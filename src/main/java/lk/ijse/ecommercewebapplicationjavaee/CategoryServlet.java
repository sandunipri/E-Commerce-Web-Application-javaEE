package lk.ijse.ecommercewebapplicationjavaee;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

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
        try {
            Connection connection = dataSource.getConnection();
            ResultSet resultSet = connection.prepareStatement("SELECT * FROM category").executeQuery();

            req.setAttribute("resulSet", resultSet);
            req.getRequestDispatcher("category.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
        String name = req.getParameter("name");
        String description = req.getParameter("category_description");

        Part filepart = req.getPart("image");
        String fileName = filepart.getSubmittedFileName();

        String uploadDir = "C:\\Users\\priya\\Desktop\\Projects\\Advanced API\\E-Commerce Web Application-javaEE\\src\\main\\webapp\\assects\\imageDB";

        File imageFile = new File(uploadDir + File.separator + fileName);

        try (InputStream inputStream = filepart.getInputStream()){
            Files.copy(inputStream, imageFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
        }

            Connection connection =dataSource.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO category (category_name ,category_image , category_description) VALUES (?,?,?)");
            preparedStatement.setString(1,name);
            String imageDbPath = "assects/imageDB/" + fileName;
            preparedStatement.setString(2,imageDbPath);
            preparedStatement.setString(3,description);

            if (preparedStatement.executeUpdate() > 0){
                resp.sendRedirect("category.jsp?message=Category Save Success");
                System.out.println("Cat saved");
            }
        } catch (Exception e) {
            resp.sendRedirect("category.jsp?message=Category Save Failed");
            e.printStackTrace();
        }

    }
}
