package lk.ijse.ecommercewebapplicationjavaee;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommercewebapplicationjavaee.model.OrderDetailTable;
import lk.ijse.ecommercewebapplicationjavaee.model.OrderTable;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "OrderViewServlet", value = "/OrderViewServlet")
public class OrderViewServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;
    Connection connection = null;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            connection = dataSource.getConnection();
            String sql = "SELECT o.order_id, o.user_email, p.product_name, od.quantity, od.total " +
                    "FROM orders o " +
                    "JOIN order_details od ON o.order_id = od.order_id " +
                    "JOIN products p ON od.product_id = p.product_id";

            ResultSet resultSet = connection.prepareStatement(sql).executeQuery();

            List<OrderTable> orderTables = new ArrayList<>();

            while (resultSet.next()){
                orderTables.add(new OrderTable(
                        resultSet.getInt("order_id"),
                        resultSet.getString("user_email"),
                        resultSet.getString("product_name"),
                        resultSet.getInt("quantity"),
                        resultSet.getDouble("total")

                ));
                System.out.println("resultSet = " + resultSet);
            }

            req.setAttribute("orderList", orderTables);



            //order details view on database

            connection = dataSource.getConnection();

            ResultSet orderDetails = connection.prepareStatement("SELECT * FROM orders").executeQuery();
            List<OrderDetailTable> orderList = new ArrayList<>();

            while (orderDetails.next()){
                orderList.add(new OrderDetailTable(
                        orderDetails.getString("user_email"),
                        orderDetails.getDouble("sub_total")
                ));
            }
            req.setAttribute("orderDetailsList", orderList);

            req.getRequestDispatcher("order.jsp").forward(req, resp);

        }catch (Exception e){
            e.printStackTrace();
            resp.sendRedirect("order.jsp?message=Failed to load order items!");
        }
    }
}
