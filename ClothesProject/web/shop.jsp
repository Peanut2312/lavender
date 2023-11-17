<%-- 
    Document   : shop
    Created on : Jun 25, 2023, 4:01:32 PM
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
<html lang="zxx">

    <head>


        <meta charset="UTF-8">
        <meta name="description" content="Ashion Template">
        <meta name="keywords" content="Ashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Lavender</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
              rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <link href="img/flower.png" rel="icon" type="image/x-icon">
        <style>
            .date-input-container {
                display: flex;
                align-items: center;
                margin-bottom: 10px;
            }

            .date-input-container label {
                margin-right: 10px;
                width: 80px;
            }

            .date-input-container input {
                flex: 1;
            }

            .pagination__option a.active {
                background-color: #0d0d0d;
                border-color: #0d0d0d;
                color: #ffffff;
                .pagination__option a.none {
                    display: none;
                }

                .pagination__option a.disabled {
                    pointer-events: none;
                    opacity: 0.5;
                }
            }
            .ui-slider {
                background-color: #e0e0e0; /* Màu nền của thanh trượt */
                height: 10px; /* Chiều cao của thanh trượt */
            }

            .ui-slider-handle {
                background-color: #ff0000; /* Màu của nút trượt */
                border: none; /* Bỏ viền của nút trượt */
                width: 20px; /* Chiều rộng của nút trượt */
                height: 20px; /* Chiều cao của nút trượt */
                margin-top: -5px; /* Điều chỉnh vị trí nút trượt theo chiều dọc */
                cursor: pointer; /* Hiển thị con trỏ khi di chuột vào nút trượt */
            }

            .ui-slider-range {
                background-color: #ff0000; /* Màu của vùng giữa hai nút trượt */
            }

            p {
                margin-top: 20px; /* Điều chỉnh khoảng cách giữa thanh trượt và văn bản */
            }
            .sort_bar {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .sort_bar__left {
                margin-right: auto;
            }

            .sort_bar__right {
                margin-left: auto;
            }

            .sort__container {
                margin-bottom: 10px;
            }

            label {
                font-weight: bold;
            }

            select {
                padding: 5px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

        </style>
        <script>
            function setCheck(obj) {
                var fries = document.getElementsByName("brand");
                if ((obj.id == 'allbrand') && (fries[0].checked == true)) {
                    for (var i = 1; i < fries.length; i++) {
                        fries[i].checked = false;
                    }
                } else {
                    for (var i = 1; i < fries.length; i++) {
                        if (fries[i].checked == true) {
                            fries[0].checked = false;
                            break;
                        }
                    }
                }
                //               document.getElementById("form").submit();
            }

        </script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    </head>

    <body>

        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Offcanvas Menu Begin -->
        <div class="offcanvas-menu-overlay"></div>
        <div class="offcanvas-menu-wrapper">
            <div class="offcanvas__close">+</div>
            <ul class="offcanvas__widget">
                <li><span class="icon_search search-switch"></span></li>
                <li><a href="profile"><span class="fa fa-user"></span>
                    </a></li>
                <li><a href="show"><span class="icon_bag_alt"></span>
                        <div class="tip">${requestScope.sizeCart}</div>
                    </a></li>
            </ul>
            <div class="offcanvas__logo">
                <a href="home"><img src="img/logo.png" alt=""></a>
            </div>
            <div id="mobile-menu-wrap"></div>
            <div class="offcanvas__auth">
                <%

     if (session.getAttribute("account") == null) {
                %>
                <a style="font-weight:bold " href="login">Login</a>
                <a style="pointer-events: none;
                   cursor: default;
                   color: gray;
                   text-decoration: none;" href="logout">Logout</a>
                <%
                    } else {
                %>

                <a style="pointer-events: none;
                   cursor: default;
                   color: gray;
                   text-decoration: none;" href="login">Login</a>
                <a style="font-weight:bold " href="logout">Logout</a>
                <%
                    }
                %>

            </div>
        </div>
        <!-- Offcanvas Menu End -->

        <!-- Header Section Begin -->
        <header class="header">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-3 col-lg-2">
                        <div class="header__logo">
                            <a href="home"><img src="img/logo.png" alt=""></a>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-7">
                        <nav class="header__menu">
                            <ul>
                                <li><a href="home">Home</a></li>
                                <li class="active"><a href="shop">Shop</a></li>
                                    <% 
        Account account = (Account) session.getAttribute("account");
                                    %>
                                    <% if (account != null && account.isRole()) { %>
                                 <li  class="admin"><a href="#">Admin</a>
                                    <ul style="background-color: #FFC0CB " class="dropdown">
                                        <li ><a href="crud"> Products</a></li>
                                        <li><a href="detail">Detail</a></li>
                                        <li><a href="warehouse"> Warehouse</a></li>
                                        <li><a href="sale">Sale</a></li>
                                        <li><a href="user">User</a></li>
                                    </ul>
                                </li>
                                 <li ><a href="order">Order</a></li>
                                 <li  ><a href="data">Data</a>
                                <% } %>

 <% if (account != null && account.isRole()==false) { %>
                                
                                 <li ><a href="orderUser">My Order</a></li>
                                <% } %>
                                <!--                                <li><a href="contact">Contact</a></li>-->
                            </ul>
                        </nav>
                    </div>

                    <div class="col-lg-3">
                        <div class="header__right">
                            <div class="header__right__auth">



                                <%

                                    if (session.getAttribute("account") == null) {
                                %>
                                <a style="font-weight:bold " href="login">Login</a>
                                <a style="pointer-events: none;
                                   cursor: default;
                                   color: gray;
                                   text-decoration: none;" href="logout">Logout</a>
                                <%
                                    } else {
                                %>

                                <a style="pointer-events: none;
                                   cursor: default;
                                   color: gray;
                                   text-decoration: none;" href="login">Login</a>
                                <a style="font-weight:bold " href="logout">Logout</a>
                                <%
                                    }
                                %>
                            </div>
                            <ul class="header__right__widget">
                                <li><span class="icon_search search-switch"></span></li>
                                <li><a href="profile"><span class="fa fa-user"></span>
                                    </a></li>
                               <li><a href="show"><span class="icon_bag_alt"></span>
                        <div class="tip">${requestScope.sizeCart}</div>
                    </a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="canvas__open">
                    <i class="fa fa-bars"></i>
                </div>
            </div>
        </header>
        <!-- Header Section End -->

        <!-- Breadcrumb Begin -->
        <div class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__links">
                            <a href="home"><i class="fa fa-home"></i> Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Shop Section Begin -->

        <form action="shop">
            <section class="shop spad">
                <div class="container">
                    <div class="sort_bar row">
                        <div class="sort_bar__left col-lg-3 col-md-3  ">
                            <h2>Quantity: ${requestScope.data.size()}</h2>
                        </div>
                        <div class="sort_bar__right row col-lg-9 col-md-9">
                            <div class="col-6"><input oninput="searchByName(this)" style="border: 1px solid #ccc; padding: 5px;" placeholder="Search"type="text"> </div>
                            <div class="col-6 sort__container row">
                                <label class="col-6" for="sort">Sort by:</label>
                                <select class="col-6" name="option" id="sort" onchange="this.form.submit()">
                                    <option value="0" ${requestScope.option == 0 ? 'selected' : ''}>None</option>
                                    <option value="1" ${requestScope.option == 1 ? 'selected' : ''}>Price ↑</option>
                                    <option value="2" ${requestScope.option == 2 ? 'selected' : ''}>Price ↓</option>
                                    <option value="3" ${requestScope.option == 3 ? 'selected' : ''}>Create Date ↑</option>
                                    <option value="4" ${requestScope.option == 4 ? 'selected' : ''}>Create Date ↓</option>
                                    <option value="5" ${requestScope.option == 5 ? 'selected' : ''}>View Count ↑</option>
                                    <option value="6" ${requestScope.option == 6 ? 'selected' : ''}>View Count ↓</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    &nbsp;
                    <div class="row">
                        <div class="col-lg-3 col-md-3">

                            <div class="shop__sidebar">

                                <div class="sidebar__categories">
                                    <div class="section-title">
                                        <h4>Categories</h4>
                                    </div>
                                    <div class="categories__accordion">
                                        <div class="accordion" id="accordionExample">
                                            <div class="card">
                                                <div >
                                                    <a href="shop?subID=0" style="color:#555555 ;font-weight: bold;" >All</a>
                                                </div>

                                            </div>
                                            <% Map<Category, List<Sub_Category>> listSub = (Map<Category, List<Sub_Category>>) request.getAttribute("listSub"); %>

                                            <c:forEach var="entry" items="${listSub}">
                                                <div class="card">
                                                    <div class="card-heading">
                                                        <a data-toggle="collapse" data-target="#collapse_${entry.key.categoryID}">${entry.key.name}</a>
                                                    </div>
                                                    <div id="collapse_${entry.key.categoryID}" class="collapse" data-parent="#accordionExample">
                                                        <div class="card-body">
                                                            <ul>
                                                                <c:forEach var="subCategory" items="${entry.value}">
                                                                    <li><a href="shop?subID=${subCategory.subID}">${subCategory.name}</a></li>
                                                                    </c:forEach>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>




                                        </div>
                                    </div>
                                </div>


                                <!--                                <div class="sidebar__sizes">
                                                                    <div class="section-title">
                                                                        <h4>Shop by size</h4>
                                                                    </div>
                                                                    
                                                                    <div class="size__list">
                                                                        <label for="allsize">
                                                                            ALL
                                                                            <input ${requestScope.chsize[0]?"checked":""} type="checkbox" id="allsize">
                                                                            <span class="checkmark"></span>
                                                                        </label>
                                <c:forEach items="${requestScope.listSize}" var="s">
                                    <label for="${s.size}">
                                    ${s.size}
                                    <input type="checkbox" id="${s.size}">
                                    <span class="checkmark"></span>
                                </label>
                                </c:forEach>

                            </div>
                        </div>-->


                                <div class="sidebar__sizes">
                                    <div class="section-title">
                                        <h4>Shop by brand</h4>
                                    </div>
                                    <div class="size__list">
                                        <c:set value="${requestScope.brands}" var="brands"/>

                                        <label for="allbrand">
                                            ALL
                                            <input name="brand" value="${0}" onclick="setCheck(this)" type="checkbox" id="allbrand"
                                                   >
                                            <span class="checkmark"></span>
                                        </label>

                                        <c:forEach items="${requestScope.listBrand}" var="b" varStatus="i">
                                            <label for="${b.name}">
                                                ${b.name}
                                                <input onclick="setCheck(this)" name="brand" value="${b.brandID}" type="checkbox" id="${b.name}"
                                                       >
                                                <span class="checkmark"></span>
                                            </label>
                                        </c:forEach>
                                    </div>

                                </div>

                                <input type="hidden" name="page" value="${requestScope.page}">
                                <div class="sidebar__sizes">
                                    <div class="section-title">
                                        <h4>Shop by create date</h4>
                                    </div>  
                                    <div class="date-input-container">
                                        <label>From:</label>
                                        <input value="${requestScope.from}" type="date" name="from">
                                    </div>
                                    <div class="date-input-container">
                                        <label>To:</label>
                                        <input value="${requestScope.to}" type="date" name="to">
                                    </div>
                                </div>
                                <div class="sidebar__filter">
                                    <div class="section-title">
                                        <h4>Shop by price</h4>
                                    </div>
                                    <div class="filter-range-wrap">
                                        <!--                                        <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                                                                     data-min="0" data-max="1000000"></div>
                                                                                <div class="range-slider">
                                                                                    <div class="price-input">
                                                                                        <input readonly value="${requestScope.min}" type="text" id="minamount" name="min" >
                                                                                        <input readonly value="${requestScope.max}" type="text" id="maxamount" name="max" >
                                                                                    </div>
                                                                                </div>-->
                                        <div id="slider" style="margin-bottom:  20px"></div>
                                        <p >
                                            Min:  <input style="
                                                         width: 25%; /* Điều chỉnh kích thước chiều rộng */
                                                         font-size: 12px; /* Điều chỉnh cỡ chữ */
                                                         border: none;
                                                         outline: none;
                                                         background-color: transparent;
                                                         " name="min"  value="${requestScope.min==null?'100000':requestScope.min}" id="minValue">₫ -
                                            Max: <input  style="
                                                         width: 25%; /* Điều chỉnh kích thước chiều rộng */
                                                         font-size: 12px; /* Điều chỉnh cỡ chữ */
                                                         border: none;
                                                         outline: none;
                                                         background-color: transparent;
                                                         " name="max"  value="${requestScope.max==null?'8000000':requestScope.max}" id="maxValue">₫
                                        </p>
                                    </div>

                                </div>
                                <input type="hidden" value="${requestScope.subID}" name="subID">
                                <div class="sidebar__filter">
                                    <input type="submit" value="FILTER" class="thang">
                                </div>


                            </div>


                        </div>
                        <div class="col-lg-9 col-md-9">
                            <div id="content" class="row">
                                <c:forEach items="${requestScope.list}" var="p">
                                    <div class="col-lg-4 col-md-6">
                                        <div class="product__item">

                                            <div class="product__item__pic set-bg" data-setbg="${p.image}" >
                                                
                                                <!--                                            <div class="label new">New</div>-->

                                                <ul class="product__hover">
                                                    <li><a href="${p.image}" class="image-popup"><span class="arrow_expand"></span></a></li>
                                                                                                    <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                                    <li><a href="buy?productID=${p.productID}"><span class="icon_bag_alt"></span></a></li>
                                                </ul>

                                            </div>


                                            <div class="product__item__text">

                                                <h6><a href="product?productID=${p.productID}">${p.name}</a></h6>
                                                <!--                                            <div class="rating">
                                                                                                <i class="fa fa-star"></i>
                                                                                                <i class="fa fa-star"></i>
                                                                                                <i class="fa fa-star"></i>
                                                                                                <i class="fa fa-star"></i>
                                                                                                <i class="fa fa-star"></i>
                                                                                            </div>-->
                                                <div class="product__price"><fmt:formatNumber pattern="##,###,###.#" value="${p.price}" />₫</div>

                                            </div>

                                        </div>
                                    </div>
                                </c:forEach>



                                <div class="col-lg-12 text-center">
                                    <!--                                <div class="pagination__option">
                                                                        <a href="#">1</a>
                                                                        <a href="#">2</a>
                                                                        <a href="#">3</a>
                                                                        <a href="#"><i class="fa fa-angle-right"></i></a>
                                                                    </div>-->

                                    <div class="pagination__option">
                                        <a  class="${(page>1||page==null)?'none':'disabled'}" href="shop?page=${(page-1)}"><i class="${(page>1||page==null)?"fa fa-angle-left":""}"></i></a>
                                            <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                            <a class="${i==page?"active":""}" href="shop?option=${requestScope.option}&page=${i}&subID=${requestScope.subID}&min=${requestScope.min}&max=${requestScope.max}&from=${requestScope.from}&to=${requestScope.to}">${i}</a>
                                        </c:forEach>
                                        <a class="${page<num?"none":"disabled"}" href="shop?page=${(page+1)}"><i class="${page<num?"fa fa-angle-right":""}"></i></a>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </section>
        </form>     
        <!-- Shop Section End -->

        <!-- Instagram Begin -->
        <div class="instagram">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" data-setbg="img/kol2.png">
                            <div class="instagram__text">
                                <i class="fa fa-facebook"></i>
                                <a href="https://www.facebook.com/thangphamisme/">Thắng Phạm</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" data-setbg="img/kol1.png">
                            <div class="instagram__text">
                                <i class="fa fa-instagram"></i>
                                <a href="https://www.instagram.com/thangph_2312/">thangph_2312</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" data-setbg="img/kol4.png">
                            <div class="instagram__text">
                                <i class="fa fa-youtube"></i>
                                <a href="https://www.youtube.com/@trinhthivananhtrinhblog6313">@Sidejob</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" data-setbg="img/kol5.png">
                            <div class="instagram__text">
                                <i class="fa fa-twitter"></i>
                                <a href="https://twitter.com/APieceOfPeaceee">@APieceOfPeace</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" data-setbg="img/kol3.png">
                            <div class="instagram__text">
                                <i class="fa fa-snapchat-ghost"></i>
                                <a href="https://www.snapchat.com/">@LittleGuyWithBigDream</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" data-setbg="img/kol6.png">
                            <div class="instagram__text">
                                <i class="fa fa-pinterest"></i>
                                <a href="https://www.pinterest.com/">@TheWorldInMyPhone</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Instagram End -->

        <!-- Footer Section Begin -->
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-7">
                        <div class="footer__about">
                            <div class="footer__logo">
                                <a href="home"><img src="img/logo.png" alt=""></a>
                            </div>
                            <p style=" display: flex;
                               justify-content: center;">“Style is when they’re running you out of town and you make it look like you’re leading the parade”
                            </p>
                            <p style=" display: flex;
                               justify-content: center;">
                                - Yves Saint Laurent -
                            </p>
                            <!--                            <div class="footer__payment">
                                                            <a href="#"><img src="img/payment/payment-1.png" alt=""></a>
                                                            <a href="#"><img src="img/payment/payment-2.png" alt=""></a>
                                                            <a href="#"><img src="img/payment/payment-3.png" alt=""></a>
                                                            <a href="#"><img src="img/payment/payment-4.png" alt=""></a>
                                                            <a href="#"><img src="img/payment/payment-5.png" alt=""></a>
                                                        </div>-->
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-5">
                        <div class="footer__widget">
                            <h6></h6>
                            <ul>
                                <li><a href="#"></a></li>
                                <li><a href="#"></a></li>
                                <li><a href="#"></a></li>
                                <li><a href="#"></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-4">
                        <div class="footer__widget">
                            <h6></h6>
                            <ul>
                                <li><a href="#"></a></li>
                                <li><a href="#"></a></li>
                                <li><a href="#"></a></li>
                                <li><a href="#"></a></li>
                            </ul>
                        </div>                    </div>
                    <div class="col-lg-4 col-md-8 col-sm-8">
                        <div class="footer__newslatter">
                            <h6></h6>
                            <!--                            <form action="#">
                                                            <input type="text" placeholder="Email">
                                                            <button type="submit" class="site-btn"></button>
                                                        </form>
                                                        <div class="footer__social">
                                                            <a href="#"><i class="fa fa-facebook"></i></a>
                                                            <a href="#"><i class="fa fa-twitter"></i></a>
                                                            <a href="#"><i class="fa fa-youtube-play"></i></a>
                                                            <a href="#"><i class="fa fa-instagram"></i></a>
                                                            <a href="#"><i class="fa fa-pinterest"></i></a>
                                                        </div>-->
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        <div class="footer__copyright__text">
                            <p>Copyright 2003 &copy; by  Lavender &#x2122;  </p>
                        </div>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer Section End -->

        <!-- Search Begin -->
        <div class="search-model">
            <div class="h-100 d-flex align-items-center justify-content-center">
                <div class="search-close-switch">+</div>
                <form action="search" class="search-model-form">
                    <input name="name" type="text" id="search-input" placeholder="Search here.....">
                </form>
            </div>
        </div>

        <!-- Search End -->

        <!-- Js Plugins -->

        <script>
            $(document).ready(function () {
                $("#slider").slider({
                    range: true,
                    min: 0,
                    max: 10000000,
                    values: [${requestScope.min == null ? 1000000 : requestScope.min}, ${requestScope.max == null ? 8000000 : requestScope.max}],
                    slide: function (event, ui) {
                        $("#minValue").val(ui.values[0]);
                        $("#maxValue").val(ui.values[1]);
                    }
                });
            });

        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script>
            function searchByName(name) {
                var txtSearch=name.value;
                $.ajax({
                    url: "/project/searchajax",
                    type: "get", //send it through get method
                    data: {
                        name : txtSearch
                    },
                    success: function (data) {
                        var row=document.getElementById("content");
                        row.innerHTML =data;
                                //Do Something
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                    }
                });
            }
        </script>
<!--     <script>
    var listAjax = <%= request.getAttribute("listAjax") %>;

    // Duyệt qua danh sách sản phẩm
    listAjax.forEach(function(p) {
        var productId = p.productID;
        var image = p.image;

        var element = document.getElementById("product_" + productId);
        if (element) {
            element.setAttribute("data-setbg", image);
        }
    });
</script>-->



        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/jquery.countdown.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.nicescroll.min.js"></script>
        <script src="js/main.js"></script>
    </body>

</html>
