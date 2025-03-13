<%-- 
    Document   : cart
    Created on : Oct 24, 2024, 10:31:14 PM
    Author     : tranh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            body{
                background: #ddd;
                min-height: 100vh;
                vertical-align: middle;
                display: flex;
                font-family: sans-serif;
                font-size: 0.8rem;
                font-weight: bold;
            }
            .title{
                margin-bottom: 5vh;
            }
            .card{
                margin: auto;
                max-width: 950px;
                width: 90%;
                box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                border-radius: 1rem;
                border: transparent;
            }
            @media(max-width:767px){
                .card{
                    margin: 3vh auto;
                }
            }
            .cart{
                background-color: #fff;
                padding: 4vh 5vh;
                border-bottom-left-radius: 1rem;
                border-top-left-radius: 1rem;

            }
            @media(max-width:767px){
                .cart{
                    padding: 4vh;
                    border-bottom-left-radius: unset;
                    border-top-right-radius: 1rem;
                }
            }
            .summary{
                background-color: #ddd;
                border-top-right-radius: 1rem;
                border-bottom-right-radius: 1rem;
                padding: 4vh;
                color: rgb(65, 65, 65);
            }
            @media(max-width:767px){
                .summary{
                    border-top-right-radius: unset;
                    border-bottom-left-radius: 1rem;
                }
            }
            .summary .col-2{
                padding: 0;
            }
            .summary .col-10
            {
                padding: 0;
            }
            .row{
                margin: 0;
            }
            .title b{
                font-size: 1.5rem;
            }
            .main{
                margin: 0;
                padding: 2vh 0;
                width: 100%;
            }
            .col-2, .col{
                padding: 0 1vh;
            }
            a{
                padding: 0 1vh;
            }
            .close{
                margin-left: auto;
                font-size: 0.7rem;
            }
            img{
                width: 3.5rem;
            }
            .back-to-shop{
                position: sticky;
                bottom: 0; /* Cố định tại vị trí đáy khi cuộn */
                margin-top: 4.5rem;
            }
            h5{
                margin-top: 4vh;
            }
            hr{
                margin-top: 1.25rem;
            }
            form{
                padding: 2vh 0;
            }
            select{
                border: 1px solid rgba(0, 0, 0, 0.137);
                padding: 1.5vh 1vh;
                margin-bottom: 4vh;
                outline: none;
                width: 100%;
                background-color: rgb(247, 247, 247);
            }
            input{
                border: 1px solid rgba(0, 0, 0, 0.137);
                padding: 1vh;
                margin-bottom: 4vh;
                outline: none;
                width: 100%;
                background-color: rgb(247, 247, 247);
            }
            input:focus::-webkit-input-placeholder
            {
                color:transparent;
            }
            .btn{
                background-color: #000;
                border-color: #000;
                color: white;
                width: 100%;
                font-size: 0.7rem;
                margin-top: 4vh;
                padding: 1vh;
                border-radius: 0;
            }
            .btn:focus{
                box-shadow: none;
                outline: none;
                box-shadow: none;
                color: white;
                -webkit-box-shadow: none;
                -webkit-user-select: none;
                transition: none;
            }
            .btn:hover{
                color: white;
            }
            a{
                color: black;
            }
            a:hover{
                color: black;
                text-decoration: none;
            }
            #code{
                background-image: linear-gradient(to left, rgba(255, 255, 255, 0.253) , rgba(255, 255, 255, 0.185)), url("https://img.icons8.com/small/16/000000/long-arrow-right.png");
                background-repeat: no-repeat;
                background-position-x: 95%;
                background-position-y: center;
            }

            .listproduct{
                max-height: 300px; /* Chiều cao tối đa của vùng sản phẩm */
                overflow-y: auto; /* Hiển thị thanh cuộn dọc khi sản phẩm vượt quá chiều cao */
            }

            form{
                display: flex;
                flex-wrap: wrap;

            }

            form .col-md-8{
                width: 635px;
            }
            form .col-md-4{
                width: 315px;
            }


        </style>
    </head>
    <body>

        <div class="card">
            <div class="row">
                <form action="checkout">
                    <div class="col-md-8 cart">

                        <div class="title">
                            <div class="row">
                                <div class="col"><h4><b>Shopping Cart</b></h4></div>
                                <div class="col align-self-center text-right text-muted">${requestScope.numberofitems} items</div>
                            </div>
                        </div> 
                        <div class="listproduct">
                            <c:if test="${empty requestScope.listcart}">
                                <center><h5>Bạn chưa thêm sản phẩm nào vào trong cart</h5> </center>
                            </c:if>
                            <c:if test="${not empty requestScope.listcart}">
                                <c:forEach var="products" items="${requestScope.listcart}">
                                    <div class="row border-top border-bottom">
                                        <div class="row main align-items-center">
                                            <div class="col-2"><img class="img-fluid" src="${products.image}"></div>
                                            <div class="col">
                                                <div class="row text-muted">${products.category.name}</div>
                                                <div class="row">${products.name}</div>
                                            </div>
                                            <div class="col">
                                                <input type="hidden" name="productId" value="${products.id}">
                                                <a href="#" class="decrease">-</a>
                                                <a href="#" class="quantity border">1</a>
                                                <a href="#" class="increase">+</a>
                                                <input type="hidden" name="quantity" class="quantity-input" value="1">
                                            </div>
                                            <div class="col price" data-price="${products.price}">
                                                ${products.price} VND
                                                <input type="hidden" name="price" value="${products.price}">
                                            </div>
                                            <a href="removecart?id=${products.id}">
                                                <span>&#10005;</span>
                                            </a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </div>
                        <div class="back-to-shop"><a href="home">&leftarrow;</a><span class="text-muted">Back to shop</span></div>
                    </div>
                    <div class="col-md-4 summary">
                        <div><h5><b>Summary</b></h5></div>
                        <hr>
                        <div class="row">
                            <div class="col" style="padding-left:0;">ITEMS: ${requestScope.numberofitems}</div>
                            <div class="col text-right">TOTAL PRICE: <span id="total-price">0</span></div>
                        </div>
                        <p>SHIPPING</p>
                        <select><option class="text-muted">Standard-Delivery- 5trVND</option></select>
                        <p>SHIPPING ADDRESS</p>
                        <input id="code" name="shipaddress" type="text" required>
                        <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                            <div class="col">TOTAL PRICE</div>
                            <div class="col text-right"><span id="total-price-final">0</span></div>
                        </div>
                        <button type="submit"class="btn">CHECKOUT</button>
                    </div>
                </form>       
            </div>

        </div>

        <!--    <script>
                document.querySelectorAll('.main').forEach(function (productRow) {
                    const decreaseBtn = productRow.querySelector('.decrease');
                    const increaseBtn = productRow.querySelector('.increase');
                    const quantityEl = productRow.querySelector('.quantity');
                    const priceEl = productRow.querySelector('.price');
                    const pricePerItem = parseFloat(priceEl.getAttribute('data-price'));
                });
        
            </script>   
        
            <script>
                document.addEventListener("DOMContentLoaded", function() {
            const decreaseButtons = document.querySelectorAll('.decrease');
            const increaseButtons = document.querySelectorAll('.increase');
            const totalPriceElement = document.getElementById("total-price");
        
            function updatePrice(element, quantity) {
                const priceElement = element.closest('.main').querySelector('.price');
                const pricePerItem = parseFloat(priceElement.getAttribute('data-price'));
        
                // Kiểm tra nếu giá trị pricePerItem không phải là số
                if (isNaN(pricePerItem)) {
                    console.error("Giá trị price không hợp lệ:", pricePerItem);
                    return; // Dừng lại nếu pricePerItem không hợp lệ
                }
        
                const totalItemPrice = pricePerItem * quantity;
                priceElement.querySelector('span').textContent = `${totalItemPrice} VND`;
        
                const quantityInput = element.closest('.col').querySelector('.quantity-input');
                quantityInput.value = quantity;
                updateTotalPrice();
            }
        
            function updateTotalPrice() {
                const quantityInputs = document.querySelectorAll(".quantity-input");
                let total = 0;
        
                quantityInputs.forEach(input => {
                    const quantity = parseInt(input.value);
                    const pricePerItem = parseFloat(input.closest('.main').querySelector('.price').getAttribute('data-price'));
                    if (!isNaN(quantity) && !isNaN(pricePerItem)) {
                        total += quantity * pricePerItem;
                    }
                });
        
                totalPriceElement.textContent = `${total} VND`;
            }
        
            decreaseButtons.forEach(button => {
                button.addEventListener("click", function(e) {
                    e.preventDefault();
                    const quantityElement = button.nextElementSibling;
                    let quantity = parseInt(quantityElement.textContent);
                    if (quantity > 1) {
                        quantity--;
                        quantityElement.textContent = quantity;
                        updatePrice(button, quantity);
                    }
                });
            });
        
            increaseButtons.forEach(button => {
                button.addEventListener("click", function(e) {
                    e.preventDefault();
                    const quantityElement = button.previousElementSibling;
                    let quantity = parseInt(quantityElement.textContent);
                    quantity++;
                    quantityElement.textContent = quantity;
                    updatePrice(button, quantity);
                });
            });
        
            // Initialize total price on page load
            updateTotalPrice();
        });
        
            </script>-->
        <script>
            function formatCurrency(number) {
                return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
            }

            // Hàm cập nhật tổng giá mỗi khi thay đổi số lượng
            function updateTotal() {
                let totalPrice = 0;

                document.querySelectorAll('.row.main').forEach(function (row) {
                    const pricePerUnit = parseFloat(row.querySelector('.price').dataset.price);
                    const quantity = parseInt(row.querySelector('.quantity-input').value);
                    const totalItemPrice = pricePerUnit * quantity;

                    // Cập nhật giá cho từng sản phẩm
                    row.querySelector('.price').innerText = formatCurrency(totalItemPrice) + ' VND';

                    // Cộng dồn vào tổng giá
                    totalPrice += totalItemPrice;
                });

                // Cập nhật tổng giá trong summary
                document.getElementById('total-price').innerText = formatCurrency(totalPrice) + ' VND';
                document.getElementById('total-price-final').innerText = formatCurrency(totalPrice) + ' VND';
            }

            // Hàm xử lý khi tăng/giảm số lượng
            document.querySelectorAll('.increase, .decrease').forEach(function (button) {
                button.addEventListener('click', function (event) {
                    event.preventDefault();

                    const row = event.target.closest('.row.main');
                    const quantityInput = row.querySelector('.quantity-input');
                    let quantity = parseInt(quantityInput.value);

                    // Tăng hoặc giảm số lượng
                    if (event.target.classList.contains('increase')) {
                        quantity++;
                    } else if (event.target.classList.contains('decrease') && quantity > 1) {
                        quantity--;
                    }

                    quantityInput.value = quantity;
                    row.querySelector('.quantity').innerText = quantity; // Cập nhật hiển thị số lượng

                    updateTotal(); // Cập nhật tổng giá
                });
            });

            // Cập nhật tổng giá ban đầu khi tải trang
            document.addEventListener('DOMContentLoaded', updateTotal);

        </script>
    </body>
</html>
