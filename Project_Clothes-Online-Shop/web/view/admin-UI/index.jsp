<%@page import="ClothesOnlineShop.Controller.Web.Handle.DispatchServlet"%>
<%@page import="ClothesOnlineShop.Model.AdminDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Product Admin - Dashboard HTML Template</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="view/admin-UI/css/fontawesome.min.css">
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="view/admin-UI/css/bootstrap.min.css">
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="view/admin-UI/css/templatemo-style.css">
        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->
    </head>
    <%
        String logout = request.getParameter("logout");
        if ("true".equals(logout)) {
            session.invalidate(); // Xóa session
        }
    %>

    <body id="reportsPage">
        <div class="" id="home">
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
                                <a class="nav-link active" href="#">
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
                                <a class="nav-link" href="AdminServlet?action=account">
                                    <i class="far fa-user"></i>
                                    Accounts
                                </a>
                            </li>
                        </ul>
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <% AdminDTO admin = (AdminDTO) session.getAttribute("adminsession");%>
                                <form id="logoutForm" action="DispatchServlet?action=logout" method="POST">
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
            <div class="container">
                <div class="row">
                    <div class="col">
                        <p class="text-white mt-5 mb-5">Welcome back, <b><%= admin.getAdName()%></b></p>
                    </div>
                </div>

                <div class="col-12 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
                        <h2 class="tm-block-title">Orders List</h2>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">ORDER NO.</th>
                                    <th scope="col">CUSTOMER NAME</th>
                                    <th scope="col">PROCESSING</th>
                                    <th scope="col">PAYMENT</th>
                                    <th scope="col">START DATE</th>
                                    <th scope="col">TOTAL</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="order" items="${allOrder}">
                                    <tr onclick="window.location.href='ManagementOrder?id=${order.idOrder}'" style="cursor:pointer;">
                                        <th scope="row"><b>${order.idOrder}</b></th>
                                        <th scope="row"><b>${order.customerName}</b></th>
                                        <td>
                                            <div class="tm-status-circle moving">
                                            </div>Moving
                                        </td>
                                        <td><b>${order.paymentName}</b></td>
                                        <td><b>${order.startDate}</b></td>
                                        <td><b>${order.totalMoney}</b></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer-bottom">
            <div>
                <p>&copy; 2024 3Connguoi Studio. All Rights Reserved.</p>
            </div>
        </footer>
    </div>

    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="js/moment.min.js"></script>
    <!-- https://momentjs.com/ -->
    <script src="js/Chart.min.js"></script>
    <!-- http://www.chartjs.org/docs/latest/ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    <script src="js/tooplate-scripts.js"></script>
    <script>
                                        Chart.defaults.global.defaultFontColor = 'white';
                                        let ctxLine,
                                                ctxBar,
                                                ctxPie,
                                                optionsLine,
                                                optionsBar,
                                                optionsPie,
                                                configLine,
                                                configBar,
                                                configPie,
                                                lineChart;
                                        barChart, pieChart;
                                        // DOM is ready
                                        $(function () {
                                            drawLineChart(); // Line Chart
                                            drawBarChart(); // Bar Chart
                                            drawPieChart(); // Pie Chart

                                            $(window).resize(function () {
                                                updateLineChart();
                                                updateBarChart();
                                            });
                                        })
    </script>
</body>

</html>