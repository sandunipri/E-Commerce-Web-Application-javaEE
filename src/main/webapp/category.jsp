<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.ecommercewebapplicationjavaee.model.CategoryCard" %><%--
  Created by IntelliJ IDEA.
  User: Sanduni
  Date: 1/19/2025
  Time: 9:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Category management</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <link rel="stylesheet" href="assects/css/header.css" />
    <link rel="stylesheet" href="assects/css/main.css" />
    <link rel="stylesheet" href="assects/css/category.css">
</head>
<style>



</style>
<body>
<header>
    <div class="topHeader">
        <div class="logoAndName">
            <img class="logo" src="assects/images/img_1.png" alt="Web Application Logo">
            <p class="webTitle">DREAMER'S SHELF</p>
        </div>
    </div>
    <div class="middleHeader">

        <div class="searchBar">
            <nav class="navbar">
                <div class="container-fluid">
                    <form class="d-flex" role="search">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </nav>
        </div>
        <div class="contactBox">
            <div class="callIcon"><i class="fa-solid fa-headphones"></i></div>
            <div class="callDesc">
                <p>Free Support 24/H</p>
                <p>123-456-7890</p>
            </div>
        </div>

        <div class="categoryBtn">
            <button type="button" class="btn addCategory" data-bs-toggle="modal" data-bs-target="#categoryModal">
                <b>ADD CATEGORY</b>
            </button>
            <a href="admin.jsp" class="btn " id="logout">
                <b>BACK </b>
            </a>
        </div>

    </div>
</header>
<main>

<%--
    <%
        String message = request.getParameter("message");
        if (message != null){
    %>
    <div style="color: green"><%=message%></div>
    <%
        }

    %>

    <%
        String error = request.getParameter("error");
        if (error != null){
    %>
    <div style="color: red"><%=error%></div>
    <%
        }
    %>--%>
    <div class="modal fade" id="categoryModal" tabindex="-1" aria-labelledby="categoryModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content d-flex align-items-center">
                <div class="modal-header">
                    <h5 class="modal-title" id="categoryModalLabel">ADD NEW CATEGORY</h5>
                </div>
                <div class="modal-body">
                    <form enctype="multipart/form-data" action="category" method="post">
                        <div class="mb-3">
                            <label for="category-name" class="form-label">Category Name</label>
                            <input type="text" class="form-control" id="category-name" name="name" placeholder="Enter category name">
                        </div>
                        <!-- Image -->
                        <div class="mb-3">
                            <label for="productImage" class="form-label">Upload Image</label>
                            <input type="file" class="form-control" id="productImage" name="image" accept="image/*" required>
                        </div>
                        <div class="mb-3">
                            <label for="category-description" class="form-label">Description</label>
                            <textarea class="form-control" id="category-description"  name="category_description" rows="3" placeholder="Enter description"></textarea>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary back" data-bs-dismiss="modal">BACK</button>
                            <button type="submit" class="btn btn-primary saveCategory" name="categoryAction" value="doPostCategory">SAVE CATEGORY</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>

    <section class="category-set">
        <div class="container my-5">
            <div class="row d-flex flex-wrap justify-content-center">
                <%
                    List<CategoryCard> categoryLists = (List<CategoryCard>) request.getAttribute("categoryList");
                    if (categoryLists != null){
                        for (CategoryCard categoryCard : categoryLists){
                %>
                <div class="col-md-4" style="max-width: 30%;">
                    <div class="card">
                        <h5 class="card-title"><%=categoryCard.getCategoryName()%></h5>
                        <img src="<%=categoryCard.getCategoryImage()%>" class="card-img-top" alt="Product Image">
                        <div class="card-body text-center">
                            <p class="card-text">
                                <%=categoryCard.getCategoryDescription()%>
                            </p>
<%--                            <a href="#" class="btn btn-view-products">View Products</a>--%>
                        </div>
                        <form action="category" method="post">
                            <input type="hidden" name="categoryId" value="<%=categoryCard.getCategoryId()%>">
                            <button type="submit" class="btn btn-danger" name="categoryAction" value="doDeleteCategory">DELETE</button>
                        </form>
                    </div>

                </div>

                <%
                        }
                    }
                %>

            </div>
        </div>
    </section>


</main>

<script src="assects/js/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
