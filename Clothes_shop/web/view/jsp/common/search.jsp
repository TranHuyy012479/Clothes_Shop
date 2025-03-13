<%-- 
    Document   : search
    Created on : Oct 20, 2024, 10:10:28 AM
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
                                <span>  </span>
                                <a href="register">Register</a>
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
                                    <li class="active"><a href="home.jsp">Home <span class="sr-only">(current)</span></a></li>
                                    <li><a href="blog.jsp">Blog</a></li>
                                    <li><a href="blog-detail.jsp">Blog Post</a></li>
                                    <li><a href="contact.jsp">Contact</a></li>
                                </ul>

                                <ul class="nav navbar-nav navbar-right">
                                    <li class="menu-search-form">
                                        <a href="#" id="open-srch-form"><img src="view/assets/images/srch.png" alt="srch"></a>
                                    </li>
                                    <li><a href="#"><img src="view/assets/images/pav.png" alt="pav"><span></span></a></li>
                                    <li><a href="#"><img src="view/assets/images/bag.png" alt="bag"><span></span></a></li>
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
        <hr>
        <div class="newest">
            <div class="container">
                <div class="newest-content">
                    <div class="newest-tab">
                        <c:if test="${not empty requestScope.pSearch}">
                            <div id="myTabContent" class="tab-content">
                                <div role="tabpanel" class="tab-pane fade in active" id="1" aria-labelledby="cat-1">
                                    <div class="row clearfix">

                                        <c:forEach var="products" items="${requestScope.pSearch}">
                                            <div class="col-md-3 prdct-grid">
                                                <div class="product-fade">
                                                    <div class="product-fade-wrap">
                                                        <div id="product-image" class="owl-carousel owl-theme">
                                                            <div class="item"><img style="aspect-ratio:1/1;" src="${products.image}" alt="" class="img-responsive"></div>
                                                        </div>
                                                        <div class="product-fade-ct">
                                                            <div class="product-fade-control">
                                                                <div class="to-left">
                                                                    <a href=""><i class="fa fa-heart"></i></a>
                                                                    <a href="productdetail?id=${products.id}"><i class="fa fa-search"></i></a>
                                                                </div>
                                                                <div class="clearfix"></div>
                                                                <a href="" class="btn btn-to-cart"><span class="bag"></span><span>Add To cart</span><div class="clearfix"></div></a>
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
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${empty requestScope.pSearch}">
        <center><h1 style="margin-bottom: 20%">Không có sản phẩm nào!!!</h1></center>
        </c:if>



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
