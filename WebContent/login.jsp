<%
if(session.getAttribute("UserID") != null){
	response.sendRedirect("index.jsp");
	return;
}

String Email = (String) request.getAttribute("Email");

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
                            <span>Login</span>
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
                        <form action="Login" method="POST">
                            <div class="row">
                                <div class="col-12">
                                    <input type="email" placeholder="Email Address" name="email" value="<%= (Email != null)?Email:"" %>" data-validation="email">
                                </div>
                                <div class="col-12">
                                    <input type="password" placeholder="Password" name="password" data-validation="required">
                                </div>
                                <div class="col-xl-12">
                                    <button type="submit" class="boxed-btn3">Login</button>
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