<%-- 
    Document   : createUser
    Created on : Jun 16, 2022, 9:11:48 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pink Tea House - Sign Up Page</title>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet" />
        <link href="css/all.min.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" />
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
                                    <li class="nav-li"><a href="login.jsp" class="nav-link">Login</a></li>
                                    <li class="nav-li"><a href="createUser.jsp" class="nav-link active">Sign Up</a></li>
                                </ul>
                            </nav>	
                        </div>
                    </div>
                </div>
            </div>
            <main>
                <header class="row welcome-section">
                    <h1 class="col-12 text-center section-title">Input user information</h1>
                </header>
                <div class="container-inner-2 form-section">
                    <%--Create user form--%>
                    <form action="MainController" method="POST" class="form">
                        <div class="form-group">
                            <input type="text" name="userID" class="form-control" placeholder="User ID" required="" />
                            ${requestScope.USER_ERROR.userID}
                        </div>
                        <div class="form-group">
                            <input type="text" name="fullName" class="form-control" placeholder="Full Name" required="" />
                            ${requestScope.USER_ERROR.fullName}
                        </div>
                        <div class="form-group">
                            <input type="text" name="phoneNumber" class="form-control" placeholder="Phone Number" required="" />
                        </div>
                        <div class="form-group">
                            <input type="text" name="address" class="form-control" placeholder="Address" required="" />
                        </div>
                        <div class="form-group">
                            <input type="password" name="password" class="form-control" placeholder="Password" required="" />
                        </div>
                        <div class="form-group">
                            <input type="password" name="confirm" class="form-control" placeholder="Confirm Password" required="" />
                            ${requestScope.USER_ERROR.confirm}
                        </div>
                        <div class="form-group">
                            <input type="text" name="roleID" class="form-control" placeholder="Confirm Password" value="US"readonly="" />
                        </div>
                        <div class="form-group">
                            <button type="submit" name="action" value="Create" class="btn btn-success">Create</button>
                            <button type="reset" value="Reset" class="btn btn-success">Reset</button>
                        </div>
                    </form>
                    ${requestScope.USER_ERROR.error}
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
    </body>
</html>
