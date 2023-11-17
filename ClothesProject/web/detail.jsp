<%-- 
    Document   : brand
    Created on : Jul 10, 2023, 9:04:29 AM
    Author     : Pham Thang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="model.Category" %>
<%@ page import="model.Sub_Category" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="model.Account" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Lavender</title>
        <link href="img/flower.png" rel="icon" type="image/x-icon">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/style1.css">
        <style>
            .page {
                display: none;
            }
            .page-wrapper {
                width: 100%;
                height: 100vh; /* Chiều cao của toàn bộ trang */
            }

            .page-wrapper .p-4 {
                height: 100%; /* Chiều cao của phần tử cha */
                overflow-y: auto; /* Hiển thị thanh cuộn nếu nội dung quá dài */
            }

            .active {
                font-weight: bold;
                color: red;
            }
            /* Cách side bar 1 đoạn */
            .page-wrapper {
                padding-left: 20px;
                padding-right: 20px;
            }

            /* CSS cho table */
            #brandPage table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
                background-color: #f5f5f5;
            }

            #brandPage table th,
            #brandPage table td {
                padding: 8px;
                border: 1px solid #ccc;
            }

            /* CSS cho màu nền */
            body {
                background-color: #F5F5F5;
            }
            #brandPage {
                padding-left: 100px;
            }
            #brandPage {
                display: flex;
            }

            .left {
                flex: 1;
                padding-right: 20px
            }

            .right {
                flex: 1;
                padding-top: 20px;
            }

            .categoryPage {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                padding: 20px;
                text-align: center;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }

            .categoryPage .name {
                font-weight: bold;
                color: #333;
                font-size: 18px;
                margin-bottom: 10px;
            }

            .categoryPage .delete,
            .categoryPage .edit {
                color: #999;
                text-decoration: none;
                margin-bottom: 5px;
                font-size: 14px;
            }

            .categoryPage .delete:hover,
            .categoryPage .edit:hover {
                color: #ff0000;
            }
        </style>
    </head>
    <body>

        <div class="wrapper d-flex align-items-stretch">
            <nav id="sidebar">
                <div class="custom-menu">
                    <button type="button" id="sidebarCollapse" class="btn btn-primary">
                        <i class="fa fa-bars"></i>
                        <span class="sr-only">Toggle Menu</span>
                    </button>
                </div>
                <div class="page-wrapper">
                    <div class="p-4 pt-5">
                        <h1><a href="home" class="logo">Home</a></h1>
                        <ul class="list-unstyled components mb-5">
                            <li>
                                <a  href="#" onclick="showPage('brandPage')">Brand</a>
                            </li>
                            <li>
                                <a  href="#" onclick="showPage('categoryPage')">Category</a>
                            </li>
                            <li>
                                <a  href="#" onclick="showPage('sizePage')">Size</a>
                            </li>
                            <li>
                                <a  href="#" onclick="showPage('colorPage')">Color</a>
                            </li>
                            <li>
                                <a  href="#" onclick="showPage('subCategoryPage')">Sub Category</a>
                            </li>


                        </ul>
                    </div>
                </div>

            </nav>

            <!-- Page Content  -->
           <div id="brandPage" class="page">
    <div class="row">
        <div class="left col-md-8">
            <table class="table">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Country</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listBrand}" var="b">
                        <c:set value="${b.brandID}" var="id"/>
                        <tr>
                            <td>${b.name}</td>
                            <td>${b.country}</td>
                            <td>
                                <div class="d-flex">
                                    <a href="deleteDetail?brandID=${b.brandID}" class="mr-2">Delete</a>
                                    <a href="#" onclick="showModal('${b.brandID}', '${b.name}', '${b.country}')" data-toggle="modal" data-target="#editModal">Edit</a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="right col-md-4">
            <h5>Add new Brand</h5>
            <form action="updateDetail">
                <div class="form-group">
                    <label for="brandName">Name</label>
                    <input required type="text" class="form-control" id="brandName" name="brandName">
                </div>
                <div class="form-group">
                    <label for="country">Country</label>
                    <input required type="text" class="form-control" id="country" name="country">
                </div>
                <button type="submit" class="btn btn-primary">Save</button>
            </form>
        </div>
    </div>
</div>
            <!-- Edit Modal -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">Edit Brand</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editForm" action="editDetail">
                    <div class="form-group">
                        <label for="editBrandName">Name</label>
                        <input required type="text" class="form-control" id="editBrandName" value="" name="brandName">
                    </div>
                    <div class="form-group">
                        <label for="editCountry">Country</label>
                        <input required type="text" class="form-control" id="editCountry" value="" name="country">
                    </div>
                    <input value="${id}" type="hidden" id="editBrandID" name="brandID">
                    <button type="submit" class="btn btn-primary">Save</button>
                </form>
            </div>
        </div>
    </div>
