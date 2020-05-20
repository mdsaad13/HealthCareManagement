<%@page import="com.healthcare.Formatter"%>
<%@page import="com.healthcare.modals.HealthTip"%>
<%@page import="com.healthcare.dbutil.DbUtil"%>
<%@page import="java.util.ArrayList"%>
<%
	if (session.getAttribute("AdminID") == null) {
	response.sendRedirect("login.jsp");
	return;
}

String Title = "Health Tips";

DbUtil db = new DbUtil();
ArrayList<HealthTip> list = db.AllTips();
%>
<jsp:include page="header.jsp">
    <jsp:param name="Title" value="<%=Title%>" />
    <jsp:param name="HealthtipsActive" value="active" />
</jsp:include>

<!-- Add Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Add Health
                    Tip</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="POST" action="HealthTipsServlet">
                    <div class="form-group">
                        <label for="Title">Title</label>
                        <input type="text" class="form-control" id="Title" name="Title" placeholder="Enter Title">
                    </div>
                    <div class="form-group">
                        <label for="Title">Description</label>
                        <textarea name="Description" id="Description" rows="5" placeholder="Enter Description"
                            class="form-control"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="Visibility">Visibility</label>
                        <select class="form-control" id="Visibility" name="Visibility">
                            <option value="0">Hide on Home Page</option>
                            <option value="1">Show on Home Page</option>
                        </select>
                    </div>
                    <input type="hidden" name="action" value="add">
                    <div class="form-group mt-5 text-center">
                        <button type="submit" class="btn btn-primary w-50">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Update Modal -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateModalTitle"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="POST" action="HealthTipsServlet">
                    <div class="form-group">
                        <label for="update-Title">Title</label>
                        <input type="text" class="form-control" id="update-Title" name="Title"
                            placeholder="Enter Title">
                    </div>
                    <div class="form-group">
                        <label for="update-Description">Description</label>
                        <textarea name="Description" id="update-Description" rows="5" placeholder="Enter Description"
                            class="form-control"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="update-Visibility">Visibility</label>
                        <select class="form-control" id="update-Visibility" name="Visibility">
                            <option value="0">Hide on Home Page</option>
                            <option value="1">Show on Home Page</option>
                        </select>
                    </div>
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" id="id">
                    <div class="form-group mt-5 text-center">
                        <button type="submit" class="btn btn-primary w-50">Update</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="row mt-4 mb-3">
    <div class="col-8">
        <h2 class=""><%=Title%></h2>
    </div>
    <div class="col-4">
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
            <li class="breadcrumb-item active"><%=Title%></li>
        </ol>
    </div>
</div>
<%
	String Message = null;
Message = request.getParameter("message");
if (Message != null)
	if (Message.equals("AddSuccess")) {
%>
<div class="alert alert-success alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
    Health Tip added successfully!
</div>
<%
	} else if (Message.equals("AddFailed")) {
%>
<div class="alert alert-danger alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
    Health Tip add failed!
</div>
<%
	} else if (Message.equals("UpdateSuccess")) {
%>
<div class="alert alert-success alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
    Health Tip updated successfully!
</div>
<%
	} else if (Message.equals("UpdateFailed")) {
%>
<div class="alert alert-danger alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
    Health Tip update failed!
</div>
<%
	} else if (Message.equals("DeleteSuccess")) {
%>
<div class="alert alert-success alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
    Health Tip deleted successfully!
</div>
<%
	} else if (Message.equals("DeleteFailed")) {
%>
<div class="alert alert-danger alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
    Health Tip delete failed!
</div>
<%
	}
%>
<div class="card mb-4">
    <div class="card-header">
        <div class="row">
            <div class="col-10">
                <i class="fas fa-table mr-1"></i><%=Title%>
            </div>
            <div class="col-2 text-right">
                <button class="btn btn-primary text-right" data-toggle="modal" data-target="#exampleModalCenter">Add
                    Health Tip</button>
            </div>
        </div>

    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table" id="myDataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Visibility</th>
                        <th>Added On</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
						int i = 1;
					for (HealthTip item : list) {
					%>
                    <tr>
                        <td><%=i%></td>
                        <td><%=item.getTitle()%></td>
                        <td><%=item.getDescription()%></td>
                        <td class="font-weight-bold">
                            <%
								if (item.getVisibility() == 0) { %>
                            <span class="text-warning">Hidden on home screen</span>
                            <% } else { %>
                            <span class="text-success">Displaying on home screen</span>
                            <% }
							%>
                        </td>
                        <td><%=Formatter.FormatToDateTime(item.getDateTime())%></td>
                        <td>
                            <button type="button" class="btn btn-info btn-sm" data-toggle="modal"
                                data-target="#updateModal" data-id="<%=item.getID()%>" data-title="<%=item.getTitle()%>"
                                data-description="<%=item.getDescription()%>"
                                data-visibility="<%=item.getVisibility()%>">
                                Edit
                            </button>
                            <button type="button" class="btn btn-danger btn-sm"
                                onclick="DeleteThis('<%=item.getID()%>', '<%=item.getTitle()%>')">
                                Delete
                            </button>
                        </td>
                    </tr>
                    <%
						i++;
					}
					%>
                </tbody>
                <tfoot>
                    <tr>
                        <th>#</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Visibility</th>
                        <th>Added On</th>
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

    $('#updateModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var id = button.data('id');
        var title = button.data('title');
        var description = button.data('description');
        var visibility = button.data('visibility');

        var modal = $(this);
        modal.find('.modal-title').text('Update Health Tip - ' + title);
        modal.find('.modal-body #id').val(id);
        modal.find('.modal-body #update-Title').val(title);
        modal.find('.modal-body #update-Description').val(description);
        modal.find('.modal-body #update-Visibility').val(visibility).change();
    });

    function DeleteThis(id, title) {
        if (confirm('Are you sure you want to delete ' + title)) {
            window.location.replace('HealthTipsServlet?tipid=' + id);
        }
    }
</script>