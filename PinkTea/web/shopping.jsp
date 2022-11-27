<%-- 
    Document   : shopping
    Created on : Jun 16, 2022, 11:14:50 AM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pink Tea House - Shopping Page</title>
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
                        <div class="header header-inner row">
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
                                    <li class="nav-li"><a href="MainController?action=ShowProduct" class="nav-link active">Shopping</a></li>
                                        <c:if test="${sessionScope.LOGIN_USER==null}">
                                        <li class="nav-li"><a href="login.jsp" class="nav-link">Login</a></li>
                                        <li class="nav-li"><a href="createUser.jsp" class="nav-link">Sign Up</a></li>
                                        </c:if>
                                        <c:if test="${sessionScope.LOGIN_USER.roleID eq 'US'}">
                                        <li class="nav-li"><a href="MainController?action=Logout" class="nav-link">Logout</a></li>
                                        <li class="nav-li"><a href="userPage.jsp" class="nav-link">User Page</a></li>
                                        </c:if>
                                </ul>
                            </nav>	
                        </div>
                    </div>
                </div>
            </div>
            <main>
                <%--Search product form--%>
                <header class="row welcome-section">
                    <h1 class="col-12 text-center section-title">Shopping page</h1>
                </header>
                <div class="container-inner-2 form-section row">
                    <form action="MainController">
                        <div class="form-group row">
                            <div class="col-md-5">
                                <input type="search" name="search" value="${param.search}" class="form-control" placeholder="Search"/>
                            </div>
                            <div class="col-md-7">
                                <button type="submit" name="action" value="SearchProduct" class="btn btn-success">Search</button>
                                <button type="submit" name="action" value="View" class="btn btn-success">View Cart</button>
                            </div>
                        </div>
                    </form>
                </div>
                <%--Product--%>
                <p class="col-12 text-center">${requestScope.MESSAGE}</p>
                <div class="row product">
                    <div class="product-page">
                        <c:if test="${requestScope.LIST_PRODUCT != null}">
                            <c:if test="${not empty requestScope.LIST_PRODUCT}">
                                <c:forEach var="product" varStatus="counter" items="${requestScope.LIST_PRODUCT}">
                                    <article class="col-lg-3 col-md-4 col-sm-6 col-12 product-item">
                                        <%--Show on screen--%>
                                        <img src="img/product/${product.image}" alt="Image" class="img-fluid product-img" />
                                        <p class="product-title">${product.name}</p>
                                        <p class="product-price">$${product.price}</p>
                                        <%--Add--%>
                                        <form action="MainController">
                                            <input type="hidden" name="productID" value="${product.productID}" readonly=""/>
                                            <input type="hidden" name="name" value="${product.name}" readonly=""/>
                                            <input type="hidden" name="price" value="${product.price}" readonly=""/>
                                            <input type="hidden" name="quantity" value="${product.quantity}" readonly=""/>
                                            <input type="hidden" name="image" value="${product.image}" readonly=""/>
                                            <input type="hidden" name="categoryID" value="${product.categoryID}" readonly=""/>
                                            <div class="form-group">
                                                <input type="number" name="cmbQuantity" value="" required="" min="1" placeholder="Quantity" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <button type="submit" name="action" value="Add" class="btn btn-success">
                                                    Add
                                                    <input type="hidden" name="search" value="${param.search}"/>
                                                </button>
                                            </div>
                                        </form>
                                    </article>
                                </c:forEach>
                            </c:if>
                        </c:if>
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
    </body>
</html>
