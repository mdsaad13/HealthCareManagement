<%
if(session.getAttribute("UserID") != null){
	response.sendRedirect("index.jsp");
	return;
}

%>

<jsp:include page="header.jsp">
    <jsp:param name="Title" value="Login" />
</jsp:include>
<div class="book_apointment_area">
    <div class="container">
        <div class="row justify-content-end">
            <div class="col-lg-7">
                <div class="popup_box ">
                    <div class="popup_inner">
                        <h3>
                            <span>Register</span>
                        </h3>
                        <%
                        String msg = "";
                        msg = (String) request.getAttribute("message");
                    %> <%
                        if (msg == "RegisterSuccess") {
                    %>
                        <div class="alert alert-success" role="alert">
                            <strong>Account successfully registered!</strong><br>
                            Kindly login
                        </div>
                        <%
                        } else if(msg == "InvalidCreds") {
                    %>
                        <div class="alert alert-danger" role="alert">
                            <strong>Incorrect email or password!</strong>
                        </div>
                        <% } %>
                        <form action="Register" method="POST">
                            <div class="row">
                                <div class="col-12">
                                    <input type="text" placeholder="Name" name="name" data-validation="required">
                                </div>
                                <div class="col-12">
                                    <input type="email" placeholder="Email Address" name="email"
                                        data-validation="email">
                                </div>
                                <div class="col-12">
                                    <input type="text" placeholder="Mobile number" name="phone"
                                        data-validation-regexp="^([6-9]{1})(\d{9})$" data-validation="custom">
                                </div>
                                <div class="col-12">
                                    <input type="text" placeholder="Age" name="age" data-validation="number"
                                        data-validation-allowing="range[1;100]">
                                </div>
                                <div class="col-12">
                                    <input type="text" placeholder="Address" name="address" data-validation="required">
                                </div>
                                <div class="col-12">
                                    <input type="password" class="form-control" name="password_confirmation"
                                        placeholder="Enter password" id="inputPassword3" data-validation="strength"
                                        data-validation-strength="2" />
                                </div>
                                <div class="col-12">
                                    <input type="password" class="form-control" id="inputPassword3"
                                        placeholder="Re-Enter password" name="password" data-validation="confirmation">
                                </div>
                                <div class="col-xl-12">
                                    <button type="submit" class="boxed-btn3">Register</button>
                                </div>
                                <div class="col-md-12 mt-3">
                                    <p>
                                        <a href="login.jsp">Already registered?</a>
                                    </p>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp" />