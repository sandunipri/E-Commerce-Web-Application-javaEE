<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>E-Commerce Web Application</title>
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
                                <a class="nav-link active" aria-current="page" href="#home">HOME</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#about">ABOUT</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                   aria-expanded="false">
                                    PAGES
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">View Products</a></li>
                                    <li><a class="dropdown-item" href="">Orders</a></li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="" role="button" data-bs-toggle="dropdown"
                                   aria-expanded="false">
                                    BLOG
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#blog">Latest Posts</a></li>
                                    <li><a class="dropdown-item" href="#blog">Popular Articles</a></li>
                                    <li><a class="dropdown-item" href="#blog">New Arrivals</a></li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contact.jsp">CONTACTS</a>
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
        <div class="login">
            <button type="button" class="btn btn-primary" id="loginOpenPopup">
                <b>Login </b>or Register
            </button>

            <%--<button type="button" class="btn btn-primary " id="logout">
                <b>LogOut </b>
            </button>--%>


            <div class="popup-overlay" id="loginPopupOverlay"></div>
            <div class="popup" id="popup">
                <form class="login-form" action="login" method="get">
                    <h4 class="login-title">LOGIN USER</h4>
                    <p><span class="font-weight-bold">I am a new User</span></p>
                    <div class="row">
                        <div class="col-12 mb--20 line">
                            <label for="email">Email</label>
                            <input class="mb-0 form-control loginInput" type="email" id="email" name="RegEmail"
                                   placeholder="Enter Your Email Address Here..">
                        </div>
                        <div class="col-12 mb--20 line">
                            <label for="password">Password</label>
                            <input class="mb-0 form-control loginInput" type="password" id="password" name="RegPassword"
                                   placeholder="Enter your password">
                        </div>
                        <div class="col-12 mb--20 line">
                            <label for="ConfirmPassword">Confirm Password</label>
                            <input class="mb-0 form-control loginInput" type="password" id="ConfirmPassword"
                                   name="ConfirmRegPassword" placeholder="Confirm password">
                        </div>
                    </div>
                    <br/>
                    <div class="btnsUser">
                        <button class="btnLogin" type="submit">LOGIN</button>
                        <button class="btnReg" id="registerPopup" type="button">REGISTER</button>
                    </div>
                </form>

                <%
                    String message = request.getParameter("message");
                    if (message != null) {
                %>
                <div style="color: green"><%= message %>
                </div>
                <%
                    }
                %>

                <%
                    String error = request.getParameter("error");
                    if (error != null) {
                %>
                <div style="color: red"><%= error %>
                </div>
                <%
                    }
                %>
            </div>
            <div class="popup-overlay" id="regPopupOverlay"></div>
            <div class="popup" id="regPopup">
                <form class="Register-form" action="register" method="post">
                    <h4 class="register-title">NEW USER</h4>
                    <p><span class="font-weight-bold">I am a new customer</span></p>
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
                                <h1>Adventure Storybook</h1>
                                <p>
                                    "Get ready for a thrilling expedition through unknown territories, where every page
                                    brims with excitement and discovery. Follow brave protagonists as they navigate
                                    treacherous paths, encounter daring challenges, and uncover hidden treasures. This
                                    adventure storybook promises heart-pounding moments, unforgettable characters, and a
                                    world that comes alive with every twist and turn. Perfect for readers seeking a tale
                                    that fuels their wanderlust and awakens their inner explorer."

                                </p>
                            </div>
                        </div>

                        <div class="carousel-item">
                            <img src="assects/images/story%20book%20-03.jpg" class="d-block imgCarousal"
                                 alt="Story-picture-01">
                            <div class="carousel-caption d-none d-md-block caption-right">
                                <h1>Mystery Storybook</h1>
                                <p>
                                    "Delve into a gripping tale where secrets lurk in every corner and nothing is as it
                                    seems. This mystery storybook invites you to become the detective, piecing together
                                    subtle clues and untangling webs of deceit. As the plot thickens, each revelation
                                    will pull you deeper into a narrative of suspense and intrigue. With unexpected
                                    twists, compelling characters, and a final twist you’ll never see coming, this book
                                    is a must-read for those who love solving the unsolvable."
                                </p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="assects/images/story%20book%20-04.jpg" class="d-block imgCarousal"
                                 alt="Story-picture-01">
                            <div class="carousel-caption d-none d-md-block caption-right">
                                <h1>Fantasy Storybook</h1>
                                <p>
                                    "Enter a mesmerizing realm where magic flows through the air, ancient prophecies
                                    shape destinies, and mythical creatures roam the land. This fantasy storybook weaves
                                    an intricate tapestry of wonder and imagination, filled with richly detailed worlds
                                    and unforgettable characters. From epic battles to heartfelt moments of friendship
                                    and sacrifice, this tale is a celebration of courage, dreams, and the boundless
                                    power of belief. Ideal for readers yearning to escape into a universe beyond their
                                    wildest dreams."
                                </p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="assects/images/story%20book%20-05.jpg" class="d-block imgCarousal"
                                 alt="Story-picture-01">
                            <div class="carousel-caption d-none d-md-block caption-right">
                                <h1>Inspirational Storybook</h1>
                                <p>
                                    "Immerse yourself in a collection of heartfelt tales that celebrate the beauty of
                                    the human spirit. Each story in this inspirational storybook captures themes of
                                    resilience, kindness, and hope, painting vivid portraits of individuals overcoming
                                    challenges and discovering their true potential. These uplifting narratives are
                                    perfect for readers seeking encouragement and a reminder of the strength we all
                                    carry within. Whether it’s a story of redemption, self-discovery, or the power of
                                    compassion, this book is sure to leave a lasting impression."
                                </p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="assects/images/story%20book%20-03.jpg" class="d-block imgCarousal"
                                 alt="Story-picture-01">
                            <div class="carousel-caption d-none d-md-block caption-right">
                                <h1>Classic Children’s Storybook</h1>
                                <p>
                                    "Step into a world of timeless tales that have captivated the hearts of generations.
                                    This classic children’s storybook is a treasure trove of magical adventures,
                                    unforgettable characters, and valuable life lessons. From whimsical fairy tales to
                                    endearing fables, each story is brimming with charm and imagination. Designed to
                                    spark curiosity and nurture a love for reading, this book is perfect for children
                                    and nostalgic adults alike. Share these enchanting stories with your loved ones and
                                    create memories that will last a lifetime."
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
                    <p class="card-text">Reading Challenges & Lists: Join in on fun reading challenges and explore
                        curated book lists across genres to keep your reading journey exciting and diverse.</p>
                </div>
            </div>
            <div class="card transition-card" style="width: 25rem;">
                <img src="assects/images/blog-01.jpg" class="card-img-top" alt="blog_image">
                <div class="card-body">
                    <p class="post-meta"><span><b class="fs-6">13/08/2017</b></span> | <b>Popular Articles</b></p>
                    <p class="card-text">Author Insights & Interviews: Get to know your favorite authors through
                        exclusive interviews, personal stories, and a closer look at their creative process.
                    </p>
                </div>
            </div>
            <div class="card transition-card" style="width: 25rem;">
                <img src="assects/images/blog%20-01.png" class="card-img-top " alt="blog_image">
                <div class="card-body">
                    <p class="post-meta"><span><b class="fs-6">13/08/2017</b></span> | <b>Popular Articles</b></p>
                    <p class="card-text">Book Reviews & Recommendations: A blog dedicated to honest book reviews and
                        reading recommendations, helping readers discover their next favorite read.</p>
                </div>
            </div>
        </div>
    </section>
    <section>

    </section>


