package lk.ijse.ecommercewebapplicationjavaee;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "categoryServlet" , value = "/category")
public class CategoryServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("category_name");
        String image = req.getParameter("image");
        String description = req.getParameter("category_description");

        System.out.println("name = " + name + " image = " + image + " description = " + description);

        try {
            Connection connection =dataSource.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO category (category_name ,ctegory_image , category_description) VALUES (?,?,?)");
            preparedStatement.setString(1,name);
            preparedStatement.setString(2,image);
            preparedStatement.setString(3,description);

            if (preparedStatement.executeUpdate() > 0){
                resp.sendRedirect("category.jsp?message=Category Save Success");
            }
        } catch (SQLException e) {
            resp.sendRedirect("category.jsp?message=Category Save Failed");
            e.printStackTrace();
        }

    }
}
