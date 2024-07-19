<%@page import="ClothesOnlineShop.Model.UserDTO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">

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
        <link rel="stylesheet" type="text/css" href="view/assets/user-UI/CSS/style-news.css">
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
                                <a href="CartController">
                                    <i class="fa fa-shopping-cart"></i>
                                </a>
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
        <main style="padding: 150px;">
            <section class="news">
                <div class="news__container">
                    <div class="news__item">
                        <img src="view/web/img/Sale-off.png" alt="" />
                        <div class="news__item-content">
                            <h3> 3Connguoi CHÍNH THỨC CÓ MẶT TẠI VINCOM MEGA MALL....</h3>
                            <p>Vào ngày 01.06.2024, địa điểm mua sắm mới của 3Connguoi sẽ chính thức chào sân tại Vincom Mega Mall Vinhomes Grand Park Quận 9, Thành phố Thủ Đức. Sự góp mặt của cửa hàng thứ 11 này đánh dấu cột mốc tiếp theo trên chặng đường mang 3Connguoi đến gần hơn với các bạn trẻ yêu thích Streetwear....</p>
                            <a href="#" class="news__item-button">Xem thêm</a>
                        </div>
                    </div>
                    <div class="news__item">
                        <img src="view/web/img/Sale-off.png" alt="" />
                        <div class="news__item-content">
                            <h3> 3Connguoi CHÍNH THỨC CÓ MẶT TẠI VINCOM MEGA MALL....</h3>
                            <p>Vào ngày 01.06.2024, địa điểm mua sắm mới của 3Connguoi sẽ chính thức chào sân tại Vincom Mega Mall Vinhomes Grand Park Quận 9, Thành phố Thủ Đức. Sự góp mặt của cửa hàng thứ 11 này đánh dấu cột mốc tiếp theo trên chặng đường mang DirtyCoins đến gần hơn với các bạn trẻ yêu thích Streetwear....</p>
                            <a href="#" class="news__item-button">Xem thêm</a>
                        </div>
                    </div>
                    <div class="news__item">
                        <img src="view/web/img/Sale-off.png" alt="" />
                        <div class="news__item-content">
                            <h3> 3Connguoi CHÍNH THỨC CÓ MẶT TẠI VINCOM MEGA MALL....</h3>
                            <p>Vào ngày 01.06.2024, địa điểm mua sắm mới của 3Connguoi sẽ chính thức chào sân tại Vincom Mega Mall Vinhomes Grand Park Quận 9, Thành phố Thủ Đức. Sự góp mặt của cửa hàng thứ 11 này đánh dấu cột mốc tiếp theo trên chặng đường mang DirtyCoins đến gần hơn với các bạn trẻ yêu thích Streetwear....</p>
                            <a href="#" class="news__item-button">Xem thêm</a>
                        </div>
                    </div>
                </div>
            </section>
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