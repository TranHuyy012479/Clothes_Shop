<%-- 
    Document   : admin_categories_insert
    Created on : Oct 29, 2024, 7:18:43 PM
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
                        <h4>Product Add Category</h4>
                        <h6>Create new product Category</h6>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <form class="row" method="get" action="InsertCategoryServlet">
                            <div class="col-lg-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label>Category Existing</label>
                                    <c:forEach items="${requestScope.LIST_CATEGORIES}" var="cat">
                                        <option value="${cat.getId()}">ID:${cat.getId()}: ${cat.getName()}</option>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="col-lg-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label>ID new</label>
                                    <input type="number" name="id" min="1" required/>
                                </div>
                            </div>
                            <div class="col-lg-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label>Name Category</label>
                                    <input type="text" name="name" required/>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <button type="submit" class="btn btn-submit me-2">Submit</button>
                                <a href="ManageCategoryServlet" class="btn btn-cancel">Cancel</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
    
</html>
