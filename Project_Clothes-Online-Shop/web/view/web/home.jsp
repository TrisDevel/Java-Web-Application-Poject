<%@page import="ClothesOnlineShop.Model.UserDTO" %>
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
        <link rel="stylesheet" type="text/css" href="view/assets/user-UI/CSS/style.css">
        <title>Clothes online shop</title>
        <style>
            .popup {
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: whitesmoke;
                width: 500px;
                height: 500px;
                color: white;
                padding: 15px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                display: none;
                z-index: 1000;            }


            .description {
                display: -webkit-box;
                -webkit-line-clamp: 2;
                -webkit-box-orient: vertical;  
                overflow: hidden;
                text-overflow: ellipsis;
                max-height: 3em; /* Điều chỉnh cho phù hợp với chiều cao của dòng chữ */
                line-height: 1.5em; /* Điều chỉnh cho phù hợp với chiều cao của dòng chữ */
            }
        </style>

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
                            <a href="CartController?action=goToCart">
                                <i class="fa fa-shopping-cart"></i>
                                <span>${listSize}</span>
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

    <!-- Carousel -->
    <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel" data-interval="3000">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100" src="view/web/img/Sale-off.png" alt="First slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="view/web/img/NewCollection.png" alt="Second slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="view/web/img/newCollection_2.png" alt="Third slide">
            </div>
        </div>
    </div>

    <main>
        <div class="product-categories">
            <h2>BEST SELLER</h2>
        </div>
        <div class="container">
            <section class="product-listings row">
                <c:forEach var="product" items="${bestSellers}">
                    <div class="col-md-4">
                        <div class="product-card">
                            <a href="ProductController?id=${product.idProduct}&action=detail&type=${product.type}">
                                <img src="${product.images}" style="width: 90%; height: 350px; object-fit: cover;">

                                <h3>${product.nameProduct}</h3>
                                <div style="font-weight: 600;">
                                    <span style="color: gray; text-decoration: line-through;"> 
                                        <fmt:formatNumber value="${product.cost * 1.2}" type="number" minFractionDigits="1" maxFractionDigits="1"/>$</span>
                                    <span style="color: #d0021b; margin-left: 4px">${product.cost}$</span>
                                </div>
                                <p style="font-weight:500; text-align: left; color: black; margin-top: 5px" class="description">${product.description}</p>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </section>
        </div>
        <div class="button-seall">
            <a href="ProductController"><button>See all</button></a>
        </div>
        <!-- Customer Feedback -->
        <div class="customer-feedback">
            <h2>Customer Feedback</h2>
            <div class="feedback-slider">
                <div class="feedback-item">
                    <p>"Great quality products! Highly recommend."</p>
                    <p>- Duong Thanh Tung</p>
                </div>
                <div class="feedback-item">
                    <p>"Excellent customer service and fast shipping."</p>
                    <p>- Le Quang Hai</p>
                </div>
                <div class="feedback-item">
                    <p>"Love the variety and the prices are reasonable."</p>
                    <p>- Nguyen Quoc Minh Hieu</p>
                </div>
            </div>
        </div>

        <!-- Newsletter Signup -->
        <div class="newsletter-signup">
            <h2>Sign up for our newsletter</h2>
            <p>Get the latest news and exclusive offers</p>
            <form id="newsletterForm" action="EmailController" onsubmit="showThankYouMessage()" method="post">
                <input type="email" id="emailInput" name="email" placeholder="Enter your email" required>
                <button type="submit">Subscribe</button>
            </form>


            <div id="thankYouMessage" class="thank-you-message">
                <h2>You are now subscribed. Thank you!</h2>
                <img src="view/web/img/thumbs-up-icon.png" alt="Thumbs Up">
                <p>Thank you! Your subscription has now been successfully confirmed.</p>
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
        <div id="popup" class="popup"></div>
        <div class="footer-bottom">
            <p>&copy; 2024 3Connguoi Studio. All Rights Reserved.</p>
        </div>
    </footer>
    <script>
        function showThankYouMessage() {
            var emailInput = document.getElementById('emailInput');
            if (emailInput.value) {
                var thankYouMessage = document.getElementById('thankYouMessage');
                thankYouMessage.style.display = 'block';
                setTimeout(function () {
                    thankYouMessage.style.display = 'none';
                }, 3000); // Hide after 3 seconds
            }
        }
        ;

        function showPopup(message) {
            var popup = document.getElementById("popup");
            popup.innerHTML = message;
            popup.style.display = "block";
            setTimeout(function () {
                popup.style.display = "none";
            }, 3000);
        }

        window.onload = function () {
        <% if (request.getAttribute("message") != null) {%>
            showPopup("<%= request.getAttribute("message")%>");
        <% }%>
        };
    </script>
</body>

</html>