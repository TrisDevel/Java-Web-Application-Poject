<%@page import="ClothesOnlineShop.Model.AdminDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Product Page - Admin HTML Template</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="view/admin-UI/css/fontawesome.min.css" />
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="view/admin-UI/css/bootstrap.min.css" />
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="view/admin-UI/css/templatemo-style.css">
        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        
        -->
        <style>
            .popup {
                position: fixed;
                top: 20px;
                right: 20px;
                background-color: #4caf50;
                color: white;
                padding: 15px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                display: none;
                z-index: 1000;
            }
        </style>
    </head>

    <body id="reportsPage">
        <nav class="navbar navbar-expand-xl">
            <div class="container h-100">
                <a class="navbar-brand" href="AdminServlet">
                    <h1 class="tm-site-title mb-0">Product Admin</h1>
                </a>
                <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-bars tm-nav-icon"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto h-100">
                        <li class="nav-item">
                            <a class="nav-link" href="AdminServlet">
                                <i class="fas fa-tachometer-alt"></i>
                                Dashboard
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                       
                        <li class="nav-item">
                            <a class="nav-link active" href="AdminServlet?action=product">
                                <i class="fas fa-shopping-cart"></i>
                                Products
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="AdminServlet?action=account">
                                <i class="far fa-user"></i>
                                Accounts
                            </a>
                        </li>
                    </ul>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <% AdminDTO admin = (AdminDTO) session.getAttribute("adminsession");%>
                            <form id="logoutForm" action="LogoutController" method="POST">
                                <input type="hidden" name="logout" value="true">
                                <a class="nav-link d-block" href="#" onclick="document.getElementById('logoutForm').submit();">
                                    <%= admin.getAdName()%>, <b>Logout</b>
                                </a>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container mt-5">
            <div class="row tm-content-row">
                <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-products">
                        <div class="tm-product-table-container">
                            <table class="table table-hover tm-table-small tm-product-table">
                                <thead>
                                    <tr>
                                        <th scope="col">PRODUCT</th>
                                        <th scope="col">QUANTITY</th>
                                        <th scope="col">COST</th>
                                        <th scope="col">SIZE</th>
                                        <th scope="col">COLOR</th>
                                        <th scope="col">&nbsp;</th>
                                        <th scope="col">&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="product" items="${allProduct}">
                                        <tr>
                                            <td class="tm-product-name">${product.nameProduct}</td>
                                            <td>${product.productQuantity}</td>
                                            <td>${product.cost}</td>
                                            <td>${product.size}</td>
                                            <td>${product.color}</td>
                                            <td>
                                                <a href="ManagementProduct?action=delete&id=${product.idProduct}" class="tm-product-delete-link">
                                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                                </a>
                                            </td>
                                            <td>
                                                <a href="ManagementProduct?action=view&id=${product.idProduct}" class="tm-product-delete-link">
                                                    <i class="far fa-edit tm-product-delete-icon"></i>
                                                </a>
                                            </td>
                                            </a>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- table container -->
                        <a
                            href="ManagementProduct?action=create"
                            class="btn btn-primary btn-block text-uppercase mb-3">Add new product</a>
                        
                    </div>
                </div>


            </div>
        </div>
                                
        <div id="popup" class="popup"></div>                        
<div id="popup" class="popup"></div>
<footer class="tm-footer row tm-mt-small">
    <div class="col-12 font-weight-light">
        <p class="text-center text-white mb-0 px-4 small">
            Copyright &copy; <b>2018</b> All rights reserved. 

            Design: <a rel="nofollow noopener" href="https://templatemo.com" class="tm-footer-link">Template Mo</a>
        </p>
    </div>
</footer>

<script src="js/jquery-3.3.1.min.js"></script>
<!-- https://jquery.com/download/ -->
<script src="js/bootstrap.min.js"></script>
<!-- https://getbootstrap.com/ -->
<script>
                                    $(function () {
                                        $(".tm-product-name").on("click", function () {
                                            window.location.href = "edit-product.html";
                                        });
                                    });

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