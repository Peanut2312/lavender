<%-- 
    Document   : home
    Created on : Jun 25, 2023, 2:44:58 PM
    Author     : Pham Thang
--%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link href="img/flower.png" rel="icon" type="image/x-icon">
        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">

        <style>
            .welcome-text {
                color: #006400;
                text-align: center;
                font-weight: bold;
            }

        </style>

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
                            <a href="home.jsp"><img  src="img/logo.png" alt=""></a>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-5">
                        <nav class="header__menu">
                            <ul>
                                <li class="active"><a href="home">Home</a></li>
                                <li><a href="shop">Shop</a></li>

                                <% 
   Account account = (Account) session.getAttribute("account");
                                %>
                                <% if (account != null && account.isRole()) { %>
                                <li  class="admin"><a href="#">Admin</a>
                                    <ul style="background-color: #FFC0CB " class="dropdown">
                                        <li ><a href="crud"> Products</a>
                                        
                                        </li>
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
                    <div class="col-xl-2 col-lg-2">
                        <%
                                if (session.getAttribute("account") != null) {
                        %>
                        <span  class="welcome-text"><br><i class="fa fa-user-circle"></i>Welcome ${sessionScope.account.firstname}</span>

                        <%
                                    }%>
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

        <!-- Categories Section Begin -->
        <!--    <section class="categories">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-6 p-0">
                            <div class="categories__item categories__large__item set-bg"
                            data-setbg="img/categories/category-1.jpg">
                            <div class="categories__text">
                                <h1>Women’s fashion</h1>
                                <p>Sitamet, consectetur adipiscing elit, sed do eiusmod tempor incidid-unt labore
                                edolore magna aliquapendisse ultrices gravida.</p>
                                <a href="#">Shop now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6 p-0">
                                <div class="categories__item set-bg" data-setbg="img/categories/category-2.jpg">
                                    <div class="categories__text">
                                        <h4>Men’s fashion</h4>
                                        <p>358 items</p>
                                        <a href="#">Shop now</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 p-0">
                                <div class="categories__item set-bg" data-setbg="img/categories/category-3.jpg">
                                    <div class="categories__text">
                                        <h4>Kid’s fashion</h4>
                                        <p>273 items</p>
                                        <a href="#">Shop now</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 p-0">
                                <div class="categories__item set-bg" data-setbg="img/categories/category-4.jpg">
                                    <div class="categories__text">
                                        <h4>Cosmetics</h4>
                                        <p>159 items</p>
                                        <a href="#">Shop now</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 p-0">
                                <div class="categories__item set-bg" data-setbg="img/categories/category-5.jpg">
                                    <div class="categories__text">
                                        <h4>Accessories</h4>
                                        <p>792 items</p>
                                        <a href="#">Shop now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>-->
        <!-- Categories Section End -->

        <!-- Product Section Begin -->
        <section class="product spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-3">
                        <div class="section-title">
                            <h4>New product</h4>
                        </div>
                    </div>
                    <!--                    <div class="col-lg-9 col-md-9">
                                            
                                                <ul class="filter__controls">
                    <c:forEach items="${listCate}" var="c">
                        <li data-filter=".women">${c.name}</li>
                    </c:forEach>
                                     <li data-filter=".women">Pants</li>
                                        <li data-filter=".men">Shoes</li>
                                        <li data-filter=".kid">Sandal</li>
                                        <li data-filter=".accessories">Glasses</li>
                                        <li data-filter=".cosmetic">Necklace</li>
                                        <li data-filter=".cosmetic">Dress</li>
                                        <li data-filter=".cosmetic">Ring</li>
                                        <li data-filter=".cosmetic">Bracelet</li>
                                        <li data-filter=".cosmetic">Others</li>
                </ul>
            
        </div>-->
                </div>
                <div class="row property__gallery">
                    <c:forEach items="${newProduct}" var="n">
                        <div class="col-lg-3 col-md-4 col-sm-6 mix women">

                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="${n.image}">
                                    <div class="label new">New</div>
                                    <ul class="product__hover">
                                        <li><a href="${n.image}" class="image-popup"><span class="arrow_expand"></span></a></li>
                                        <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                        <li><a href="product?productID=${n.productID}"><span class="icon_bag_alt"></span></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="product?productID=${n.productID}">${n.name}</a></h6>
                                    <div class="rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product__price"><fmt:formatNumber pattern="##,###,###.#" value="${n.price}" />₫</div>
                                </div>
                            </div>

                        </div>
                    </c:forEach>
                    <!--            <div class="col-lg-3 col-md-4 col-sm-6 mix men">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="img/product/product-2.jpg">
                                            <ul class="product__hover">
                                                <li><a href="img/product/product-2.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
                                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                                <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="#">Flowy striped skirt</a></h6>
                                            <div class="rating">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <div class="product__price">$ 49.0</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 mix accessories">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="img/product/product-3.jpg">
                                            <div class="label stockout">out of stock</div>
                                            <ul class="product__hover">
                                                <li><a href="img/product/product-3.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
                                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                                <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="#">Cotton T-Shirt</a></h6>
                                            <div class="rating">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <div class="product__price">$ 59.0</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 mix cosmetic">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="img/product/product-4.jpg">
                                            <ul class="product__hover">
                                                <li><a href="img/product/product-4.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
                                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                                <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="#">Slim striped pocket shirt</a></h6>
                                            <div class="rating">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <div class="product__price">$ 59.0</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 mix kid">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="img/product/product-5.jpg">
                                            <ul class="product__hover">
                                                <li><a href="img/product/product-5.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
                                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                                <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="#">Fit micro corduroy shirt</a></h6>
                                            <div class="rating">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <div class="product__price">$ 59.0</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 mix women men kid accessories cosmetic">
                                    <div class="product__item sale">
                                        <div class="product__item__pic set-bg" data-setbg="img/product/product-6.jpg">
                                            <div class="label sale">Sale</div>
                                            <ul class="product__hover">
                                                <li><a href="img/product/product-6.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
                                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                                <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="#">Tropical Kimono</a></h6>
                                            <div class="rating">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <div class="product__price">$ 49.0 <span>$ 59.0</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 mix women men kid accessories cosmetic">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="img/product/product-7.jpg">
                                            <ul class="product__hover">
                                                <li><a href="img/product/product-7.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
                                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                                <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="#">Contrasting sunglasses</a></h6>
                                            <div class="rating">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <div class="product__price">$ 59.0</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 mix women men kid accessories cosmetic">
                                    <div class="product__item sale">
                                        <div class="product__item__pic set-bg" data-setbg="img/product/product-8.jpg">
                                            <div class="label">Sale</div>
                                            <ul class="product__hover">
                                                <li><a href="img/product/product-8.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
                                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                                <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="#">Water resistant backpack</a></h6>
                                            <div class="rating">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <div class="product__price">$ 49.0 <span>$ 59.0</span></div>
                                        </div>
                                    </div>
                                </div>-->
                </div>
            </div>
        </section>
        <!-- Product Section End -->

        <!-- Banner Section Begin -->
        <section class="banner set-bg" data-setbg="img/banner.png">
            <div class="container">
                <div class="row">
                    <div class="col-xl-7 col-lg-8 m-auto">
                        <div class="banner__slider owl-carousel">
                            <div class="banner__item">
                                <div class="banner__text">
                                    <span>The Meow Collection</span>
                                    <h1>Meow Tee</h1>
                                    <a href="shop">Shop now</a>
                                </div>
                            </div>
                            <div class="banner__item">
                                <div class="banner__text">
                                    <span>The Meow Collection</span>
                                    <h1>Meow Outwear</h1>
                                    <a href="shop">Shop now</a>
                                </div>
                            </div>
                            <div class="banner__item">
                                <div class="banner__text">
                                    <span>The Meow Collection</span>
                                    <h1>Meow Polo</h1>
                                    <a href="shop">Shop now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Banner Section End -->

        <!-- Trend Section Begin -->
        <section class="trend spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <div class="trend__content">
                            <div class="section-title">
                                <h4>hot trend</h4>
                            </div>
                            <c:forEach items="${listView}" var="v">
                                <div class="trend__item">

                                    <div class="trend__item__pic">
                                        <img style="width: 90px; height: 90px"  src="${v.image}" alt="">
                                    </div>

                                    <div class="trend__item__text">
                                        <h6>${v.name}</h6>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product__price"><fmt:formatNumber pattern="##,###,###.#" value="${v.price}" />₫</div>
                                    </div>

                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <div class="trend__content">
                            <div class="section-title">
                                <h4>feature</h4>
                            </div>
                            <c:forEach items="${listOld}" var="n">
                                <div class="trend__item">

                                    <div class="trend__item__pic">
                                        <img style="width: 90px; height: 90px"  src="${n.image}" alt="">
                                    </div>

                                    <div class="trend__item__text">
                                        <h6>${n.name}</h6>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product__price"><fmt:formatNumber pattern="##,###,###.#" value="${n.price}" />₫</div>
                                    </div>

                                </div>
                            </c:forEach>

                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <div class="trend__content">
                            <div class="section-title">
                                <h4>new</h4>
                            </div>
                            <c:forEach items="${listNew}" var="n">
                                <div class="trend__item">

                                    <div class="trend__item__pic">
                                        <img style="width: 90px; height: 90px"  src="${n.image}" alt="">
                                    </div>

                                    <div class="trend__item__text">
                                        <h6>${n.name}</h6>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product__price"><fmt:formatNumber pattern="##,###,###.#" value="${n.price}" />₫</div>
                                    </div>

                                </div>
                            </c:forEach>

                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Trend Section End -->

        <!-- Discount Section Begin -->
        <c:set value="${requestScope.sale}" var="sale"/>
        <section ${requestScope.sale==null ? 'style="display: none;"' : ''} class="discount">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 p-0">
                        <div class="discount__pic">
                            <img src="${sale.image}" alt="">
                        </div>
                    </div>
                    <div class="col-lg-6 p-0">
                        <div class="discount__text">
                            <div class="discount__text__title">
                                <span>Discount</span>
                                <h2>${sale.name}</h2>
                                <h5><span>Sale</span><fmt:formatNumber value="${sale.sale*100}" pattern="##'%'"/></h5>
                            </div>
                            <div class="discount__countdown" id="countdown-time">
                                <div class="countdown__item">
                                    <span id="days">00</span>
                                    <p>Days</p>
                                </div>
                                <div class="countdown__item">
                                    <span id="hours">00</span>
                                    <p>Hours</p>
                                </div>
                                <div class="countdown__item">
                                    <span id="minutes">00</span>
                                    <p>Minutes</p>
                                </div>
                                <div class="countdown__item">
                                    <span id="seconds">00</span>
                                    <p>Seconds</p>
                                </div>
                            </div>
                            <a href="shop"><c:if test="${sale.brand.brandID==null}">
                                    All Brand
                                </c:if>
                                <c:if test="${sale.brand.brandID!=null}">
                                    ${sale.brand.name}
                                </c:if></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Discount Section End -->

        <!-- Services Section Begin -->
        <section class="services spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="services__item">
                            <i class="fa fa-car"></i>
                            <h6>Free Shipping</h6>
                            <p>For all oder over 499.000₫</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="services__item">
                            <i class="fa fa-money"></i>
                            <h6>Money Back Guarantee</h6>
                            <p>If good have Problems</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="services__item">
                            <i class="fa fa-support"></i>
                            <h6>Online Support 24/7</h6>
                            <p>Dedicated support</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="services__item">
                            <i class="fa fa-headphones"></i>
                            <h6>Payment Secure</h6>
                            <p>100% secure payment</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Services Section End -->

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
                            <p>Copyright 2003 &copy; by  Aphrodite &#x2122; CEO Thắng Phạm </p>
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
        <script>
            $(document).ready(function () {
                var countdownDate = new Date("${requestScope.sale.toTime}");

                $('#countdown-time').countdown(countdownDate, function (event) {
                    $(this).find('#days').text(event.strftime('%D'));
                    $(this).find('#hours').text(event.strftime('%H'));
                    $(this).find('#minutes').text(event.strftime('%M'));
                    $(this).find('#seconds').text(event.strftime('%S'));
                });
            });
        </script>
    </body>

</html>