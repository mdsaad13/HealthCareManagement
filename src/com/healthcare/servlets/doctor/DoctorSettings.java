package com.healthcare.servlets.doctor;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.healthcare.Environment;
import com.healthcare.dbutil.AccountUtil;
import com.healthcare.modals.Doctor;

@WebServlet("/doctor/DoctorSettings")
public class DoctorSettings extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(final HttpServletRequest request, final HttpServletResponse response)
            throws ServletException, IOException {
        final Random rand = new Random();
        final int rand_int1 = rand.nextInt(1000);

        final String UPLOAD_DIRECTORY = Environment._InstalledDirectory + "\\WebContent\\img\\doctors";

        HttpSession session = request.getSession();
        int id = (int) session.getAttribute("DoctorID");

        String name = null;
        String email = null;
        String phone = null;
        int deptid = 0;
        String address = null;
        int age = 0;
        String qualification = null;
        String filename = "";
        String imgUrl = null;
        String oldimgurl = null;

        // process only if its multipart content
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                final List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory())
                        .parseRequest(request);
                for (final FileItem item : multiparts) {
                    if (item.isFormField()) {

                        if (item.getFieldName().equalsIgnoreCase("name")) {
                            name = item.getString();
                        }
                        if (item.getFieldName().equalsIgnoreCase("email")) {
                            email = item.getString();
                        }
                        if (item.getFieldName().equalsIgnoreCase("phone")) {
                            phone = item.getString();
                        }
                        if (item.getFieldName().equalsIgnoreCase("age")) {
                            age = Integer.parseInt(item.getString());
                        }
                        if (item.getFieldName().equalsIgnoreCase("address")) {
                            address = item.getString();
                        }
                        if (item.getFieldName().equalsIgnoreCase("deptid")) {
                            deptid = Integer.parseInt(item.getString());
                        }
                        if (item.getFieldName().equalsIgnoreCase("qualification")) {
                            qualification = item.getString();
                        }
                        if (item.getFieldName().equalsIgnoreCase("oldimgurl")) {
                            oldimgurl = item.getString();
                        }
                    } else {
                        final String FormFileName = new File(item.getName()).getName();
                        if (FormFileName.length() > 0) {
                            filename = rand_int1 + FormFileName;
                            item.write(new File(UPLOAD_DIRECTORY + File.separator + filename));
                        }
                    }
                }
            } catch (final Exception ex) {

            }
        }

        if (filename == null || filename.equals("")) {
            if (oldimgurl == null || oldimgurl.equals("")) {
                imgUrl = "default.png";
            } else {
                imgUrl = oldimgurl;
            }
        } else {
            imgUrl = filename;
        }

        final Doctor doctor = new Doctor(id, name, email, "", phone, age, address, deptid, qualification, imgUrl);
        final AccountUtil accountUtil = new AccountUtil();

        String Message = "UpdateFailed";

        try {
            if (accountUtil.UpdateDoctor(doctor)) {
                Message = "UpdateSuccess";
            }
        } catch (final SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("settings.jsp?message=" + Message);
        return;
    }
}