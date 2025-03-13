<%-- 
    Document   : admin_order_detail
    Created on : Oct 30, 2024, 10:31:59 PM
    Author     : tranh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="sidebar.jsp"%>
        <div class="page-wrapper">
            <div class="content">
                <div class="page-header">
                    <div class="page-title">
                        <h4>ORDER DETAIL</h4>
                        <h6>Manage your order items</h6>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <div class="table-top">
                            <div class="search-set">
                                <div class="search-path">
                                    <a class="btn btn-filter" id="filter_search">
                                        <img src="${pageContext.request.contextPath}/view/assets/icons/filter.svg" alt="img" />
                                        <span
                                            ><img src="assets/img/icons/closes.svg" alt="img"
                                              /></span>
                                    </a>
                                </div>
                                <div class="search-input">
                                    <a class="btn btn-searchset"
                                       ><img src="${pageContext.request.contextPath}/view/assets/icons/search-white.svg" alt="img"
                                          /></a>
                                </div>
                            </div>
                            <div class="wordset">
                                <ul>
                                    <li>
                                        <a
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="pdf"
                                            ><img src="${pageContext.request.contextPath}/view/assets/icons/pdf.svg" alt="img"
                                              /></a>
                                    </li>
                                    <li>
                                        <a
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="excel"
                                            ><img src="${pageContext.request.contextPath}/view/assets/icons/excel.svg" alt="img"
                                              /></a>
                                    </li>
                                    <li>
                                        <a
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="print"
                                            ><img src="${pageContext.request.contextPath}/view/assets/icons/printer.svg" alt="img"
                                              /></a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="card" id="filter_inputs">
                            <div class="card-body pb-0">
                                <div class="row">
                                    <div class="col-lg-2 col-sm-6 col-12">
                                        <div class="form-group">
                                            <input type="text" placeholder="Enter Supplier Code" />
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-sm-6 col-12">
                                        <div class="form-group">
                                            <input type="text" placeholder="Enter Supplier" />
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-sm-6 col-12">
                                        <div class="form-group">
                                            <input type="text" placeholder="Enter Phone" />
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-sm-6 col-12">
                                        <div class="form-group">
                                            <input type="text" placeholder="Enter Email" />
                                        </div>
                                    </div>
                                    <div class="col-lg-1 col-sm-6 col-12 ms-auto">
                                        <div class="form-group">
                                            <a class="btn btn-filters ms-auto"
                                               ><img
                                                    src="assets/img/icons/search-whites.svg"
                                                    alt="img"
                                                    /></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="table-responsive">
                            <table class="table datanew">
                                <thead>
                                    <tr>
                                        <th>Image</th>
                                        <th>Product ID</th>
                                        <th>Product Name</th>
                                        <th>Quantity Buy</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${LIST_PRODUCTS_IN_ORDER}" var="d">
                                        <tr>
                                            <td><img src="${d.products.image}" alt="" width="100px;"></td>
                                            <td>${d.products.id}</td>
                                            <td>${d.products.name}</td>
                                            <td>${d.numberOfProduct}</td>
                                            <td>${d.totalMoney}VND</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/view/assets/js/jquery-3.6.0.min.js"></script>

        <script src="${pageContext.request.contextPath}/view/assets/js/feather.min.js"></script>

        <script src="${pageContext.request.contextPath}/view/assets/js/jquery.slimscroll.min.js"></script>

        <script src="${pageContext.request.contextPath}/view/assets/js/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/view/assets/js/dataTables.bootstrap4.min.js"></script>

        <script src="${pageContext.request.contextPath}/view/assets/js/bootstrap.bundle.min.js"></script>

        <script src="${pageContext.request.contextPath}/view/assets/js/script.js"></script>  
        
    </body>
</html>
