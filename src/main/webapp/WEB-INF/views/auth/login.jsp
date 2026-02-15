<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: A 2026-02-15
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Login - Ocean View Resort</title>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/app.css" />
</head>
<body>
<div class="container">
  <h2>Staff Login</h2>

  <%
    String err = (String) request.getAttribute("error");
    if (err != null) {
  %>
  <p class="err"><%= err %></p>
  <% } %>

  <form method="post" action="<%= request.getContextPath() %>/login">
    <label>Username</label>
    <input name="username" required />

    <label>Password</label>
    <input name="password" type="password" required />

    <button type="submit">Login</button>
  </form>

  <p style="font-size:12px;color:#666;">Default: admin / admin123</p>
</div>
</body>
</html>

