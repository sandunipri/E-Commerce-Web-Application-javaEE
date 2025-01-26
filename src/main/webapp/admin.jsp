<%--
  Created by IntelliJ IDEA.
  User: Sanduni
  Date: 1/18/2025
  Time: 12:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
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
    <link rel="stylesheet" href="assects/css/style.css">
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
                                <a class="nav-link" href="product">PRODUCTS</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="UserServlet">USERS</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="OrderViewServlet">ORDERS</a>
                            </li>
                        </ul>
                        <div class="dropdown">
                            <button class="btnCategory dropdown-toggle" type="button" data-bs-toggle="dropdown"
                                    aria-expanded="false">
                                CATEGORY
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Contemporary Fiction</a></li>
                                <li><a class="dropdown-item" href="#">Historical Fiction</a></li>
                                <li><a class="dropdown-item" href="#">Mystery & Thriller</a></li>
                                <li><a class="dropdown-item" href="#">Science Fiction & Fantasy</a></li>
                                <li><a class="dropdown-item" href="#">Romance</a></li>
                                <li><a class="dropdown-item" href="category" >
                                    <button type="button" class="btn btn-secondary" >Add Category</button>
                                </a></li>
                            </ul>

                        </div>
                    </div>
                </div>
            </nav>
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
            <a href="index.jsp" class="btn btn-primary " id="logout">
                <b>LogOut </b>
            </a>
            <button type="button" class="btn btn-primary" id="loginOpenPopup">
                NEW ADMIN
            </button>
        </div>
        <div class="popup-overlay" id="regPopupOverlay"></div>
        <div class="popup" id="regPopup">
            <form class="Register-form" action="admin" method="post">
                <h4 class="register-title">NEW ADMIN</h4>
                <p><span class="font-weight-bold">I am a new admin</span></p>
                <div class="row">
                    <div class="col-md-12 col-12 mb--15 line">
                        <label for="name">Full Name</label>
                        <input class="mb-0 form-control loginInput registerInput" type="text" id="name" name="name"
                               placeholder="Enter your full name">
                    </div>
                    <div class="col-12 mb--20 line">
                        <label for="RegEmail">Email</label>
                        <input class="mb-0 form-control loginInput registerInput" type="email" id="RegEmail"
                               name="RegEmail" placeholder="Enter Your Email Address Here..">
                    </div>
                    <div class="col-12 mb--20 line">
                        <label for="RegPassword">Password</label>
                        <input class="mb-0 form-control loginInput registerInput" type="password" id="RegPassword"
                               name="RegPassword" placeholder="Enter your password">
                    </div>
                    <div class="col-12 mb--20 line">
                        <label for="ConfirmRegPassword">Confirm Password</label>
                        <input class="mb-0 form-control loginInput registerInput" type="password"
                               id="ConfirmRegPassword" name="ConfirmRegPassword" placeholder="Confirm password">
                    </div>
                </div>
                <br/>
                <div class="btnsUser">
                    <button class="btnLogin" id="backToLogin">BACK</button>
                    <button class="btnReg" type="submit" id="btnRegister">REGISTER</button>
                </div>
            </form>
        </div>
    </div>
</header>
<main>
    <section class="carousal">
        <div class="bookDesc">
            <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel" data-bs-interval="1500">
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
    <section class="AboutBooks">
        <div class="about">
            <div class="p-4 p-md-5 mb-4 rounded text-body-emphasis bg-body-secondary position-relative">
                <img class="image-background position-absolute w-100 h-100"
                     src="assects/images/story%20background-02.jpg"
                     alt="background-image"
                     style="z-index: 1; object-fit: cover; top: 0; left: 0"
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

</main>
<footer></footer>

<script src="assects/js/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous">
</script>

<script>
    // Get the elements
    const loginOpenPopup = document.getElementById("loginOpenPopup");
    const regPopupOverlay = document.getElementById("regPopupOverlay");
    const regPopup = document.getElementById("regPopup");
    const backToLogin = document.getElementById("backToLogin");

    // Open the pop-up
    loginOpenPopup.addEventListener("click", () => {
        regPopupOverlay.style.display = "block";
        regPopup.style.display = "block";
    });

    // Close the pop-up
    backToLogin.addEventListener("click", (e) => {
        e.preventDefault();
        regPopupOverlay.style.display = "none";
        regPopup.style.display = "none";
    });

    // Close when clicking outside the modal
    regPopupOverlay.addEventListener("click", () => {
        regPopupOverlay.style.display = "none";
        regPopup.style.display = "none";
    });

</script>
</body>
</html>
