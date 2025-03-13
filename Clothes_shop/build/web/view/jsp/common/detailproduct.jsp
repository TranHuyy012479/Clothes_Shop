<%-- 
    Document   : detailproduct
    Created on : Oct 19, 2024, 10:08:15 PM
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
                                <input type="text" class="form-control search-wid" placeholder="Search Here" aria-describedby="basic-addon2">
                                <a href="" class="input-group-addon btn-side-serach" id="basic-addon2"><i class="fa fa-search"></i></a>
                            </div>
                        </form>
                    </div>
                </div>
            </div> 
        </div>
        <hr>

    <center><h2>Thông tin sản phẩm</h2></center>
        <c:set var="product" value="${requestScope.singleProduct}"/>

    <section class="py-5">
        <div class="container">
            <div class="row gx-5">
                <aside class="col-lg-6">
                    <div class="border rounded-4 mb-3 d-flex justify-content-center">
                        <a data-fslightbox="mygalley" class="rounded-4" target="_blank" data-type="image">
                            <img style="width: 550px; height: 550px; margin: auto;"  src="${product.image}" />
                        </a>
                    </div>
                </aside>
                <main class="col-lg-6">
                    <div class="ps-lg-3">
                        <h4 class="title text-dark">
                            ${product.name}
                        </h4>
                        <div class="d-flex flex-row my-3">
                            <div class="text-warning mb-1 me-2">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                                <span class="ms-1">
                                    4.5
                                </span>
                            </div>
                            <span class="text-muted"><i class="fas fa-shopping-basket fa-sm mx-1"></i>${product.quantity} orders</span>
                            <span class="text-success ms-2">In stock</span>
                        </div>

                        <div class="mb-3">
                            <span class="h5">${product.price}VND</span>
                            <span class="text-muted">/per box</span>
                        </div>

                        <p>
                            ${product.description},
                            modern look and quality demo item is a streetwear-inspired collection that continues to break away from the conventions of mainstream fashion. Made in Italy, these black and brown clothing low-top shirts for
                            men.
                        </p>


                        <hr />

                        <div class="row mb-4">
                            <div class="col-md-4 col-6">
                                <label class="mb-2">Size</label>
                                <select class="form-select border border-secondary" style="height: 35px;">
                                    <option>Small</option>
                                    <option>Medium</option>
                                    <option>Large</option>
                                </select>
                            </div>
                            <!-- col.// -->
                            <div class="col-md-4 col-6 mb-3">
                                <div class="product-quantity">
                                    <label class="mb-2">Số lượng:</label>
                                    <div class="quantity-selector" style="display: inline-flex">
                                        <button class="quantity-btn" onclick="decreaseQuantity()">-</button>
                                        <input type="text" id="quantity" value="1" readonly style="width: 30px">
                                        <button class="quantity-btn" onclick="increaseQuantity()">+</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a href="#" class="btn btn-warning shadow-0">Add to cart</a>
                        <a href="#" class="btn btn-primary shadow-0"> <i class="me-1 fa fa-shopping-basket"></i> Add to wishlist </a>
                    </div>
                </main>
            </div>
        </div>
    </section>

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
        function decreaseQuantity() {
            var quantity = document.getElementById('quantity').value;
            if (quantity > 1) {
                document.getElementById('quantity').value = --quantity;
            }
        }

        function increaseQuantity() {
            var quantity = document.getElementById('quantity').value;
            document.getElementById('quantity').value = ++quantity;
        }
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
