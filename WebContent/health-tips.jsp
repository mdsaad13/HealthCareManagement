<%@page import="com.healthcare.dbutil.AccountUtil"%>
<%@page import="com.healthcare.Environment"%>
<%@page import="com.healthcare.Formatter"%>
<%@page import="com.healthcare.modals.HealthTip"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.healthcare.dbutil.DbUtil"%>
<%

String Title = "Health Tips";

DbUtil dbUtil = new DbUtil();

ArrayList<HealthTip> AllHealthTips = dbUtil.AllTips();

%>
<jsp:include page="header.jsp">
    <jsp:param name="Title" value="<%= Title %>" />
</jsp:include>
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
        </div>
    </div>
</div>
<jsp:include page="footer.jsp" />