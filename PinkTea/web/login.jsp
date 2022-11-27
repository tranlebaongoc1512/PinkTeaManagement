<%-- 
    Document   : login
    Created on : Jul 3, 2022, 10:55:47 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pink Tea House - Login Page</title>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet" />
        <link href="css/all.min.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" />
        <%--Recapcha--%>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    </head>
    <body>
        <div class="container">
            <%-- Top box --%>
            <%-- Logo & Site Name --%>
            <div class="placeholder">
                <div class="parallax-window" data-parallax="scroll" data-image-src="img/pink-tea-01.jpg">
                    <div class="header">
                        <div class="row header-inner">
                            <div class="col-md-6 col-12">
                                <img src="img/logo.png" alt="Logo" class="site-logo" /> 
                                <div class="site-text-box">
                                    <h1 class="site-title">Pink Tea House</h1>
                                    <h6 class="site-description">a small milk tea shop</h6>
                                </div>
                            </div>
                            <nav class="col-md-6 col-12 nav">
                                <ul class="nav-ul">
                                    <li class="nav-li"><a href="index.jsp" class="nav-link">Home</a></li>
                                    <li class="nav-li"><a href="MainController?action=ShowProduct" class="nav-link">Shopping</a></li>
                                    <li class="nav-li"><a href="login.jsp" class="nav-link active">Login</a></li>
                                    <li class="nav-li"><a href="createUser.jsp" class="nav-link">Sign Up</a></li>
                                </ul>
                            </nav>	
                        </div>
                    </div>
                </div>
            </div>
            <main>
                <%--Login form--%>
                <header class="row welcome-section">
                    <h1 class="col-12 text-center section-title">Login</h1>
                    <p class="col-12 text-center">- Or Login with -</p>
                </header>
                <div class="container-inner-2 form-section row">
                    <div class="col-md-6">
                        <form onsubmit="return submitUserForm();" action="MainController" method="POST" class="form">
                            <div class="form-group">
                                <input type="text" name="userID" class="form-control" placeholder="User ID" required="" />
                            </div>

                            <div class="form-group">
                                <input type="password" name="password" class="form-control" placeholder="Password" required="" />
                            </div>
                            <%--Recaptcha--%>
                            <div class="g-recaptcha" data-sitekey="6LfAJ9MgAAAAACpeO5whIbYFMmfTxTEHbMaoaq2d" data-callback="verifyCaptcha"></div>
                            <div id="g-recaptcha-error"></div>
                            <button type="submit" name="action" value="Login" class="btn btn-success">Login</button>
                            <button type="reset" value="Reset" class="btn btn-success">Reset</button>
                        </form>
                        ${requestScope.ERROR}
                    </div>
                </div>
            </main>
            <footer class="footer text-center">
                <h2>PINK TEA</h2>
                <p>D1 Street, Saigon Hi-tech Park, Long Thanh My Ward, District 9, Ho Chi Minh City</p>
                <p>ngoctlbse160583@fpt.edu.vn</p>
            </footer>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="js/parallax.min.js"></script>
        <%--function for recaptcha--%>
        <script src='https://www.google.com/recaptcha/api.js'></script>
        <script>
            function submitUserForm() {
                var response = grecaptcha.getResponse();
                if (response.length == 0) {
                    document.getElementById('g-recaptcha-error').innerHTML = '<span style="color:red;">This field is required.</span>';
                    return false;
                }
                return true;
                }

                function verifyCaptcha() {
                    document.getElementById('g-recaptcha-error').innerHTML = '';
                }
        </script>
    </body>
</html>
