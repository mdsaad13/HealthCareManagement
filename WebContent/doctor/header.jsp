<%@page import="com.healthcare.modals.Doctor"%>
<%@page import="com.healthcare.dbutil.AccountUtil"%>
<%@page import="com.healthcare.Environment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
int ID = (Integer)session.getAttribute("DoctorID");

AccountUtil accountUtil = new AccountUtil();
Doctor adminDetails = accountUtil.GetDoctorByID(ID);
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>${param.Title} - <%= Environment._SoftwareName %> Doctor</title>
    <link href="../dashboard_assets/css/styles.css" rel="stylesheet" />
    <link href="../dashboard_assets/plugins/DataTables/datatables.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous">
    </script>
    <link href="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/theme-default.min.css" rel="stylesheet"
        type="text/css" />
    <link href="../dashboard_assets/css/custom.css" rel="stylesheet" />
</head>

<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <a class="navbar-brand" href="index.jsp"><%= Environment._SoftwareShortName %></a><button
            class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i
                class="fas fa-bars"></i></button>

        <!-- Navbar-->
        <ul class="navbar-nav ml-auto mr-0 mr-md-3 my-2 my-md-0">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i>
                    <%= adminDetails.getName() %> </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                    <a class="dropdown-item" href="settings.jsp">Settings</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="logout.jsp">Logout</a>
                </div>
            </li>
        </ul>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-light" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">Main Navigation</div>
                        <a class="nav-link ${param.IndexActive}" href="index.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            Dashboard
                        </a>
                        <a class="nav-link ${param.AppointmentsActive}" href="appointments.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-calendar-check"></i></div>
                            Appointments
                        </a>
                        <a class="nav-link ${param.ConsultingActive}" href="consulting.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-question-circle"></i></div>
                            Consulting
                        </a>
                    </div>
                </div>
            </nav>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid">