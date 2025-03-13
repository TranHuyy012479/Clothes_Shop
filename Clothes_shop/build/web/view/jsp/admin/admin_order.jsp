<%-- 
    Document   : admin
    Created on : Oct 29, 2024, 7:12:59 PM
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
                        <h4>ORDERS LIST</h4>
                        <h6>Manage orders</h6>
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
                                            ><img src="${pageContext.request.contextPath}/view/assets/img/icons/closes.svg" alt="img"
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
                                    <div class="col-lg col-sm-6 col-12">
                                        <div class="form-group">
                                            <input
                                                type="text"
                                                class="datetimepicker cal-icon"
                                                placeholder="Choose Date"
                                                />
                                        </div>
                                    </div>
                                    <div class="col-lg col-sm-6 col-12">
                                        <div class="form-group">
                                            <input type="text" placeholder="Enter Reference" />
                                        </div>
                                    </div>
                                    <div class="col-lg col-sm-6 col-12">
                                        <div class="form-group">
                                            <select class="select">
                                                <option>Choose Supplier</option>
                                                <option>Supplier</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg col-sm-6 col-12">
                                        <div class="form-group">
                                            <select class="select">
                                                <option>Choose Status</option>
                                                <option>Inprogress</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg col-sm-6 col-12">
                                        <div class="form-group">
                                            <select class="select">
                                                <option>Choose Payment Status</option>
                                                <option>Payment Status</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-1 col-sm-6 col-12">
                                        <div class="form-group">
                                            <a class="btn btn-filters ms-auto"
                                               ><img
                                                    src="${pageContext.request.contextPath}/view/assets/icons/search-whites.svg"
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
                                        <th>Order ID</th>
                                        <th>Username</th>
                                        <th>Phone number</th>
                                        <th>Address</th>
                                        <th>Date purchase</th>
                                        <th>Total</th>
                                        <th>Payment</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${LIST_ORDERS}" var="b">
                                    <tr>
                                         <td>${b.id}</td>
                                    <td>${b.users.username}</td>
                                    <td>${b.users.phoneNumber}</td>
                                    <td>${b.shippingAddress}</td>
                                    <td>${b.orderDate}</td>
                                    <td>${b.totalMoney}</td>
                                    <td><span class="badge bg-success">CASH</span></td>
                                    <td>
                                        ${b.status=='Done'?"Done":"Delevering..."}
                                    <c:if test="${b.status!='Done'}">
                                        <button style="margin-left: 20px; float: right; cursor: pointer" onclick="changeStatus(this, ${b.id})">
                                            <i style="color: green" class="fa-solid fa-check"></i>
                                         </button>
                                    </c:if>
                                    </td>
                                    <td>
                                        <a style=" color: rgb(245 157 57);background-color: rgb(251 226 197); padding: 5px;border-radius: 5px;" 
                                           href="ManageOrderServlet?action=showdetail&bill_id=${b.id}">
                                            <i class="fa"></i>Detail Order
                                        </a>
                                    </td>
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
        <script>
            function changeStatus(button, orderID) {
                var id = orderID;
                var action = 'changeStatus';
                $.ajax({
                    url: "/assignmentPRJ301/ManageOrderServlet",
                    type: "post",
                    data: {
                        id: id,
                        action: action
                    },
                    success: function () {
                        var row = button.parentElement;
                        row.innerHTML = 'Done';
                    },
                    error: function (xhr) {
                    }
                });
            } 
        </script>
        
    </body>
</html>
