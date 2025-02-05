<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Processing Redirect</title>
</head>
<body>
<%
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String session_state = request.getParameter("session_state");
    String error = request.getParameter("error");

    if (session_state != null && !session_state.isEmpty()) {
%>
    <form id="redirectForm" action="app/webapps?r=igrp/login/login" method="post">
        <input type="hidden" name="code" value="<%= code %>">
        <input type="hidden" name="state" value="<%= state %>">
        <input type="hidden" name="session_state" value="<%= session_state %>">
        <input type="hidden" name="error" value="<%= error %>">
    </form>
    <script type="text/javascript">
        document.getElementById("redirectForm").submit();
    </script>
<%
    } else {
        response.sendRedirect("app/webapps?r=igrp/login/login");
    }
%>
</body>
</html>
