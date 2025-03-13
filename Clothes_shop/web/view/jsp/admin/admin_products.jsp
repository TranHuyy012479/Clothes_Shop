<%-- 
    Document   : admin_product
    Created on : Oct 29, 2024, 6:37:04 PM
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
            /* CSS cho hộp thoại xác nhận */
            .modal {
                display: none;
                position: fixed;
                z-index: 1000;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                justify-content: center;
                align-items: center;
            }

            .modal-content {
                background-color: #fefefe;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
                text-align: center;
                width: 300px;
            }

            .modal-header, .modal-body, .modal-footer {
                margin-bottom: 10px;
            }

            .modal-header {
                font-size: 18px;
                font-weight: bold;
            }

            .modal-footer button {
                padding: 8px 16px;
                margin: 5px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            .btn-confirm {
                background-color: #d9534f;
                color: white;
            }

            .btn-cancel {
                background-color: #5bc0de;
                color: white;
            }
        </style>
    </head>
    <body>
        <%@include file="sidebar.jsp"%>
        <div class="page-wrapper">    
            <div class="content">
                <div class="page-header">
                    <div class="page-title">
                        <h4>Product List</h4>
                        <h6>Manage your products</h6>
                    </div>
                    <div class="page-btn">
                        <a href="ManageProductServlet?action=Insert" class="btn btn-added"
                           ><img src="${pageContext.request.contextPath}/view/assets/icons/plus.svg" alt="img" class="me-1"/>Add New Product
                        </a>
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
                                            ><img src="${pageContext.request.contextPath}/view/assets/icons/closes.svg" alt="img"
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

                        <div class="card mb-0" id="filter_inputs">
                            <div class="card-body pb-0">
                                <div class="row">
                                    <div class="col-lg-12 col-sm-12">
                                        <div class="row">
                                            <div class="col-lg col-sm-6 col-12">
                                                <div class="form-group">
                                                    <select class="select">
                                                        <option>Choose Product</option>
                                                        <option>Macbook pro</option>
                                                        <option>Orange</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg col-sm-6 col-12">
                                                <div class="form-group">
                                                    <select class="select">
                                                        <option>Choose Category</option>
                                                        <option>Computers</option>
                                                        <option>Fruits</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg col-sm-6 col-12">
                                                <div class="form-group">
                                                    <select class="select">
                                                        <option>Choose Sub Category</option>
                                                        <option>Computer</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg col-sm-6 col-12">
                                                <div class="form-group">
                                                    <select class="select">
                                                        <option>Brand</option>
                                                        <option>N/D</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg col-sm-6 col-12">
                                                <div class="form-group">
                                                    <select class="select">
                                                        <option>Price</option>
                                                        <option>150.00</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-1 col-sm-6 col-12">
                                                <div class="form-group">
                                                    <a class="btn btn-filters ms-auto"
                                                       ><img
                                                            src="${pageContext.request.contextPath}/view/assets/img/icons/search-whites.svg"
                                                            alt="img"
                                                            /></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="table-responsive">
                            <table class="table datanew">
                                <thead>
                                    <tr>
                                        <th>Mã sản phẩm</th>
                                        <th>Category</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Giá</th>
                                        <th>Số lượng</th>
                                        <th>Ảnh</th>
                                        <th>Tình trạng</th>
                                        <th>Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.LIST_PRODUCTS}" var="p">
                                    <tr>
                                        <td>${p.id}</td>
                                        <td>${p.getCategory().getName()}</td>
                                        <td style="max-width: 200px">${p.getName()}</td>
                                        <td>${p.getPrice()}VND</td>
                                        <td>${p.getQuantity()}</td>
                                        <td><img style="width: 50px; height: 50px" src="${p.getImage()}" alt="alt"/></td>
                                        <td>${p.getStatus() == 1 ? 'selling' : 'deleted'}</td>
                                        <td>
                                            <a class="me-3" href="EditProductServlet?product_id=${p.id}">
                                                <img src="${pageContext.request.contextPath}/view/assets/icons/edit.svg" alt="img" />
                                            </a>
                                            <a class="confirm-text" href="#" onclick="confirmDelete(${p.getId()})">
                                                <img src="${pageContext.request.contextPath}/view/assets/icons/delete.svg" alt="img" />
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
                                                            
        <!-- Hộp thoại xác nhận xóa -->
        <div id="confirmModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">Confirmation</div>
                <div class="modal-body">Do you want to delete this user?</div>
                <div class="modal-footer">
                    <button id="confirmYes" class="btn-confirm">Yes</button>
                    <button id="confirmNo" class="btn-cancel">No</button>
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
            
         // Hiển thị hộp thoại xác nhận
            function confirmDelete(pid) {
                
                
            const modal = document.getElementById("confirmModal");
            modal.style.display = "flex"; 
            
            document.getElementById("confirmYes").onclick = function () {
             window.location.href = 'DeleteProductServlet?pid=' + pid;
            modal.style.display = "none"; 
            };

            document.getElementById("confirmNo").onclick = function () {
            modal.style.display = "none"; 
             };
            }

        </script>
        
    </body>
</html>
