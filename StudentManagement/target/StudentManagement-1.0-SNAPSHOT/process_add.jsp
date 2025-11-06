<%@ include file="db_connection.jsp" %>
<%@ page import="java.sql.*" %>

<%
    String code = request.getParameter("code");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String major = request.getParameter("major");

    if (code == null || code.isEmpty() || name == null || name.isEmpty()) {
        out.println("<p style='color:red;'>Required fields missing!</p>");
        out.println("<a href='add_student.jsp'>Go Back</a>");
        return;
    }

    try {
        // Kiểm tra trùng mã
        String checkSql = "SELECT * FROM students WHERE student_code = ?";
        PreparedStatement checkStmt = conn.prepareStatement(checkSql);
        checkStmt.setString(1, code);
        ResultSet rs = checkStmt.executeQuery();

        if (rs.next()) {
            out.println("<p style='color:red;'>Student code already exists!</p>");
            out.println("<a href='add_student.jsp'>Go Back</a>");
        } else {
            String insertSql = "INSERT INTO students(student_code, full_name, email, major, created_at) VALUES (?, ?, ?, ?, NOW())";
            PreparedStatement ps = conn.prepareStatement(insertSql);
            ps.setString(1, code);
            ps.setString(2, name);
            ps.setString(3, email);
            ps.setString(4, major);
            ps.executeUpdate();

            response.sendRedirect("list_students.jsp");
        }
        conn.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
%>
