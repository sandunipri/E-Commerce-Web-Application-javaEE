package lk.ijse.ecommercewebapplicationjavaee;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommercewebapplicationjavaee.Entity.User;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "PlaceOrderServlet", value = "/placeOrder")
public class PlaceOrderServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;
    Connection connection = null;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        String subTotal = req.getParameter("subTotal");
        User user = (User) req.getServletContext().getAttribute("user");

        try {
            connection = dataSource.getConnection();
            connection.setAutoCommit(false);

            PreparedStatement OrderPSTM = connection.prepareStatement("INSERT INTO orders (order_date, sub_total , user_email) VALUES (?,?,?)", Statement.RETURN_GENERATED_KEYS);
            OrderPSTM.setTimestamp(1, timestamp);
            OrderPSTM.setDouble(2, Double.parseDouble(subTotal));
            OrderPSTM.setString(3, user.getEmail());

            if (OrderPSTM.executeUpdate() > 0) {
                ResultSet generatedKeys = OrderPSTM.getGeneratedKeys();
                int orderId = 0;
                if (generatedKeys.next()) {
                    orderId = generatedKeys.getInt(1);
                }

                // Get the cart items
                PreparedStatement getCartPSTM = connection.prepareStatement(("SELECT * FROM cart WHERE user_email = ?"));
                getCartPSTM.setString(1, user.getEmail());
                ResultSet resultSet = getCartPSTM.executeQuery();

                PreparedStatement odPSTM = connection.prepareStatement("INSERT INTO order_details (order_id, product_id, quantity, total) VALUES (?,?,?,?)");

                while (resultSet.next()) {
                    String productId = resultSet.getString("product_id");
                    String qty = resultSet.getString("qty");
                    double total = resultSet.getDouble("total");

                    odPSTM.setInt(1, orderId);
                    odPSTM.setString(2, productId);
                    odPSTM.setString(3, qty);
                    odPSTM.setDouble(4, total);

                    odPSTM.executeUpdate();
                }


                PreparedStatement cartDeletePSTM = connection.prepareStatement("DELETE FROM cart WHERE user_email = ?");
                cartDeletePSTM.setString(1, user.getEmail());
                cartDeletePSTM.executeUpdate();
            }
            connection.commit();
            connection.setAutoCommit(true);
            connection.close();
            resp.sendRedirect("cart?message=Order Placed Successfully!");
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("cart?message=Order Placed Failed!");
        }

    }
}
