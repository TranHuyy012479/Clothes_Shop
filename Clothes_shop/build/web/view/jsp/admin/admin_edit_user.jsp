<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="view/assets/admin/css/main.css">
        <!-- Font-icon css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}view/assets/admin/css/main.css">
        <script src="view/assets/admin/js/main.js"></script>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
            select {
                width: 32.3%;
                margin: 0;
                font-size: 100%;
                padding: 5px 10px 5px 10px;
                font-family: Segoe UI, Helvetica, sans-serif;
                border: 1px solid #D0D0D0;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                border-radius: 20px;
                outline: none;
            }
        </style>
    <body>
        <form id="form" action="EditUserServlet" method="get">
            <div class="" >
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="row">
                                <div class="form-group  col-md-12">
                                    <span class="thong-tin-thanh-toan">
                                        <h5>Chỉnh sửa thông tin người dùng</h5>
                                    </span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="control-label">Tên đăng nhập</label>
                                    <input class="form-control" type="text" readonly name="username" value="${username}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Tên đầy đủ</label>
                                    <input class="form-control" type="text" name="fullname" value="${fullname}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Ngày tháng năm sinh</label>
                                    <input class="form-control" type="date" name="dob" value="${dob}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Số điện thoại</label>
                                    <input class="form-control" type="text" name="phone" value="${phone}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Email</label>
                                    <input class="form-control" type="text" name="email" value="${email}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Địa chỉ</label>
                                    <input class="form-control" type="text" name="address" value="${address}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Ảnh đại diện</label>
                                    <div id="myfileupload">
                                        <input type="file" id="uploadfile" name="avatar" value="${avatar}" onchange="readURL(this);" />
                                    </div>
                                    <div id="thumbbox">
                                        <img height="450" width="400" alt="Thumb image" id="thumbimage" style="display: none" />
                                        <a class="removeimg" href="javascript:"></a>
                                    </div>
                                </div>
                                    <div class="form-group col-md-6">
                                    <label for="exampleSelect1" class="control-label">Status</label>
<!--                                    <input hidden name="user_id" value="${roleid}">-->
                                    <select name="status" class="form-control" id="exampleSelect1">
                                        <option value="1">Active</option>
                                        <option value="0">Inactive</option>
                                    </select>
                                </div>
                            </div>
                            <BR>
                            <button class="btn btn-save" name="action" value="Update" type="submit">Lưu lại</button>
                            <a class="btn btn-cancel" data-dismiss="modal" href="ManageUserServlet">Hủy bỏ</a>
                            <BR>
                        </div>
                    </div>
                </div>
            </div>
        </form>
                                    
    </body>
    
</html>