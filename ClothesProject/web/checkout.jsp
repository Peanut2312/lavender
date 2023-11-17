<%-- 
    Document   : checkout
    Created on : Jul 12, 2023, 7:59:27 AM
    Author     : Pham Thang
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.Account" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                            <a href="show"> Shopping cart</a>
                            <span>Check out</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Checkout Section Begin -->
        <section class="checkout spad">
            <div class="container">
                <!--            <div class="row">
                                <div class="col-lg-12">
                                    <h6 class="coupon__link"><span class="icon_tag_alt"></span> <a href="#">Have a coupon?</a> Click
                                    here to enter your code.</h6>
                                </div>
                            </div>-->
                <form action="pay" class="checkout__form">
                    <div class="row">
                        <div class="col-lg-8">
                            <h5>Billing detail</h5>
                            <div class="row">
                                <!--                            <div class="col-lg-6 col-md-6 col-sm-6">
                                                                <div class="checkout__form__input">
                                                                    <p>First Name <span>*</span></p>
                                                                    <input type="text">
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6 col-md-6 col-sm-6">
                                                                <div class="checkout__form__input">
                                                                    <p>Last Name <span>*</span></p>
                                                                    <input type="text">
                                                                </div>
                                                            </div>-->
                                <div class="col-lg-12">
                                    <div class="checkout__form__input">
                                        <p>Delivery address</p>
                                        <input type="text" name="address">
                                    </div>
                                    <!--                                <div class="checkout__form__input">
                                                                        <p>Address <span>*</span></p>
                                                                        <input type="text" placeholder="Street Address">
                                                                        <input type="text" placeholder="Apartment. suite, unite ect ( optinal )">
                                                                    </div>
                                                                    <div class="checkout__form__input">
                                                                        <p>Town/City <span>*</span></p>
                                                                        <input type="text">
                                                                    </div>
                                                                    <div class="checkout__form__input">
                                                                        <p>Country/State <span>*</span></p>
                                                                        <input type="text">
                                                                    </div>
                                                                    <div class="checkout__form__input">
                                                                        <p>Postcode/Zip <span>*</span></p>
                                                                        <input type="text">
                                                                    </div>-->
                                </div>
                                <!--                            <div class="col-lg-6 col-md-6 col-sm-6">
                                                                <div class="checkout__form__input">
                                                                    <p>Phone <span>*</span></p>
                                                                    <input type="text">
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6 col-md-6 col-sm-6">
                                                                <div class="checkout__form__input">
                                                                    <p>Email <span>*</span></p>
                                                                    <input type="text">
                                                                </div>
                                                            </div>-->
                                <div class="col-lg-12">
                                    <!--                                <div class="checkout__form__checkbox">
                                                                        <label for="acc">
                                                                            Create an acount?
                                                                            <input type="checkbox" id="acc">
                                                                            <span class="checkmark"></span>
                                                                        </label>-->
                                    <!--                                    <p>Create am acount by entering the information below. If you are a returing
                                                                            customer login at the <br />top of the page</p>
                                                                        </div>
                                                                        <div class="checkout__form__input">
                                                                            <p>Account Password <span>*</span></p>
                                                                            <input type="text">
                                                                        </div>
                                                                        <div class="checkout__form__checkbox">
                                                                            <label for="note">
                                                                                Note about your order, e.g, special noe for delivery
                                                                                <input type="checkbox" id="note">
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </div>-->
                                    <div class="checkout__form__input">
                                        <p>Oder notes </p>
                                        <input name="note" type="text"
                                               placeholder="Note about your order, e.g, special noe for delivery">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="checkout__order">
                                <h5>Your order</h5>
                                <c:set var="o" value="${requestScope.cart}"/>

                                <div class="checkout__order__product">
                                    <ul>
                                        <li>
                                            <span class="top__text">Product</span>
                                            <span class="top__text__right">Total</span>
                                        </li>
                                        <c:forEach items="${o.items}" var="i">
                                            <c:set var="country" value="${i.product.brand.country}"/>
                                            <li>${i.product.name}
                                                <c:if test="${!country.equals('Việt Nam')}">
                                                    (Foreign)
                                                </c:if>
                                                <span><fmt:formatNumber pattern="##,###,###.#" value="${i.product.price*i.quantity}" />₫</span></li>
                                            </c:forEach>
                                    </ul>
                                </div>

                                <div class="checkout__order__total">
                                    <ul>
                                        <li>Subtotal <span><fmt:formatNumber pattern="##,###,###.#" value="${o.totalMoney}" />₫</span></li>
                                        <li>VAT<span>10%</span></li>
                                        <li>Total <span><fmt:formatNumber pattern="##,###,###.#" value="${o.finalTotalMoney}" />₫</span></li>
                                    </ul>
                                </div>
                                <!--                                <div class="checkout__order__widget">
                                                                    <label for="o-acc">
                                                                        Create an acount?
                                                                        <input type="checkbox" id="o-acc">
                                                                        <span class="checkmark"></span>
                                                                    </label>
                                                                    <p>Create am acount by entering the information below. If you are a returing customer
                                                                    login at the top of the page.</p>
                                                                    <label for="check-payment">
                                                                        Cheque payment
                                                                        <input type="checkbox" id="check-payment">
                                                                        <span class="checkmark"></span>
                                                                    </label>
                                                                    <label for="paypal">
                                                                        PayPal
                                                                        <input type="checkbox" id="paypal">
                                                                        <span class="checkmark"></span>
                                                                    </label>
                                                                </div>-->
                                <button type="submit" class="site-btn">Place oder</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <!-- Checkout Section End -->

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
                <form class="search-model-form">
                    <input type="text" id="search-input" placeholder="Search here.....">
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
    </body>

</html>