<%@page import="com.healthcare.dbutil.GeneralUtil"%>
<%
if(session.getAttribute("AdminID") == null){
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
        <div class="card bg-primary mb-4">
            <div class="card-body">
                Total Departments
                <h4>
                    <%= generalUtil.CountTable("departments") %>
                </h4>
            </div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small stretched-link" href="departments.jsp">View Details</a>
                <div class="small "><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6">
        <div class="card bg-success mb-4">
            <div class="card-body">
                Total Health Tips
                <h4>
                    <%= generalUtil.CountTable("healthtips") %>
                </h4>
            </div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small  stretched-link" href="health-tips.jsp">View Details</a>
                <div class="small "><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6">
        <div class="card bg-warning mb-4">
            <div class="card-body">
                Total Doctors
                <h4>
                    <%= generalUtil.CountTable("doctors") %>
                </h4>
            </div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small  stretched-link" href="doctors.jsp">View Details</a>
                <div class="small "><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6">
        <div class="card bg-danger mb-4">
            <div class="card-body">
                Total Users
                <h4>
                    <%= generalUtil.CountTable("users") %>
                </h4>
            </div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small text-white stretched-link" href="users.jsp">View Details</a>
                <div class="small "><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6">
        <div class="card bg-purple mb-4">
            <div class="card-body">
                Total Appointments
                <h4>
                    <%= generalUtil.CountTable("appointments") %>
                </h4>
            </div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small text-white stretched-link" href="appointments.jsp">View Details</a>
                <div class="small "><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6">
        <div class="card bg-info mb-4">
            <div class="card-body">
                Total Consulting
                <h4>
                    <%= generalUtil.CountTable("consulting") %>
                </h4>
            </div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small  stretched-link" href="consulting.jsp">View Details</a>
                <div class="small "><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6">
        <div class="card bg-black mb-4">
            <div class="card-body">
                Total Contact Us
                <h4>
                    <%= generalUtil.CountTable("contact_us") %>
                </h4>
            </div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small text-white stretched-link" href="contact-us.jsp">View Details</a>
                <div class="small "><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />

<jsp:include page="footer.jsp" />