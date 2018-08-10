<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" autoFlush="true"%>
<%@ page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
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
	String token = "";
%>
<%
	String json = (String)session.getAttribute("__links");
	JSONObject jsonObject = new JSONObject(json);
	JSONArray jsonArray = jsonObject.getJSONArray("myLinks");
	token = jsonObject.getString("token");
	
	for(int i = 0; i < jsonArray.length(); i++){ 
		if(jsonArray.get(i).toString().contains("0_45") || jsonArray.get(i).toString().contains("0_47") || jsonArray.get(i).toString().contains("0_58"))
			mylinks.add(jsonArray.get(i).toString()); 
	}
%>
	
	<% 
	for(int i = 0; i < mylinks.size(); i++) { 
		String link = "https://" + mylinks.get(i) + "/igrpoauth2sso?_t=" + token;
		link = link.replace("0_45", "-").replace("0_47", "/").replace("0_58", ":");
	%>   
		 
            <p><a href="<%= link%>"><%=link%></a></p>
    <% 
    	} 
	
	mylinks.clear();
	/*
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	 response.setHeader("Pragma","no-cache"); //HTTP 1.0 
	 response.setDateHeader ("Expires", 0); //prevents caching at the proxy server*/
	
    %>
    
    <p><b><a href="app/webapps?r=igrp/login/logout">Logout</a></b></p> 
    
</body>
</html>