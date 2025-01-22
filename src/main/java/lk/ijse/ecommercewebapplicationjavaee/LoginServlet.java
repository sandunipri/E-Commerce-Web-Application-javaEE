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
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "loginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("RegEmail");
        String password = req.getParameter("RegPassword");

        System.out.println("email = " + email + " password = " + password);

        Connection connection = null;
        try {
            connection = dataSource.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM users WHERE user_email = (?)");
            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                String passwordDB = resultSet.getString("user_password");
                if (password.equals(passwordDB)){
                    String role = resultSet.getString("user_role");
                    if (role.equals("admin")){
                        resp.sendRedirect("admin.jsp?message=Login Successful!");
                        return;
                    }
                    resp.sendRedirect("user.jsp?message=Login Successful!");
                }else {
                    resp.sendRedirect("index.jsp?error=Wrong Password!");
                }
            }
        connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }
}
