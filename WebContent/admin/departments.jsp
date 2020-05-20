<%@page import="com.healthcare.dbutil.DbUtil"%>
<%@page import="com.healthcare.modals.Department"%>
<%@page import="java.util.ArrayList"%>
<%
if(session.getAttribute("AdminID") == null){
	response.sendRedirect("login.jsp");
	return;
}

String Title = "Departments";

DbUtil db = new DbUtil();
ArrayList<Department> list = db.AllDepartment(false);
%>
<jsp:include page="header.jsp">
  <jsp:param name="Title" value="<%= Title %>" />
  <jsp:param name="DepartmentsActive" value="active" />
</jsp:include>

<!-- Add Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
  aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Add Department</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form method="POST" action="DepartmentServlet">
          <div class="form-group">
            <label for="name">Department Name</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="Enter department name">
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
        <form method="POST" action="DepartmentServlet">
          <div class="form-group">
            <label for="name">Department Name</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="Enter department name">
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
  if(Message.equals("AddSuccess")){ %>
<div class="alert alert-success alert-dismissible">
  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
  <h4><i class="icon fa fa-check"></i> Alert!</h4>
  Department added successfully!
</div>
<% } else if(Message.equals("AddFailed")){ %>
<div class="alert alert-danger alert-dismissible">
  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
  <h4><i class="icon fa fa-check"></i> Alert!</h4>
  Department add failed!
</div>
<% } else if(Message.equals("UpdateSuccess")){ %>
<div class="alert alert-success alert-dismissible">
  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
  <h4><i class="icon fa fa-check"></i> Alert!</h4>
  Department updated successfully!
</div>
<% } else if(Message.equals("UpdateFailed")){ %>
<div class="alert alert-danger alert-dismissible">
  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
  <h4><i class="icon fa fa-check"></i> Alert!</h4>
  Department update failed!
</div>
<% }
  %>
<div class="card mb-4">
  <div class="card-header">
    <div class="row">
      <div class="col-10">
        <i class="fas fa-table mr-1"></i><%= Title %>
      </div>
      <div class="col-2 text-right">
        <button class="btn btn-primary text-right" data-toggle="modal" data-target="#exampleModalCenter">Add
          Department</button>
      </div>
    </div>

  </div>
  <div class="card-body">
    <div class="table-responsive">
      <table class="table" id="myDataTable" width="100%" cellspacing="0">
        <thead>
          <tr>
            <th>#</th>
            <th>ID</th>
            <th>Name</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <%
              int i = 1;
              for (Department item : list) 
              { %>
          <tr>
            <td>
              <%= i %>
            </td>
            <td>
              <%= item.getID() %>
            </td>
            <td>
              <%= item.getName() %>
            </td>
            <td>
              <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#updateModal"
                data-id="<%= item.getID() %>" data-name="<%= item.getName() %>">Edit</button>
            </td>
          </tr>
          <%  i++;
              }
              %>
        </tbody>
        <tfoot>
          <tr>
            <th>#</th>
            <th>ID</th>
            <th>Name</th>
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
    var name = button.data('name');
    var modal = $(this);
    modal.find('.modal-title').text('Update Department - ' + name);
    modal.find('.modal-body #id').val(id);
    modal.find('.modal-body #name').val(name);
  });
</script>