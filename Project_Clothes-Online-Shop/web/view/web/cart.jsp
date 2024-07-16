<%@page import="ClothesOnlineShop.Model.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
              integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
                integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <link rel="stylesheet" type="text/css" href="view/assets/user-UI/CSS/style-cart.css">
        <title>Clothes online shop</title>
    </head>

    <body>
        <div class="container-fluid">
            <header class="header nav-bar">
                <div class="row">
                    <div class="col-lg-2">
                        <a href="DispatchServlet" class="logo-brand">
                            <div>
                                <img src="view/web/img/name-brand.png" alt="">
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-5">
                        <ul>
                            <li><a href="ProductController">SHOP</a></li>
                            <li><a href="DispatchServlet">BEST SELLER</a></li>
                            <li><a href="News">NEWS</a></li>
                            <li><a href="Contact">CONTACT</a></li>
                            <li><a href="About">ABOUT</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-5">
                        <div>
                            
                            <div class="cart">
                                <a href="web/cart.jsp">
                                    <i class="fa fa-shopping-cart"></i>
                                </a>
                            </div>
                            <div class="login">
                                <% UserDTO user = (UserDTO) session.getAttribute("usersession"); %>
                                <% if (user != null) {%>
                                <a href="DispatchServlet?action=logout">
                                    <i class="fa fa-sign-out-alt"></i>
                                </a>
                                <% } else { %>
                                <a href="DispatchServlet?action=login">
                                    <i class="fa fa-user"></i>
                                </a>
                                <% }%>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
        <main>
            <div class="container" style="margin-top: 150px; margin-bottom: 30px;">
                <h1>${sessionScope.usersession.lastName}'s Shopping Cart </h1>
                <div class="row">
                    <div class="col-lg-12">
                        <table class="cart-table">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Image</th>
                                    <th>Name</th>
                                    <th>Size</th>
                                    <th>Cost</th>
                                    <th>Quantity</th>
                                    <th>Total Cost</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="o" value="${sessionScope.cart}" />
                                <c:set var="t" value="0" />
                                <c:forEach items="${o.item}" var="i">
                                    <c:set var="t" value="${t + 1}" />
                                    <tr>
                                        <td>${t}</td>
                                        <td><img class="product-image" src="${i.product.images}" alt="${i.product.nameProduct}"></td>
                                        <td>${i.product.nameProduct}</td>
                                        <td>${i.size}</td>
                                        <td>${i.product.cost}$</td>
                                        <td class="quantity">
                                            <button class="quantity-button">
                                                <a href="process?num=-1&id=${i.product.idProduct}&action=adjust&size=${i.size}">-</a>
                                            </button>
                                            <input type="text" class="readonly-input" readonly value="${i.quantity}" />
                                            <button class="quantity-button">
                                                <a href="process?num=1&id=${i.product.idProduct}&action=adjust&size=${i.size}">+</a>
                                            </button>
                                        </td>
                                        <td>${i.product.cost * i.quantity}$</td>
                                        <td>
                                            <form action="process" method="post">
                                                <input type="hidden" name="id" value="${i.product.idProduct}" />
                                                <input type="hidden" name="action" value="return" />
                                                <input type="submit" class="delete-button" value="Return item" />
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <hr>
                    </div>
                    <div class="col-lg-12">                    
                        <form action="CheckoutController" method="">
                            <div class="row payment">
                                <div class="paymentMethod">
                                    <input type="radio" id="Cash" name="paymentId" value="1" checked>
                                    <label for="Cash">Cash</label>
                                </div>
                                <div class="paymentMethod">
                                    <input type="radio" id="Credit Card" name="paymentId" value="2">
                                    <label for="Credit Card">Credit Card</label>
                                </div>

                            </div>
                            <div class="row">
                                <table class="payment-table">
                                    <tr>
                                        <td>Total Payment</td>
                                        <td><fmt:formatNumber value="${o.getTotalMoney()}" type="number" minFractionDigits="2" maxFractionDigits="2"/>$</td>
                                    </tr>
                                </table>

                            </div>
                            <div style="text-align: center">
                                <input class="checkout-btn" type="submit" value="Check out"/>
                            </div>

                        </form>  
                        <div style="text-align: center">
                            <button class="continue-shopping">CONTINUE SHOPPING</button>
                        </div>
                    </div>





                </div>

            </div>


        </main>
        <footer class="footer">
            <div class="footer-top">
                <div class="row">
                    <div class="col-lg-3">
                        <h4>Contact Us</h4>
                        <h5>Ho Chi Minh Branch</h5>
                        <p>
                            District 1: 160 Nguyen Cu Trinh, Ward Nguyen Cu Trinh.<br>
                            District 1: 561 Su Van Hanh, Ward 13.<br>
                            District 1 - The New Playground: 26 Ly Tu Trong, Ben Nghe Ward.
                        </p>
                    </div>
                    <div class="col-lg-3">
                        <h4>Customer Service</h4>
                        <ul>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">Returns</a></li>
                            <li><a href="#">Shipping</a></li>
                            <li><a href="#">FAQs</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-3">
                        <h4>Quick Links</h4>
                        <ul>
                            <li><a href="#">Shop</a></li>
                            <li><a href="#">Best Sellers</a></li>
                            <li><a href="#">News</a></li>
                            <li><a href="#">About Us</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-3">
                        <h4>Follow Us</h4>
                        <div class="icon">
                            <img class="icon-youtube" src="https://www.coolmate.me/images/footer/icon-youtube.svg"
                                 onclick="window.open('https://www.youtube.com/channel/UC9J9f5J9QJnZ9v8Z2b7v9jw', '_blank')"
                                 style="width: 35px; height: 35px;">
                            <img class="icon-facebook" src="https://mcdn.coolmate.me/image/June2023/mceclip1_43.png"
                                 onclick="window.open('https://www.facebook.com/Shop-System-Ho-Chi-Minh-Branch-101925154381829', '_blank')"
                                 style="width: 35px; height: 35px;">
                            <img class="icon-ig" src="https://www.coolmate.me/images/footer/icon-instar.svg"
                                 onclick="window.open('https://www.instagram.com/shop.system.hcm/', '_blank')"
                                 style="width: 35px; height: 35px;">
                            <img class="icon-zalo" src="https://mcdn.coolmate.me/image/June2023/mceclip2_68.png"
                                 onclick="window.open('https://zalo.me/your-zalo-link', '_blank')"
                                 style="width: 35px; height: 35px;">
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2024 3Connguoi Studio. All Rights Reserved.</p>
            </div>
        </footer>
        <script src="scripts.js"></script>
    </body>
</html>