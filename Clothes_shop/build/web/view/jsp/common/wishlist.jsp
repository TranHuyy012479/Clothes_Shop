<%-- 
    Document   : wishlist
    Created on : Oct 24, 2024, 9:43:26 AM
    Author     : tranh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Believe</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <style>
        /* Định dạng bảng */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        thead th {
            text-align: center;
            font-weight: bold;
            padding: 15px;
            background-color: #f9f9f9;
        }

        tbody tr {
            border-bottom: 1px solid #e9e9e9;
        }

        tbody td {
            padding: 15px;
            vertical-align: middle;
            text-align: center;
        }

        /* Định dạng hình ảnh sản phẩm */
        .image img {
            width: 60px;
            height: auto;
            border: 1px solid #ddd;
            padding: 5px;
            border-radius: 5px;
        }

        /* Định dạng tên sản phẩm */
        .description a {
            color: #7bc244;
            font-size: 16px;
            text-decoration: none;
            font-weight: 600;
        }

        .description a:hover {
            text-decoration: underline;
        }

        /* Định dạng giá */
        .price {
            font-size: 16px;
            font-weight: bold;
            color: #333;
        }

        /* Định dạng nút Add to cart */
        .td-quentety a {
            background-color: #7bc244;
            color: white;
            padding: 10px 20px;
            font-size: 14px;
            border-radius: 5px;
            text-transform: uppercase;
            text-decoration: none;
            display: inline-block;
        }

        .td-quentety a:hover {
            background-color: #6fa736;
        }

        /* Định dạng trạng thái kho */
        .price-2 {
            color: #7bc244;
            font-size: 14px;
        }

        .price-2:contains("Out of stock") {
            color: #ff4f4f;
        }

        /* Định dạng nút đóng (xóa sản phẩm) */
        .total a {
            color: #ff4f4f;
            font-size: 16px;
            text-decoration: none;
        }

        .total a:hover {
            color: #d93b3b;
        }

        .home-button {
            background-color: #4CAF50; /* Màu nền */
            color: white; /* Màu chữ */
            padding: 10px 20px; /* Khoảng cách bên trong */
            text-align: center;
            font-size: 16px;
            cursor: pointer;
            border: none; /* Bỏ viền */
            border-radius: 5px; /* Bo góc nút */
        }

        .home-button:hover {
            background-color: #45a049; /* Màu nền khi hover */
        }

    </style>
</head>
<body>
    <button class="home-button" onclick="window.location.href = 'home';">Home</button>

    <c:if test="${not empty requestScope.listwishlist}">
    <center><h1>${sessionScope.users.username} Wishlist</h1></center>
    <section class="wishlist-page page-section-ptb">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Product name</th>
                                    <th>Price</th>
                                    <th>Add to cart </th>
                                    <th>Stock status </th>
                                    <th>Close </th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="products" items="${requestScope.listwishlist}">
                                    <tr>
                                        <td class="image">
                                            <img class="img-fluid" src="${products.image}" alt=""/>
                                        </td>
                                        <td class="description">
                                            <a href="productdetail?id=${products.id}">${products.name}</a>
                                        </td>
                                        <td class="price">${products.price}VND</td>
                                        <td class="td-quentety">
                                            <a class="button" href="#">Add to cart</a>
                                        </td>
                                        <td class="price price-2">In stock</td>
                                        <td class="total">
                                            <a href="removewl?id=${products.id}"><i class="fa fa-close remove-from-wishlist"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
</c:if>
<c:if test="${empty requestScope.listwishlist}">
    <center><h1>Ban chua co san pham nao trong wishlist</h1></center>
    </c:if>
</body>
</html>
