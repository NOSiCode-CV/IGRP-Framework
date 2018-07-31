<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
<%@ page import="org.json.JSONArray"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	List<String> mylinks = new ArrayList<String>();
%>
<%
	String json = (String)session.getAttribute("__links");
	JSONArray jsonArray = new JSONArray(json);
	
	for(int i = 0; i < jsonArray.length(); i++){ 
		mylinks.add(jsonArray.get(i).toString()); 
	}
	
	System.out.println(mylinks.size());
%>
	
	<% 
	for(int i = 0; i < mylinks.size(); i++) { 
		String link = "https://" + mylinks.get(i) + "/";
	%>   
		 
            <p><a href="<%= link%>"><%=link%></a></p>
    <% 
    	} 
    %>
	
</body>
</html>