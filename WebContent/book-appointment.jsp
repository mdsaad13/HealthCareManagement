<%@page import="com.healthcare.modals.User"%>
<%@page import="com.healthcare.modals.Doctor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.healthcare.dbutil.AccountUtil"%>
<%
int UserID = 0;
String Name = "";
int Age = 0;
String Phone = "";
String Email = "";

AccountUtil accountUtil = new AccountUtil();
ArrayList<Doctor> AllDocs = accountUtil.AllDoctors();

if(session.getAttribute("UserID") != null){
	UserID = (int)session.getAttribute("UserID");
	User user = accountUtil.GetUserByID(UserID);
	Name = user.getName();
	Age = user.getAge();
	Phone = user.getAddress();
	Email = user.getEmail();
}

String Message = null;
Message = request.getParameter("message");
%>

<jsp:include page="header.jsp">
    <jsp:param name="Title" value="Book Appointment" />
</jsp:include>
<div class="book_apointment_area">
    <div class="container">
        <div class="row justify-content-end">
            <div class="col-lg-7">
                <div class="popup_box ">
                    <div class="popup_inner">
                        <h3>
                            Book An
                            <span>Appointment</span>
                        </h3>
                        <%
                        if (Message != null)
                        if (Message.equals("AddSuccess")) {
                    %>
                        <div class="alert alert-success alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                            Appointment booked successfully!
                        </div>
                        <%
                        } else if (Message.equals("AddFailed")) {
                    %>
                        <div class="alert alert-danger alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                            Appointment booking failed!
                        </div>
                        <%
                        } %>
                        <form action="AddAppointment" method="POST">
                            <div class="row">
                                <div class="col-xl-12">
                                    <select class="form-select wide" id="default-select" name="docid" data-validation="required">
                                        <option data-display="Please select doctor to visit">Please select doctor to
                                            visit </option>
                                        <% for(Doctor SingleDoc : AllDocs){ %>
                                        <option value="<%=SingleDoc.getID()%>"><%=SingleDoc.getName()%> -
                                            <%=SingleDoc.getQualification()%></option>
                                        <% } %>
                                    </select>
                                </div>
                                <div class="col-xl-9">
                                    <input type="text" placeholder="Your name" name="name" value="<%=Name%>" data-validation="required">
                                </div>
                                <div class="col-xl-3">
                                    <input type="text" placeholder="Your age" name="age"
                                        value="<% if(Age>0) out.print(Age);%>" data-validation="number" data-validation-allowing="range[1;100]">
                                </div>
                                <div class="col-xl-6">
                                    <input type="text" placeholder="Phone number" name="phone" value="<%=Phone%>" data-validation-regexp="^([6-9]{1})(\d{9})$" data-validation="custom">
                                </div>
                                <div class="col-xl-6">
                                    <input type="email" placeholder="Email Address" name="email" value="<%=Email%>" data-validation="email">
                                </div>
                                <div class="col-xl-6">
                                    <input class="datepicker" placeholder="Appointment Date" name="date" data-validation="required">
                                </div>
                                <div class="col-xl-6">
                                    <input class="timepicker" placeholder="Suitable time" name="time" data-validation="required">
                                </div>
                                <div class="col-xl-12">
                                    <button type="submit" class="boxed-btn3">Make an Appointment</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp" />