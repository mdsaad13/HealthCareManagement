<%@page import="com.healthcare.modals.Appointment"%>
<%@page import="com.healthcare.Formatter"%>
<%@page import="com.healthcare.dbutil.DbUtil"%>
<%@page import="java.util.ArrayList"%>
<%
if(session.getAttribute("DoctorID") == null){
	response.sendRedirect("login.jsp");
	return;
}

String Title = "Appointments";

DbUtil db = new DbUtil();
ArrayList<Appointment> list = db.AllAppointmentsByDoc((int) session.getAttribute("DoctorID"));
%>
<jsp:include page="header.jsp">
    <jsp:param name="Title" value="<%= Title %>" />
    <jsp:param name="AppointmentsActive" value="active" />
</jsp:include>

<div class="row mt-4 mb-3">
    <div class="col-8">
        <h2 class=""><%= Title %></h2>
    </div>
    <div class="col-4">
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
            <li class="breadcrumb-item active"><%= Title %></li>
        </ol>
    </div>
</div>
<%
   String Message = null;
   Message = request.getParameter("message");
    if(Message != null)
  if(Message.equals("StatusUpdateSuccess")){ %>
<div class="alert alert-success alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
    <h4><i class="icon fa fa-check"></i> Alert!</h4>
    Status updated successfully!
</div>
<% } else if(Message.equals("StatusUpdateFailed")){ %>
<div class="alert alert-danger alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
    <h4><i class="icon fa fa-check"></i> Alert!</h4>
    Status update failed!
</div>
<% } %>
<div class="card mb-4">
    <div class="card-header">
        <div class="row">
            <div class="col-10">
                <i class="fas fa-table mr-1"></i><%= Title %>
            </div>
            <div class="col-2 text-right">
            </div>
        </div>

    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table" id="myDataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Age</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
              int i = 1;
              for (Appointment item : list) 
              { %>
                    <tr>
                        <td>
                            <%= i %>
                        </td>
                        <td>
                            <%= item.getName() %>
                        </td>
                        <td>
                            <%= item.getEmail()%>
                        </td>
                        <td>
                            <%= item.getPhone() %>
                        </td>
                        <td>
                            <%= item.getAge() %>
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
                            <div class="btn-group">
                                <button type="button" class="btn btn-danger btn-sm dropdown-toggle"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Action
                                </button>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#"
                                        onclick="UpdateStatus('<%= item.getID() %>', 1)">Accept</a>
                                    <a class="dropdown-item" href="#"
                                        onclick="UpdateStatus('<%= item.getID() %>', 2)">Reject</a>
                                </div>
                            </div>
                            <% } else { %>
                            <span class="text-muted">No Action required</span>
                            <% }
							%>
                        </td>
                    </tr>
                    <%  i++;
              }
              %>
                </tbody>
                <tfoot>
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Age</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </tfoot>

            </table>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />
<script>
    $(document).ready(function () {
        $('#myDataTable').DataTable({
            responsive: true
        });
    });

    function UpdateStatus(id, status) {
        if (confirm('Are you sure you want to update status')) {
            window.location.replace('../admin/ApointmentStatusServlet?id=' + id + '&status=' + status + '&redirect=doctor');
        }
    }
</script>