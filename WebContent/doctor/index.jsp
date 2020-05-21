<%@page import="com.healthcare.dbutil.GeneralUtil"%>
<%
if(session.getAttribute("DoctorID") == null){
	response.sendRedirect("login.jsp");
	return;
}

GeneralUtil generalUtil = new GeneralUtil();

String Title = "Dashboard";
%>
<jsp:include page="header.jsp">
    <jsp:param name="Title" value="<%= Title %>" />
    <jsp:param name="IndexActive" value="active" />
</jsp:include>
<div class="row mt-4 mb-3">
    <div class="col-8">
        <h2 class=""><%= Title %></h2>
    </div>
    <div class="col-4">
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item active"><%= Title %></li>
        </ol>
    </div>
</div>
<div class="row">
    <div class="col-xl-3 col-md-6">
        <div class="card bg-warning mb-4">
            <div class="card-body">
                Pending Appointments
                <h4><%= generalUtil.CountByArgs("appointments", "status = 0 AND doc_id = "+session.getAttribute("DoctorID")) %></h4>
            </div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small  stretched-link" href="appointments.jsp">View Details</a>
                <div class="small "><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6">
        <div class="card bg-success mb-4">
            <div class="card-body">
                Completed Appointments
                <h4><%= generalUtil.CountByArgs("appointments", "status = 1 AND doc_id = "+session.getAttribute("DoctorID")) %></h4>
            </div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small  stretched-link" href="appointments.jsp">View Details</a>
                <div class="small "><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6">
        <div class="card bg-warning mb-4">
            <div class="card-body">
                Pending Consulting
                <h4><%= generalUtil.CountByArgs("consulting", "status = 0 AND doc_id = "+session.getAttribute("DoctorID")) %></h4>
            </div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small  stretched-link" href="consulting.jsp">View Details</a>
                <div class="small"><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6">
        <div class="card bg-success mb-4">
            <div class="card-body">
                Completed Consulting
                <h4><%= generalUtil.CountByArgs("consulting", "status = 1 AND doc_id = "+session.getAttribute("DoctorID")) %></h4>
            </div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small  stretched-link" href="consulting.jsp">View Details</a>
                <div class="small "><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />