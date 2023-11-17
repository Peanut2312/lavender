<%-- 
    Document   : login
    Created on : Jun 30, 2023, 11:18:21 PM
    Author     : Pham Thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lavender</title>
        <style>

            @import url("https://fonts.googleapis.com/css?family=Fira+Sans");

            html,body {
                position: relative;
                min-height: 100vh;
                background-color: #E1E8EE;
                display: flex;
                align-items: center;
                justify-content: center;
                font-family: "Fira Sans", Helvetica, Arial, sans-serif;
                -webkit-font-smoothing: antialiased;
                -moz-osx-font-smoothing: grayscale;
            }

            .form-structor {
                background-color: #222;
                border-radius: 15px;
                height: 600px;
                width: 600px;
                position: relative;
                overflow: hidden;

                &::after {
                    content: '';
                    opacity: .8;
                    position: absolute;
                    top: 0;
                    right:0;
                    bottom:0;
                    left:0;
                    background-repeat: no-repeat;
                    background-position: left bottom;
                    background-size: 600px;
                    background-image: url('img/login.png');
                }

                .signup {
                    position: absolute;
                    top: 50%;
                    left: 50%;
                    -webkit-transform: translate(-50%, -50%);
                    width: 45%;
                    z-index: 5;
                    -webkit-transition: all .3s ease;


                    &.slide-up {
                        top: 5%;
                        -webkit-transform: translate(-50%, 0%);
                        -webkit-transition: all .3s ease;
                    }

                    &.slide-up .form-holder,
                    &.slide-up .submit-btn {
                        opacity: 0;
                        visibility: hidden;
                    }

                    &.slide-up .form-title {
                        font-size: 1em;
                        cursor: pointer;
                    }

                    &.slide-up .form-title span {
                        margin-right: 5px;
                        opacity: 1;
                        visibility: visible;
                        -webkit-transition: all .3s ease;
                    }

                    .form-title {
                        color: #fff;
                        font-size: 1.7em;
                        text-align: center;

                        span {
                            color: rgba(0,0,0,0.4);
                            opacity: 0;
                            visibility: hidden;
                            -webkit-transition: all .3s ease;
                        }
                    }

                    .form-holder {
                        border-radius: 15px;
                        background-color: #fff;
                        overflow: hidden;
                        margin-top: 50px;
                        opacity: 1;
                        visibility: visible;
                        -webkit-transition: all .3s ease;

                        .input {
                            border: 0;
                            outline: none;
                            box-shadow: none;
                            display: block;
                            height: 30px;
                            line-height: 30px;
                            padding: 8px 15px;
                            border-bottom: 1px solid #eee;
                            width: 100%;
                            font-size: 12px;

                            &:last-child {
                                border-bottom: 0;
                            }
                            &::-webkit-input-placeholder {
                                color: rgba(0,0,0,0.4);
                            }
                        }
                    }

                    .submit-btn {
                        background-color: rgba(0,0,0,0.4);
                        color: rgba(256,256,256,0.7);
                        border:0;
                        border-radius: 15px;
                        display: block;
                        margin: 15px auto;
                        padding: 15px 45px;
                        width: 100%;
                        font-size: 13px;
                        font-weight: bold;
                        cursor: pointer;
                        opacity: 1;
                        visibility: visible;
                        -webkit-transition: all .3s ease;

                        &:hover {
                            transition: all .3s ease;
                            background-color: rgba(0,0,0,0.8);
                        }
                    }
                }

                .login {
                    position: absolute;
                    top: 20%;
                    left: 0;
                    right: 0;
                    bottom: 0;
                    background-color: #fff;
                    z-index: 5;
                    -webkit-transition: all .3s ease;

                    &::before {
                        content: '';
                        position: absolute;
                        left: 50%;
                        top: -20px;
                        -webkit-transform: translate(-50%, 0);
                        background-color: #fff;
                        width: 200%;
                        height: 250px;
                        border-radius: 50%;
                        z-index: 4;
                        -webkit-transition: all .3s ease;
                    }

                    .center {
                        position: absolute;
                        top: calc(50% - 10%);
                        left: 50%;
                        -webkit-transform: translate(-50%, -50%);
                        width: 65%;
                        z-index: 5;
                        -webkit-transition: all .3s ease;

                        .form-title {
                            color: #000;
                            font-size: 1.7em;
                            text-align: center;

                            span {
                                color: rgba(0,0,0,0.4);
                                opacity: 0;
                                visibility: hidden;
                                -webkit-transition: all .3s ease;
                            }
                        }

                        .form-holder {
                            border-radius: 15px;
                            background-color: #fff;
                            border: 1px solid #eee;
                            overflow: hidden;
                            margin-top: 50px;
                            opacity: 1;
                            visibility: visible;
                            -webkit-transition: all .3s ease;

                            .input {
                                border: 0;
                                outline: none;
                                box-shadow: none;
                                display: block;
                                height: 30px;
                                line-height: 30px;
                                padding: 8px 15px;
                                border-bottom: 1px solid #eee;
                                width: 100%;
                                font-size: 12px;

                                &:last-child {
                                    border-bottom: 0;
                                }
                                &::-webkit-input-placeholder {
                                    color: rgba(0,0,0,0.4);
                                }
                            }
                        }

                        .submit-btn {
                            background-color: #6B92A4;
                            color: rgba(256,256,256,0.7);
                            border:0;
                            border-radius: 15px;
                            display: block;
                            margin: 15px auto;
                            padding: 15px 45px;
                            width: 100%;
                            font-size: 13px;
                            font-weight: bold;
                            cursor: pointer;
                            opacity: 1;
                            visibility: visible;
                            -webkit-transition: all .3s ease;

                            &:hover {
                                transition: all .3s ease;
                                background-color: rgba(0,0,0,0.8);
                            }
                        }
                    }

                    &.slide-up {
                        top: 90%;
                        -webkit-transition: all .3s ease;
                    }

                    &.slide-up .center {
                        top: 10%;
                        -webkit-transform: translate(-50%, 0%);
                        -webkit-transition: all .3s ease;
                    }

                    &.slide-up .form-holder,
                    &.slide-up .submit-btn {
                        opacity: 0;
                        visibility: hidden;
                        -webkit-transition: all .3s ease;
                    }

                    &.slide-up .form-title {
                        font-size: 1em;
                        margin: 0;
                        padding: 0;
                        cursor: pointer;
                        -webkit-transition: all .3s ease;
                    }

                    &.slide-up .form-title span {
                        margin-right: 5px;
                        opacity: 1;
                        visibility: visible;
                        -webkit-transition: all .3s ease;
                    }
                }
                .password-container {
                    position: relative;
                }

                .toggle-icon {
                    position: absolute;
                    right: 10px;
                    top: 50%;
                    transform: translateY(-50%);
                    cursor: pointer;
                }

                .input {
                    padding-right: 30px; /* Đảm bảo không ghi đè lên biểu tượng con mắt */
                }



                .matched {
                    color: #008000;
                    background-color: #ADFF2F;
                }

                .not-matched {
                    color: #FF0000;
                    background-color: #FFC0CB;
                }
.login-with-google {
  display: flex;
  align-items: center;
}

.login-with-google span {
  display: flex;
  align-items: center;
}

.login-with-google a {
  text-decoration: none;
  color: black;
  margin-right: 10px;
}

.login-with-google div {
  padding: 10px;
  border-radius: 5px;
}

.login-with-google i {
  color: #DB4437;
}


            </style>

            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

            <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
            <link href="img/flower.png" rel="icon" type="image/x-icon">
        </head>
        <body>

            <div class="form-structor">
                <form action="login" method="post">
                    <div class="signup">
                        <h2 class="form-title" id="signup">Login</h2>
                        <div class="form-holder">
                            <h2 style="font-family: 'Montserrat', sans-serif;
                                margin-left: 10px;

                                font-size: 120%;
                                color: ${color}" >${requestScope.notice}</h2>
                                <input value="${empty requestScope.user ? cookie.cuser.value : requestScope.user }" name="user" type="text" class="input" placeholder="Username" />
                                <div class="password-container">
                                    <input value="${empty requestScope.pass ? cookie.cpass.value : requestScope.pass}" name="pass" type="password" class="input" placeholder="Password" />
                                    <span class="toggle-icon"><i class="fas fa-eye-slash"></i></span>
                                </div>
                                    <div style="margin-top: 10px" class="login-with-google">
                                    <span><a  href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:9999/project/login-google&response_type=code
                                              &client_id=352918127082-915a10eqotcv84ks0rsl560if6vb4t4d.apps.googleusercontent.com&approval_prompt=force"><div>Login with</div></a>
                                    </span>
                                    <span>
                                        <a  href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:9999/project/login-google&response_type=code
                                            &client_id=352918127082-915a10eqotcv84ks0rsl560if6vb4t4d.apps.googleusercontent.com&approval_prompt=force"><i class="fab fa-google"></i></a>
                                    </span>
                                </div>



                                <input style="margin:  20px"  type="checkbox" ${(cookie.crem!=null?'checked':'')} name="rem" value="ON"/> Remember me<br/>

                            </div>

                            <button class="submit-btn">Login</button>
                        </div>
                    </form>
                    <form id="signupForm" action="signup">
                        <div class="login slide-up">
                            <div class="center">
                                <h3  class="form-title" id="login">Doesn't have account ? Sign up</h3>

                                <div class="form-holder">
                                    <input required name="user" type="text" class="input" placeholder="Username" />
                                    <input  name="pass" class="input" type="text" id="password1" placeholder="Create Password" required/>
                                    <!-- Confirm Password -->
                                    <input  class="input" type="text" id="password2" placeholder="Confirm Password" name="repass" required/>

                                    <input required name="email" type="email" class="input" placeholder="Email" />
                                    <input required name="first" type="text" class="input" placeholder="First Name" />
                                    <input required name="last" type="text" class="input" placeholder="Last Name" />
                                </div>

                                <input type="submit" class="submit-btn" value="Sign up">
                            </div>
                        </div>
                    </form>

                </div>

                <script >

                    console.clear();

                    var loginBtn = document.getElementById('login');
                    var signupBtn = document.getElementById('signup');

                    loginBtn.addEventListener('click', (e) => {
                        let parent = e.target.parentNode.parentNode;
                        Array.from(e.target.parentNode.parentNode.classList).find((element) => {
                            if (element !== "slide-up") {
                                parent.classList.add('slide-up')
                            } else {
                                signupBtn.parentNode.classList.add('slide-up')
                                parent.classList.remove('slide-up')
                            }
                        });
                    });

                    signupBtn.addEventListener('click', (e) => {
                        let parent = e.target.parentNode;
                        Array.from(e.target.parentNode.classList).find((element) => {
                            if (element !== "slide-up") {
                                parent.classList.add('slide-up')
                            } else {
                                loginBtn.parentNode.parentNode.classList.add('slide-up')
                                parent.classList.remove('slide-up')
                            }
                        });
                    });
                    var toggleIcon = document.querySelector(".toggle-icon");
                    var passwordField = document.querySelector("input[name='pass']");
                    var iconElement = toggleIcon.querySelector("i");

                    toggleIcon.addEventListener("click", function () {
                        if (passwordField.type === "password") {
                            passwordField.type = "text";
                            iconElement.classList.remove("fa-eye-slash");
                            iconElement.classList.add("fa-eye");
                        } else {
                            passwordField.type = "password";
                            iconElement.classList.remove("fa-eye");
                            iconElement.classList.add("fa-eye-slash");
                        }
                    });

                    // Lấy các phần tử input và gán vào biến
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
