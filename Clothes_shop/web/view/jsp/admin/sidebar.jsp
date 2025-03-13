<%-- 
    Document   : sidebar
    Created on : Oct 29, 2024, 4:01:40 PM
    Author     : tranh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/view/assets/img/favicon.jpg"/>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/bootstrap.min.css" />

        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/animate.css" />

        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/dataTables.bootstrap4.min.css" />

        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/plugins/fontawesome/css/fontawesome.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/plugins/fontawesome/css/all.min.css" />

        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/style.css" />
    </head>
    <body>
<!--                <div id="global-loader">
                    <div class="whirly-loader"></div>
                </div>-->

        <div class="main-wrapper">
            <div class="header">
                <div class="header-left active">
                    <a href="index.html" class="logo">
                        <img src="${pageContext.request.contextPath}/view/assets/images/logo.png" alt="" />
                    </a>
                    <a href="index.html" class="logo-small">
                        <img src="${pageContext.request.contextPath}/view/assets/images/logo-small.png" alt="" />
                    </a>
                    <a id="toggle_btn" href=""> </a>
                </div>


                <ul class="nav user-menu">

                    <li class="nav-item dropdown has-arrow main-drop">
                        <a
                            href="javascript:void(0);"
                            class="dropdown-toggle nav-link userset"
                            data-bs-toggle="dropdown"
                            >
                            <span class="user-img"
                                  ><img src="${pageContext.request.contextPath}/view/assets/images/avator1.jpg" alt="" />
                                <span class="status online"></span
                                ></span>
                        </a>
                        <div class="dropdown-menu menu-drop-user">
                            <div class="profilename">
                                <div class="profileset">
                                    <span class="user-img"
                                          ><img src="assets/img/profiles/avator1.jpg" alt="" />
                                        <span class="status online"></span
                                        ></span>
                                    <div class="profilesets">
                                        <h6>${users.username}</h6>
                                        <h5>Admin</h5>
                                    </div>
                                </div>
                                <hr class="m-0" />
                                <a class="dropdown-item logout pb-0" href="logout"
                                   ><img
                                        src="${pageContext.request.contextPath}/view/assets/icons/log-out.svg"
                                        class="me-2"
                                        alt="img"
                                        />Logout</a
                                >
                            </div>
                        </div>
                    </li>
                </ul>
                <div class="dropdown mobile-user-menu">
                    <a href="javascript:void(0);" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item" href="profile.html">My Profile</a>
                        <a class="dropdown-item" href="logout">Logout</a>
                    </div>
                </div>
            </div>
            <div class="sidebar" id="sidebar">
                <div class="sidebar-inner slimscroll">
                    <div id="sidebar-menu" class="sidebar-menu">
                        <ul>
                            <li class="" style="margin: 40px 0px" >
                                <a style="text-decoration: none" href="AdminServlet">
                                    <img src="${pageContext.request.contextPath}/view/assets/icons/dashboard.svg" alt="img" />
                                    <span>Dashboard</span>
                                </a>
                            </li>
                            <li class="" style="margin: 40px 0px">
                                <a style="text-decoration: none" href="ManageUserServlet">
                                    <img src="${pageContext.request.contextPath}/view/assets/icons/users1.svg" alt="img" />
                                    <span>User Manage</span>
                                </a>
                            </li>
                            <li class="" style="margin: 40px 0px">
                                <a style="text-decoration: none" href="ManageProductServlet">
                                    <img src="${pageContext.request.contextPath}/view/assets/icons/product.svg" alt="img" />
                                    <span>Product Manage </span>
                                </a>
                            </li>
                            <li class="" style="margin: 40px 0px">
                                <a style="text-decoration: none" href="ManageCategoryServlet">
                                    <img src="${pageContext.request.contextPath}/view/assets/icons/users1.svg" alt="img" />
                                    <span>Category Manage</span>
                                </a>
                            </li>
                            <li class="" style="margin: 40px 0px" >
                                <a style="text-decoration: none" href="ManageOrderServlet">
                                    <img src="${pageContext.request.contextPath}/view/assets/icons/dashboard.svg" alt="img" />
                                    <span>Order Manage</span>
                                </a>
                            </li>
                            <li class="" style="margin: 40px 0px">
                                <a style="text-decoration: none" href="ChartServlet">
                                    <i data-feather="bar-chart-2"></i> 
                                    <span> Charts </span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </body>

   
</html>
