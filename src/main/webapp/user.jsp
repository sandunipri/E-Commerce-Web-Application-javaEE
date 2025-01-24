<%@ page import="lk.ijse.ecommercewebapplicationjavaee.model.ProductCard" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Sanduni
  Date: 1/18/2025
  Time: 12:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>LOGIN</title>
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

    <style>

    </style>
</head>
<body>
<header>

    <div class="topHeader">
        <div class="logoAndName">
            <img class="logo" src="assects/images/web%20application%20picture.jpg" alt="Web Application Logo">
            <p class="webTitle">WEB APPLICATION</p>
        </div>
        <div class="nav-list">
            <nav class="navbar navbar-expand-lg">
                <div class="container-fluid">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false"
                            aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNavDropdown">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">HOME</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">ABOUT</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                   aria-expanded="false">
                                    PAGES
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="product">Products</a></li>
                                    <li><a class="dropdown-item" href="order.jsp">Orders</a></li>
                                    <li><a class="dropdown-item" href="cart">Cart</a></li>


                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                   aria-expanded="false">
                                    BLOG
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Latest Posts</a></li>
                                    <li><a class="dropdown-item" href="#">Popular Articles</a></li>
                                    <li><a class="dropdown-item" href="#">Categories</a></li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">CONTACTS</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <div class="middleHeader">
        <div class="dropdown">
            <button class="btnCategory dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                CATEGORY
            </button>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">Contemporary Fiction</a></li>
                <li><a class="dropdown-item" href="#">Historical Fiction</a></li>
                <li><a class="dropdown-item" href="#">Mystery & Thriller</a></li>
                <li><a class="dropdown-item" href="#">Science Fiction & Fantasy</a></li>
                <li><a class="dropdown-item" href="#">Romance</a></li>
                <li><a class="dropdown-item" href="#">Horror</a></li>
            </ul>
        </div>
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
        <a href="index.jsp" class="btn btn-primary " id="logout">
            <b>LogOut </b>
        </a>
    </div>

</header>
<main>
    <section>
        <%-- <div class="card mb-2" style="max-width: 540px;">
             <div class="row g-0">
                 <div class="col-md-4">
                     <img src="assects/images/story%20book%20-04.jpg" class="img-fluid rounded-start" alt="Book image">
                 </div>
                 <div class="col-md-8">
                     <div class="card-body">
                         <h5 class="card-title">Card title</h5>
                         <p class="card-text text-truncate">This is a wider card with supporting text below as a natural lead-in to additional content.</p>
                         <p class="card-text mb-1"><strong>Price:</strong> $699</p>
                         <div class="input-group input-group-sm">
                             <span class="input-group-text">Qty</span>
                             <input type="number" class="form-control" value="1" min="1">
                             <button class="btn btn-success">AddToCart</button>
                         </div>
                     </div>
                 </div>
             </div>
         </div>--%>

    </section>
    <section class="row">

        <%
            List<ProductCard> productList = (List<ProductCard>) request.getAttribute("productList");
            if (productList != null) {
                for (ProductCard productCard : productList) {
        %>
        <form class="card mb-2" style="max-width: 500px;" action="cart" method="post">
            <div class="row g-0">
                <div class="col-md-4">
                    <img src="<%=productCard.getImage()%>" class="img-fluid rounded-start" alt="Book image">
                </div>
                <div class="col-md-8">
                    <div class="card-body">
                        <h5 class="card-title"><%=productCard.getProductName()%></h5>
                        <input type="hidden" name="productName" class="card-title" value="<%=productCard.getProductName()%>">
                        <br>
                        <p class="card-text"><%=productCard.getProductDescription()%></p>
                        <input type="hidden" name="productDescription"
                               class="card-text text-truncate" value="<%=productCard.getProductDescription()%>">

                        <br>
                        <input type="number" name="qty" class="form-control" aria-label="Sizing example input"
                               aria-describedby="inputGroup-sizing-sm" value="1" min="1"
                               max="<%=productCard.getProductQty()%>">

                        <br>
                        <p class="card-text"><strong>Price:</strong><%=productCard.getProductPrice()%></p>
                        <input type="hidden" name="productPrice"
                               class="card-text mb-1" value="<%=productCard.getProductPrice()%>">
                        <br>
                        <input type="hidden" name="productId" value="<%=productCard.getProductId()%>">
                        <button type="submit" class="btn btn-success">AddToCart</button>
                    </div>
                </div>
            </div>
        </form>
        <%
                }
            }
        %>

    </section>

</main>
<script src="assects/js/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

</body>
</html>
