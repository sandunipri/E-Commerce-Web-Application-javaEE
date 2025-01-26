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

    <link rel="stylesheet" href="assects/css/style.css">
    <link rel="stylesheet" href="assects/css/header.css"/>
    <link rel="stylesheet" href="assects/css/main.css"/>
    <link rel="stylesheet" href="assects/css/home.css">

    <style>

    </style>
</head>
<body>
<header>

    <div class="topHeader">
        <div class="logoAndName">
            <img class="logo" src="assects/images/img_1.png" alt="Web Application Logo">
            <p class="webTitle">DREAMER'S SHELF</p>
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
                                    <li><a class="dropdown-item" href="OrderViewServlet">Orders</a></li>
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
    <article id="home">
        <section class="carousal">
            <div class="bookDesc">
                <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel"
                     data-bs-interval="1500">
                    <div class="carousel-inner carousel-control-transition">
                        <div class="carousel-item active">
                            <img src="assects/images/s.jpg" class="d-block imgCarousal" alt="Story-picture-01">
                            <div class="carousel-caption d-none d-md-block caption-right">
                                <h1>Story Book</h1>
                                <p>
                                    lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                                    incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
                                    nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                    Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
                                    eu fugiat nulla pariatur.
                                </p>
                            </div>
                        </div>

                        <div class="carousel-item">
                            <img src="assects/images/story%20book%20-03.jpg" class="d-block imgCarousal"
                                 alt="Story-picture-01">
                            <div class="carousel-caption d-none d-md-block caption-right">
                                <h1>Story Book</h1>
                                <p>
                                    lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                                    incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
                                    nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                    Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
                                    eu fugiat nulla pariatur.
                                </p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="assects/images/story%20book%20-04.jpg" class="d-block imgCarousal"
                                 alt="Story-picture-01">
                            <div class="carousel-caption d-none d-md-block caption-right">
                                <h1>Story Book</h1>
                                <p>
                                    lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                                    incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
                                    nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                    Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
                                    eu fugiat nulla pariatur.
                                </p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="assects/images/story%20book%20-05.jpg" class="d-block imgCarousal"
                                 alt="Story-picture-01">
                            <div class="carousel-caption d-none d-md-block caption-right">
                                <h1>Story Book</h1>
                                <p>
                                    lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                                    incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
                                    nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                    Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
                                    eu fugiat nulla pariatur.
                                </p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="assects/images/story%20book%20-03.jpg" class="d-block imgCarousal"
                                 alt="Story-picture-01">
                            <div class="carousel-caption d-none d-md-block caption-right">
                                <h1>Story Book</h1>
                                <p>
                                    lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                                    incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
                                    nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                    Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
                                    eu fugiat nulla pariatur.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </article>
    <article id="about">
        <section class="AboutBooks">
            <div class="about">
                <div class="p-4 p-md-5 mb-4 rounded text-body-emphasis bg-body-secondary position-relative">
                    <img class="image-background position-absolute w-100 h-100"
                         src="assects/images/story%20background-02.jpg"
                         alt="background-image"
                         style="object-fit: cover; top: 0; left: 0"
                    />
                    <div class="col-lg-6 px-0 position-relative">
                        <h1 class="display-4 fst-italic">
                            <b> "Unfold Your Next Adventure: A Journey Through Pages"</b>
                        </h1>
                        <p class="lead my-3 description">
                            "Step into a world where stories come alive and imagination knows no
                            bounds. Discover the latest page-turners, timeless classics, and
                            hidden treasures that will captivate your mind and soul. This post
                            highlights the most exciting reads and literary trends you won't
                            want to miss."
                        </p>
                    </div>
                </div>

                <div class="row mb-2">
                    <div class="col-md-6">
                        <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                            <div class="col p-4 d-flex flex-column position-static">
                                <h3 class="mb-0 topic-paragraph">New Arrivals & Events</h3>
                                <div class="mb-1 text-body-secondary">Nov 12</div>
                                <p class="card-text mb-auto">
                                    Exciting news for book lovers! Our shelves are now brimming with
                                    the latest bestsellers, timeless classics, and hidden gems.
                                    Explore the magic of reading with us today!
                                </p>
                            </div>
                            <div class="col-auto d-none d-lg-block">
                                <img
                                        class="aboutStory"
                                        src="assects/images/story%20image%2014.jpg"
                                        alt="about-image"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div
                                class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative"
                        >
                            <div class="col p-4 d-flex flex-column position-static">
                                <h3 class="mb-0 topic-paragraph">Exclusive Releases</h3>
                                <div class="mb-1 text-body-secondary">Nov 12</div>
                                <p class="card-text mb-auto">
                                    We're thrilled to announce the arrival of exclusive new releases
                                    available only in our library! Join our Reader's Club for early
                                    access, special discounts, and monthly discussions with authors.
                                </p>
                            </div>
                            <div class="col-auto d-none d-lg-block">
                                <img
                                        class="aboutStory"
                                        src="assects/images/story%20book%20-13.jpg"
                                        alt="about-image"
                                />

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </article>

    <section id="blog">
        <h2 class="bolgTitle">LATEST BLOGS</h2>
        <div class="card-set d-flex justify-content-center text-center flex-wrap">
            <div class="card transition-card" style="width: 25rem;">
                <img src="assects/images/img.png" class="card-img-top" alt="blog_image">
                <div class="card-body">
                    <p class="post-meta"><span><b class="fs-6">13/08/2017</b></span> | <b>Popular Articles</b></p>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        card's content.</p>
                </div>
            </div>
            <div class="card transition-card" style="width: 25rem;">
                <img src="assects/images/blog-01.jpg" class="card-img-top" alt="blog_image">
                <div class="card-body">
                    <p class="post-meta"><span><b class="fs-6">13/08/2017</b></span> | <b>Popular Articles</b></p>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        card's content.</p>
                </div>
            </div>
            <div class="card transition-card" style="width: 25rem;">
                <img src="assects/images/blog%20-01.png" class="card-img-top " alt="blog_image">
                <div class="card-body">
                    <p class="post-meta"><span><b class="fs-6">13/08/2017</b></span> | <b>Popular Articles</b></p>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        card's content.</p>
                </div>
            </div>
        </div>
    </section>
    <section>


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
