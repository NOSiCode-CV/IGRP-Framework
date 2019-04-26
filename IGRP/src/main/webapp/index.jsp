<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String code = request.getParameter("code");
	String state = request.getParameter("state"); 
	String session_state = request.getParameter("session_state"); 
	String error = request.getParameter("error"); 
	
	if(session_state != null && !session_state.isEmpty()){
		String url = "app/webapps?r=igrp/login/login";
		url += "&code=" + code;
		url += "&state=" + state;
		url += "&session_state=" + session_state;
		url += "&error=" + error;
		response.sendRedirect(url);
	}else{ 
		response.sendRedirect("app/webapps?r=igrp/login/login"); 
	}
%>
</body>
</html>