</div>
            <div style="padding-left:  200px;padding-top: 50px" id="categoryPage" class="page">
                <div class="row">
                    <c:forEach items="${listCate}" var="c">
                        <div  style="padding: 30px">
                            <span class="name">${c.name}</span>
                            <a class="" href="deleteDetail?categoryID=${c.categoryID}">Delete</a>
                            <a class="" href="editDetail?categoryID=${categoryID}">Edit</a>
                        </div>
                    </c:forEach>
                </div>
                <div style="padding-top: 50px">

                    <form action="updateDetail">
                        Add new Category<br/>
                        <input type="text" name="categoryName"><br/>
                        <input type="submit" value="Save">
                    </form>
                </div>
            </div>

            <div style="padding-left:  200px;padding-top: 50px"  id="colorPage" class="page">
                <div class="row">
                    <c:forEach items="${listColor}" var="c">
                        <div  style="padding: 30px">
                            <span class="name">${c.color}(${c.product.name})</span>
                            <a class="" href="deleteDetail?colorID=${c.colorID}">Delete</a>
                            <a class="" href="editDetail?colorID=${c.colorID}">Edit</a>
                        </div>
                    </c:forEach>
                </div>
                <div style="padding-top: 50px">
                    <form action="updateDetail">
                        Add new Color<br/>
                        <input type="text" name="colorName"><br/>
                        <select name="productID">
                            <c:forEach items="${listProduct}" var="p">
                                <option value="${p.productID}" >${p.name}</option>
                            </c:forEach>
                        </select>
                        <input type="submit" value="Save">

                    </form>
                </div> 
            </div>

            <div style="padding-left:  200px;padding-top: 50px" id="sizePage" class="page">
                <div class="row">
                    <c:forEach items="${listSize}" var="s">
                        <div  style="padding: 30px">
                            <span class="name">${s.size}(${s.category.name})</span>
                            <a class="" href="deleteDetail?sizeID=${s.sizeID}">Delete</a>
                            <a class="" href="editDetail?sizeID=${s.sizeID}">Edit</a>
                        </div>
                    </c:forEach>
                </div>
                <div style="padding-top: 50px">
                    <form action="updateDetail">
                        Add new Size<br/>
                        <input type="text" name="sizeName"><br/>
                        <select name="cateID">
                            <c:forEach items="${listCate}" var="c">
                                <option value="${c.categoryID}" >${c.name}</option>
                            </c:forEach>
                        </select>
                        <input type="submit" value="Save">
                    </form>
                </div> 
            </div>

            <div style="padding-left:  200px;padding-top: 50px" id="subCategoryPage" class="page">
                <div class="row">
                    <c:forEach items="${listSub}" var="s">
                        <div  style="padding: 30px">
                            <span class="name">${s.name}(${s.category.name})</span>
                            <a class="" href="deleteDetail?subID=${s.subID}">Delete</a>
                            <a class="" href="editDetail?subID=${s.subID}">Edit</a>
                        </div>
                    </c:forEach>
                </div>
                <div style="padding-top: 50px">
                    <form action="updateDetail">
                        Add new Sub Category<br/>
                        <input type="text" name="subName"><br/>
                        <select name="categoryID">
                            <c:forEach items="${listCate}" var="c">
                                <option value="${c.categoryID}" >${c.name}</option>
                            </c:forEach>
                        </select>
                        <input type="submit" value="Save">
                    </form>
                </div> 
            </div>
        </div>

        <script>
            function showPage(pageId) {
                // Ẩn tất cả các trang
                var pages = document.getElementsByClassName("page");
                for (var i = 0; i < pages.length; i++) {
                    pages[i].style.display = "none";
                }

                // Hiển thị trang được chọn
                var page = document.getElementById(pageId);
                page.style.display = "block";
            }
            window.addEventListener('load', (event) => {
                // Thêm lớp "active" cho liên kết "Brand"
                var brandLink = document.querySelector('a[href="#brandPage"]');
                brandLink.classList.add('active');

                // Hiển thị trang "Brand"
                var brandPage = document.getElementById('brandPage');
                brandPage.style.display = 'block';
            });

            document.getElementById("brandForm").addEventListener("submit", function (event) {
                event.preventDefault();

                // Lấy giá trị từ các trường input
                var brandName = document.getElementById("brandName").value;
                var country = document.getElementById("country").value;

                // Thực hiện các hành động tương ứng với dữ liệu nhập vào
            });
        </script>

        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main2.js"></script>
    </body>
</html>