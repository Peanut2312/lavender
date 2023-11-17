<%-- 
    Document   : product
    Created on : Jun 26, 2023, 2:46:01 PM
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
                <li><a href="#"><span class="icon_heart_alt"></span>
                        <div class="tip">2</div>
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
                                    </ul>
                                </li>
                                 <li ><a href="order">Order</a></li>
                                 <li  ><a href="data">Data</a>
                                <% } %>
                                 <% if (account != null && account.isRole()==false) { %>
                                
                                 <li ><a href="orderUser">My Order</a></li>
                                <% } %>
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
                            <a href="shop">Shop</a>
                            <a href="shop?subID=${p.sub_category.subID}">${p.sub_category.name}</a>
                            <span>${p.name}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Product Details Section Begin -->
        <section class="product-details spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="product__details__pic">
                            <div class="product__details__pic__left product__thumb nice-scroll">
                                <c:forEach items="${listImage}" var="image" varStatus="i">
                                    <a class="pt active" href="#product-${(i.index != null) ? i.index+1 : 1}">
                                        <img src="${image.image}" alt="">
                                    </a>
                                </c:forEach>
                                <!--                            <a class="pt" href="#product-2">
                                                                <img src="img/product/details/thumb-2.jpg" alt="">
                                                            </a>
                                                            <a class="pt" href="#product-3">
                                                                <img src="img/product/details/thumb-3.jpg" alt="">
                                                            </a>
                                                            <a class="pt" href="#product-4">
                                                                <img src="img/product/details/thumb-4.jpg" alt="">
                                                            </a>-->
                            </div>
                            <div class="product__details__slider__content">
                                <div class="product__details__pic__slider owl-carousel">
                                    <c:forEach items="${listImage}" var="image" varStatus="i">
                                        <img data-hash="product-${i.index+1}" class="product__big__img" src="${image.image}" alt="">
                                    </c:forEach>
                                    <!--                                <img data-hash="product-2" class="product__big__img" src="img/product/details/product-3.jpg" alt="">
                                                                    <img data-hash="product-3" class="product__big__img" src="img/product/details/product-2.jpg" alt="">
                                                                    <img data-hash="product-4" class="product__big__img" src="img/product/details/product-4.jpg" alt="">-->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="product__details__text">
                            <h3>${p.name} <span>Brand: ${p.brand.name}</span></h3>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <span>( 138 reviews )</span>
                            </div>
                            <div class="product__details__price"><fmt:formatNumber pattern="##,###,###.#" value="${p.price}" />₫ <span ${((sale.brand.brandID==p.brand.brandID)||sale.brand==null) ? '' : 'style="display: none;"'}>${p.price/(1-sale.sale)}₫</span>
