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

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024*50 //50MB
)

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            Connection connection = dataSource.getConnection();
            ResultSet resultSet = connection.prepareStatement("SELECT * FROM products").executeQuery();

            req.setAttribute("resultSet", resultSet);
            req.getRequestDispatcher("product.jsp").forward(req, resp);
        }catch (Exception e){
           throw new RuntimeException(e);
        }
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

            Part filepart = req.getPart("product_image");
            String fileName = filepart.getSubmittedFileName();

            String uploadDir = "C:\\Users\\priya\\Desktop\\Projects\\Advanced API\\E-Commerce Web Application-javaEE\\src\\main\\webapp\\assects\\productsImages";

            File imageFile = new File(uploadDir + File.separator + fileName);

            try (InputStream inputStream = filepart.getInputStream()){
                Files.copy(inputStream, imageFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
            }

            Connection connection = dataSource.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO products (product_name,product_image,product_description,product_qty,product_price,category_id) VALUES (?,?,?,?,?,?)");
            preparedStatement.setString(1, name);
            String imagePath = "assects/productsImages/" + fileName;
            preparedStatement.setString(2, imagePath);
            preparedStatement.setString(3, description);
            preparedStatement.setInt(4, Integer.parseInt(qty));
            preparedStatement.setDouble(5, Double.parseDouble(price));
            preparedStatement.setInt(6, Integer.parseInt(categoryID));

            if (preparedStatement.executeUpdate()>0){
                resp.sendRedirect("product.jsp?message=product Save Success");
                System.out.println("Product saved");
            }


        } catch (Exception e) {
            resp.sendRedirect("product.jsp?message=product Save Failed");
            e.printStackTrace();
        }
    }
}
