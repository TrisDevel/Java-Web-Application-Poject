<%@page import="ClothesOnlineShop.Model.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
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
        <link rel="stylesheet" type="text/css" href="view/assets/user-UI/CSS/style-allproduct.css">
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

                            <form action='' method="GET">
                                <div class="search-container" style="margin-top: 25px; margin-left: 150px;">
                                    <input name="keyword" type="text" class="search-input" 
                                           value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>" 
                                           placeholder="Search...">
                                    <i class="search-icon fa fa-search" onclick="this.closest('form').submit()" style="cursor: pointer;"></i>
                                </div>    
                            </form>

                            <div class="cart">
                                <a href="CartController?action=goToCart">
                                    <i class="fa fa-shopping-cart"></i>
                                </a>
                                <span>${listSize}</span>
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
        <div class="container" style="margin-top: 150px; margin-bottom: 30px;">
            <div style="background-color: gainsboro;" class="row">
                <div class=" nav-barr">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <div class="collapse navbar-collapse" id="navbarNavDropdown">
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle font-weight-bold" href="#" id="navbarDropdownMenuLink"
                                       role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Price
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <a class="dropdown-item" href="ProductController?action=sort&order=asc">Price ascending</a>
                                        <a class="dropdown-item" href="ProductController?action=sort&order=desc">Price descending</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="collapse navbar-collapse" id="navbarNavDropdown">
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle font-weight-bold" href="#" id="navbarDropdownMenuLink"
                                       role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Type
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <a class="dropdown-item" href="ProductController">All</a>
                                        <a class="dropdown-item" href="ProductController?action=sort&order=${requestScope.order}&type=hoodies">Hoodies</a>
                                        <a class="dropdown-item" href="ProductController?action=sort&order=${requestScope.order}&type=cap">Cap</a>
                                        <a class="dropdown-item" href="ProductController?action=sort&order=${requestScope.order}&type=polo">Polo</a>
                                        <a class="dropdown-item" href="ProductController?action=sort&order=${requestScope.order}&type=balo">Balo</a>
                                        <a class="dropdown-item" href="ProductController?action=sort&order=${requestScope.order}&type=t-shirt">T-Shirt</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="collapse navbar-collapse" id="navbarNavDropdown">
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle font-weight-bold" href="#" id="navbarDropdownMenuLink"
                                       role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Color
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <a class="dropdown-item" href="ProductController?action=sort&order=${requestScope.order}&type=${requestScope.type}&color=red">Red</a>
                                        <a class="dropdown-item" href="ProductController?action=sort&order=${requestScope.order}&type=${requestScope.type}&color=blue">Blue</a>
                                        <a class="dropdown-item" href="ProductController?action=sort&order=${requestScope.order}&type=${requestScope.type}&color=white">White</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="collapse navbar-collapse" >
                            <a style="margin-left: 830px; text-decoration: none; color: red;"href='ProductController'>
                                <i class="fa-solid fa-ban"></i>
                            </a>
                        </div>
                    </nav>
                </div>
            </div>

        </div>
        <main>
            <div class="container">
                <div class="row">
                    <c:forEach var="product" items="${allProduct}">
                        <div class="col-md-4 product">
                            <div class="product-card">
                                <a href="ProductController?id=${product.idProduct}&type=${product.type}&action=detail">
                                    <img src="${product.images}" style="width: 100%; height: 500px; object-fit: cover;">
                                    <h3 style="color: black;">${product.nameProduct}</h3>
                                    <div style="font-weight: 600;">
                                        <span style="color: gray; text-decoration: line-through;"> 
                                            <fmt:formatNumber value="${product.cost * 1.2}" type="number" minFractionDigits="1" maxFractionDigits="1"/>$</span>
                                            <span style="color: #d0021b; margin-left: 4px">${product.cost}$</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="moreproduct" id="moreproduct"></div>
        </main>
        <div id="popup" class="popup"></div>
        <footer>
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
            <script src="view/web/js/scripts.js"></script>
    </body>

</html>