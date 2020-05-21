<%
session.removeAttribute("DoctorID");
response.sendRedirect("login.jsp");
return;
%>