<%@page import="com.healthcare.modals.User"%>
<%@page import="com.healthcare.dbutil.AccountUtil"%>
<%
if(session.getAttribute("UserID") == null){
	response.sendRedirect("index.jsp");
	return;
}

AccountUtil accountUtil = new AccountUtil();
User user = accountUtil.GetUserByID((int) session.getAttribute("UserID"));

String Message = null;
Message = request.getParameter("message");

String Email = (String) request.getAttribute("Email");

%>

<jsp:include page="header.jsp">
    <jsp:param name="Title" value="Settings" />
</jsp:include>
<div class="container mt-5">
    <div class="section-top-border mt-2">
        <%
			if (Message != null)
			if (Message.equals("UpdateSuccess")) {
		%>
        <div class="alert alert-success alert-dismissible">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>

            Profile updated successfully!
        </div>
        <%
			} else if (Message.equals("UpdateFailed")) {
		%>
        <div class="alert alert-danger alert-dismissible">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>

            Profile update failed!
        </div>
        <%
			} else if (Message.equals("PasswordChangeSuccess")) {
		%>
        <div class="alert alert-success alert-dismissible">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>

            Password changed successfully!
        </div>
        <%
			} else if (Message.equals("PasswordChangeFailed")) {
		%>
        <div class="alert alert-danger alert-dismissible">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>

            Password change failed!
        </div>
        <%
			} else if (Message.equals("IncorrectPassword")) {
		%>
        <div class="alert alert-danger alert-dismissible">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>

            Incorrect password entered! Kindly enter correct password.
        </div>
        <%
			}
		%>
        <div class="row">
            <div class="col-6">
                <h3 class="text-center">General Details</h3>
                <form role="form" method="post" action="Settings">
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
                            <input type="text" class="form-control" id="email" name="phone" placeholder="Enter phone"
                                value="<%= user.getPhone() %>" data-validation-regexp="^([6-9]{1})(\d{9})$"
                                data-validation="custom">
                        </div>
                        <div class="form-group">
                            <label for="age">Age</label>
                            <input type="text" class="form-control" id="age" name="age" placeholder="Enter age"
                                value="<%= user.getAge() %>" data-validation="number"
                                data-validation-allowing="range[1;100]">
                        </div>
                        <div class="form-group">
                            <label for="address">Address</label>
                            <input type="text" class="form-control" id="address" name="address"
                                placeholder="Enter address" value="<%= user.getAddress() %>" data-validation="required">
                        </div>
                    </div>
                    <input type="hidden" name="action" value="update">
                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary">Update
                            Profile</button>
                    </div>
                </form>
            </div>
            <div class="col-6">
                <h3 class="text-center">Change Password</h3>
                <form role="form" method="post" action="Settings">
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