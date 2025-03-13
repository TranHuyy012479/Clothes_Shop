<%-- 
    Document   : trackorder
    Created on : Oct 26, 2024, 11:07:51 AM
    Author     : tranh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <title>Order List</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: center;
            }
            th {
                background-color: #f2f2f2;
            }

            .table thead th {
                background-color: #343a40; /* Màu nền tiêu đề */
                color: #ffffff; /* Màu chữ tiêu đề */
            }

            .table-hover tbody tr:hover {
                background-color: #f1f1f1; /* Màu nền khi hover */
            }

        </style>
    </head>
    <body>
        <button class="home-button" onclick="window.location.href = 'home';">Home</button>
        <c:if test="${empty requestScope.listOrders}">
        <center><h1>Bạn chưa orders!!!</h1></center>
        </c:if>
        <c:if test="${not empty requestScope.listOrders}">
        <div class="container mt-5">
            <h2 class="text-center mb-4">Order List</h2>

            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th width="10%">OrderID</th>
                            <th width="10%">Username</th>
                            <th width="20%">Shipping Address</th>
                            <th width="10%">Note</th>
                            <th width="15%">Orderdate</th>
                            <th width="15%">Total Money</th>
                            <th width="10%">Status</th>
                            <th width="10%">Detail</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="orders" items="${requestScope.listOrders}">
                            <tr>
                                <td>${orders.id}</td>
                                <td>${orders.users.username}</td>
                                <td>${orders.shippingAddress}</td>
                                <td>${orders.note}</td>
                                <td>${orders.orderDate}</td>
                                <td>${orders.totalMoney}</td>
                                <td>${orders.status}</td>
                                <td><a href="view?orderID=${orders.id}">detail</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
            </c:if>

        <!-- JavaScript của Bootstrap -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>

