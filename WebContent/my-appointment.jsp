<%@page import="java.util.ArrayList"%>
<%@page import="com.healthcare.modals.Appointment"%>
<%@page import="com.healthcare.dbutil.DbUtil"%>
<%@page import="com.healthcare.dbutil.AccountUtil"%>
<%@page import="com.healthcare.Formatter"%>
<%
if(session.getAttribute("UserID") == null){
	response.sendRedirect("login.jsp");
	return;
}
int UserID = (int)session.getAttribute("UserID");
DbUtil dbUtil = new DbUtil();
ArrayList<Appointment> AllAppointments = dbUtil.AllAppointmentsByUser(UserID);

AccountUtil accountUtil = new AccountUtil();

String Message = null;
Message = request.getParameter("message");
%>
<jsp:include page="header.jsp">
    <jsp:param name="Title" value="My Appointment" />
</jsp:include>
<div class="container mt-5">
    <div class="section-top-border mt-2">
        <h3 class="mb-30">My Appointments</h3>
        <%
            if (Message != null)
                if (Message.equals("DeleteSuccess")) {
        %>
        <div class="alert alert-success alert-dismissible">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
            Appointment deleted successfully!
        </div>
        <%
        } else if (Message.equals("DeleteFailed")) {
        %>
        <div class="alert alert-danger alert-dismissible">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
            Appointment delete failed!
        </div>
        <% } %>
        <div class="progress-table-wrap">
            <div class="progress-table">
                <table class="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Doctor</th>
                            <th>Booked For</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% int i = 1; for(Appointment item : AllAppointments){ %>
                        <tr>
                            <td>
                                <%=i%>
                            </td>
                            <td>
                                <%= accountUtil.GetDoctorByID(item.getDocID()).getName() %>
                            </td>
                            <td>
                                <%= item.getName() %>
                            </td>
                            <td>
                                <%= item.getEmail() %>
                            </td>
                            <td>
                                <%= item.getPhone() %>
                            </td>
                            <td>
                                <%=Formatter.FormatToDate(item.getDate()+" 00:00:00")%>
                            </td>
                            <td>
                                <%= item.getTime() %>
                            </td>
                            <td class="font-weight-bold">
                                <%
								if (item.getStatus() == 0) { %>
                                <span class="text-warning">Pending!</span>
                                <% } else if (item.getStatus() == 1) { %>
                                <span class="text-success">Accepted!</span>
                                <% } else if (item.getStatus() == 2) { %>
                                <span class="text-danger">Rejected!</span>
                                <% }
							%>
                            </td>
                            <td>
                                <%
								if (item.getStatus() == 0) { %>
                                <button class="btn btn-danger btn-sm"
                                    onclick="DeleteThis('<%= item.getID() %>')">Delete</button>
                                <% } else { %>
                                <span class="text-muted">No Action required</span>
                                <% }
							%>
                            </td>
                        </tr>
                        <% i++; } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />

<script>
    function DeleteThis(id) {
        if (confirm('Are you sure you want to delete this appointment')) {
            window.location.replace('DeleteAppointment?id=' + id);
        }
    }
</script>