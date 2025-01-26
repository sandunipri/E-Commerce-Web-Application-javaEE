<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.ecommercewebapplicationjavaee.model.UserTable" %><%--
  Created by IntelliJ IDEA.
  User: Sanduni
  Date: 1/19/2025
  Time: 9:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order Management</title>
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
    <link rel="stylesheet" href="assects/css/order.css">
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

            <a href="admin.jsp" class="btn btn-primary addProduct" id="logout">
                <b>BACK</b>
            </a>
        </div>

    </div>
</header>
<main>
    <div class="order-details">
        <p class="text-center m-0 text">ALL USERS</p>

        <%--<table class="table">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Product</th>
                <th scope="col">Total</th>

            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td>Mark</td>
                <td>Otto</td>
            </tr>
            </tbody>
        </table>--%>
        <div class="table-responsive">
            <table class="table order-details-table">
                <thead>
                <tr>
                    <th>User Name</th>
                    <th>User Email</th>
                    <th>User Role</th>
                    <th>Status</th>
                </tr>
                </thead>
                <tbody>
                <%
                    List<UserTable> allUsers = (List<UserTable>) request.getAttribute("userList");
                    if (allUsers != null) {
                        for (UserTable user : allUsers) {

                %>
                <tr>
                    <td><%=user.getUserName()%></td>
                    <td><%=user.getUserEmail()%></td>
                    <td><%=user.getUserRole()%></td>
                    <td><b>ACTIVE</b></td>
                </tr>
                <%
                    }
                }
                %>
                </tbody>
            </table>
        </div>
    </div>
</main>


<script src="assects/js/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

</body>
</html>

