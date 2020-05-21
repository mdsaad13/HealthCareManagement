<%@page import="com.healthcare.dbutil.AccountUtil"%>
<%@page import="com.healthcare.Environment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html class="no-js">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>${param.Title} - <%= Environment._SoftwareName %></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSS here -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/gijgo.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/slicknav.css">
    <link rel="stylesheet" href="css/style.css">
    <link href="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/theme-default.min.css" rel="stylesheet"
        type="text/css" />
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
    <style type="text/css">
        .logo-img a {
            color: white;
            font-size: 1.8rem;
        }
    </style>
</head>

<body>
    <!-- header-start -->
    <header>
        <div class="header-area ">
            <div id="sticky-header" class="main-header-area">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-3 col-lg-3">
                            <div class="logo-img">
                                <a href="index.jsp">
                                    <%= Environment._SoftwareShortName %>
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-9 col-lg-9">
                            <div class="menu_wrap d-none d-lg-block">
                                <div class="menu_wrap_inner d-flex align-items-center justify-content-end">
                                    <div class="main-menu">
                                        <nav>
                                            <ul id="navigation">
                                                <li><a href="index.jsp">home</a></li>
                                                <li><a href="book-appointment.jsp">Book An Appointment</a></li>
                                                <li><a href="health-tips.jsp">Health Tips</a></li>
                                                <li><a href="contact-us.jsp">Contact</a></li>
                                                <% if(session.getAttribute("UserID") == null){ %>
                                                <li>
                                                    <a href="#">
                                                        Account <i class="ti-angle-down"></i>
                                                    </a>
                                                    <ul class="submenu">
                                                        <li>
                                                            <a href="login.jsp">Login</a>
                                                        </li>
                                                        <li>
                                                            <a href="register.jsp">Register</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <% } else { 
                                                	AccountUtil accountUtil = new AccountUtil();
                                                %>
                                                	<li>
                                                    <a href="#">
                                                        Welcome <%= accountUtil.GetUserByID((int) session.getAttribute("UserID")).getName() %> <i class="ti-angle-down"></i>
                                                    </a>
                                                    <ul class="submenu">
                                                        <li>
                                                            <a href="my-appointment.jsp">My Appointments</a>
                                                        </li>
                                                        <li>
                                                            <a href="my-consulting.jsp">My Consultancy</a>
                                                        </li>
                                                        <li>
                                                            <a href="settings.jsp">Settings</a>
                                                        </li>
                                                        <li>
                                                            <a href="logout.jsp">Logout</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <% } %>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- header-end -->