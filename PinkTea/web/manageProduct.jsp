<%-- 
    Document   : manageProduct
    Created on : Jul 4, 2022, 5:20:59 PM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pink Tea House - Manage Product Page</title>
        <link href="css/all.min.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400" rel="stylesheet" />    
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
                    <h1 class="col-12 text-center section-title">Manage Product</h1>
                </header>
                <div class="container-inner-2 form-section">
                    <div class="row">
                        <%--Search product form--%>
                        <form action="MainController">
                            <div class="form-group row">
                                <div class="col-md-9">
                                    <input type="search" name="search" value="${param.search}" class="form-control" placeholder="Search"/>
                                </div>
                                <div class="col-md-3">
                                    <button type="submit" name="action" value="SearchProduct" class="btn btn-success">Search Product</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <a href="createProduct.jsp" class="btn btn-success">Create Product</a>
                </div>
                <%--Show search Product--%>
                <div class="row product product-page">
                    <c:if test="${requestScope.LIST_PRODUCT != null}">
                        <c:if test="${not empty requestScope.LIST_PRODUCT}">
                            <c:forEach var="product" varStatus="counter" items="${requestScope.LIST_PRODUCT}">
                                <article class="col-lg-3 col-md-4 col-sm-6 col-12 product-item">
                                    <div class="container-inner-2 form-section">
                                        <img src="img/product/${product.image}" alt="Image" class="img-fluid product-img" />
                                        <%--Update and Delete--%>
                                        <form action="MainController">
                                            <div class="form-group">
                                                <label>Product ID</label>
                                                <input type="text" name="productID" value="${product.productID}" required="" class="form-control"/>
                                            </div>
                                            <div class="form-group">
                                                <label>Name</label>
                                                <input type="text" name="name" value="${product.name}" required="" class="form-control"/>
                                            </div>
                                            <div class="form-group">
                                                <label>Price</label>
                                                <input type="text" name="price" value="${product.price}" required="" class="form-control"/>
                                            </div>
                                            <div class="form-group">
                                                <label>Quantity</label>
                                                <input type="number" name="quantity" value="${product.quantity}" required="" class="form-control"/>
                                            </div>
                                            <div class="form-group">
                                                <label>Image</label>
                                                <input type="text" name="image" value="${product.image}" readonly="" class="form-control"/>
                                            </div>
                                            <div class="form-group">
                                                <label>Category ID</label>
                                                <input type="text" name="categoryID" value="${product.categoryID}" required="" class="form-control"/>
                                            </div>
                                            <div class="form-group">
                                                <button type="submit" name="action" value="UpdateProduct" class="btn btn-success">
                                                    Update
                                                    <input type="hidden" name="search" value="${param.search}"/>
                                                </button>
                                                <button type="submit" name="action" value="DeleteProduct" class="btn btn-success">
                                                    Delete
                                                    <input type="hidden" name="search" value="${param.search}"/>
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </article>
                            </c:forEach>
                        </c:if>
                    </c:if>
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