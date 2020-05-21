<%@page import="com.healthcare.dbutil.AccountUtil"%>
<%@page import="com.healthcare.Environment"%>
<%@page import="com.healthcare.Formatter"%>
<%@page import="com.healthcare.modals.Doctor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.healthcare.dbutil.DbUtil"%>
<%

String Title = "All Doctors";

DbUtil dbUtil = new DbUtil();
AccountUtil accountUtil = new AccountUtil();

ArrayList<Doctor> AllDocs = accountUtil.AllDoctors();

%>
<jsp:include page="header.jsp">
    <jsp:param name="Title" value="<%= Title %>" />
</jsp:include>
<div class="expert_doctors_area">
    <div class="container">
        <div class="row justify-content-center ">
            <div class="col-lg-6">
                <div class="section_title mb-55 text-center">
                    <h3>Our Doctors</h3>
                </div>
            </div>
        </div>
        <div class="row justify-content-center">
            <% for(Doctor SingleDoc : AllDocs){ %>
            <div class="col-lg-4 col-md-6">
                <div class="single_expert">
                    <div class="expert_thumb" style="text-align: center;">
                        <img class="img-fluid" src="img/doctors/<%= SingleDoc.getImgUrl() %>" style="height: 200px;
    width: auto !important;" alt="">
                    </div>
                    <div class="experts_name text-center">
                        <h3><%= SingleDoc.getName() %></h3>
                        <span><%= SingleDoc.getQualification() %> -
                            <%= dbUtil.GetDeptByID(SingleDoc.getDeptID()).getName() %> Specialist</span>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp" />