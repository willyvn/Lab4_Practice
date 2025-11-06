<%@ include file="db_connection.jsp" %>
<%@ page import="java.sql.*" %>

<%
    String id = request.getParameter("id");
    if (id == null || id.isEmpty()) {
        out.println("<p style='color:red;'>Invalid ID!</p>");
        return;
    }

    String sql = "SELECT * FROM students WHERE id = ?";
    PreparedStatement ps = conn.prepareStatement(sql);
    ps.setInt(1, Integer.parseInt(id));
    ResultSet rs = ps.executeQuery();

    if (!rs.next()) {
        out.println("<p style='color:red;'>Student not found!</p>");
        return;
    }
%>

<html>
<head><title>Edit Student</title></head>
<body>
    <h2>Edit Student</h2>
    <form action="process_edit.jsp" method="post">
        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">

        <label>Student Code:</label>
        <input type="text" name="code" value="<%= rs.getString("student_code") %>" readonly><br><br>

        <label>Full Name:</label>
        <input type="text" name="name" value="<%= rs.getString("full_name") %>" required><br><br>

        <label>Email:</label>
        <input type="email" name="email" value="<%= rs.getString("email") %>"><br><br>

        <label>Major:</label>
        <input type="text" name="major" value="<%= rs.getString("major") %>"><br><br>

        <input type="submit" value="Update">
        <a href="list_students.jsp">Cancel</a>
    </form>
</body>
</html>

<%
    conn.close();
%>
