package lk.ijse.ecommercewebapplicationjavaee;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommercewebapplicationjavaee.dto.User;
import lk.ijse.ecommercewebapplicationjavaee.model.CartTable;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CartServlet", value = "/cart")
public class CartServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;
    Connection connection = null;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getServletContext().getAttribute("user");

        try {
            connection = dataSource.getConnection();
            String query = "SELECT c.qty, c.total, p.product_name, p.product_price " +
                    "FROM cart c " +
                    "JOIN products p ON c.product_id = p.product_id " +
                    "WHERE c.user_email = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, user.getEmail());

            ResultSet resultSet = preparedStatement.executeQuery();

            List<CartTable> cartTables = new ArrayList<>();

            while (resultSet.next()){
                cartTables.add(new CartTable(
                        resultSet.getString("product_name"),
                        resultSet.getDouble("product_price"),
                        resultSet.getInt("qty"),
                        resultSet.getDouble("total")
                ));
            }

            req.setAttribute("cartList", cartTables);
            req.getRequestDispatcher("cart.jsp").forward(req, resp);
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("cart.jsp?message=Failed to load cart items!");
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            User user = (User) req.getServletContext().getAttribute("user");
            String productId = req.getParameter("productId");
            String productName = req.getParameter("productName");
            String productPrice = req.getParameter("productPrice");
            String productQty = req.getParameter("qty");
            double total = Integer.parseInt(productQty) * Double.parseDouble(productPrice);

            System.out.println("productName = " + productName + " productPrice = " + productPrice + " productQty = " + productQty + " total = " + total);

            connection = dataSource.getConnection();
            PreparedStatement preparedStatement =  connection.prepareStatement("INSERT INTO cart ( qty, total,product_id,user_email) VALUES (?,?,?,?)");
            preparedStatement.setInt(1, Integer.parseInt(productQty));
            preparedStatement.setDouble(2, total);
            preparedStatement.setInt(3, Integer.parseInt(productId));
            preparedStatement.setString(4, user.getEmail());

            if (preparedStatement.executeUpdate() > 0) {
                resp.sendRedirect("cart?message=Product Added to Cart!");
            }
            connection.close();

        }catch (Exception e){
            e.printStackTrace();
            resp.sendRedirect("cart.jsp?message=Failed to add product to cart!");
        }

    }

}
