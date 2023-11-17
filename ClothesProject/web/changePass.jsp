<%-- 
    Document   : changePass
    Created on : Jul 3, 2023, 6:37:52 PM
    Author     : Pham Thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lavender</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
        <meta name="description" content="Ashion Template">
        <meta name="keywords" content="Ashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

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
            html,body {
                height: 100%;
            }

            body{
                display: -ms-flexbox;
                display: -webkit-box;
                display: flex;
                -ms-flex-align: center;
                -ms-flex-pack: center;
                -webkit-box-align: center;
                align-items: center;
                -webkit-box-pack: center;
                justify-content: center;
                background-color: #f5f5f5;
                background-image: url("img/pass.png")
            }

            form{
                padding-top: 10px;
                font-size: 13px;
                margin-top: 30px;
            }

            .card-title{
                font-weight:300;
            }

            .btn{
                font-size: 13px;
            }

            .login-form{
                width:320px;
                margin:20px;
            }

            .sign-up{
                text-align:center;
                padding:20px 0 0;
            }

            span{
                font-size:14px;
            }

            .submit-btn{
                margin-top:20px;
            }
            .matched {
                color: #008000;
                background-color: #ADFF2F;
            }

            .not-matched {
                color: #FF0000;
                background-color: #FFC0CB;
            }


        </style>
    </head>
    <body>

        <div class="card login-form">
            <div class="breadcrumb-option">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="breadcrumb__links">
                                <a href="home"><i class="fa fa-home"></i> Home</a>
                                <a href="profile">Profile</a>
                                <a href="change">Change</a>
                                <span>Change Password</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <h3 class="card-title text-center">Change password</h3>

                <!--Password must contain one lowercase letter, one number, and be at least 7 characters long.-->

                <div class="card-text">
                    <form action="changePass" method="post">
                        <!--				<div class="alert alert-danger alert-dismissible fade show" role="alert">
                          <strong>Holy guacamole!</strong> You should check in on some of those fields below.
                          <a class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </a>
                        </div>-->       
                        <h5 style="color: ${requestScope.color}">${requestScope.notice}</h5>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Old Passwork</label>
                            <input name="oldpass" type="text" class="form-control form-control-sm">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">New Passwork</label>
                            <input name="newpass" id="password1" type="text" class="form-control form-control-sm">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Repeat New Password</label>
                            <input name="repass" id="password2" type="text" class="form-control form-control-sm">
                        </div>
                        <input type="hidden" value="${sessionScope.account.accountID}" name="accountID">
                        <input type="hidden" value="${sessionScope.account.username}" name="user">
                        <button type="submit" class="btn btn-primary btn-block submit-btn">Save</button>
                    </form>
                </div>
            </div>
        </div>
        <script>
            var password1Input = document.getElementById("password1");
            var password2Input = document.getElementById("password2");

// Lắng nghe sự kiện input trên password1Input
            password2Input.addEventListener("input", checkPasswordMatch);

// Hàm kiểm tra sự khớp của mật khẩu
            function checkPasswordMatch() {
                var password1Value = password1Input.value;
                var password2Value = password2Input.value;

                if (password1Value === password2Value) {
// Nếu mật khẩu khớp, thay đổi lớp CSS thành "matched"
                    password2Input.classList.remove("not-matched");
                    password2Input.classList.add("matched");
                } else {
// Nếu mật khẩu không khớp, thay đổi lớp CSS thành "not-matched"
                    password2Input.classList.remove("matched");
                    password2Input.classList.add("not-matched");
                }
            }

        </script>
    </body>
</html>
