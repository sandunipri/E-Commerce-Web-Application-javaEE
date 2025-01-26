<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.awt.*" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.ecommercewebapplicationjavaee.model.ProductCard" %><%--
  Created by IntelliJ IDEA.
  User: Sanduni
  Date: 1/19/2025
  Time: 11:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Products management</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital,wght@0,100..900;1,100..900&display=swap"
          rel="stylesheet">
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <link rel="stylesheet" href="assects/css/header.css"/>
    <link rel="stylesheet" href="assects/css/main.css"/>
    <link rel="stylesheet" href="assects/css/product.css">
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

        <div>
            <!-- Button to trigger modal -->
            <button type="button" class="btn btn-primary addProduct" data-bs-toggle="modal"
                    data-bs-target="#productModal">
                <b>ADD PRODUCTS</b>
            </button>
            <a href="admin.jsp" class="btn btn-primary addProduct" id="logout">
                <b>BACK</b>
            </a>
        </div>

    </div>
</header>
<main>
    <div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="productModalLabel">ADD NEW PRODUCT</h5>
                </div>
                <div class="modal-body">
                    <form action="product" method="post" enctype="multipart/form-data">
                        <div class="mb-3">
                            <label for="product-name" class="form-label">Product Name</label>
                            <input type="text" class="form-control" id="product-name" name="product_name"
                                   placeholder="Enter product name" required>
                        </div>
                        <div class="mb-3">
                            <label for="product-category" class="form-label">Category</label>
                            <select class="form-select" id="product-category" name="product_category" required>
                                <option class="formDropDown" selected disabled>Select a category</option>
                                <option value="17">Contemporary Fiction</option>
                                <option value="28">Mystery & Thriller</option>
<%--                                <option value="19">Romance</option>--%>
<%--                                <option value="20">Historical Fiction</option>--%>
<%--                                <option value="21">Science Fiction & Fantasy</option>--%>


                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="product-image" class="form-label">Upload Image</label>
                            <input type="file" class="form-control" id="product-image" name="product_image"
                                   accept="image/*" required>
                        </div>
                        <div class="mb-3">
                            <label for="product-description" class="form-label">Description</label>
                            <textarea class="form-control" id="product-description" name="product_description" rows="3"
                                      placeholder="Enter product description" required></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="product-qty" class="form-label">QTY</label>
                            <input class="form-control" type="number" id="product-qty" name="product_qty"
                                   placeholder="Enter product qty" required>
                        </div>
                        <div class="mb-3">
                            <label for="product-price" class="form-label">Price</label>
                            <input type="number" class="form-control" id="product-price" name="product_price"
                                   placeholder="Enter product price" required>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary back" data-bs-dismiss="modal">BACK</button>
                            <button type="submit" class="btn btn-primary saveProduct" name="productAction"
                                    value="doPostProduct">SAVE PRODUCT
                            </button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>

    <h2 class="productTitle">ALL PRODUCTS</h2>

    <div class="w-100 d-flex flex-row flex-wrap gap-1">
        <div class="row gap-5 container mt-4">
            <%
                List<ProductCard> productList = (List<ProductCard>) request.getAttribute("productList");
                if (productList != null) {
                    for (ProductCard productCard : productList) {
            %>
            <div class="col-4 card">
                <div class="card h-100 ">
                    <img src="<%=productCard.getImage()%>" class="card-img-top" alt="Product Image">
                    <div class="card-body">
                        <h5 class="card-title"><%=productCard.getProductName()%>
                        </h5>
                        <p class="card-text text-truncate"><%=productCard.getProductDescription()%>
                        </p>
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="fw-bold">Qty:</span>
                            <input style="width: 200px" type="number" name="qty" class="form-control"
                                   aria-label="Sizing example input"
                                   aria-describedby="inputGroup-sizing-sm" value="1" min="1"
                                   max="<%=productCard.getProductQty()%>">
                        </div>
                        <p class="card-text mt-2"><strong>Price:</strong><%=productCard.getProductPrice()%>
                        </p>
                    </div>
                    <div class="card-footer text-center">
                        <form action="product" method="post">
                            <input type="hidden" name="productId" value="<%=productCard.getProductId()%>">
                            <button type="submit" class="btn btn-danger" name="productAction" value="doDeleteProduct">
                                DELETE
                            </button>
                        </form>
                    </div>
                </div>
            </div>

            <%
                }
            %>
        </div>
        <%
            }
        %>

    </div>
    <%--    </section>--%>

</main>

<script src="assects/js/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

</body>
</html>
