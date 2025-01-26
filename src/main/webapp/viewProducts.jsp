<%@ page import="lk.ijse.ecommercewebapplicationjavaee.model.ProductCard" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Sanduni
  Date: 1/26/2025
  Time: 9:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>
        Products management
    </title>
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
    <link rel="stylesheet" href="assects/css/style.css">
    <link rel="stylesheet" href="assects/css/header.css"/>
    <link rel="stylesheet" href="assects/css/main.css"/>
    <link rel="stylesheet" href="assects/css/home.css">
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
            <a href="user.jsp" class="btn btn-primary addProduct" id="logout">
                <b>BACK</b>
            </a>
        </div>

    </div>
</header>
<main>
    <h2 class="productTitle">ALL PRODUCTS</h2>

    <%-- <div class="w-100 d-flex flex-row flex-wrap gap-1">
         <div class="row gap-5 container mt-4">
             <%
                 List<ProductCard> productList = (List<ProductCard>) request.getAttribute("productList");
                 if (productList != null) {
                     for (ProductCard productCard : productList) {
             %>
             <form class="col-4 card" action="cart" method="post">
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
                             <button type="submit" class="btn btn-success" name="action" value="doPost">AddToCart
                             </button>
                         </form>
                     </div>
                 </div>
             </form>

             <%
                 }
             %>
         </div>
         <%
             }
         %>

     </div>--%>


    <section id="viewProducts" class="row">
        <%
            List<ProductCard> productList = (List<ProductCard>) request.getAttribute("productList");
            if (productList != null) {
                for (ProductCard productCard : productList) {
        %>
        <form class="col-4 " action="cart" method="post">
            <div class="card">
                <img src="<%=productCard.getImage()%>" class="card-img-top" alt="Product Image">
                <div class="col-md-8">
                    <div class="card-body p-0">
                        <h5 class="card-title"><%=productCard.getProductName()%>
                        </h5>
                        <input type="hidden" name="productName" class="card-title"
                               value="<%=productCard.getProductName()%>">
                        <p class="card-text"><%=productCard.getProductDescription()%>
                        </p>
                        <input type="hidden" name="productDescription"
                               class="card-text text-truncate" value="<%=productCard.getProductDescription()%>">

                        <div class="d-flex justify-content-between align-items-center">
                            <span class="fw-bold">Qty:</span>
                            <input style="width: 200px" type="number" name="qty" class="form-control"
                                   aria-label="Sizing example input"
                                   aria-describedby="inputGroup-sizing-sm" value="1" min="1"
                                   max="<%=productCard.getProductQty()%>">
                        </div>


                        <p class="card-text"><strong>Price:</strong>$<%=productCard.getProductPrice()%>
                        </p>
                        <input type="hidden" name="productPrice"
                               class="card-text mb-1" value="<%=productCard.getProductPrice()%>">

                            <input type="hidden" name="productId" value="<%=productCard.getProductId()%>">
                            <button type="submit" class="btn btn-primary btn-block" name="action" value="doPost">Add to
                                Cart
                            </button>

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

