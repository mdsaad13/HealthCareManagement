<%@page import="com.healthcare.Environment"%>
<%@page import="com.healthcare.modals.Department"%>
<%@page import="com.healthcare.dbutil.DbUtil"%>
<%@page import="java.util.ArrayList"%>
<%
DbUtil dbUtil = new DbUtil();

ArrayList<Department> AllDepartments = dbUtil.AllDepartment(true);
%>
<footer class="footer">
    <div class="footer_top">
        <div class="container">
            <div class="row">
                <div class="col-xl-4 col-md-6 col-lg-4 ">
                    <div class="footer_widget">
                        <div class="footer_logo">
                            <%= Environment._SoftwareName %>
                        </div>
                        <p class="address_text"><strong>Bring health</strong><br>to life for the whole family.
                        </p>
                        <div class="socail_links">
                            <ul>
                                <li>
                                    <a href="<%= Environment._FBURL %>">
                                        <i class="ti-facebook"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="<%= Environment._TwitterURL %>">
                                        <i class="ti-twitter-alt"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="<%= Environment._InstaURL %>">
                                        <i class="fa fa-instagram"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>

                    </div>
                </div>
                <div class="col-xl-4 col-md-6 col-lg-4">
                    <div class="footer_widget">
                        <h3 class="footer_title">
                            Our Departments
                        </h3>
                        <ul class="links">
                            <% for(Department Depts : AllDepartments){ %>
                            <li><a href="#"><%=Depts.getName()%></a></li>
                            <% } %>
                        </ul>
                    </div>
                </div>
                <div class="col-xl-4  col-md-6 col-lg-4">
                    <div class="footer_widget">
                        <h3 class="footer_title">
                            We are Available
                        </h3>
                        <ul class="meting_time">
                            <li class="d-flex justify-content-between "><span>Monday - Friday</span> <span>8.00 am -
                                    6.00 pm</span></li>
                            <li class="d-flex justify-content-between "><span>Saturday </span> <span>10.00 am -
                                    6.00 pm</span></li>
                            <li class="d-flex justify-content-between "><span>Sunday</span> <span>10.00 am -
                                    5.00 pm</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="copy-right_text">
        <div class="container">
            <div class="row">
                <div class="bordered_1px "></div>
                <div class="col-xl-12">
                    <p class="copy_right text-center">
                        <p>
                            Copyright &copy;<script>
                                document.write(new Date().getFullYear());
                            </script> All rights reserved | <%= Environment._SoftwareName %>
                        </p>
                    </p>
                </div>
            </div>
        </div>
    </div>
</footer>

<!-- JS here -->
<script src="js/vendor/modernizr-3.5.0.min.js"></script>
<script src="js/vendor/jquery-1.12.4.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/isotope.pkgd.min.js"></script>
<script src="js/waypoints.min.js"></script>
<script src="js/jquery.counterup.min.js"></script>
<script src="js/imagesloaded.pkgd.min.js"></script>
<script src="js/scrollIt.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/wow.min.js"></script>
<script src="js/nice-select.min.js"></script>
<script src="js/jquery.slicknav.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/plugins.js"></script>
<script src="js/gijgo.min.js"></script>

<script src="js/main.js"></script>
<script>
    $('.datepicker').datepicker({
        format: 'yyyy/mm/dd',
        iconsLibrary: 'fontawesome',
        icons: {
            rightIcon: '<span class="fa fa-calendar"></span>'
        }
    });

    $('.timepicker').timepicker({
        iconsLibrary: 'fontawesome',
        icons: {
            rightIcon: '<span class="fa fa-clock-o"></span>'
        }
    });
</script>
<!-- Validator -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
<script>

    $.validate({
        modules: 'location, date, security, file',
        onModulesLoaded: function () {
            $('#country').suggestCountry();
        }
    });

    // Restrict presentation length
    $('#presentation').restrictLength($('#pres-max-length'));
</script>

</body>

</html>