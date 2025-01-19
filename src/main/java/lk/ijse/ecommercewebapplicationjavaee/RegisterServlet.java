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

@WebServlet(name = "registerServlet", value = "/register")
public class RegisterServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("RegEmail");
        String password = req.getParameter("RegPassword");

        System.out.println("name = " + name + " email = " + email + " password = " + password);

        try {
            Connection connection = dataSource.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO users VALUES (?,?,?,?,?)");
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, "user");
            preparedStatement.setString(4, password);
            preparedStatement.setBoolean(5, true);

            if (preparedStatement.executeUpdate() > 0) {
                resp.sendRedirect("index.jsp?message=Registration Successful");
            }

        } catch (SQLException e) {
            resp.sendRedirect("index.jsp?error=Registration Failed");
            e.printStackTrace();
        }
    }
}
