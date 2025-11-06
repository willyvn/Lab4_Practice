<%@ include file="db_connection.jsp" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Student List</title>
</head>
<body>
    <h2>Student List</h2>
    <a href="add_student.jsp">➕ Add New Student</a>
    <br><br>

    <table border="1" cellpadding="8" cellspacing="0">
        <tr>
            <th>ID</th>
            <th>Student Code</th>
            <th>Full Name</th>
            <th>Email</th>
            <th>Major</th>
            <th>Created At</th>
            <th>Actions</th>
        </tr>

        <%
            if (conn != null) {
                String sql = "SELECT * FROM students";
                try (PreparedStatement ps = conn.prepareStatement(sql);
                     ResultSet rs = ps.executeQuery()) {

                    while (rs.next()) {
        %>
                        <tr>
                            <td><%= rs.getInt("id") %></td>
                            <td><%= rs.getString("student_code") %></td>
                            <td><%= rs.getString("full_name") %></td>
                            <td><%= rs.getString("email") %></td>
                            <td><%= rs.getString("major") %></td>
                            <td><%= rs.getTimestamp("created_at") %></td>
                            <td>
                                <a href="edit_student.jsp?id=<%= rs.getInt("id") %>">Edit</a> |
                                <a href="delete_student.jsp?id=<%= rs.getInt("id") %>"
                                   style="color:red;"
                                   onclick="return confirm('Are you sure you want to delete this student?')">
                                   Delete
                                </a>
                            </td>
                        </tr>
        <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='7' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
                } finally {
                    conn.close();
                }
            }
        %>
    </table>
</body>
</html>
