<html>
<head><title>Add Student</title></head>
<body>
    <h2>Add New Student</h2>
    <form action="process_add.jsp" method="post">
        <label>Student Code:</label>
        <input type="text" name="code" required><br><br>

        <label>Full Name:</label>
        <input type="text" name="name" required><br><br>

        <label>Email:</label>
        <input type="email" name="email"><br><br>

        <label>Major:</label>
        <input type="text" name="major"><br><br>

        <input type="submit" value="Add Student">
        <a href="list_students.jsp">Cancel</a>
    </form>
</body>
</html>
