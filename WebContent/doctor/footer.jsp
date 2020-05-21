<%@page import="com.healthcare.Environment"%>
</div>
</main>
<footer class="py-4 bg-light mt-auto">
    <div class="container-fluid">
        <div class="d-flex align-items-center justify-content-between small">
            <div class="text-muted">Copyright &copy; <%= Environment._SoftwareName %> 2020</div>
        </div>
    </div>
</footer>
</div>
</div>

<script src="../dashboard_assets/bootstrap/js/jquery-3.3.1.slim.min.js"></script>
<script src="../dashboard_assets/bootstrap/js/popper.min.js"></script>
<script src="../dashboard_assets/bootstrap/js/bootstrap.bundle.min.js">
</script>
<script src="../dashboard_assets/js/scripts.js"></script>
<script src="../dashboard_assets/plugins/DataTables/datatables.min.js"></script>
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