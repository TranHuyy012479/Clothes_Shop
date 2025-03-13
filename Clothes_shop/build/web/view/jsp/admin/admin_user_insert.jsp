<%-- 
    Document   : admin_user_create
    Created on : Oct 29, 2024, 7:19:39 PM
    Author     : tranh
--%>

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
                        <h4>Customer Management</h4>
                        <h6>Add/Update Customer</h6>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <form class="row" action="InsertUserServlet" method="get">
                            <div class="col-lg-3 col-sm-6 col-12">
                                <div class="form-group">
                                    <label>Customer Name</label>
                                    <input type="text" name="fullname" required/>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6 col-12">
                                <div class="form-group">
                                    <label>Username</label>
                                    <input type="text" name="username" required/>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6 col-12">
                                <div class="form-group">
                                    <label>Password</label>
                                    <input type="text" name="password" required/>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6 col-12">
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="text" name="email" required/>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6 col-12">
                                <div class="form-group">
                                    <label>Phone</label>
                                    <input type="text" name="phone" required/>
                                </div>
                            </div>
                            <div class="col-lg-9 col-12">
                                <div class="form-group">
                                    <label>Address</label>
                                    <input type="text" name="address"/>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label>Date of birth</label>
                                    <input type="date" name="dob" required/>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label> Avatar</label>
                                    <div class="image-upload">
                                        <input type="file" />
                                        <div class="image-uploads">
                                            <img src="assets/img/icons/upload.svg" alt="img" />
                                            <h4>Drag and drop a file to upload</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <button type="submit" class="btn btn-submit me-2"
                                   >Submit</button>
                                <a href="ManageUserServlet" class="btn btn-cancel"
                                   >Cancel</a
                                >
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
    </body>
</html>
