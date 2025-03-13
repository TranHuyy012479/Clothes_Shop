<%-- 
    Document   : detailorder
    Created on : Oct 28, 2024, 8:28:18 PM
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
        <div class="container mt-5">
            <h2 class="text-center mb-4">Order List</h2>

            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th width="10%">Product</th>
                            <th width="10%">Product name</th>
                            <th width="20%">Price</th>
                            <th width="10%">Quantity</th>
                            <th width="15%">Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="od" items="${requestScope.listOD}">
                            <tr>
                                <td><img class="img-fluid" src="${od.products.image}" alt="alt"/></td>
                                <td>${od.products.name}</td>
                                <td>${od.products.price}</td>
                                <td>${od.numberOfProduct}</td>
                                <td>${od.totalMoney}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- JavaScript của Bootstrap -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>

