<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="javax.servlet.ServletException" %>
    <%@page import="javax.servlet.http.HttpServlet" %>
    <%@page import="javax.servlet.http.HttpServletRequest" %>
    <%@page import="javax.servlet.annotation.WebServlet" %>
    <%@page import="javax.servlet.http.HttpServletResponse" %>
    <%@page import="java.io.IOException" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
	response.setHeader("Access-Control-Allow-Origin", "*");
	response.setHeader("Access-Control-Allow-Methods", "GET,POST");
	response.setStatus(HttpServletResponse.SC_OK);
	response.sendRedirect("app/webapps?r=inps_porton/Pagamento_de_servico/index&" + request.getQueryString()); 

%>


</body>
</html>