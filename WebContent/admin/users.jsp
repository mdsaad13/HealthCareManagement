<%@page import="com.healthcare.dbutil.AccountUtil"%>
<%@page import="com.healthcare.modals.User"%>
<%@page import="java.util.ArrayList"%>
<%
if(session.getAttribute("AdminID") == null){
	response.sendRedirect("login.jsp");
	return;
}

String Title = "Users";

AccountUtil db = new AccountUtil();
ArrayList<User> list = db.AllUsers();
%>
<jsp:include page="header.jsp">
    <jsp:param name="Title" value="<%= Title %>" />
    <jsp:param name="UsersActive" value="active" />
</jsp:include>

<!-- Add Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Add User</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="POST" action="UsersServlet">
                    <div class="form-group row">
                        <div class="col-md-6">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" id="name" name="name" placeholder="Enter User name"
                                data-validation="required">
                        </div>
                        <div class="col-md-6">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email"
                                placeholder="Enter User email" data-validation="email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" name="password"
                            placeholder="Enter User password" data-validation="strength" data-validation-strength="2">
                    </div>
                    <div class="form-group row">
                        <div class="col-md-6">
                            <label for="phone">Phone</label>
                            <input type="text" class="form-control" id="phone" name="phone"
                                placeholder="Enter User phone" data-validation-regexp="^([6-9]{1})(\d{9})$"
                                data-validation="custom">
                        </div>
                        <div class="col-md-6">
                            <label for="age">Age</label>
                            <input type="number" class="form-control" id="age" name="age" placeholder="Enter User age"
                                data-validation="number" data-validation-allowing="range[1;100]">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name">Address</label>
                        <textarea class="form-control" id="address" name="address" placeholder="Enter User address"
                            rows="5" data-validation="required"></textarea>
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
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateModalTitle"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="POST" action="UsersServlet">
                    <div class="form-group row">
                        <div class="col-md-6">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" id="update-name" name="name"
                                placeholder="Enter User name" data-validation="required">
                        </div>
                        <div class="col-md-6">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="update-email" name="email"
                                placeholder="Enter User email" data-validation="email">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-6">
                            <label for="phone">Phone</label>
                            <input type="text" class="form-control" id="update-phone" name="phone"
                                placeholder="Enter User phone" data-validation-regexp="^([6-9]{1})(\d{9})$"
                                data-validation="custom">
                        </div>
                        <div class="col-md-6">
                            <label for="age">Age</label>
                            <input type="number" class="form-control" id="update-age" name="age"
                                placeholder="Enter User age" data-validation="number"
                                data-validation-allowing="range[1;100]">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name">Address</label>
                        <textarea class="form-control" id="update-address" name="address"
                            placeholder="Enter User address" rows="5" data-validation="required"></textarea>
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
    User added successfully!
</div>
<% } else if(Message.equals("AddFailed")){ %>
<div class="alert alert-danger alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
    <h4><i class="icon fa fa-check"></i> Alert!</h4>
    User add failed!
</div>
<% } else if(Message.equals("UpdateSuccess")){ %>
<div class="alert alert-success alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
    <h4><i class="icon fa fa-check"></i> Alert!</h4>
    User updated successfully!
</div>
<% } else if(Message.equals("UpdateFailed")){ %>
<div class="alert alert-danger alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
    <h4><i class="icon fa fa-check"></i> Alert!</h4>
    User update failed!
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
                    User</button>
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
                        <th>Address</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
              int i = 1;
              for (User item : list) 
              { %>
                    <tr>
                        <td>
                            <%= i %>
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
                            <%= item.getAge() %>
                        </td>
                        <td>
                            <%= item.getAddress() %>
                        </td>
                        <td>
                            <button type="button" class="btn btn-info btn-sm" data-toggle="modal"
                                data-target="#updateModal" data-id="<%= item.getID() %>"
                                data-name="<%= item.getName() %>" data-email="<%= item.getEmail() %>"
                                data-phone="<%= item.getPhone() %>" data-age="<%= item.getAge() %>"
                                data-address="<%= item.getAddress() %>">Edit</button>
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
                        <th>Address</th>
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
        var email = button.data('email');
        var phone = button.data('phone');
        var age = button.data('age');
        var address = button.data('address');

        var modal = $(this);
        modal.find('.modal-title').text('Update User - ' + name);
        modal.find('.modal-body #id').val(id);
        modal.find('.modal-body #update-name').val(name);
        modal.find('.modal-body #update-email').val(email);
        modal.find('.modal-body #update-phone').val(phone);
        modal.find('.modal-body #update-age').val(age);
        modal.find('.modal-body #update-address').val(address);
    });
</script>