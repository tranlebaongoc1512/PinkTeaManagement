<%@page import="sample.user.UserDTO"%>
<%@page import="sample.cart.ProductCart"%>
<%@page import="sample.cart.Cart"%>
<%-- 
    Document   : shopping
    Created on : Jun 21, 2022, 10:58:03 AM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pink Tea House - Cart Page</title>
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
                <%--Cart--%>
                <header class="row welcome-section">
                    <h1 class="col-12 text-center section-title">Your Cart</h1>
                    <a href="MainController?action=CheckOut" class="btn btn-success">Check Out</a>
                    <a href="MainController?action=ShowProduct" class="btn btn-success">Add More</a>
                </header>
                <div class="row product">
                    <div class="product-page">
                        <%
                            Cart cart = (Cart) session.getAttribute("CART");
                            if (cart != null) {
                                double total = 0;
                                for (ProductCart productCart : cart.getCart().values()) {
                                    total += productCart.getProduct().getPrice() * productCart.getQuantity();
                        %>
                        <article class="col-lg-3 col-md-4 col-sm-6 col-12 product-item">
                            <%--Show on screen--%>
                            <img src="img/product/<%= productCart.getProduct().getImage()%>" alt="Image" class="img-fluid product-img" />
                            <p class="product-title"><%= productCart.getProduct().getName()%></p>
                            <p class="product-price">$<%= productCart.getProduct().getPrice()%></p>
                            <p class="product-price">Total: $<%= productCart.getQuantity() * productCart.getProduct().getPrice()%></p>
                            <form action="MainController">
                                <%--Remove and Edit--%>
                                <input type="hidden" name="productID" value="<%= productCart.getProduct().getProductID()%>" readonly=""/>
                                <input type="hidden" name="name" value="<%= productCart.getProduct().getName()%>" readonly=""/>
                                <input type="hidden" name="price" value="<%= productCart.getProduct().getPrice()%>" readonly=""/>
                                <input type="hidden" name="quantity" value="<%= productCart.getProduct().getQuantity()%>" readonly=""/>
                                <input type="hidden" name="image" value="<%= productCart.getProduct().getImage()%>" readonly=""/>
                                <input type="hidden" name="categoryID" value="<%= productCart.getProduct().getCategoryID()%>" readonly=""/>
                                <div class="form-group">
                                    <input type="number" name="cmbQuantity" value="<%= productCart.getQuantity()%>" required="" min="1" placeholder="Quantity" class="form-control">
                                </div>
                                <div class="form-group">
                                    <button type="submit" name="action" value="Remove" class="btn btn-success">Remove</button>
                                    <button type="submit" name="action" value="Edit" class="btn btn-success">Edit</button>
                                </div>
                            </form>
                        </article>
                        <%
                            }
                        %>
                        <h1 class="col-12 text-center section-title">Total: $<%= total%></h1>
                        <%
                            }
                        %>
                    </div>
                </div>
                <h1 class="col-12 text-center section-title">${requestScope.ERROR}</h1>
                <h1 class="col-12 text-center section-title">${requestScope.MESSAGE}</h1>
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
