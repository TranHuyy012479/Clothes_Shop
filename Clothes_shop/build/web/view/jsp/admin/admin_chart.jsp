<%-- 
    Document   : admin
    Created on : Oct 29, 2024, 7:19:04 PM
    Author     : tranh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chart Page</title>
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/view/assets/img/favicon.jpg"/>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/bootstrap.min.css" />

        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/animate.css" />

        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/dataTables.bootstrap4.min.css" />

        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/plugins/fontawesome/css/fontawesome.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/plugins/fontawesome/css/all.min.css" />

        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/style.css" />
    </head>
    <body>
        <%@include file="sidebar.jsp"%>
        <div class="page-wrapper cardhead">
            <div class="content">
                <div class="page-header">
                    <div class="row">
                        <div class="col-sm-12">
                            <h3 class="page-title">Chartjs</h3>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <a href="AdminServlet">Dashboard</a>
                                </li>
                                <li class="breadcrumb-item active">Chartjs</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div style="margin-bottom: 30px" class="col-sm-12 col-xl-6">
                                <div class="bg-light text-center rounded p-4">
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <h6 class="mb-0">Revenue by month</h6>
                                    </div>
                                    <canvas id="worldwide-sales"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="card">
                            <div style="margin-bottom: 30px" class="col-sm-12 col-xl-6">
                                <div class="bg-light text-center rounded p-4">
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <h6 class="mb-0">Revenue by year</h6>
                                    </div>
                                    <canvas id="sale-revenue"></canvas>
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
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/view/assets/admin/js/chart.min.js"></script>
        <script>
        // Worldwide Sales Chart
        var ctx1 = document.getElementById("worldwide-sales").getContext("2d");
        var myChart1 = new Chart(ctx1, {
            type: "bar",
            data: {
                labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "No", "Dec"],
                datasets: [{
                        label: "Revenue",
                        data: [${MONTH1}, ${MONTH2}, ${MONTH3}, ${MONTH4}, ${MONTH5}, ${MONTH6}, ${MONTH7}, ${MONTH8}, ${MONTH9}, ${MONTH10}
                            ,${MONTH11}, ${MONTH12}],
                        backgroundColor: "rgba(0, 156, 255, .7)"
                    }
                ]
            },
            options: {
                responsive: true
            }
        });
        // Salse & Revenue Chart
        var ctx2 = document.getElementById("sale-revenue").getContext("2d");
        var myChart2 = new Chart(ctx2, {
            type: "line",
            data: {
                labels: ["2024", "2025", "2026", "2027", "2028", "2029", "2030"],
                datasets: [{
                        label: "Revenue",
                        data: [${YEAR24}, ${YEAR25}, ${YEAR26}, ${YEAR27}, ${YEAR28}, ${YEAR29}, ${YEAR30}],
                        backgroundColor: "rgba(0, 156, 255, .5)",
                        fill: true
                    }
                ]
            },
            options: {
                responsive: true
            }
        });
        </script>
        
    </body>
</html>
