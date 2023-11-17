<%-- 
    Document   : orderUser
    Created on : Jul 16, 2023, 3:10:22 AM
    Author     : Pham Thang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lavender</title>
        <link href="img/flower.png" rel="icon" type="image/x-icon">
        <style>
            .container {
                width: 100%;
                position: absolute;
                z-index: 1;
            }

            .progressbar li {
                float: left;
                width: 20%;
                position: relative;
                text-align: center;
                cursor: pointer;
            }

            .progressbar li.active + li:after {
                background: #3aac5d;
            }

            .progressbar li:before {
                content: counter(step);
                counter-increment: step;
                width: 30px;
                height: 30px;
                border: 2px solid #bebebe;
                display: block;
                margin: 0 auto 10px auto;
                border-radius: 50%;
                line-height: 27px;
                background: white;
                color: #bebebe;
                text-align: center;
                font-weight: bold;
            }

            .progressbar {
                counter-reset: step;
            }

            .progressbar li:after {
                content: '';
                position: absolute;
                width: 100%;
                height: 3px;
                background: #979797;
                top: 15px;
                left: -50%;
                z-index: -1;
            }

            .progressbar li.active + li:after {
                background: #3aac5d;
            }

            .progressbar li.active:before {
                border-color: #3aac5d;
                background: #3aac5d;
                color: white;
            }

            .page-content {
                display: none;
                margin-top: 100px; /* Khoảng cách giữa phần nội dung và thanh progress */
                padding: 10px; /* Để tạo khoảng trống xung quanh nội dung trang */
                background-color: #f1f1f1; /* Màu nền cho phần nội dung */
            }

            .page-content.active {
                display: block;
            }
            .delete-button-container {
                display: flex;
                align-items: center;
                margin-bottom: 5px;
            }

            .delete-button {
                display: inline-block;
                padding: 5px 10px;
                background-color: #ff0000;
                color: #ffffff;
                border-radius: 5px;
                text-decoration: none;
            }
             .receive-button {
                display: inline-block;
                padding: 5px 10px;
                background-color:   #00bfff;
                color: #ffffff;
                border-radius: 5px;
                text-decoration: none;
            }

            .custom-hr {
                color: red;
                background-color: red;
                height: 2px;
                margin: 5px 0;
                width: 25%;
            }

            .info-section {
                margin-left: 10px;
            }
        </style>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    </head>
    <body>
        <a style="text-decoration: none;padding: 40px " href="home" class="home-link">
            <i class="fas fa-home"></i> Home
        </a>
        <div class="container">
            <ul class="progressbar">
                <li class="active">Pending</li>
                <li>Confirmed</li>
                <li>Preparing</li>
                <li>Shipping</li>
                <li>Arrived</li>
            </ul>
        </div>


        <div class="page-content active" id="page-pending">
            <h2>Pending Orders</h2>

            <c:forEach items="${pen}" var="p">
                <c:if test="${p.orderID != orderID}">
                    <div class="delete-button-container">
                        <a href="cancel?orderID=${p.orderID}" class="delete-button">Cancel</a>
                    </div>
                    <hr class="custom-hr">
                </c:if>
                <c:set value="${p.orderID}" var="orderID"/>

                <div class="info-section">
                    <p>Name: ${p.product.name}</p>
                    <p>Quantity: ${p.quantity}</p>
                    <p>Size: ${p.size.size}</p>
                    <p>Color: ${p.color.color}</p>
                    <p>Total: ${p.total}</p>
                    
                    &nbsp;
                </div>
            </c:forEach>

        </div>

        <div class="page-content" id="page-confirmed">
            <h2>Confirmed Orders</h2>
             <c:forEach items="${c}" var="p">
                <c:if test="${p.orderID != orderID}">
                    <div class="delete-button-container">
                        <a href="cancel?orderID=${p.orderID}" class="delete-button">Cancel</a>
                    </div>
                    <hr class="custom-hr">
                </c:if>
                <c:set value="${p.orderID}" var="orderID"/>

                <div class="info-section">
                    <p>Name: ${p.product.name}</p>
                    <p>Quantity: ${p.quantity}</p>
                    <p>Total: ${p.total}</p>
                    &nbsp;
                </div>
            </c:forEach>
        </div>

        <div class="page-content" id="page-preparing">
            <h2>Preparing Orders</h2>
             <c:forEach items="${pre}" var="p">
                <c:if test="${p.orderID != orderID}">
                   
                    <hr class="custom-hr">
                </c:if>
                <c:set value="${p.orderID}" var="orderID"/>

                <div class="info-section">
                    <p>Name: ${p.product.name}</p>
                    <p>Quantity: ${p.quantity}</p>
                    <p>Total: ${p.total}</p>
                    &nbsp;
                </div>
            </c:forEach>
        </div>

        <div class="page-content" id="page-shipping">
            <h2>Shipping Orders</h2>
             <c:forEach items="${s}" var="p">
                <c:if test="${p.orderID != orderID}">
                   
                    <hr class="custom-hr">
                </c:if>
                <c:set value="${p.orderID}" var="orderID"/>

                <div class="info-section">
                    <p>Name: ${p.product.name}</p>
                    <p>Quantity: ${p.quantity}</p>
                    <p>Total: ${p.total}</p>
                    &nbsp;
                </div>
            </c:forEach>
        </div>

        <div class="page-content" id="page-arrived">
            <h2>Arrived Orders</h2>
             <c:forEach items="${a}" var="p">
                <c:if test="${p.orderID != orderID}">
                     <div class="delete-button-container">
                        <a href="receive?orderID=${p.orderID}" class="receive-button">Received</a>
                    </div>
                    <hr class="custom-hr">
                </c:if>
                <c:set value="${p.orderID}" var="orderID"/>

                <div class="info-section">
                    <p>Name: ${p.product.name}</p>
                    <p>Quantity: ${p.quantity}</p>
                    <p>Total: ${p.total}</p>
                    &nbsp;
                </div>
            </c:forEach>
        </div>

        <script>
            var progressbarTabs = document.querySelectorAll('.progressbar li');
            progressbarTabs.forEach(function (tab, index) {
                tab.addEventListener('click', function () {
                    progressbarTabs.forEach(function (tab) {
                        tab.classList.remove('active');
                    });
                    var pageContents = document.querySelectorAll('.page-content');
                    pageContents.forEach(function (content) {
                        content.classList.remove('active');
                    });
                    this.classList.add('active');
                    pageContents[index].classList.add('active');
                });
            });
        </script>

    </body>
</html>
