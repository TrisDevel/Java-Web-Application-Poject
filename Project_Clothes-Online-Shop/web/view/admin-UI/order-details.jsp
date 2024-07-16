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
                <h2 style='margin-top:20px'>Order Details</h2>
                <table style="margin-top:20px" class="table ">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Customer ID</th>
                            <th>Start Date</th>
                            <th>Total Money</th>
                            <th>Payment</th>
                            <th>Customer Name</th>

                            <th>Products</th>
                        </tr>
                    </thead>
                    <tbody id="order-details-body">
                    <c:forEach var="order" items="${orderDetails}">
                        <tr data-order-id="${order.idOrder}">
                            <td>${order.idOrder}</td>
                            <td>${order.address}</td>
                            <td>${order.startDate}</td>
                            <td>${order.totalMoney}</td>
                            <td>${order.paymentName}</td>
                            <td>${order.customerName}</td>
                            <td>
                                <span class="product-name">${order.productName}</span> (Qty: <span class="product-quantity">${order.quantity}</span>)
                                <br>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
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
                                        document.addEventListener("DOMContentLoaded", function () {
                                            const rows = document.querySelectorAll("#order-details-body tr");
                                            const orderMap = new Map();

                                            rows.forEach(row => {
                                                const idOrder = row.getAttribute('data-order-id');
                                                const productName = row.querySelector('.product-name').innerText;
                                                const productQuantity = row.querySelector('.product-quantity').innerText;

                                                if (!orderMap.has(idOrder)) {
                                                    orderMap.set(idOrder, {
                                                        row: row,
                                                        products: []
                                                    });
                                                }
                                                orderMap.get(idOrder).products.push({
                                                    name: productName,
                                                    quantity: productQuantity
                                                });
                                            });

                                            orderMap.forEach((order, idOrder) => {
                                                const firstRow = order.row;
                                                const productCell = firstRow.querySelector('.products-cell');

                                                productCell.innerHTML = '';  // Clear product cell
                                                order.products.forEach(product => {
                                                    productCell.innerHTML += `${product.name} (Qty: ${product.quantity})<br>`;
                                                });

                                                order.products.forEach((product, index) => {
                                                    if (index > 0) { // Skip the first product as it's already included in the first row
                                                        const newRow = firstRow.cloneNode(true);
                                                        newRow.querySelector('.products-cell').innerHTML = `${product.name} (Qty: ${product.quantity})`;
                                                        newRow.querySelectorAll('td:not(.products-cell)').forEach(cell => cell.style.display = 'none');
                                                        firstRow.parentNode.insertBefore(newRow, firstRow.nextSibling);
                                                    }
                                                });

                                                let isFirstRow = true;
                                                const hideCells = [0, 1, 2, 3, 4, 5];
                                                hideCells.forEach(index => {
                                                    const cell = firstRow.cells[index];
                                                    if (isFirstRow) {
                                                        cell.rowSpan = order.products.length;
                                                    } else {
                                                        cell.style.display = 'table-cell';
                                                        cell.rowSpan = order.products.length;
                                                    }
                                                    isFirstRow = false;
                                                });
                                            });

                                            // Hide all additional rows, except for the first one
                                            const seenOrders = new Set();
                                            rows.forEach(row => {
                                                const idOrder = row.getAttribute('data-order-id');
                                                if (seenOrders.has(idOrder)) {
                                                    row.style.display = 'none';
                                                } else {
                                                    seenOrders.add(idOrder);
                                                }
                                            });
                                        });
        </script>
    </body>
</html>
