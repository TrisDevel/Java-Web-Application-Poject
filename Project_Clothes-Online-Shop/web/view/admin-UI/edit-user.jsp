    <%@page import="ClothesOnlineShop.Model.AdminDTO"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Edit Product - Dashboard Admin Template</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="view/admin-UI/css/fontawesome.min.css" />
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
        <!-- http://api.jqueryui.com/datepicker/ -->
        <link rel="stylesheet" href="view/admin-UI/css/bootstrap.min.css" />
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="view/admin-UI/css/templatemo-style.css">
        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->
    </head>

    <body>
        <nav class="navbar navbar-expand-xl">
            <div class="container h-100">
                <a class="navbar-brand" href="index.jsp">
                    <h1 class="tm-site-title mb-0">Product Admin</h1>
                </a>
                <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-bars tm-nav-icon"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto h-100">
                        <li class="nav-item">
                            <a class="nav-link " href="AdminServlet">
                                <i class="fas fa-tachometer-alt"></i>
                                Dashboard
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                       
                        <li class="nav-item">
                            <a class="nav-link" href="AdminServlet?action=product">
                                <i class="fas fa-shopping-cart"></i>
                                Products
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link active" href="AdminServlet?action=account">
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
        <div class="container tm-mt-big tm-mb-big">
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 mx-auto">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <div class="row">
                            <div class="col-12">
                                <h2 class="tm-block-title d-inline-block">Edit User</h2>
                            </div>
                        </div>
                        <div class="row tm-edit-product-row">
                            <div class="col-xl-12 col-lg-12 col-md-12">
                                <form action="UpdateUser?id=${user.idCustomer}" method="post" class="tm-edit-product-form">
                                    <div class="form-group mb-3">
                                        <label
                                            <label for="nameProduct">First Name</label>
                                        </label>
                                        <input id="nameProduct" name="firstname" type="text" value="${user.firstName}" class="form-control validate" required />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            <label for="nameProduct">Last Name</label>
                                        </label>
                                        <input id="nameProduct" name="lastname" type="text" value="${user.lastName}" class="form-control validate" required />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            <label for="gender">Last Name</label>
                                        </label>
                                        <input id="gender" name="gender" type="text" value="${user.gender}" class="form-control validate" required />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="address"
                                            >Address</label
                                        >
                                        <textarea                    
                                            class="form-control validate tm-small"
                                            rows="3"
                                            name="address"
                                            required
                                            >${user.address}</textarea>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            <label for="email">Email</label>
                                        </label>
                                        <input id="email" name="email" type="text" value="${user.email}" class="form-control validate" required />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            <label for="phoneNumber">Phone Number</label>
                                        </label>
                                        <input id="phoneNumber" name="phoneNumber" type="text" value="${user.phoneNumber}" class="form-control validate" required />
                                    </div>
                                    <div class="col-12">
                                        <button type="submit" class="btn btn-primary btn-block text-uppercase">Update Now</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
    <script src="jquery-ui-datepicker/jquery-ui.min.js"></script>
    <!-- https://jqueryui.com/download/ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    <script>
                                    $(function () {
                                        $("#expire_date").datepicker({
                                            defaultDate: "10/22/2020"
                                        });
                                    });
    </script>
</body>
</html>
