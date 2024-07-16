<%@page import="ClothesOnlineShop.Model.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
        <link rel="stylesheet" type="text/css" href="view/assets/user-UI/CSS/style-contact.css">
        <title>Clothes online shop</title>
        <style>
            li {
                margin-bottom: 13px;
            }
            a {
                text-decoration: none;
                color: black;
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
                                <a href="CartController">
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
            <div class="container main-content" style="padding-top: 150px;">
                <div class="row">
                    <div style="text-align: center;" class="col-lg-8">
                        <p><i class="fa-solid fa-folder"></i></p>
                        <h2> INFORMATION ABOUT 3CONNGUOI STORE SYSTEM</h2>
                        <p style="color: gray; margin: 18px;"><span style="margin-right: 10px;">Posted by: Vu Anh Duc</span> |
                            <span style="margin-left: 10px;">03/06/2024</span>
                        </p>
                        <h1 style="font-weight: 550;margin: 28px;">SHOP SYSTEM</h1>
                        <h3 style="font-weight: 550;margin: 18px;">Ho Chi Minh Branch:</h3>
                        <ul style="list-style-type: none;">
                            <li><i class="fa-solid fa-check"></i> District 1: 160 Nguyen Cu Trinh, Ward Nguyen Cu Trinh.
                            </li>
                            <li> <i class="fa-solid fa-check"></i> District 1: 160 Nguyen Cu Trinh, Ward Nguyen Cu Trinh.
                            </li>
                            <li><i class="fa-solid fa-check"></i> District 1 - The New Playground: 26 Ly Tu Trong, Ben Nghe
                                Ward.</li>
                        </ul>
                        <p style="margin: 18px; font-size: 20px;"><span style="margin-right: 10px;">0965 233 198 </span> -
                            <span style="margin-left: 10px;">0383 276 199</span></p>
                        <p style="margin: 18px; font-size: 20px;">3connguoishop@gmail.com</p>
                        <P style="text-align: left;margin: 30px;margin-bottom: 10px;">SHARE POST</P>
                        <p style="font-size: 30px;text-align: left;margin-left: 30px;"><i class="fa-brands fa-tiktok"></i> <i class="fa-brands fa-facebook"></i> <i class="fa-brands fa-twitter"></i></p>

                    </div>
                    <div class="col-lg-4">
                        <h3>SHOP NEWS</h3>
                        <hr>
                        <form style="position: relative;">
                            <input style="box-shadow: 5px 5px 5px 5px lightgrey;" class="form-control" type="search" placeholder="Search">
                            <i class="fa-solid fa-magnifying-glass" style="position: absolute; top: 10px;right: 10px;"></i>
                        </form>
                        <hr>

                        <ul style="list-style-type: none;padding: 0;">
                            <li><a href="#"><i class="fa-solid fa-pen-fancy"></i> 3connguoi unveils new collection with bold Y2K style</a></li>
                            <li><a href="#"><i class="fa-solid fa-pen-fancy"></i> Feminine or edgy? Find the answer at 3connguoi</a></li>
                            <li><a href="#"><i class="fa-solid fa-pen-fancy"></i> Explore unique ways to express your love at 3connguoi</a></li>
                            <li><a href="#"><i class="fa-solid fa-pen-fancy"></i> How to shine in your outfit while still keeping a normal appearance?</a></li>
                            <li><a href="#"><i class="fa-solid fa-pen-fancy"></i> Analysis of how Y2K has changed perceptions of modern fashion</a></li>
                            <li><a href="#"><i class="fa-solid fa-pen-fancy"></i> The secret to mixing simple yet stylish outfits with 3connguoi</a></li>
                            <li><a href="#"><i class="fa-solid fa-pen-fancy"></i> How to create a personalized and edgy streetwear style with products from 3connguoi?</a></li>
                            <li><a href="#"><i class="fa-solid fa-pen-fancy"></i> 3connguoi - Where to discover the latest fashion trends of the year</a></li>
                            <li><a href="#"><i class="fa-solid fa-pen-fancy"></i> How to create a unique and individual outfit with products from 3connguoi?</a></li>
                            <li><a href="#"><i class="fa-solid fa-pen-fancy"></i> Step into the world of Y2K: Fashion inspiration from the 2000s</a></li>
                            <li><a href="#"><i class="fa-solid fa-pen-fancy"></i> DirtyCoins x One Piece Season 2: The perfect blend of manga and fashion</a></li>
                            <li><a href="#"><i class="fa-solid fa-pen-fancy"></i> Explore the latest collection from 3connguoi: When workwear meets streetwear</a></li>
                            <li><a href="#"><i class="fa-solid fa-pen-fancy"></i> Why 'unconventional' style is the trend among today's youth?</a></li>
                        </ul>
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