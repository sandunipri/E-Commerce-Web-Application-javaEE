package lk.ijse.ecommercewebapplicationjavaee;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String name = req.getParameter("product_name");
            String description = req.getParameter("product_description");
            String qty = req.getParameter("product_qty");
            String price = req.getParameter("product_price");
            String categoryID = req.getParameter("product_category");

            System.out.println(name + " " + description + " " + qty + " " + price + " " + categoryID);


//            dataSource.getConnection().prepareStatement("INSERT INTO product (name, description, price, qty) VALUES ('" + name + "', '" + description + "', '" + price + "', '" + qty + "')").executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
