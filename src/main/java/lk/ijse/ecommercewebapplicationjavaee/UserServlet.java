package lk.ijse.ecommercewebapplicationjavaee;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommercewebapplicationjavaee.model.UserTable;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/UserServlet")
public class UserServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;
    Connection connection = null;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            connection = dataSource.getConnection();
            ResultSet resultSet = connection.prepareStatement("SELECT * FROM users").executeQuery();

            List<UserTable> userLists = new ArrayList<>();

            while (resultSet.next()){
                userLists.add(new UserTable(
                        resultSet.getString("user_name"),
                        resultSet.getString("user_email"),
                        resultSet.getString("user_role")
//                        resultSet.getBoolean("status"))
                ));

            }
            req.setAttribute("userList", userLists);
            req.getRequestDispatcher("userView.jsp").forward(req, resp);

        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("user.jsp?message=Failed to load cart items!");

        }

    }
}
