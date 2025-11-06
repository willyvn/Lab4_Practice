<%@ page import="java.sql.*" %>
<%
    String url = "jdbc:mysql://localhost:3306/student_management";
    String user = "root"; // đổi nếu bạn có mật khẩu
    String password = "123456";

    Connection conn = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
    } catch (Exception e) {
        out.println("<p style='color:red;'>Database connection failed: " + e.getMessage() + "</p>");
    }
%>
