<%@page import="com.healthcare.modals.Consulting"%>
<%@page import="com.healthcare.modals.Doctor"%>
<%@page import="java.util.ArrayList"%>
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
ArrayList<Consulting> Data = dbUtil.AllConsultingByUser(UserID);

AccountUtil accountUtil = new AccountUtil();
ArrayList<Doctor> AllDocs = accountUtil.AllDoctors();


String Message = null;
Message = request.getParameter("message");
%>
<jsp:include page="header.jsp">
    <jsp:param name="Title" value="My Consultings" />
</jsp:include>

<div class="container mt-5">
    <div class="section-top-border mt-2">
        <div class="row mb-3">
            <div class="col-10">
                <h3 class="mb-30">My Consultings</h3>
            </div>
            <div class="col-2">
                <a class="popup-with-form btn btn-primary btn-block" href="#test-form">
                    Consult Now
                </a>
            </div>
        </div>
        <%
            if (Message != null)
                if (Message.equals("DeleteSuccess")) {
        %>
        <div class="alert alert-success alert-dismissible">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
            Consulting deleted successfully!
        </div>
        <%
        } else if (Message.equals("DeleteFailed")) {
        %>
        <div class="alert alert-danger alert-dismissible">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
            Consulting delete failed!
        </div>
        <% } else if (Message.equals("AddSuccess")) {
        %>
        <div class="alert alert-success alert-dismissible">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
            Consulting added successfully!
        </div>
        <% } else if (Message.equals("AddFailed")) {
        %>
        <div class="alert alert-danger alert-dismissible">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
            Consulting add failed!
        </div>
        <% } %>
        <div class="progress-table-wrap">
            <div class="progress-table">
                <table class="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Doctor</th>
                            <th>Subject</th>
                            <th>Description</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Response</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% int i = 1; for(Consulting item : Data){ %>
                        <tr>
                            <td>
                                <%=i%>
                            </td>
                            <td>
                                <%= accountUtil.GetDoctorByID(item.getDocID()).getName() %>
                            </td>
                            <td>
                                <%= item.getSubject() %>
                            </td>
                            <td>
                                <%= item.getDescription() %>
                            </td>
                            <td>
                                <%=Formatter.FormatToDateTime(item.getDateTime())%>
                            </td>
                            <td class="font-weight-bold">
                                <%
								if (item.getStatus() == 0) { %>
                                <span class="text-warning">Pending!</span>
                                <% } else if (item.getStatus() == 1) { %>
                                <span class="text-success">Responded!</span>
                                <% } %>
                            </td>
                            <td>
                                <%
								if (item.getStatus() == 0) { %>
                                <button class="btn btn-danger btn-sm"
                                    onclick="DeleteThis('<%= item.getID() %>')">Delete</button>
                                <% } else { %>
                                <%= item.getResponse() %>
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

<form id="test-form" class="white-popup-block mfp-hide" method="POST" action="AddConsulting">
    <div class="popup_box ">
        <div class="popup_inner">
            <h3>
                <span>Consult Doctor</span>
            </h3>
            <form method="POST" action="AddConsulting">
                <div class="row">
                    <div class="col-xl-12">
                        <select class="form-select wide" id="default-select" name="docid">
                            <option data-display="Please select doctor to visit">Please select doctor to
                                visit </option>
                            <% for(Doctor SingleDoc : AllDocs){ %>
                            <option value="<%=SingleDoc.getID()%>"><%=SingleDoc.getName()%> -
                                <%=SingleDoc.getQualification()%></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="col-12">
                        <input type="text" class="form-control" name="subject" placeholder="Subject">
                    </div>
                    <div class="col-12">
                        <textarea class="form-control" name="description" id="description" rows="5"
                            placeholder="Enter your query"></textarea>
                    </div>
                    <div class="col-xl-12 mt-3">
                        <button type="submit" class="boxed-btn3">Consult</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</form>

<jsp:include page="footer.jsp" />

<script>
    function DeleteThis(id) {
        if (confirm('Are you sure you want to delete this?')) {
            window.location.replace('DeleteConsut?id=' + id);
        }
    }
</script>