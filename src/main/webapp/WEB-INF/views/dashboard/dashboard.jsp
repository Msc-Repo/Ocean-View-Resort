<%@ page contentType="text/html;charset=UTF-8" %>
<%
  String activeView = (String) request.getAttribute("activeView");
  if (activeView == null) activeView = "home";
%>
<!DOCTYPE html>
<html>
<head>
  <title>Ocean View Resort - Dashboard</title>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/app.css" />
</head>
<body>
<div class="layout">
  <div class="sidebar">
    <h3>Ocean View</h3>

    <div class="nav">
      <a class="<%= "home".equals(activeView) ? "active" : "" %>"
         href="<%= request.getContextPath() %>/dashboard?view=home">Home</a>

      <a class="<%= "rooms".equals(activeView) ? "active" : "" %>"
         href="<%= request.getContextPath() %>/dashboard?view=rooms">Rooms</a>

      <a class="<%= "reservations".equals(activeView) ? "active" : "" %>"
         href="<%= request.getContextPath() %>/dashboard?view=reservations">Reservations</a>

      <a class="<%= "billing".equals(activeView) ? "active" : "" %>"
         href="<%= request.getContextPath() %>/dashboard?view=billing">Billing</a>

      <a class="<%= "help".equals(activeView) ? "active" : "" %>"
         href="<%= request.getContextPath() %>/dashboard?view=help">Help</a>
    </div>

    <form method="post" action="<%= request.getContextPath() %>/logout"
          onsubmit="return confirm('Do you want to logout?');">
      <button type="submit">Logout</button>
    </form>
  </div>

  <div class="content">
    <div class="card">
      <div style="display:flex; justify-content:space-between; align-items:center;">
        <h2 style="margin:0;">Dashboard</h2>
        <div>Welcome, <b><%= request.getAttribute("username") %></b></div>
      </div>

      <hr style="border:none;border-top:1px solid #eee;margin:14px 0;"/>

      <jsp:include page="/WEB-INF/views/dashboard/partials/<%= activeView %>.jsp" />
    </div>
  </div>
</div>
</body>
</html>


