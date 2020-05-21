<%@page import="com.healthcare.dbutil.AccountUtil"%>
<%@page import="com.healthcare.modals.Consulting"%>
<%@page import="com.healthcare.Formatter"%>
<%@page import="com.healthcare.dbutil.DbUtil"%>
<%@page import="java.util.ArrayList"%>
<%
if(session.getAttribute("DoctorID") == null){
	response.sendRedirect("login.jsp");
	return;
}

String Title = "View Consultings";

DbUtil db = new DbUtil();
ArrayList<Consulting> list = db.AllConsultingByDoctor((int) session.getAttribute("DoctorID"));

AccountUtil accountUtil = new AccountUtil();

%>
<jsp:include page="header.jsp">
    <jsp:param name="Title" value="<%= Title %>" />
    <jsp:param name="ConsultingActive" value="active" />
</jsp:include>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Reply</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="POST" action="ConsultingResponse">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Response</label>
                        <textarea name="response" id="response" cols="30" rows="10" class="form-control"
                            placeholder="Enter response..." data-validation="required"></textarea>
                        <input type="hidden" name="id" id="id">
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>

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
  if(Message.equals("ResponseSucess")){ %>
<div class="alert alert-success alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
    <h4><i class="icon fa fa-check"></i> Alert!</h4>
    Department added successfully!
</div>
<% } else if(Message.equals("ResponseFailed")){ %>
<div class="alert alert-danger alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
    <h4><i class="icon fa fa-check"></i> Alert!</h4>
    Department add failed!
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
                        <th>User</th>
                        <th>Subject</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th>Date</th>
                        <th>Response</th>
                    </tr>
                </thead>
                <tbody>
                    <%
              int i = 1;
              for (Consulting item : list) 
              { %>
                    <tr>
                        <td>
                            <%= i %>
                        </td>
                        <td>
                            <%= accountUtil.GetUserByID(item.getUserID()).getName() %>
                        </td>
                        <td>
                            <%= item.getSubject() %>
                        </td>
                        <td>
                            <%= item.getDescription() %>
                        </td>
                        <td class="font-weight-bold">
                            <%
								if (item.getStatus() == 0) { %>
                            <span class="text-warning">Pending!</span>
                            <% } else { %>
                            <span class="text-success">Responded!</span>
                            <% }
							%>
                        </td>
                        <td><%=Formatter.FormatToDateTime(item.getDateTime())%></td>
                        <td>
                            <%
								if (item.getStatus() == 0) { %>
                            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal"
                                data-target="#exampleModalCenter" data-id="<%= item.getID() %>">
                                Reply
                            </button>
                            <% } else { 
                                out.print(item.getResponse()); 
                            }
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
                        <th>User</th>
                        <th>Subject</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th>Response</th>
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

    $('#exampleModalCenter').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var id = button.data('id');

        var modal = $(this);
        modal.find('.modal-body #id').val(id);

    });
</script>