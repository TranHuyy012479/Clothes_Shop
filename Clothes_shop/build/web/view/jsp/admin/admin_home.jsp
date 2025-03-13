<%-- 
    Document   : admin_home
    Created on : Oct 29, 2024, 6:08:25 PM
    Author     : tranh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            #chartDonut {
                width: 500px;
                height: 500px;
            }
        </style>

    </head>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <body>
        <%@include file="sidebar.jsp"%>
        <div class="page-wrapper">
            <div class="content">
                <div class="row">
                    <div class="col-lg-3 col-sm-6 col-12 d-flex">
                        <div class="dash-count">
                            <div class="dash-counts">
                                <h4>${requestScope.TOTALUSERS}</h4>
                                <h5>Customers</h5>
                            </div>
                            <div class="dash-imgs">
                                <i data-feather="user"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6 col-12 d-flex">
                        <div class="dash-count das1">
                            <div class="dash-counts">
                                <h4>${requestScope.TOTALPRODUCTS}</h4>
                                <h5>Products</h5>
                            </div>
                            <div class="dash-imgs">
                                <i data-feather="user-check"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6 col-12 d-flex">
                        <div class="dash-count das2">
                            <div class="dash-counts">
                                <h4>${requestScope.TOTALORDERS}</h4>
                                <h5>Orders</h5>
                            </div>
                            <div class="dash-imgs">
                                <i data-feather="file-text"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6 col-12 d-flex">
                        <div class="dash-count das3">
                            <div class="dash-counts">
                                <h4>${requestScope.TOTAL_REVENUE}VND</h4>
                                <h5>Revenue</h5>
                            </div>
                            <div class="dash-imgs">
                                <i data-feather="file"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-7 col-sm-12 col-12 d-flex">
                        <div class="card flex-fill">
                            <div class="card-header pb-0 d-flex justify-content-between align-items-center">
                                <h5 class="card-title mb-0">Product Proportion</h5>
                                <div class="graph-sets">
                                    <div class="col-md-6">
                                        <div class="card-body">
                                            <div class="chartjs-wrapper-demo">
                                                <canvas id="chartDonut" class="h-300"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div id="sales_charts"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 col-sm-12 col-12 d-flex">
                        <div class="card flex-fill">
                            <div class="card-header pb-0 d-flex justify-content-between align-items-center">
                                <h4 class="card-title mb-0">Recently Added Products</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive dataview">
                                    <table class="table"> <!--thieu trong class datatable-->
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Products</th>
                                                <th>Price</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="p" items="${LAST_RECENT_PRODUCTS}">
                                                <tr>
                                                    <td>${p.id}</td>
                                                    <td class="productimgname">
                                                        <a href="productlist.html" class="product-img">
                                                            <img src="${p.image}"/>
                                                        </a>
                                                        <a href="#">${p.name}</a>
                                                    </td>
                                                    <td>${p.price}VND</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card mb-0">
                    <div class="card-body">
                        <h4 class="card-title">Recent Orders</h4>
                        <div class="table-responsive dataview">
                            <table class="table" id="myTable">  <!--thieu trong class datatable-->
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Username</th>
                                        <th>Phone number</th>
                                        <th>Address</th>
                                        <th>Date purchase</th>
                                        <th>Total</th>
                                        <th>Payment</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${LAST_RECENT_ORDERS}" var="b">
                                        <tr>
                                            <td>${b.id}</td>
                                            <td>${b.users.username}</td>
                                            <td>${b.users.phoneNumber}</td>
                                            <td>${b.shippingAddress}</td>
                                            <td>${b.orderDate}</td>
                                            <td>${b.totalMoney}</td>
                                            <td><span class="badge bg-success">CASH</span></td>   
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

        <script src="assets/plugins/chartjs/chart.min.js"></script>
        <script src="assets/plugins/chartjs/chart-data.js"></script>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Lấy dữ liệu từ requestScope và chuyển đổi thành mảng
                var rawData = "${requestScope.chartadminhome}"; // Dữ liệu từ server
                var items = rawData.split(','); // Tách theo dấu phẩy

                var labels = [];     // Mảng lưu nhãn
                var dataValues = []; // Mảng lưu giá trị

                // Xử lý từng mục để lấy nhãn và giá trị
                items.forEach(function (item) {
                    var parts = item.split('-'); // Tách theo dấu gạch ngang
                    labels.push(parts[0].trim()); // Nhãn
                    dataValues.push(parseInt(parts[1].trim())); // Giá trị
                });

                // Tạo biểu đồ với dữ liệu đã tách được
                var ctx = document.getElementById('chartDonut').getContext('2d');
                var chartDonut = new Chart(ctx, {
                    type: 'pie',
                    data: {
                        labels: labels,
                        datasets: [{
                                label: 'My Pie Chart',
                                data: dataValues,
                                backgroundColor: ['red', 'blue', 'green','orange','black'] // Màu sắc cho biểu đồ
                            }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {
                                position: 'top'
                            },
                            tooltip: {
                                enabled: true
                            }
                        }
                    }
                });
            });
        </script>
        
    </body>
</html>
