<%-- 
    Document   : createProduct
    Created on : Jul 8, 2022, 12:57:04 AM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pink Tea House - Create Product Page</title>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet" />
        <link href="css/all.min.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" />
    </head>
    <body>
        <%--Phan Quyen--%>
        <c:if test="${sessionScope.LOGIN_USER==null||sessionScope.LOGIN_USER.roleID ne 'AD'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
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
                                    <li class="nav-li"><a href="MainController?action=ShowProduct" class="nav-link active">ManageProduct</a></li>
                                    <li class="nav-li"><a href="MainController?action=Logout" class="nav-link">Logout</a></li>
                                    <li class="nav-li"><a href="adminPage.jsp" class="nav-link">Admin Page</a></li>
                                </ul>
                            </nav>	
                        </div>
                    </div>
                </div>
            </div>
            <main>
                <header class="row welcome-section">
                    <h1 class="col-12 text-center section-title">Input product information</h1>
                </header>
                <div class="container-inner-2 form-section ">
                    <%--Create product form--%>
                    <form action="MainController" method="POST" class="form">
                        <div class="form-group">
                            <input type="text" name="productID" class="form-control" placeholder="Product ID" required="" />
                            ${requestScope.PRODUCT_ERROR.productID}
                        </div>
                        <div class="form-group">
                            <input type="text" name="name" class="form-control" placeholder="Name" required="" />
                            ${requestScope.PRODUCT_ERROR.name}
                        </div>
                        <div class="form-group">
                            <input type="text" name="price" class="form-control" placeholder="Price" required="" />
                        </div>
                        <div class="form-group">
                            <input type="number" name="quantity" class="form-control" placeholder="Quantity" required="" />
                        </div>
                        <div class="form-group">
                            <input type="text" name="image" class="form-control" placeholder="Image" required="" />
                        </div>
                        <div class="form-group">
                            <input type="text" name="categoryID" class="form-control" placeholder="Category ID" required="" />
                        </div>
                        <div class="form-group">
                            <button type="submit" name="action" value="CreateProduct" class="btn btn-success">Create</button>
                            <button type="reset" value="Reset" class="btn btn-success">Reset</button>
                        </div>
                    </form>
                    ${requestScope.PRODUCT_ERROR.error}
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
