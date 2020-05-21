<%@page import="com.healthcare.Environment"%>
<%
if(session.getAttribute("DoctorID") != null){
	response.sendRedirect("index.jsp");
	return;
}

String Email = (String) request.getAttribute("Email");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Login - <%= Environment._SoftwareName %> Admin</title>
    <link href="../dashboard_assets/css/styles.css" rel="stylesheet" />
    <link href="../dashboard_assets/plugins/DataTables/datatables.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous">
    </script>
    <link href="../dashboard_assets/css/custom.css" rel="stylesheet" />
</head>

<body class="bg-primary">
    <div id="layoutAuthentication">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-5">
                    <div class="card shadow-lg border-0 rounded-lg mt-5">
                        <div class="card-header">
                            <h3 class="text-center font-weight-light my-4">
                                <%= Environment._SoftwareShortName %>
                                - Doctor Login
                            </h3>
                        </div>
                        <div class="card-body">
                            <%
                            String msg = "";
                            msg = (String) request.getAttribute("message");
                            %> <%
                                if(msg == "InvalidCreds") {
                            %>
                            <div class="alert alert-danger" role="alert">
                                <strong>Incorrect email or password!</strong>
                            </div>
                            <% } %>
                            <form method="POST" action="DoctorLogin">
                                <div class="form-group">
                                    <label class="small mb-1" for="email">
                                        Email
                                    </label>
                                    <input class="form-control py-4" id="email" type="email"
                                        placeholder="Enter email address" name="email" />
                                </div>
                                <div class="form-group">
                                    <label class="small mb-1" for="email">
                                        Password
                                    </label>
                                    <input class="form-control py-4" id="password" type="password"
                                        placeholder="Enter password" name="password" />
                                </div>
                                <div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
                                    <button type="submit" class="btn btn-primary btn-block">Login</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../dashboard_assets/bootstrap/js/jquery-3.3.1.slim.min.js"></script>
    <script src="../dashboard_assets/bootstrap/js/popper.min.js"></script>
    <script src="../dashboard_assets/bootstrap/js/bootstrap.bundle.min.js">
    </script>
    <script src="../dashboard_assets/js/scripts.js"></script>
    <script src="js/scripts.js"></script>
</body>

</html>