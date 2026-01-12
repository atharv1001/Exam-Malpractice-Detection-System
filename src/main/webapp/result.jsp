<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
    Object user = session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Result</title>
</head>
<body>

<h2>Exam Submitted Successfully</h2>

<p>Your Score: <b><%= request.getAttribute("score") %></b></p>

<a href="logout">Logout</a>

</body>
</html>
