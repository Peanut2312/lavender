<%-- 
    Document   : change
    Created on : Jul 3, 2023, 4:51:03 PM
    Author     : Pham Thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.1/css/bootstrap.min.css"  />
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
            body{
                margin-top:20px;
                background-color:#f2f6fc;
                color:#69707a;
            }
            .img-account-profile {
                height: 10rem;
            }
            .rounded-circle {
                border-radius: 50% !important;
            }
            .card {
                box-shadow: 0 0.15rem 1.75rem 0 rgb(33 40 50 / 15%);
            }
            .card .card-header {
                font-weight: 500;
            }
            .card-header:first-child {
                border-radius: 0.35rem 0.35rem 0 0;
            }
            .card-header {
                padding: 1rem 1.35rem;
                margin-bottom: 0;
                background-color: rgba(33, 40, 50, 0.03);
                border-bottom: 1px solid rgba(33, 40, 50, 0.125);
            }
            .form-control, .dataTable-input {
                display: block;
                width: 100%;
                padding: 0.875rem 1.125rem;
                font-size: 0.875rem;
                font-weight: 400;
                line-height: 1;
                color: #69707a;
                background-color: #fff;
                background-clip: padding-box;
                border: 1px solid #c5ccd6;
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                border-radius: 0.35rem;
                transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            }

            .nav-borders .nav-link.active {
                color: #0061f2;
                border-bottom-color: #0061f2;
            }
            .nav-borders .nav-link {
                color: #69707a;
                border-bottom-width: 0.125rem;
                border-bottom-style: solid;
                border-bottom-color: transparent;
                padding-top: 0.5rem;
                padding-bottom: 0.5rem;
                padding-left: 0;
                padding-right: 0;
                margin-left: 1rem;
                margin-right: 1rem;
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


        </style>
    </head>
    <body>
        <div class="container-xl px-4 mt-4">
            <!-- Account page navigation-->
            <nav class="nav nav-borders">
                <!--                <a class="nav-link active ms-0" href="https://www.bootdey.com/snippets/view/bs5-edit-profile-account-details" target="__blank">Profile</a>
                                <a class="nav-link" href="https://www.bootdey.com/snippets/view/bs5-profile-billing-page" target="__blank">Billing</a>
                                <a class="nav-link" href="https://www.bootdey.com/snippets/view/bs5-profile-security-page" target="__blank">Security</a>
                                <a class="nav-link" href="https://www.bootdey.com/snippets/view/bs5-edit-notifications-page"  target="__blank">Notifications</a>-->
                <div class="breadcrumb-option">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="breadcrumb__links">
                                    <a href="home"><i class="fa fa-home"></i> Home</a>
                                    <a href="profile">Profile</a>
                                    <span>Change Profile</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>
            <hr class="mt-0 mb-4">
            <div class="row">
                <div class="col-xl-4">
                    <!-- Profile picture card-->
                    <div class="card mb-4 mb-xl-0">
                        <div class="card-header">Profile Picture</div>
                        <div class="card-body text-center">
                            <!-- Profile picture image-->
                            <img class="img-account-profile rounded-circle mb-2" src="http://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                            <!-- Profile picture help block-->
                            <div class="small font-italic text-muted mb-4">JPG or PNG no larger than 5 MB</div>
                            <!-- Profile picture upload button-->
                            <button class="btn btn-primary" type="button">Upload new image</button>
                        </div>
                    </div>
                </div>
                <div class="col-xl-8">
                    <!-- Account details card-->
                    <div class="card mb-4">
                        <div class="card-header" style="display: flex; align-items: center;">
                            Account Details <span style="margin-left: 50px;"><a href="changePass">Change Password</a></span>
                        </div>
                        <div class="card-body">
                            <form action="change" method="post">
                                <!-- Form Group (username)-->
                                <!--                                <div class="mb-3">
                                                                    <label class="small mb-1" for="inputUsername">Username (how your name will appear to other users on the site)</label>
                                                                    <input class="form-control" id="inputUsername" type="text" placeholder="Enter your username" value="username">
                                                                </div>-->
                                <!-- Form Row-->
                                <div class="row gx-3 mb-3">
                                    <!-- Form Group (first name)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputFirstName">First name</label>
                                        <input required class="form-control" id="inputFirstName" type="text" name="first" value="${sessionScope.account.firstname}">
                                    </div>
                                    <!-- Form Group (last name)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputLastName">Last name</label>
                                        <input required class="form-control" id="inputLastName" name="last" type="text" value="${sessionScope.account.lastname}">
                                    </div>
                                </div>
                                <!-- Form Row        -->
                                <!--                                <div class="row gx-3 mb-3">
                                                                     Form Group (organization name)
                                                                    <div class="col-md-6">
                                                                        <label class="small mb-1" for="inputOrgName">Organization name</label>
                                                                        <input class="form-control" id="inputOrgName" type="text" placeholder="Enter your organization name" value="Start Bootstrap">
                                                                    </div>
                                                                     Form Group (location)
                                                                    <div class="col-md-6">
                                                                        <label class="small mb-1" for="inputLocation">Location</label>
                                                                        <input class="form-control" id="inputLocation" type="text" placeholder="Enter your location" value="San Francisco, CA">
                                                                    </div>
                                                                </div>-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="inputEmailAddress">Address</label>
                                    <input required  class="form-control" name="address" id="inputEmailAddress" type="text" value="${sessionScope.account.address}" >
                                </div>
                                <!-- Form Group (email address)-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="inputEmailAddress">Email </label>
                                    <input required class="form-control" name="email" id="inputEmailAddress" type="email" value="${sessionScope.account.email}" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">

                                </div>
                                <!-- Form Row-->
                                <div class="row gx-3 mb-3">
                                    <!-- Form Group (phone number)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputPhone">Phone number</label>
                                        <input required class="form-control" name="phone" id="inputPhoneNumber" type="tel" value="${sessionScope.account.phone}" pattern="[0-9]{10,12}">

                                    </div>
                                    <!-- Form Group (birthday)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputBirthday">Birthday</label>
                                        <input required class="form-control" name="dob" id="inputBirthday" type="date" name="birthday" value="${sessionScope.account.dob}" >
                                    </div>
                                </div>
                                <input type="hidden" value="${sessionScope.account.accountID}" name="accountID"/>
                                <!-- Save changes button-->
                                <input type="submit" value="Save changes" class="btn btn-primary">
                                <h4 style="color: #008000;">${requestScope.notice}</h4>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
