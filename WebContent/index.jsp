<%@page import="com.healthcare.dbutil.AccountUtil"%>
<%@page import="com.healthcare.modals.Doctor"%>
<%@page import="com.healthcare.Environment"%>
<%@page import="com.healthcare.Formatter"%>
<%@page import="com.healthcare.modals.HealthTip"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.healthcare.dbutil.DbUtil"%>
<%

String Title = "Home";

DbUtil dbUtil = new DbUtil();
AccountUtil accountUtil = new AccountUtil();

ArrayList<HealthTip> AllHealthTips = dbUtil.OnlyHomeScreenTips();

ArrayList<Doctor> AllDocs = accountUtil.LimitedDoctors();
%>
<jsp:include page="header.jsp">
    <jsp:param name="Title" value="<%= Title %>" />
    <jsp:param name="IndexActive" value="active" />
</jsp:include>

<style>
    .quality_area {
        padding-top: 10px;
    }

    .expert_doctors_area {
        padding-bottom: 0;
    }
</style>
<!-- slider_area_start -->
<div class="slider_area">
    <div class="slider_active owl-carousel">
        <div class="single_slider  d-flex align-items-center slider_bg_1 overlay">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="slider_text ">
                            <span>the best medical center</span>
                            <h3> <span>Bringing health</span> <br>
                                to life for the whole family.</h3>
                            <a href="book-appointment.jsp" class="boxed-btn5">Book An Appointment
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- slider_area_end -->

<!-- expert_doctors_area_start -->
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
            <div class="col-12 text-center mb-4">
                <a href="doctors.jsp" class="btn btn-link btn-block">View All</a>
            </div>
        </div>
    </div>
</div>
<!-- expert_doctors_area_end -->

<!-- quality_area_start  -->
<div class="quality_area">
    <div class="container">
        <div class="row justify-content-center ">
            <div class="col-lg-6">
                <div class="section_title mb-55 text-center">
                    <h3>Health Tips</h3>
                </div>
            </div>
        </div>
        <div class="row">

            <% for(HealthTip SingleTips : AllHealthTips){ %>
            <div class="col-lg-4 col-md-6">
                <div class="single_quality">
                    <div class="icon">
                        <i class="flaticon-doctor"></i>
                    </div>
                    <h3><%=SingleTips.getTitle()%></h3>
                    <p>
                        <%=SingleTips.getDescription()%>
                    </p>
                    <p><small><%= Formatter.FormatToDate(SingleTips.getDateTime())%></small></p>
                </div>
            </div>
            <% } %>
            <div class="col-12 text-center mb-4">
                <a href="health-tips.jsp" class="btn btn-link btn-block">View All</a>
            </div>
        </div>
    </div>
</div>
<!-- quality_areaend  -->

<!-- Emergency_contact start -->
<div class="Emergency_contact">
    <div class="Emergency_contact_inner ">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <div class="single_emergency">
                        <div class="info">
                            <span>We are here for you</span>
                            <h3>Book Appointment</h3>
                        </div>
                        <div class="info_button">
                            <a href="book-appointment.jsp" class="boxed-btn3-white">Book Appointment
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="single_emergency align-items-center d-flex justify-content-end">
                        <div class="icon">
                            <i class="flaticon-call"></i>
                        </div>
                        <div class="info">
                            <span>Call us for appointment</span>
                            <h3><%= Environment._OwnerMobile %></h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Emergency_contact end -->
<jsp:include page="footer.jsp" />