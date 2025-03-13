<%-- 
    Document   : allproducts
    Created on : Oct 27, 2024, 9:52:36 AM
    Author     : tranh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Believe</title>

        <!-- fonts -->
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Raleway:400,300,500,600,700'  type='text/css'>
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Roboto+Slab:400,700,300' type='text/css'>
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Playfair+Display:400,700' type='text/css'>
        <link rel='stylesheet' href='${pageContext.request.contextPath}/view/assets/font-awesome/css/font-awesome.css' type='text/css'>

        <!-- Bootstrap -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/assets/css/bootstrap.min.css" >

        <!-- main css -->
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="responsive.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/assets/css/detailproduct.css">

        <!-- Slider -->
        <link href="${pageContext.request.contextPath}/view/assets/css/owl.carousel.css" type="text/css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/view/assets/css/owl.theme.css" type="text/css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/view/assets/css/owl.transitions.css" type="text/css" rel="stylesheet"> 


        <style>
            /* Product Card */
            .product-card{
                background-color: #fff;
                border: 1px solid #ccc;
                margin-bottom: 24px;
            }
            .product-card a{
                text-decoration: none;
            }
            .product-card .stock{
                position: absolute;
                color: #fff;
                border-radius: 4px;
                padding: 2px 12px;
                margin: 8px;
                font-size: 12px;
            }
            .product-card .product-card-img{
                max-height: 260px;
                overflow: hidden;
                border-bottom: 1px solid #ccc;
            }
            .product-card .product-card-img img{
                height: 260px;
                width: 100%;
            }
            .product-card .product-card-body{
                padding: 10px 10px;
            }
            .product-card .product-card-body .product-brand{

                font-size: 14px;
                font-weight: 400;
                margin-bottom: 4px;
                color: #937979;
                white-space: nowrap;
                text-overflow: ellipsis;
                overflow: hidden;
            }
            .product-card .product-card-body .product-name{
                font-size: 20px;
                font-weight: 600;
                color: #000;
                white-space: nowrap;
                text-overflow: ellipsis;
                overflow: hidden;
            }
            .product-card .product-card-body .selling-price{
                font-size: 22px;
                color: #000;

                font-weight: 600;
                margin-right: 8px;
            }
            .product-card .product-card-body .original-price{
                font-size: 18px;
                color: #937979;
                font-weight: 400;
                text-decoration: line-through;
            }
            .product-card .product-card-body .btn1{
                border: 1px solid;
                margin-right: 3px;
                border-radius: 0px;
                font-size: 12px;
                margin-top: 10px;
            }
            /* Product Card End */

            #filter {
                padding: 15px;
                background-color: #f8f9fa;
                border: 1px solid #ddd;
                border-radius: 8px;
                margin-bottom: 20px;
            }

            #filter h4 {
                font-size: 18px;
                color: #333;
                margin-bottom: 10px;
            }

            #filter button {
                display: inline-block;
                margin: 5px;
                padding: 8px 12px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 14px;
                transition: background-color 0.3s ease;
            }

            #filter button:hover {
                background-color: #0056b3;
            }

            #filter button.active {
                background-color: #0056b3;
            }

            #productList div {
                padding: 10px;
                background-color: #ffffff;
                border: 1px solid #ddd;
                border-radius: 5px;
                margin-bottom: 10px;
            }

            #filter h4 + button {
                margin-top: 10px;
            }

            #filter button:focus {
                outline: none;
            }

            #filter .selected {
                background-color: #17a2b8;
                color: white;
            }

        </style>

    </head>
    <body>
        <div id="header"> <!-- header -->
            <div class="top"> <!-- top -->
                <div class="container">
                    <ul class="top-support"> 
                        <li><i class="fa fa-phone-square"></i><span>0123456789</span></li>
                        <li><a href=""><i class="fa fa-envelope-square"></i><span>toduamashop@clothes.com</span></a></li>
                    </ul>

                    <div class="top-control">
                        <c:choose>
                            <c:when test="${not empty sessionScope.users}">
                                <a href="profile">Welcome, ${users.username}</a>
                                <span>  </span>
                                <a href="logout">Logout</a> 
                            </c:when>
                            <c:otherwise>
                                <a href="trackOrder.jsp">Track Order</a>
                                <span>  </span>
                                <a href="login">Login</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div> <!-- top -->

            <div id="believe-nav"> <!-- Nav -->
                <div class="container">
                    <div class="min-marg">
                        <nav class="navbar navbar-default">
                            <!-- <div class="container-fluid"> -->
                            <!-- Brand and toggle get grouped for better mobile display -->
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand" href="home"><img src="view/assets/images/logo.png" alt=""></a>
                            </div>

                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <ul class="nav navbar-nav">
                                    <li class="active"><a href="home">Home <span class="sr-only">(current)</span></a></li>
                                    <li><a href="blog.jsp">Blog</a></li>
                                    <li><a href="blog-detail.jsp">Blog Post</a></li>
                                    <li><a href="contact.jsp">Contact</a></li>
                                </ul>

                                <ul class="nav navbar-nav navbar-right">
                                    <li class="menu-search-form">
                                        <a href="#" id="open-srch-form"><img src="view/assets/images/srch.png" alt="srch"></a>
                                    </li>
                                    <li><a href="loadwl"><img src="view/assets/images/pav.png" alt="pav"><span></span></a></li>
                                    <li><a href="loadcart"><img src="view/assets/images/bag.png" alt="bag"><span></span></a></li>
                                    <li id="open-srch-form-mod">
                                        <div>
                                            <form class="side-search" >
                                                <div class="input-group">
                                                    <input type="text" class="form-control search-wid" placeholder="Search Here" aria-describedby="basic-addon1" name="search">
                                                    <a href="" class="input-group-addon btn-side-serach" id="basic-addon1"><i class="fa fa-search"></i></a>
                                                </div>
                                            </form>
                                        </div>
                                    </li>
                                </ul>

                            </div><!-- /.navbar-collapse -->
                        </nav>
                    </div>
                    <div class="srch-form">
                        <form class="side-search">
                            <div class="input-group">
                                <input type="text" id="search-key" class="form-control search-wid" placeholder="Search Here" aria-describedby="basic-addon2">
                                <a href="#" id="search-btn" class="input-group-addon btn-side-serach" id="basic-addon2"><i class="fa fa-search"></i></a>
                            </div>
                        </form>
                    </div>
                </div>
            </div> 
        </div>
        <hr style="line-height: 2px">

        <div class="col-md-12" style="margin-bottom: 20px">
            <center><h4 class="mb-4">Our Products</h4></center>
        </div>
        <div class="container-fluid">
            <div class="col-md-2">
                <div id="filter">
                    <h4>Thể loại:</h4>
                    <button onclick="filterProductsType(0)">Tất cả</button>
                    <button onclick="filterProductsType(1)">Quần</button>
                    <button onclick="filterProductsType(2)">Áo</button>
                    <button onclick="filterProductsType(3)">Giày</button>
                    <button onclick="filterProductsType(4)">Phụ kiện</button>

                    <h4>Giá tiền:</h4>
                    <button onclick="filterProducts('all')">Tất cả</button>
                    <button onclick="filterProducts('0-500')">Dưới 500k</button>
                    <button onclick="filterProducts('500-1000')">500k - 1 triệu</button>
                    <button onclick="filterProducts('1000-2000')">1 triệu - 2 triệu</button>
                    <button onclick="filterProducts('2000')">Trên 2 triệu</button>
                </div>
            </div>
            <div class="py-3 py-md-5 bg-light col-md-10">
                <div class="row">

                    <c:forEach var="products" items="${requestScope.listfull}">
                        <div class="col-md-3" id="sampleTable" data-category-id="${products.category.id}">
                            <div class="product-card" style="display: none;">
                                <div class="product-card-img">
                                    <img src="${products.image}" alt="Laptop">
                                </div>
                                <div class="product-card-body">
                                    <h5 class="product-name">
                                        ${products.name} 
                                    </h5>
                                    <div style="text-align: center">
                                        <span class="selling-price">${products.price}VND</span>
                                    </div>
                                    <div class="mt-2">
                                        <a href="#" class="btn btn1 add-to-cart" data-id="${products.id}">Add To Cart</a>
                                        <a href="#" class="btn btn1 add-to-wishlist" data-id="${products.id}"> <i class="fa fa-heart" ></i> </a>
                                        <a href="productdetail?id=${products.id}" class="btn btn1"> View </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

    <center>
        <div class="pagination">
            <button onclick="changePage('prev')">Previous</button>
            <span id="pageNumbers"></span>
            <button onclick="changePage('next')">Next</button>
        </div>
    </center>

    <div id="footer"><!-- Footer -->
        <div class="footer-widget">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <div class="text-widget">
                            <div class="wid-title">Welcome to</div>
                            <img src="view/assets/images/logo-white.png" alt="ft-logo">
                            <p>
                                Believe isCommerce WordPress theme. It has<br/>everything you need to start selling today! <a href="">Get this theme on ThemeForest!</a>
                            </p>
                            <ul class="ft-soc clearfix">
                                <li><a href=""><i class="fa fa-facebook-square"></i></a></li>
                                <li><a href=""><i class="fa fa-twitter"></i></a></li>
                                <li><a href=""><i class="fa fa-google-plus-square"></i></a></li>
                                <li><a href=""><i class="fa fa-instagram"></i></a></li>
                                <li><a href=""><i class="fa fa-pinterest"></i></a></li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="quick-links">
                            <div class="wid-title">Quick Links</div>
                            <ul>
                                <li><a href="index.html">Home</a></li>
                                <li><a href="#">About US</a></li>
                                <li><a href="contact.html">contact US</a></li>
                                <li><a href="#">deals</a></li>
                                <li><a href="blog.html">blog</a></li>
                                <li><a href="#">help</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="term">
                            <div class="wid-title">&nbsp;</div>
                            <p>
                                <a href="#">Tearms & condition</a><br/>
                                <a href="#">FAQs</a><br/>
                                <a href="#">Privacy Policy</a><br/>
                                <a href="#">Legal Desclaimer</a><br/>
                            </p>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="quick-links">
                            <div class="wid-title">My Account</div>

                            <ul>
                                <li><a href="#">My Account</a></li>
                                <li><a href="#">Personal Information</a></li>
                                <li><a href="#">Addresses</a></li>
                                <li><a href="#">Orders</a></li>
                                <li><a href="#">Wishlist</a></li>
                                <li><a href="#">track order</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="subscribe">
                            <div class="wid-title">Subscribe for OFFERS & UPDATES</div>
                            <p>
                                Enter your email and we'll send you a coupon
                                with 10% off your next order. Add any text here
                            </p>
                            <form>
                                <div class="form-group">
                                    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
                                </div>
                                <button type="submit" class="btn btn-default">Subscribe Now</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- Footer -->    
    <script>
        function filterProductsType(categoryId) {
            // Lấy tất cả các sản phẩm
            var products = document.querySelectorAll("#sampleTable");

            products.forEach(function (product) {
                // Lấy categoryId từ data attribute
                var productCategoryId = product.getAttribute("data-category-id");

                // Nếu categoryId là 0, hiển thị tất cả sản phẩm
                // Nếu không, chỉ hiển thị các sản phẩm thuộc loại được chọn
                if (categoryId == 0 || productCategoryId == categoryId) {
                    product.style.display = "block"; // Hiển thị sản phẩm
                } else {
                    product.style.display = "none"; // Ẩn sản phẩm
                }
            });
        }


        function filterProducts(priceRange) {
            // Lấy tất cả các sản phẩm
            var products = document.querySelectorAll("#sampleTable");

            products.forEach(function (product) {
                // Lấy giá sản phẩm từ phần tử HTML
                var priceText = product.querySelector(".selling-price").textContent;

                // Chuyển đổi giá thành số (giả sử giá được định dạng là "500k" hoặc "500000VND")
                var price = parseFloat(priceText.replace('VND', '').replace(/,/g, '').trim());

                // Kiểm tra khoảng giá và hiển thị hoặc ẩn sản phẩm
                if (priceRange === 'all') {
                    product.style.display = "block"; // Hiển thị tất cả sản phẩm
                } else if (priceRange === '0-500' && price < 500000) {
                    product.style.display = "block"; // Hiển thị sản phẩm dưới 500k
                } else if (priceRange === '500-1000' && price >= 500000 && price < 1000000) {
                    product.style.display = "block"; // Hiển thị sản phẩm từ 500k đến 1 triệu
                } else if (priceRange === '1000-2000' && price >= 1000000 && price < 2000000) {
                    product.style.display = "block"; // Hiển thị sản phẩm từ 1 triệu đến 2 triệu
                } else if (priceRange === '2000' && price >= 2000000) {
                    product.style.display = "block"; // Hiển thị sản phẩm trên 2 triệu
                } else {
                    product.style.display = "none"; // Ẩn sản phẩm không phù hợp
                }
            });
        }

    </script>

    <script>
        //phân trang
        let currentPage = 1;
        const pageSize = 12; // Số sản phẩm trên mỗi trang
        const products = document.querySelectorAll(".product-card");
        const totalPages = Math.ceil(products.length / pageSize);

