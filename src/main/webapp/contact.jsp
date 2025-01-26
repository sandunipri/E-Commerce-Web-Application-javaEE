<%--
  Created by IntelliJ IDEA.
  User: Sanduni
  Date: 1/26/2025
  Time: 7:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
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
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .header {
            text-align: center;
            padding: 20px;
            background: #007bff;
            color: white;
        }

        .header h1 {
            margin: 0;
        }

        .contact-section {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 20px;
        }

        .contact-form {
            flex: 1;
            min-width: 300px;
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .contact-form h2 {
            margin-bottom: 20px;
        }

        .contact-form label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .contact-form input,
        .contact-form textarea,
        .contact-form button {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .contact-form button {
            background: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }

        .contact-form button:hover {
            background: #0056b3;
        }

        .contact-info {
            flex: 1;
            min-width: 300px;
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .contact-info h2 {
            margin-bottom: 20px;
        }

        .contact-info p {
            margin: 10px 0;
        }

        .map {
            margin-top: 20px;
        }

        iframe {
            width: 100%;
            border: 0;
            border-radius: 8px;
        }
    </style>
</head>

<body>
<header>
    <div class="topHeader">
        <div class="logoAndName">
            <img class="logo" src="assects/images/img_1.png" alt="Web Application Logo">
            <p class="webTitle">DREAMER'S SHELF</p>
        </div>
    </div>
    <div class="middleHeader">
        <div class="dropdown">
            <button class="btnCategory dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                CATEGORY
            </button>
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
    <div class="container">
        <div class="contact-section">
            <!-- Contact Form -->
            <div class="contact-form">
                <h2>Send us a message</h2>
                <form action="submitContactForm.jsp" method="post">
                    <label for="name">Your Name</label>
                    <input type="text" id="name" name="name" placeholder="Enter your name" required>

                    <label for="email">Your Email</label>
                    <input type="email" id="email" name="email" placeholder="Enter your email" required>

                    <label for="message">Your Message</label>
                    <textarea id="message" name="message" rows="5" placeholder="Write your message here"
                              required></textarea>

                    <button type="submit">Send Message</button>
                </form>
            </div>

            <!-- Contact Information -->
            <div class="contact-info">
                <h2>Contact Information</h2>
                <p><strong>Address:</strong> 123 Muddhuwa Road,Rathnapura, Sri Lanka</p>
                <p><strong>Phone:</strong> 076-4389984</p>
                <p><strong>Email:</strong>priyadarshani@gmail.com</p>
                <p><strong>Business Hours:</strong></p>
                <p>Monday - Friday: 9:00 AM - 5:00 PM</p>
                <p>Saturday: 10:00 AM - 4:00 PM</p>
                <p>Sunday: Closed</p>
            </div>
        </div>

        <!-- Map Section -->
<%--        <div class="map">
            <h2>Our Location</h2>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3153.835434509387!2d-122.41941508468202!3d37.77492927975917!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8085808e5dd1b473%3A0x9e2b49381bb59e73!2sSan%20Francisco%2C%20CA%2C%20USA!5e0!3m2!1sen!2s!4v1696441287653!5m2!1sen!2s"
                    height="300" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>--%>
    </div>
</main>
<script src="assects/js/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>

</html>

