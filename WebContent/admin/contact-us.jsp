<%@page import="com.healthcare.Formatter"%>
<%@page import="com.healthcare.modals.Enquiry"%>
<%@page import="com.healthcare.dbutil.DbUtil"%>
<%@page import="java.util.ArrayList"%>
<%
if(session.getAttribute("AdminID") == null){
	response.sendRedirect("login.jsp");
	return;
}

String Title = "Enquiries";

DbUtil db = new DbUtil();
ArrayList<Enquiry> list = db.AllEnquiries();
%>
<jsp:include page="header.jsp">
    <jsp:param name="Title" value="<%= Title %>" />
    <jsp:param name="ContactActive" value="active" />
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
                        <th>Subject</th>
                        <th>Message</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                    <%
              int i = 1;
              for (Enquiry item : list) 
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
                            <%= item.getSubject() %>
                        </td>
                        <td>
                            <%= item.getMessage() %>
                        </td>
                        <td><%=Formatter.FormatToDateTime(item.getDateTime())%></td>
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
                        <th>Subject</th>
                        <th>Message</th>
                        <th>Date</th>
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
</script>