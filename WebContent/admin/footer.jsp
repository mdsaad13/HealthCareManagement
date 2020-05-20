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
<script>
    $('.alert').on('closed.bs.alert', function () {
        //alert()
        //window.history.pushState('', removeParam('message', window.location.href));
    });

    $('input[type="file"]').change(function (e) {
        var fileName = e.target.files[0].name;
        $('.custom-file-label').html(fileName);
    });

    function removeParam(key, sourceURL) {
        var rtn = sourceURL.split("?")[0],
            param,
            params_arr = [],
            queryString = (sourceURL.indexOf("?") !== -1) ? sourceURL.split("?")[1] : "";
        if (queryString !== "") {
            params_arr = queryString.split("&");
            for (var i = params_arr.length - 1; i >= 0; i -= 1) {
                param = params_arr[i].split("=")[0];
                if (param === key) {
                    params_arr.splice(i, 1);
                }
            }
            rtn = rtn + "?" + params_arr.join("&");
        }
        return rtn;
    }
</script>
</body>

</html>