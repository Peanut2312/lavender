<%-- 
    Document   : user
    Created on : Jul 14, 2023, 10:11:44 AM
    Author     : Pham Thang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Lavender</title>
        <link href="img/flower.png" rel="icon" type="image/x-icon">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Varela Round', sans-serif;
                font-size: 13px;
            }
            .table-responsive {
                margin: 30px 0;
            }
            .table-wrapper {
                background: #fff;
                padding: 20px 25px;
                border-radius: 3px;
                min-width: 1000px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {
                padding-bottom: 15px;
                background: #435d7d;
                color: #fff;
                padding: 16px 30px;
                min-width: 100%;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .table-title .btn-group {
                float: right;
            }
            .table-title .btn {
                color: #fff;
                float: right;
                font-size: 13px;
                border: none;
                min-width: 50px;
                border-radius: 2px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 100px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }
            table.table td:last-child i {
                opacity: 0.9;
                font-size: 22px;
                margin: 0 5px;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
                outline: none !important;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: #F44336;
            }
            table.table td i {
                font-size: 19px;
            }
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a:hover {
                color: #666;
            }
            .pagination li.active a, .pagination li.active a.page-link {
                background: #03A9F4;
            }
            .pagination li.active a:hover {
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }

            .breadcrumb-option {

                padding-top: 35px;
            }

            .breadcrumb__links a {

                font-size: 15px;
                font-weight: 500;
                color: #111111;
                margin-right: 18px;
                display: inline-block;
                position: relative;
            }

            .breadcrumb__links a:after {
                position: absolute;
                right: -14px;
                top: 0;
                content: "";
                font-family: "FontAwesome";
            }

            .breadcrumb__links a i {
                margin-right: 5px;
            }

            .breadcrumb__links span {
                font-size: 15px;
                font-weight: 500;
                color: #888888;
                display: inline-block;
            }
            a:hover,
            a:focus {
                text-decoration: none;
                outline: none;
            }

            select {
                padding: 8px;
                border: 1px solid #CCCCCC;
                border-radius: 4px;
                background-color: #FFFFFF;
                color: #333333;
                background-image: url('red-dot.png');
                background-repeat: no-repeat;
                background-position: right center;
            }

            option.active::before {
                font-family: "FontAwesome";
                content: "\f111";
                margin-right: 5px;
                color: green;
            }
        </style>



<script>
    function update(accountID, choice) {
        if (choice === "block") {
            if (confirm("Are you sure to block this account?")) {
                window.location.href = 'account?action=block&accountID=' + accountID;
            }
        } else {
            window.location.href = 'account?action=active&accountID=' + accountID;
        }
    }
</script>


    </head>
    <body>
        <div class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__links">
                            <a href="home"><i class="fa fa-home"></i> Home</a>
                            <a href="admin">Admin</a>
                            <span>Manage User</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Manage <b>User</b></h2>
                            </div>
                            <div class="col-sm-6">
                                <!--<a href="#" class="btn btn-danger" ><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>-->						
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>
                                    <span class="custom-checkbox">
                                        <!--                                        <input type="checkbox" id="0">
                                                                                <label for="0"></label>-->
                                    </span>
                                </th>
                                <th>Name</th>
                                <th>Phone</th>
                                <th>Email</th>
                                <th>DOB</th>
                                <th>Address</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.user}" var="u">
                                <tr>
                                    <td>
                                        <span class="custom-checkbox">
                                        </span>
                                    </td>
                                    <td>${u.firstname}</a></td>
                                    <td>${u.phone}</td>
                                    <td>${u.email}</td>
                                    <td>${u.dob}</td>
                                    <td>${u.address}</td>
                                    <td>

                                        <select onchange="update(${u.accountID}, this.value)" name="status">
                                            <option value="active"  ${u.status?"selected":""}>Active</option>
                                            <option value="block"  ${u.status?"":"selected"} > Blocked</option>
                                        </select>                           
                                    </td>
                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>

                </div>
            </div>        
        </div>




    </body>
</html>