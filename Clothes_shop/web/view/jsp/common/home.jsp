<%-- 
    Document   : home
    Created on : Oct 13, 2024, 9:14:17 PM
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
        <link href="${pageContext.request.contextPath}/view/assets/css/bootstrap.min.css" rel="stylesheet">

        <!-- main css -->
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="responsive.css">

        <!-- Slider -->
        <link href="${pageContext.request.contextPath}/view/assets/css/owl.carousel.css" type="text/css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/view/assets/css/owl.theme.css" type="text/css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/view/assets/css/owl.transitions.css" type="text/css" rel="stylesheet"> 

        <!-- lightbox -->
        <link href="${pageContext.request.contextPath}/view/assets/css/prettyPhoto.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <style>
            #allproducts {
                width: 150px;
                background-color: #f9f9f9; /* Màu nền nhạt */
                padding: 15px 0; /* Khoảng cách trên dưới */
                border-radius: 8px; /* Bo tròn các góc */
                box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.15); /* Đổ bóng nhẹ */
                text-align: center; /* Canh giữa nội dung */
                margin-left: 45%;
            }

            #allproducts a {
                font-size: 20px; /* Cỡ chữ lớn hơn */
                color: #333; /* Màu chữ */
                text-decoration: none; /* Loại bỏ gạch chân */
                font-weight: bold; /* Đậm chữ */
                transition: color 0.3s; /* Hiệu ứng chuyển đổi màu khi hover */
            }

            #allproducts a:hover {
                color: #007bff; /* Màu xanh khi hover */
                text-decoration: underline; /* Gạch chân khi hover */
            }

        </style>
    </head>
    <body>

        <div id="wrapper" class="homepage-1"> <!-- wrapper -->
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
                                    <a href="trackorder">Track Order</a>
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
                                        <li><a href="${pageContext.request.contextPath}/view/jsp/common/blog.jsp">Blog</a></li>
                                        <li><a href="${pageContext.request.contextPath}/view/jsp/common/blog-detail.jsp">Blog Post</a></li>
                                        <li><a href="${pageContext.request.contextPath}/view/jsp/common/contact.jsp">Contact</a></li>
                                    </ul>

                                    <ul class="nav navbar-nav navbar-right">
                                        <li class="menu-search-form">
                                            <a href="#" id="open-srch-form"><img src="view/assets/images/srch.png" alt="srch"></a>
                                        </li>
                                        <li>
                                            <a href="loadwl">
                                                <img src="view/assets/images/pav.png" alt="pav">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="loadcart">
                                                <img src="view/assets/images/bag.png" alt="bag">
                                            </a>
                                        </li>
                                        <li id="open-srch-form-mod">    
                                            <div>
                                                <form class="side-search" action="search">
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
                            <form class="side-search" >
                                <div class="input-group">
                                    <input type="text" id="search-key" class="form-control search-wid" placeholder="Search Here" aria-describedby="basic-addon2">
                                    <a href="#" id="search-btn" class="input-group-addon btn-side-serach" id="basic-addon2"><i class="fa fa-search"></i></a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div> 
            </div> <!-- header -->

            <div id="main-slider"> <!-- Slider -->
                <div id="home-slider" class="owl-carousel owl-theme">
                    <div class="item">
                        <img src="view/assets/images/slider-1.jpg" alt="slide-1" class="img-responsive">
                        <div class="slider-desc">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="slide-offers-left">
                                            <div class="slide-offers-title"><span>Men’s</span><br/>FASHION</div>
                                            <p>New & Fvhresh collection<br/>arraival in believe store</p>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="slide-offers-right">
                                            <div class="slide-offers-title"><span>Women’s</span><br/>FASHION</div>
                                            <p>New & Fvhresh collection<br/>arraival in believe store</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <img src="view/assets/images/slider-2.jpg" alt="slide-2" class="img-responsive">
                        <div class="slider-desc">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="slide-offers-left">
                                            <div class="slide-offers-title"><span>50% Price cut</span><br/>for online order</div>
                                            <p>New & Fvhresh collection<br/>arraival in believe store</p>
                                        </div>
                                    </div>
                                    <div class="col-md-6">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> <!-- Slider -->

            <div id="content"> <!-- Content -->
                <div class="container">
                    <div class="home-content">
                        <div class="cat-offers">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="cat-sec-1">
                                        <img src="view/assets/images/cat-1.jpg" class="img-responsive" alt="">
                                        <div class="cat-desc">
                                            <div class="cat-inner">
                                                <div class="cat-title">man<span>Clothing</span></div>
                                                <a href="" class="btn btn-border">Buy Now</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="cat-sec-2">
                                        <img src="view/assets/images/cat-2.jpg" class="img-responsive" alt="">
                                        <div class="cat-desc">
                                            <div class="cat-inner">
                                                <div class="cat-title">woman<span>Clothing</span></div>
                                                <a href="" class="btn btn-border">Buy Now</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="cat-sec-3">
                                        <img src="view/assets/images/cat-3.jpg" class="img-responsive" alt="">
                                        <div class="cat-desc">
                                            <div class="cat-inner">
                                                <div class="cat-title">accessories<span>collections - 2014</span></div>
                                                <a href="" class="btn btn-border">shop Now</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="newest">
                    <div class="container">
                        <div class="newest-content">
                            <div class="newest-tab">
                                <ul id="myTab" class="nav nav-tabs newest" role="tablist">
                                    <li role="presentation" class="active">
                                        <a href="#1" id="cat-1" role="tab" data-toggle="tab" aria-controls="1" aria-expanded="true">Best Seller</a>
                                    </li>
                                </ul>

                                <div id="myTabContent" class="tab-content">
                                    <div role="tabpanel" class="tab-pane fade in active" id="1" aria-labelledby="cat-1">
                                        <div class="row clearfix">

                                            <c:forEach var="products" items="${requestScope.listProducts}">
                                                <div class="col-md-3 prdct-grid">
                                                    <div class="product-fade">
                                                        <div class="product-fade-wrap">
                                                            <div id="product-image" class="owl-carousel owl-theme">
                                                                <div class="item"><img style="aspect-ratio:1/1;" src="${products.image}" alt="" class="img-responsive"></div>
                                                            </div>
                                                            <div class="product-fade-ct">
                                                                <div class="product-fade-control">
                                                                    <div class="to-left">
                                                                        <a href="#" class="add-to-wishlist" data-id="${products.id}"><i class="fa fa-heart " ></i></a>
                                                                        <a href="productdetail?id=${products.id}"><i class="fa fa-search"></i></a>
                                                                    </div>
                                                                    <div class="clearfix"></div>
                                                                    <input type="hidden" name="productID" value="${products.id}"/>
                                                                    <a href="#" id="addToCart" class="btn btn-to-cart add-to-cart" data-id="${products.id}">
                                                                        <span>Add To cart</span>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="product-name">
                                                        <a href="productdetail?id=${products.id}">${products.name}</a>
                                                    </div>
                                                    <div class="product-price">
                                                        ${products.price}VND
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div id="allproducts">
                                <center><a href="allproducts">All products</a></center>
                            </div>
                        </div>

                    </div>
                </div>



                <div class="brands">
                    <div class="container">
                        <div class="brands-inner">
                            <div class="brand-title">
                                <span>Brands</span>
                            </div>

                            <div id="slider-home"> <!-- Slider -->
                                <div id="brand-carousel" class="owl-carousel owl-theme">
                                    <div class="item">
                                        <img src="view/assets/images/brand-2.png" alt="slide-1" class="img-responsive">
                                    </div>
                                    <div class="item">
                                        <img src="view/assets/images/brand-3.png" alt="slide-1" class="img-responsive">
                                    </div>
                                    <div class="item">
                                        <img src="view/assets/images/brand-4.png" alt="slide-1" class="img-responsive">
                                    </div>
                                    <div class="item">
                                        <img src="view/assets/images/brand-1.png" alt="slide-1" class="img-responsive">
                                    </div>
                                    <div class="item">
                                        <img src="view/assets/images/brand-5.png" alt="slide-1" class="img-responsive">
                                    </div>
                                    <div class="item">
                                        <img src="view/assets/images/brand-2.png" alt="slide-1" class="img-responsive">
                                    </div>
                                    <div class="item">
                                        <img src="view/assets/images/brand-3.png" alt="slide-1" class="img-responsive">
                                    </div>
                                    <div class="item">
                                        <img src="view/assets/images/brand-4.png" alt="slide-1" class="img-responsive">
                                    </div>
                                    <div class="item">
                                        <img src="view/assets/images/brand-1.png" alt="slide-1" class="img-responsive">
                                    </div>
                                    <div class="item"><img src="view/assets/images/brand-5.png" alt="slide-1" class="img-responsive">
                                    </div>
                                </div>
                            </div> <!-- Slider -->

                        </div>
                    </div>
                </div>


                <div class="rec-blog">
                    <div class="container">
                        <div class="rec-blog-inner">
                            <div class="blog-title">
                                <span>The Blog</span>
                            </div>
                            <div class="row">
                                <div class="col-md-4 blog-ct">
                                    <a href=""><img src="view/assets/images/rec-1.jpg" alt="" class="img-responsive"></a>
                                    <div class="blog-ct-title">
                                        <a href="">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque !</a>
                                        <span>May 11,2014</span>
                                    </div>
                                </div>
                                <div class="col-md-4 blog-ct">
                                    <a href=""><img src="view/assets/images/rec-2.jpg" alt="" class="img-responsive"></a>
                                    <div class="blog-ct-title">
                                        <a href="">Voluptatem accusantium doloremque</a>
                                        <span>May 11,2014</span>
                                    </div>
                                </div>
                                <div class="col-md-4 blog-ct">
                                    <a href=""><img src="view/assets/images/rec-3.jpg" alt="" class="img-responsive"></a>
                                    <div class="blog-ct-title">
                                        <a href="">Voluptatem accusantium doloremque</a>
                                        <span>May 11,2014</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div> <!-- Content -->

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
        </div> <!-- wrapper -->

        <script>
            window.onpageshow = function (event) {
                if (event.persisted) {
                    window.location.reload();
                }
            };

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