</main>
<footer></footer>
<script src="assects/js/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

<script>
    function openPopup(popupId, overlayId) {
        document.getElementById(popupId).classList.add('popup-active');
        document.getElementById(overlayId).classList.add('popup-overlay-active');
    }

    function closePopup(popupId, overlayId) {
        document.getElementById(popupId).classList.remove('popup-active');
        document.getElementById(overlayId).classList.remove('popup-overlay-active');
    }

    document.getElementById('loginOpenPopup').addEventListener('click', function () {
        openPopup('popup', 'loginPopupOverlay');
    });

    document.getElementById('registerPopup').addEventListener('click', function () {
        closePopup('popup', 'loginPopupOverlay');
        openPopup('regPopup', 'regPopupOverlay');
    });

    document.getElementById('backToLogin').addEventListener('click', function () {
        closePopup('regPopup', 'regPopupOverlay');
        openPopup('popup', 'loginPopupOverlay');
    });

    document.querySelectorAll('.popup-overlay').forEach(overlay => {
        overlay.addEventListener('click', function () {
            closePopup('popup', 'loginPopupOverlay');
            closePopup('regPopup', 'regPopupOverlay');
        });
    });
</script>
<script>
    $('#btnRegister').click(function (e) {
        const password = $('#RegPassword').val();
        const confirmPassword = $('#ConfirmRegPassword').val();

        if (password !== confirmPassword) {
            alert('Password mismatched');
            e.preventDefault();
        }
    });
</script>


</body>
</html>