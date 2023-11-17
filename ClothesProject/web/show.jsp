<%-- 
    Document   : show
    Created on : Jul 11, 2023, 3:48:25 AM
    Author     : Pham Thang
--%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link href="img/flower.png" rel="icon" type="image/x-icon">
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
    <script>
    window.onload = function() {
      var num = ${requestScope.num};

      if (num === 0) {
        alert("All goods in stock!");
      }
    };
  </script>
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
                                <li ><a href="shop">Shop</a></li>
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
                            <span>Shopping cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Shop Cart Section Begin -->
        <section class="shop-cart spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shop__cart__table">

                            <table>
                                <thead>
                                    <tr>
                                        <th style="  padding-right: 60px">No</th>
                                        <th>Product</th>
                                        <th>Size</th>
                                        <th>Color</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total<i class="fa fa-sync-alt"></i>
</th>

                                        <c:set var="o" value="${requestScope.cart}"/>
                                        <c:set var="tt" value="0"/>
                                    </tr>
                                </thead>
                                <tbody>

                                    <c:forEach items="${o.items}" var="i">

                                        <c:set var="tt" value="${tt+1}"/>

                                        <tr>


                                            <td style="  padding-right: 60px">#${tt}</td>
                                            <td class="cart__product__item">
                                                <img style="width: 20%" src="${i.product.image}" alt="">
                                                <div class="cart__product__item__title">
                                                    <h6>${i.product.name}</h6>
                                                    <div class="rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>
                                                </div>
                                            </td>
                                            <td  style="  padding-right: 60px" >${i.size.size}</td> 
                                            <td style="  padding-right: 70px"> <div style="background-color: ${i.color.color}; width: 20px; height: 20px;"></div></td>
                                            <td class="cart__price"><fmt:formatNumber pattern="##,###,###.#" value="${i.product.price}" />₫</td>
                                            <td class="cart__quantity">
                                                    <button style="padding-right: 20px; border: none;background-color: white"> <a href="process?num=-1&productID=${i.product.productID}&sizeID=${i.size.sizeID}&colorID=${i.color.colorID}"><i class="fa fa-minus"></i></a></button>
                                                ${i.quantity}
                                                <button style="padding-left: 20px;border: none;background-color: white"> <a href="process?num=1&productID=${i.product.productID}&sizeID=${i.size.sizeID}&colorID=${i.color.colorID}"><i class="fa fa-plus"></i></a></button>
                                                </td>
                                            <td class="cart__total"><fmt:formatNumber pattern="##,###,###.#" value="${i.quantity*i.product.price}" />₫</td>
                                            <td class="cart__close">
                                                <form action="process?productID=${i.product.productID}&sizeID=${i.size.sizeID}&colorID=${i.color.colorID}" method="post">
                                                    <button style="background-color: white;border: none" type="submit" class="icon-button">
                                                        <span  class="icon_close"></span>
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="cart__btn">
                            <a href="shop">Continue Shopping</a>
                        </div>
                    </div>
<!--                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="cart__btn update__btn">
                            <a href="#"><span class="icon_loading"></span> Update cart</a>
                        </div>
                    </div>-->
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="discount__content">
                            <h6>Voucher codes</h6>
                            <form action="#">
                                <input type="text" placeholder="Enter your coupon code">
                                <button type="submit" class="site-btn">Apply</button>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-4 offset-lg-2">
                        <div class="cart__total__procced">
                            <h6>Cart total</h6>
                            <ul>
                                
                                <li>Total <span style="text-decoration: line-through"><fmt:formatNumber pattern="##,###,###.#" value="${o.totalMoney/(1-sale.sale)}" />₫</span></li>
                                <li>Discount <span><fmt:formatNumber value="${sale.sale*100}" pattern="##'%'"/></span></li>
                                <li>Voucher <span>0%</span></li>
                                <li>Total <span ><fmt:formatNumber pattern="##,###,###.#" value="${o.totalMoney}" />₫</span></li>

                            </ul>
                                
                            <a href="checkout"  class="primary-btn">Proceed to checkout</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Shop Cart Section End -->

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
                                <a href="./index.html"><img src="img/logo.png" alt=""></a>
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