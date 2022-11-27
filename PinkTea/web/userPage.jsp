<%-- 
    Document   : userPage
    Created on : Jul 3, 2022, 11:08:58 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pink Tea House - User Page</title>
        <link href="css/all.min.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400" rel="stylesheet" />    
        <link href="css/style.css" rel="stylesheet" />
    </head>
    <body>
        <div class="container">
            <%--Phan Quyen--%>
            <c:if test="${sessionScope.LOGIN_USER==null||sessionScope.LOGIN_USER.roleID ne 'US'}">
                <c:redirect url="login.jsp"></c:redirect>
            </c:if>
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
                                    <li class="nav-li"><a href="MainController?action=Logout" class="nav-link">Logout</a></li>
                                    <li class="nav-li"><a href="userPage.jsp" class="nav-link active">User Page</a></li>
                                </ul>
                            </nav>	
                        </div>
                    </div>
                </div>
            </div>
            <main>
                welcome:
                <%--User infor--%>
                <header class="row welcome-section">
                    <h1 class="col-12 text-center section-title">User Information</h1>
                </header>
                <p class="col-12 text-center">${sessionScope.LOGIN_USER.userID}</p>
                <p class="col-12 text-center">${sessionScope.LOGIN_USER.fullName}</p>
                <p class="col-12 text-center">${sessionScope.LOGIN_USER.phoneNumber}</p>
                <p class="col-12 text-center">${sessionScope.LOGIN_USER.address}</p>
                <p class="col-12 text-center">${sessionScope.LOGIN_USER.email}</p>
                <p class="col-12 text-center">${sessionScope.LOGIN_USER.password}</p>
                <p class="col-12 text-center">${sessionScope.LOGIN_USER.roleID}</p>
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
