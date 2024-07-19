<%@page import="ClothesOnlineShop.Model.UserDTO"%>
<!DOCTYPE html>
<html lang="en">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
        <link rel="stylesheet" type="text/css"  href="view/assets/user-UI/CSS/style-detail.css">
        <link rel="stylesheet" type="text/css"  href="view/assets/user-UI/CSS/style-allproduct.css">
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
                                <a href="CartController?action=goToCart">
                                    <i class="fa fa-shopping-cart"></i>
                                </a>
                                <span>${listSize}</span>
                            </div>
                            <div class="login">
                                <% UserDTO user = (UserDTO) session.getAttribute("usersession"); %>
                                <% if (user != null) {%>
                                <a href="ProfileControlller?id=<%= user.getIdCustomer()%>">
                                    <i class="fa-regular fa-user"></i>
                                    <p><%= user.getLastName()%></p>

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
            <div class="container" style="margin-top: 150px;">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="product-images">
                            <img src="${requestScope.product.images}" alt="Product Image" style="width: 100%;">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="info-product">
                            <h1>${requestScope.product.nameProduct}</h1>
                            <div class="pricing">
                                <p style="color: gray; text-decoration: line-through;">
                                    <fmt:formatNumber value="${product.cost * 1.2}" type="number" minFractionDigits="1" maxFractionDigits="1"/>$</p>
                                <p>${requestScope.product.cost}$</p>
                            </div>
                            <div class="color-display">
                                <p>Color: ${requestScope.product.color}</p>
                                <div class="color-box" style="background-color: ${requestScope.product.color};"></div>
                            </div>                           <form action="CartController" method="GET" >
                                <div class="size-options">
                                    <p>Size:</p>
                                    <div>
                                        <input type="radio" id="size-s" name="size" value="S" checked>
                                        <label for="size-s">S</label>

                                        <input type="radio" id="size-m" name="size" value="M">
                                        <label for="size-m">M</label>

                                        <input type="radio" id="size-l" name="size" value="L">
                                        <label for="size-l">L</label>

                                        <input type="radio" id="size-xl" name="size" value="XL">
                                        <label for="size-xl">XL</label>
                                    </div>
                                </div>

                                <div class="quantity-options">
                                    <p>Quantity:</p>
                                    <input type="number" name="quantity" value="1" min="1">
                                </div>
                                <input type="hidden" name="idProduct" value="${requestScope.product.idProduct}">
                                <input type="hidden" name="type" value="${requestScope.product.type}">
                                <input type="submit" value="Add to Cart">
                            </form>

                            <div class="trust-signal">
                                <p><i class="fas fa-lock"></i> Shop secure, Free Returns</p>
                            </div>
                            <div class="social-share">
                                <p>Share: </p>
                                <a href="#"><i class="fa-brands fa-facebook"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fas fa-envelope"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="product-details">
                            <ul class="nav nav-tabs" id="productTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="description-tab" data-toggle="tab" href="#description"
                                       role="tab" aria-controls="description" aria-selected="true">Description</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="shipping-tab" data-toggle="tab" href="#shipping" role="tab"
                                       aria-controls="shipping" aria-selected="false">Shipping Information</a>
                                </li>
                            </ul>
                            <div class="tab-content" id="productTabContent">
                                <div class="tab-pane fade show active" id="description" role="tabpanel"
                                     aria-labelledby="description-tab">
                                    <p>${requestScope.product.description}</p>
                                    <strong>Size chart</strong>
                                    <img src="view/web/img/sizechart.png" alt="Size Chart" style="width: 70%; object-fit: cover;">
                                </div>
                                <div class="tab-pane fade" id="shipping" role="tabpanel" aria-labelledby="shipping-tab">
                                    <h3>Shipping Policy</h3>
                                    <p>All orders are processed within 1-2 business days. Orders are not shipped or delivered on weekends or holidays.</p>
                                    <p>If we are experiencing a high volume of orders, shipments may be delayed by a few days. Please allow additional days in transit for delivery. If there will be a significant delay in shipment of your order, we will contact you via email or telephone.</p>
                                    <h3>International Shipping</h3>
                                    <p>We currently do not ship outside the Viet Nam.</p>
                                    <h3>Contact Us</h3>
                                    <p>If you have any questions about shipping, please contact us at:</p>
                                    <p>Email: support@3Conguoishop.com</p>
                                    <p>Phone: 0372899192</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <h4>Related Products</h4>
                </div>
                <div class="row">
                    <div class="carousel-container">
                        <div class="carousel-wrapper">
                            <!-- Repeat this block for each product -->
                            <c:forEach var="product" items="${list}">

                                <div class="product-card carouselite">
                                    <a href="ProductController?id=${product.idProduct}&action=detail&type=${product.type}">
                                        <img src="${product.images}" style="width: 100%; height: 350px; object-fit: cover;">
                                        <h3>${product.nameProduct}</h3>
                                        <p style="color: gray; text-decoration: line-through;">
                                            <fmt:formatNumber value="${product.cost * 1.2}" type="number" minFractionDigits="1" maxFractionDigits="1"/>$</p>
                                        <p>${product.cost}$</p>
                                    </a>
                                </div>

                            </c:forEach>

                            <!-- End of product blocks -->
                        </div>
                        <button class="carousel-button prev" onclick="prevSlide()">&#10094;</button>
                        <button class="carousel-button next" onclick="nextSlide()">&#10095;</button>
                    </div>
                </div>
            </div>



        </div>

    </main>

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
        <script src="view/web/js/detailscripts.js" ></script>
</body>

</html>