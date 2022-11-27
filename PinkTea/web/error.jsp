<%-- 
    Document   : error
    Created on : Jun 2, 2022, 9:40:04 AM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pink Tea House - Error Page</title>
        <link href="css/all.min.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400" rel="stylesheet" />    
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
                                        <c:if test="${sessionScope.LOGIN_USER==null}">
                                        <li class="nav-li"><a href="MainController?action=ShowProduct" class="nav-link">Shopping</a></li>
                                        <li class="nav-li"><a href="login.jsp" class="nav-link">Login</a></li>
                                        <li class="nav-li"><a href="createUser.jsp" class="nav-link">Sign Up</a></li>
                                        </c:if>
                                        <c:if test="${sessionScope.LOGIN_USER.roleID eq 'AD'}">
                                        <li class="nav-li"><a href="MainController?action=ShowProduct" class="nav-link">ManageProduct</a></li>
                                        <li class="nav-li"><a href="MainController?action=Logout" class="nav-link">Logout</a></li>
                                        <li class="nav-li"><a href="adminPage.jsp" class="nav-link">Admin Page</a></li>
                                        </c:if>
                                        <c:if test="${sessionScope.LOGIN_USER.roleID eq 'US'}">
                                        <li class="nav-li"><a href="MainController?action=ShowProduct" class="nav-link">Shopping</a></li>
                                        <li class="nav-li"><a href="MainController?action=Logout" class="nav-link">Logout</a></li>
                                        <li class="nav-li"><a href="userPage.jsp" class="nav-link">User Page</a></li>
                                        </c:if>
                                </ul>
                            </nav>	
                        </div>
                    </div>
                </div>
            </div>
            <h1 class="col-12 text-center section-title">Error</h1>
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
