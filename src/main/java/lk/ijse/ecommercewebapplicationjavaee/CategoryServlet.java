package lk.ijse.ecommercewebapplicationjavaee;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import lk.ijse.ecommercewebapplicationjavaee.model.CategoryCard;

import javax.sql.DataSource;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024*50 //50MB
)

@WebServlet(name = "categoryServlet" , value = "/category")
public class CategoryServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection connection = null;
        try {
            connection = dataSource.getConnection();
            ResultSet resultSet = connection.prepareStatement("SELECT * FROM category").executeQuery();

            List<CategoryCard> categoryCardList = new ArrayList<>();

            while (resultSet.next()) {
                categoryCardList.add(new CategoryCard(
                        resultSet.getInt("category_id"),
                        resultSet.getString("category_name"),
                        resultSet.getString("category_image"),
                        resultSet.getString("category_description")
                ));

            }

            req.setAttribute("categoryList", categoryCardList);
            req.getRequestDispatcher("category.jsp").forward(req, resp);

            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection connection = null;
        try {
            String action = req.getParameter("categoryAction");
            if (action.equals("doDeleteCategory")) {
                doDelete(req, resp);
                return;
            }


            String name = req.getParameter("name");
            String description = req.getParameter("category_description");

            Part filepart = req.getPart("image");
            String fileName = filepart.getSubmittedFileName();

            String uploadDir = "C:\\Users\\priya\\Desktop\\Projects\\Advanced API\\E-Commerce Web Application-javaEE\\src\\main\\webapp\\assects\\imageDB";

            File imageFile = new File(uploadDir + File.separator + fileName);

            try (InputStream inputStream = filepart.getInputStream()) {
                Files.copy(inputStream, imageFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
            }

            connection = dataSource.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO category (category_name ,category_image , category_description) VALUES (?,?,?)");
            preparedStatement.setString(1, name);
            String imageDbPath = "assects/imageDB/" + fileName;
            preparedStatement.setString(2, imageDbPath);
            preparedStatement.setString(3, description);

            if (preparedStatement.executeUpdate() > 0) {
                resp.sendRedirect("category?message=Category Save Success");
                System.out.println("Cat saved");
            }
            connection.close();
        } catch (Exception e) {
            resp.sendRedirect("category?message=Category Save Failed");
            e.printStackTrace();
        }

    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection connection = null;
        try {

            String categoryId = req.getParameter("categoryId");
            connection = dataSource.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(" DELETE FROM category WHERE category_id = ?");
            preparedStatement.setInt(1, Integer.parseInt(categoryId));

            if (preparedStatement.executeUpdate() > 0) {
                resp.sendRedirect("category?message=Category Removed from category!");
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("category.jsp?message=Failed to remove category from categories!");
        }
    }
}
