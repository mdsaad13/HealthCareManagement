<%@page import="com.healthcare.Environment"%>
<%
String Message = null;
Message = request.getParameter("message");
%>
<jsp:include page="header.jsp">
    <jsp:param name="Title" value="Contact Us" />
</jsp:include>
<!-- bradcam_area_start  -->
<div class="bradcam_area breadcam_bg_1">
    <div class="container">
        <div class="row">
            <div class="col-xl-12">
                <div class="bradcam_text">
                    <h3>Contact</h3>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- bradcam_area_end  -->

<!-- ================ contact section start ================= -->
<section class="contact-section" id="getintouch">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h2 class="contact-title">Get in Touch</h2>
                <%
                        if (Message != null)
                        if (Message.equals("AddSuccess")) {
                    %>
                <div class="alert alert-success alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                    Enquiry added successfully! <br> We will get back to you in 2-4 working days
                </div>
                <%
                        } else if (Message.equals("AddFailed")) {
                    %>
                <div class="alert alert-danger alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                    Enquiry add failed!
                </div>
                <%
                        } %>
            </div>
            <div class="col-lg-8">
                <form class="form-contact contact_form" action="AddEnquiry" method="post" id="contactForm">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <input class="form-control" name="name" id="name" type="text"
                                    placeholder="Enter your name" data-validation="required">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <input class="form-control" name="email" id="email" type="email" placeholder="Email" data-validation="email">
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group">
                                <input class="form-control" name="subject" id="subject" type="text"
                                    placeholder="Enter Subject" data-validation="required">
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group">
                                <textarea class="form-control w-100" name="message" id="message" cols="30" rows="9"
                                    placeholder="Enter your query" data-validation="required"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="form-group mt-3">
                        <button type="submit" class="button button-contactForm boxed-btn">Send</button>
                    </div>
                </form>
            </div>
            <div class="col-lg-3 offset-lg-1">
                <div class="media contact-info">
                    <span class="contact-info__icon"><i class="ti-home"></i></span>
                    <div class="media-body">
                        <h3><%= Environment._OwnerAddress %></h3>
                    </div>
                </div>
                <div class="media contact-info">
                    <span class="contact-info__icon"><i class="ti-tablet"></i></span>
                    <div class="media-body">
                        <h3><%= Environment._OwnerMobile %></h3>
                        <p>Mon to Fri 9am to 6pm</p>
                    </div>
                </div>
                <div class="media contact-info">
                    <span class="contact-info__icon"><i class="ti-email"></i></span>
                    <div class="media-body">
                        <h3><%= Environment._OwnerEmail %></h3>
                        <p>Send us your query anytime!</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ================ contact section end ================= -->
<jsp:include page="footer.jsp" />