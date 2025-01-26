<%@ page import="lk.ijse.ecommercewebapplicationjavaee.model.CartTable" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart Managment</title>
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

    <table class="table table-bordered">
        <thead>
        <tr>
            <td>Cart ID</td>
            <td>products</td>
            <td>price</td>
            <td>Quantity</td>
            <td>Total</td>
            <td>Actions</td>
        </tr>
        </thead>
        <tbody>
        <%
            List<CartTable> cartList = (List<CartTable>) request.getAttribute("cartList");
            if (cartList != null) {
                double subTotal = 0;
                for (CartTable cart : cartList) {
                    subTotal += cart.getTotal();

        %>
        <tr>
            <td><%=cart.getCartId()%>
            </td>
            <td><%=cart.getProductName()%>
            </td>
            <td><%=cart.getProductPrice()%>
            </td>
            <td><%=cart.getQty()%>
            </td>
            <td><%=cart.getTotal()%>
            </td>

            <td>
                <form action="cart" method="post">
                    <input type="hidden" name="cartId" value="<%=cart.getCartId()%>">
                    <button class="btn btn-danger" name="action" value="doDelete">Remove</button>
                </form>
            </td>
        </tr>
        <%
            }
        %>
        <%--        <form action="placeOrder" method="post">
                    <input type="hidden" name="subTotal" value="<%=subTotal%>">
                    <button type="submit" class="btn btn-primary ">
                        Purchase
                    </button>
                </form>--%>
        </tbody>
        <tfoot>
        <tr>
            <td colspan="4" class="text-end"><strong>Subtotal:</strong></td>
            <td colspan="2"><%=subTotal%>
            </td>
        </tr>
        <tr>
            <td colspan="6" class="text-center">
                <form action="placeOrder" method="post" onsubmit="handlePurchase(event)">
                    <input type="hidden" name="subTotal" value="<%=subTotal%>">
                    <button type="submit" class="btn btn-primary">Purchase</button>
                </form>
            </td>
        </tr>
        </tfoot>
        <%
            }
        %>


    </table>

    <div id="notification"
         style="display:none; position:fixed; top:10px; right:10px; background:green; color:white; padding:10px; border-radius:5px; z-index:1000;">
        Order placed successfully!
    </div>


</main>

<script src="assects/js/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script>
    function handlePurchase(event) {

        event.preventDefault();


        const notification = document.getElementById('notification');
        notification.style.display = 'block';


        setTimeout(() => {
            notification.style.display = 'none';
            event.target.submit();
        }, 2000);
    }
</script>
</body>
</html>
