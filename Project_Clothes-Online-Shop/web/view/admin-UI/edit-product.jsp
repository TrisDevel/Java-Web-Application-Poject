<%@page import="ClothesOnlineShop.Model.AdminDTO"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Edit Product - Dashboard Admin</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700"/>
        <link rel="stylesheet" href="view/admin-UI/css/fontawesome.min.css" />
        <link rel="stylesheet" href="jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
        <link rel="stylesheet" href="view/admin-UI/css/bootstrap.min.css" />
        <link rel="stylesheet" href="view/admin-UI/css/templatemo-style.css">
    </head>

    <body>
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
        <div class="container tm-mt-big tm-mb-big">
            <div class="row">
                <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <div class="row">
                            <div class="col-12">
                                <h2 class="tm-block-title d-inline-block">Edit Product</h2>
                            </div>
                        </div>
                        <div class="row tm-edit-product-row">
                            <div class="col-xl-6 col-lg-6 col-md-12">
                                <form action="UpdateProduct?id=${product.idProduct}" method="post" class="tm-edit-product-form">
                                    <input name="images" type="hidden" value="${product.images}" class="form-control validate" required />
                                    <div class="form-group mb-3">
                                        <label
                                            <label for="nameProduct">Product Name</label>
                                        <input id="nameProduct" name="nameProduct" type="text" value="${product.nameProduct}" class="form-control validate" required />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="description"
                                            >Description</label
                                        >
                                        <textarea                    
                                            class="form-control validate tm-small"
                                            name="description"
                                            rows="5"
                                            required
                                            >${product.description}</textarea>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="type"
                                            >Type</label
                                        >
                                        <select class="custom-select tm-select-accounts" id="type" name="type">
                                            <option>Select type</option>
                                            <option  value="T-Shirt" selected>T-Shirt</option>
                                            <option  value="Hoodie">Hoodie</option>
                                            <option  value="Cap">Cap</option>
                                            <option  value="Balo">Cap</option>
                                        </select>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            <label for="size">Size</label>
                                        </label>
                                        <input id="size" name="size" type="text" value="${product.size}" class="form-control validate" required />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            <label for="color">Color</label>
                                        </label>
                                        <input id="color" name="color" type="text" value="${product.color}" class="form-control validate" required />
                                    </div>
                                    <div class="row">
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="cost"
                                                >Cost
                                            </label>
                                            <input
                                                id="cost"
                                                name="cost"
                                                type="text"
                                                value="${product.cost}"
                                                class="form-control validate"
                                                data-large-mode="true"
                                                />
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="productQuantity"
                                                >Units In Stock
                                            </label>
                                            <input
                                                id="productQuantity"
                                                name="quantity"
                                                type="text"
                                                value="${product.productQuantity}"
                                                class="form-control validate"
                                                />
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button type="submit" class="btn btn-primary btn-block text-uppercase">Update Now</button>
                                    </div>
                                </form>

                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                                <div class="tm-product-img-edit mx-auto">
                                    <img src="${product.images}" alt="Product image" class="img-fluid d-block mx-auto">
                                    <i
                                        class="fas fa-cloud-upload-alt tm-upload-icon"
                                        onclick="document.getElementById('fileInput').click();"
                                        ></i>
                                </div>
                                <div class="custom-file mt-3 mb-3">
                                    <input id="fileInput" type="file" style="display:none;" />
                                    <input
                                        type="button"
                                        class="btn btn-primary btn-block mx-auto"
                                        value="CHANGE IMAGE NOW"
                                        onclick="document.getElementById('fileInput').click();"
                                        />
                                </div>
                            </div>

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