</div>
                            <p>${p.detail}</p>
                            <form action="buy" id="form">
                                <div class="product__details__button">
                                    <div class="quantity">
                                        <span>Quantity:</span>
                                        <div class="pro-qty">
                                            <input name="quantity" id="quantity-input" type="text" value="1">
                                        </div>
                                    </div>
                                    <!--                            <div class="cart-btn"><span class="icon_bag_alt"></span><input type="submit" value="Add to cart"</div>-->
                                    <a href="#"  id="addToCartBtn" class="cart-btn"><span class="icon_bag_alt"></span> Add to cart</a>
                                    <ul>
                                        <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                        <!--                                <li><a href="#" onclick="handleBuyClick()"><span class="fa fa-shopping-cart"></span></a></li>-->

                                    </ul>
                                </div>
                                <div class="product__details__widget">
                                    <ul>
                                        <input type="hidden" value="${p.productID}" name="productID">
                                        <li>
                                            <span>Available color:</span>
                                            <div class="color__checkbox">
                                                <c:forEach items="${listColor}" var="c" varStatus="status">
                                                    <label for="${c.color}">
                                                        <input onclick="search()" ${status.first ? 'checked' : ''}  type="radio" value="${c.colorID}" name="colorID" id="${c.color}" >
                                                        <span  class="checkmark" style="border: black solid 1px; background-color: ${c.color}"></span>
                                                    </label>
                                                </c:forEach>

                                            </div>
                                        </li>
                                        
                                        <li>
                                            <span>Available size:</span>
                                            <div class="size__btn">
                                                <c:forEach items="${listSize}" var="s" varStatus="status">
                                                    <label for="${s.size}" ${status.first ? 'class="active"' : ''}>
                                                        <input onclick="search()" ${status.first ? 'checked' : ''} value="${s.sizeID}" name="sizeID" type="radio" id="${s.size}" >
                                                        ${s.size}
                                                    </label>
                                                </c:forEach>


                                            </div>
                                        </li>
                                        <input type="hidden" var="productID" value="${p.productID}">
                                        
                                        <li>
                                            <span>Promotions:</span>
                                            <p>Free shipping</p>
                                        </li>
                                        <li>
                                            <span>Material:</span>
                                            <p>${p.material}</p>
                                        </li>
                                        <li id="quantity">
                                            <span>Quantity in stock:</span>
                                        </li>
                                    </ul>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="product__details__tab">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">Size Guide</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">Refund Policy</a>
                                </li>
                                <!--                            <li class="nav-item">
                                                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">Reviews ( 2 )</a>
                                                            </li>-->
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                    <h6>Size Guide</h6>
                                    <p>${p.sizeGuide}</p>
                                </div>
                                <div class="tab-pane" id="tabs-2" role="tabpanel">
                                    <h6>Refund Policy</h6>
                                    <p>${p.refundPolicy}</p>
                                </div>
                                <!--                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                                                <h6>Reviews ( 2 )</h6>
                                                                <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut loret fugit, sed
                                                                    quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt loret.
                                                                    Neque porro lorem quisquam est, qui dolorem ipsum quia dolor si. Nemo enim ipsam
                                                                    voluptatem quia voluptas sit aspernatur aut odit aut loret fugit, sed quia ipsu
                                                                    consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Nulla
                                                                consequat massa quis enim.</p>
                                                                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget
                                                                    dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes,
                                                                    nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium
                                                                quis, sem.</p>
                                                            </div>-->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="related__title">
                            <h5>RELATED PRODUCTS</h5>
                        </div>
                    </div>
                    <c:forEach items="${requestScope.related}" var="r" varStatus="i">
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="${r.image}">
                                    <!--<div class="label new">New</div>-->
                                    <!--<div class="label stockout">out of stock</div>-->
                                    <ul class="product__hover">
                                        <li><a href="img/product/related/rp-1.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
                                        <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                        <li><a href="product?productID=${r.productID}"><span class="icon_bag_alt"></span></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="#">${r.name}₫</a></h6>
                                    <div class="rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product__price"><fmt:formatNumber pattern="##,###,###.#" value="${r.price}" />₫</div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                   
                </div>
            </div>
        </section>
        <!-- Product Details Section End -->

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
        <script>
            function search() {
                var productID = document.querySelector('input[name="productID"]').value;
                var colorInputs = document.querySelectorAll('input[name="colorID"]');

for (var i = 0; i < colorInputs.length; i++) {
  var colorInput = colorInputs[i];
  
  if (colorInput.checked) {
    var colorID = colorInput.value;
  }
}

                var sizeInputs = document.querySelectorAll('input[name="sizeID"]');

for (var i = 0; i < sizeInputs.length; i++) {
  var sizeInput = sizeInputs[i];
  
  if (sizeInput.checked) {
    var sizeID = sizeInput.value;
  }
}
                $.ajax({
                    url: "/project/quantity",
                    type: "get", 
                    data: {
  sizeID: sizeID,
  colorID: colorID,
  productID: productID
},
                    success: function (data) {
                        var row=document.getElementById("quantity");
                        row.innerHTML =data;
                    },
                    error: function (xhr) {
                    }
                });
            }
        </script>
        <script>
            var addToCartBtn = document.getElementById('addToCartBtn');

            addToCartBtn.addEventListener('click', function (event) {
                event.preventDefault();

                var form = document.getElementById('form');

                form.submit();
            });
            
            
        </script>
        
    </body>

</html>