// Hàm hiển thị các sản phẩm cho trang hiện tại
        function showProducts(page) {
            products.forEach((product, index) => {
                product.style.display = (index >= (page - 1) * pageSize && index < page * pageSize) ? "block" : "none";
            });
            updatePageNumbers();
        }

// Hàm để cập nhật số trang
        function updatePageNumbers() {
            const pageNumbers = document.getElementById("pageNumbers");
            pageNumbers.innerHTML = `Trang ${currentPage} / ${totalPages}`;
        }

// Điều hướng trang
        function changePage(direction) {
            if (direction === 'next' && currentPage < totalPages) {
                currentPage++;
            } else if (direction === 'prev' && currentPage > 1) {
                currentPage--;
            }
            showProducts(currentPage);
        }

// Gọi hàm để hiển thị trang đầu tiên khi trang tải
        showProducts(currentPage);

    </script>


    <script>
        document.getElementById("search-btn").addEventListener("click", function (event) {
            event.preventDefault(); // Ngăn không cho link mặc định được kích hoạt
            // Lấy giá trị từ ô nhập liệu
            var searchKey = document.getElementById("search-key").value.trim();
            if (searchKey !== "") {
                // Chuyển hướng tới trang tìm kiếm với từ khóa
                window.location.href = "search?key=" + encodeURIComponent(searchKey);
            } else {
                alert("Vui lòng nhập từ khóa tìm kiếm.");
            }
        });
    </script>




    <script>

        // Hàm thiết lập cookie
        function setCookie(name, value, days) {
            var date = new Date();
            date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000)); // Hết hạn sau 1 ngày
            var expires = "; expires=" + date.toUTCString();
            document.cookie = name + "=" + (value || "") + expires + "; path=/";
        }

        // Hàm lấy cookie
        function getCookie(name) {
            var nameEQ = name + "=";
            var ca = document.cookie.split(';');
            for (var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) === ' ')
                    c = c.substring(1, c.length);
                if (c.indexOf(nameEQ) === 0)
                    return c.substring(nameEQ.length, c.length);
            }
            return null;
        }

        // Hàm lấy username từ thẻ a
        function getUsernameWL() {
            var usernameElement = document.querySelector('a[href="profile"]');
            return usernameElement.textContent.replace('Welcome, ', '').trim() + "wishlist";
        }

        function getUsernameCart() {
            var usernameElement = document.querySelector('a[href="profile"]');
            return usernameElement.textContent.replace('Welcome, ', '').trim() + "cart";
        }


        // Hàm để thêm ID sản phẩm vào cookie
        function addProductIdWL(productId) {
            var username = getUsernameWL(); // Lấy tên người dùng
            var existingProductIds = getCookie(username); // Lấy chuỗi ID hiện tại từ cookie

            if (existingProductIds) {
                var productIdsArray = existingProductIds.split("_");

                // Kiểm tra xem ID có tồn tại trong chuỗi chưa
                if (!productIdsArray.includes(productId.toString())) {
                    productIdsArray.push(productId);
                    var updatedProductIds = productIdsArray.join("_");
                    setCookie(username, updatedProductIds, 1); // Lưu cookie trong 1 ngày
                    alert("Đã thêm sản phẩm ID: " + productId + " vào wishlist.");
                } else {
                    alert("Sản phẩm đã có trong wishlist.");
                }
            } else {
                // Nếu chưa có cookie thì tạo cookie mới với ID sản phẩm đầu tiên
                setCookie(username, productId, 1); // Lưu cookie trong 1 ngày
            }
        }
        function addProductIdCart(productId) {
            var username = getUsernameCart(); // Lấy tên người dùng
            var existingProductIds = getCookie(username); // Lấy chuỗi ID hiện tại từ cookie

            if (existingProductIds) {
                var productIdsArray = existingProductIds.split("_");

                // Kiểm tra xem ID có tồn tại trong chuỗi chưa
                if (!productIdsArray.includes(productId.toString())) {
                    productIdsArray.push(productId);
                    var updatedProductIds = productIdsArray.join("_");
                    setCookie(username, updatedProductIds, 1); // Lưu cookie trong 1 ngày
                    alert("Đã thêm sản phẩm ID: " + productId + " vào cart.");
                } else {
                    alert("Sản phẩm đã có trong cart.");
                }
            } else {
                // Nếu chưa có cookie thì tạo cookie mới với ID sản phẩm đầu tiên
                setCookie(username, productId, 1); // Lưu cookie trong 1 ngày
            }
        }

        // Bắt sự kiện click trên các nút add to wishlist
        document.querySelectorAll('.add-to-wishlist').forEach(button => {
            button.addEventListener('click', function (event) {
                event.preventDefault(); // Ngăn chặn hành vi mặc định
                var productId = this.getAttribute('data-id'); // Lấy ID sản phẩm
                addProductIdWL(productId); // Thêm ID vào cookie
            });
        });

        document.querySelectorAll('.add-to-cart').forEach(button => {
            button.addEventListener('click', function (event) {
                event.preventDefault(); // Ngăn chặn hành vi mặc định
                var productId = this.getAttribute('data-id'); // Lấy ID sản phẩm
                addProductIdCart(productId); // Thêm ID vào cookie
            });
        });

    </script>
    <script type="text/javascript" src="view/assets/admin/js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript">$('#sampleTable').DataTable();</script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="${pageContext.request.contextPath}/view/assets/js/library.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="${pageContext.request.contextPath}/view/assets/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/view/assets/js/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/view/assets/js/jquery.raty.js"></script>
        <script src="${pageContext.request.contextPath}/view/assets/js/ui.js"></script>
        <script src="${pageContext.request.contextPath}/view/assets/js/jquery.prettyPhoto.js"></script>
        <script src="${pageContext.request.contextPath}/view/assets/js/jquery.selectbox-0.2.js"></script>
        <script src="${pageContext.request.contextPath}/view/assets/js/theme-script.js"></script>
</body>
</html>
