<%@page import="com.healthcare.modals.Department"%>
<%@page import="com.healthcare.dbutil.DbUtil"%>
<%@page import="com.healthcare.dbutil.AccountUtil"%>
<%@page import="com.healthcare.modals.Doctor"%>
<%@page import="java.util.ArrayList"%>
<%
if(session.getAttribute("DoctorID") == null){
	response.sendRedirect("login.jsp");
	return;
}

AccountUtil accountUtil = new AccountUtil();
Doctor user = accountUtil.GetDoctorByID((int) session.getAttribute("DoctorID"));

DbUtil dbUtil = new DbUtil();

ArrayList<Department> AllDepartments = dbUtil.AllDepartment(true);

String Message = null;
Message = request.getParameter("message");

String Title = "Settings";
%>
<jsp:include page="header.jsp">
    <jsp:param name="Title" value="<%= Title %>" />
</jsp:include>
<style>
    .img-thumbnail {
        height: 200px;
    }
</style>
<div class="row mt-4 mb-3">
    <div class="col-8">
        <h2 class=""><%= Title %></h2>
    </div>
    <div class="col-4">
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item">Dashboard</li>
            <li class="breadcrumb-item active"><%= Title %></li>
        </ol>
    </div>
</div>
<%
			if (Message != null)
			if (Message.equals("UpdateSuccess")) {
		%>
<div class="alert alert-success alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>

    Profile updated successfully!
</div>
<%
			} else if (Message.equals("UpdateFailed")) {
		%>
<div class="alert alert-danger alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>

    Profile update failed!
</div>
<%
			} else if (Message.equals("PasswordChangeSuccess")) {
		%>
<div class="alert alert-success alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>

    Password changed successfully!
</div>
<%
			} else if (Message.equals("PasswordChangeFailed")) {
		%>
<div class="alert alert-danger alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>

    Password change failed!
</div>
<%
			} else if (Message.equals("IncorrectPassword")) {
		%>
<div class="alert alert-danger alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>

    Incorrect password entered! Kindly enter correct password.
</div>
<%
			}
		%>
<div class="card mb-4">
    <div class="card-header">
        <i class="fas fa-table mr-1"></i><%= Title %>
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-12 text-center mb-4">
                <img src="../img/doctors/<%= user.getImgUrl() %>" class="img-thumbnail">
            </div>
            <div class="col-6">
                <h3 class="text-center">General Details</h3>
                <form role="form" method="post" action="DoctorSettings" enctype="multipart/form-data">
                    <div class="box-body">
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" id="name" name="name" placeholder="Enter name"
                                value="<%= user.getName() %>" data-validation="required">
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter email"
                                value="<%= user.getEmail() %>" data-validation="email">
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone</label>
                            <input type="text" class="form-control" id="phone" name="phone" placeholder="Enter phone"
                                value="<%= user.getPhone() %>" data-validation="required">
                        </div>
                        <div class="form-group">
                            <label for="age">Age</label>
                            <input type="text" class="form-control" id="age" name="age" placeholder="Enter age"
                                value="<%= user.getAge() %>" data-validation="required">
                        </div>
                        <div class="form-group">
                            <label for="name">Address</label>
                            <textarea class="form-control" id="update-address" name="address"
                                placeholder="Enter Doctor address" rows="5"><%= user.getAddress() %></textarea>
                        </div>
                        <div class="form-group">
                            <label for="name">Department</label>
                            <select class="custom-select" name="deptid" id="update-deptid">
                                <option value="">Select Department</option>
                                <% for(Department Depts : AllDepartments){ %>
                                <option value="<%=Depts.getID()%>"
                                    <% if(Depts.getID() == user.getDeptID()) out.print("selected"); %>>
                                    <%=Depts.getName()%></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="update-qualification">Qualification</label>
                            <input type="text" class="form-control" id="update-qualification" name="qualification"
                                placeholder="Enter Doctor qualification" value="<%= user.getQualification() %>">
                        </div>
                        <div class="form-group">
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="validatedCustomFile" name="imgurl">
                                <label class="custom-file-label" for="validatedCustomFile">Upload Doctor image</label>
                            </div>
                        </div>

                    </div>
                    <input type="hidden" name="oldimgurl" id="update-oldimgurl">
                    <input type="hidden" name="id" id="id">
                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary">Update
                            Profile</button>
                    </div>
                </form>
            </div>
            <div class="col-6">
                <h3 class="text-center">Change Password</h3>
                <form role="form" method="post" action="DoctorChangePassword">
                    <div class="box-body">
                        <div class="form-group">
                            <label for="password">Current Password</label> <input type="password" class="form-control"
                                name="password" id="password" data-validation="strength" data-validation-strength="2" />
                        </div>
                        <div class="form-group">
                            <label for="new_password">New Password</label>
                            <input type="password" class="form-control" name="new_password_confirmation"
                                id="inputPassword3" data-validation="strength" data-validation-strength="2" />
                        </div>
                        <div class="form-group">
                            <label for="re_new_password">Re-Enter New Password</label>
                            <input type="password" class="form-control" name="new_password" id="inputPassword3"
                                data-validation="confirmation" />
                        </div>
                    </div>
                    <input type="hidden" name="action" value="changepassword">
                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary">Change
                            Password</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />