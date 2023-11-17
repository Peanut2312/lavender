<%-- 
    Document   : order
    Created on : Jul 15, 2023, 10:28:00 PM
    Author     : Pham Thang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
    <head>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

        <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lavender</title>
        <link href="img/flower.png" rel="icon" type="image/x-icon">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="path/to/editor.dataTables.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            body {
                transition: background-color 0.3s, color 0.3s;
            }


            button {
                padding: 5px 10px;
                font-size: 16px;
                cursor: pointer;
            }
            .breadcrumb__links a {

                font-size: 15px;
                font-weight: 500;
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
                display: inline-block;
            }
            a:hover,
            a {
                text-decoration: none;
                outline: none;
            }

        </style>
        <script>
            function update(orderID, choice) {
                window.location.href ='status?status=' + choice+'&orderID=' + orderID;
            }
        </script>
    </head>
    <body >
        <div style="" class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__links">
                            <a href="home"><i class="fa fa-home"></i> Home</a>
                            <a href="admin">Admin</a>
                            <span>Manage Detail</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <button onclick="toggleMode()">Mode</button>
        <table id="myTable" class=" display compact order-column">
            <thead>
                <tr>
                    <th>Detail</th>
                    <th>Account</th>
                    <th>Status</th>
                    <th>Bill</th> 
                    <th>Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="o">
                    <tr>
                        <td><a href="orderDetail?orderID=${o.orderID}">${o.orderID}</a></td>
                        <td>${o.account.username}</td>
                        <td>
                            ${o.status}
                        </td>

                        <td>${o.bill}</td>
                        <td>${o.date}</td>
                        <td>
                            <c:if test="${o.status=='Canceled'}">
                                <a href="deleteOrder?orderID=${o.orderID}">Delete</a>
                            </c:if>
                                <c:if test="${o.status!='Canceled'}">
                                 <select onchange="update(${o.orderID}, this.value)">
                                <option ${o.status=="Pending"?"selected":""} value="Pending">Pending</option>
                                <option ${o.status=="Confirmed"?"selected":""} value="Confirmed">Confirmed</option>
                                <option ${o.status=="Preparing"?"selected":""} value="Preparing">Preparing</option>
                                <option ${o.status=="Shipping"?"selected":""} value="Shipping">Shipping</option>
                                <option ${o.status=="Arrived"?"selected":""} value="Arrived">Arrived</option>
                            </select>
                            </c:if>
                           
                        </td>
                    </tr>
                </c:forEach>
            </tbody>

        </table>
        <script>
            function toggleMode() {
                var body = document.body;
                var currentMode = body.getAttribute('data-bs-theme') === 'dark' ? 'light' : 'dark';
                body.setAttribute('data-bs-theme', currentMode);
            }
        </script>
        <script>



            $(document).ready(function () {
                $('#myTable').DataTable({
                    colReorder: true,
                    fixedHeader: true
                });
            });


        </script>
    </body>
</html>