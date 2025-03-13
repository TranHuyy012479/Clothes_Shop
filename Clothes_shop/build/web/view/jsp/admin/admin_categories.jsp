<%-- 
    Document   : admin_categories
    Created on : Oct 29, 2024, 7:05:51 PM
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

            .close-btn, .cancel-btn {
                color: #333;
                cursor: pointer;
                border: none;
                background: none;
                font-size: 16px;
            }
            .close-btn {
                position: absolute;
                top: 10px;
                right: 15px;
            }
            .save-btn {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            .save-btn:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <%@include file="sidebar.jsp"%>
        <div class="page-wrapper">
            <div class="content">
                <div class="page-header">
                    <div class="page-title">
                        <h4>Product Category list</h4>
                        <h6>View/Search product Category</h6>
                    </div>
                    <div class="page-btn">
                        <a href="ManageCategoryServlet?action=Insert" class="btn btn-added">
                            <img
                                src="${pageContext.request.contextPath}/view/assets/icons/plus.svg"
                                class="me-1"
                                alt="img"
                                />Add Category
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

                        <div class="card" id="filter_inputs">
                            <div class="card-body pb-0">
                                <div class="row">
                                    <div class="col-lg-2 col-sm-6 col-12">
                                        <div class="form-group">
                                            <select class="select">
                                                <option>Choose Category</option>
                                                <option>Computers</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-sm-6 col-12">
                                        <div class="form-group">
                                            <select class="select">
                                                <option>Choose Sub Category</option>
                                                <option>Fruits</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-sm-6 col-12">
                                        <div class="form-group">
                                            <select class="select">
                                                <option>Choose Sub Brand</option>
                                                <option>Iphone</option>
                                            </select>
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
                                        <th>Category ID</th>
                                        <th>Category Name</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${LIST_CATEGORIES}" var="c">
                                        <tr>
                                            <td>${c.id}</td>
                                            <td>${c.name}</td>
                                            <td>
                                                <a class="me-3" href="#" onclick="openEditModal(${c.getId()}, '${c.getName()}')">
                                                    <img src="${pageContext.request.contextPath}/view/assets/icons/edit.svg" alt="img" />
                                                </a>
                                                <a class="me-3 confirm-text" href="#" onclick="confirmDelete(${c.getId()})">
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



        <div id="editCategoryModal" class="modal">
            <div class="modal-content">
                <button class="close-btn" onclick="closeModal()">×</button>
                <h2>Edit Category</h2>

                <form id="editCategoryForm" action="EditCategoryServlet" method="get">
                    <label for="categoryDescription">Category ID</label>
                    <input type="number" id="categoryId" name="category_id" readonly/>


                    <label for="categoryName">Category Name</label>
                    <input type="text" id="categoryName" name="category_name" required/>


                    <div style="display: flex; justify-content: space-between; margin-top: 20px;">
                        <button type="button" class="cancel-btn" onclick="closeModal()">Cancel</button>
                        <button type="submit" class="save-btn">Save Changes</button>
                    </div>
                </form>
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
                            function confirmDelete(cid) {


                                const modal = document.getElementById("confirmModal");
                                modal.style.display = "flex";

                                document.getElementById("confirmYes").onclick = function () {
                                    window.location.href = 'DeleteCategoryServlet?cid=' + cid;
                                    modal.style.display = "none";
                                };

                                document.getElementById("confirmNo").onclick = function () {
                                    modal.style.display = "none";
                                };
                            }

        </script>


        <script>
            // Hàm mở modal và điền dữ liệu
            function openEditModal(categoryId, categoryName) {
                const modal = document.getElementById("editCategoryModal");
                const categoryIdField = document.getElementById("categoryId");
                const categoryNameField = document.getElementById("categoryName");

                // Điền dữ liệu vào các trường của modal
                categoryIdField.value = categoryId;
                categoryNameField.value = categoryName;

                // Hiển thị modal
                modal.style.display = "flex";
            }

            // Hàm đóng modal
            function closeModal() {
                document.getElementById("editCategoryModal").style.display = "none";
            }

            // Đóng modal khi nhấn bên ngoài modal
            window.onclick = function (event) {
                const modal = document.getElementById("editCategoryModal");
                if (event.target === modal) {
                    closeModal();
                }
            };
        </script>
        
        
    </body>
</html>
