<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: A 2026-02-15
  Time: 14:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Dashboard</title>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/app.css" />
</head>
<body>
<div class="container">
  <h2>Dashboard</h2>
  <p>Login success ✅</p>
  <form method="post" action="<%= request.getContextPath() %>/logout">
    <button type="submit">Logout</button>
  </form>
</div>
</body>
</html>

