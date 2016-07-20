<%@ page contentType = "text/html; charset=UTF-8"%>
<%@ page import="java.sql.*, java.util.*, java.io.*" %>
<%@ page import="musicbox.Event, musicbox.EventDAO, musicbox.Activity" %>
<%@ page session="false" language="java"  %>


<%
	String temp_event_id = request.getParameter("event_id");
	int event_id;
	try{
		event_id = Integer.parseInt(temp_event_id);
	}catch (NumberFormatException nfe) {
%>
<%="exception while parsing string to int"%>
<%
	event_id=0;
	}

	String temp_user_id = request.getParameter("user_id");
	int user_id;
	try{
		user_id = Integer.parseInt(temp_user_id);
	}catch (NumberFormatException nfe) {
%>
<%="exception while parsing string to int"%>
<%
		user_id=0;
	}
	Activity act1 = new Activity();
	act1.open();
	act1.goesTo(user_id, event_id);
	act1.close();
	String url="Forum.jsp"+"?event_id="+event_id;
%>
<jsp:forward page="<%=url%>"/>