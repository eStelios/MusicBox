<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="musicbox.Event, musicbox.EventDAO, musicbox.Activity, musicbox.User, java.io.*, java.util.*, java.text.*, java.sql.*" %>


<%
 
try {
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

	String comment = request.getParameter("comment");
	comment = new String(comment.getBytes("ISO-8859-1"), "UTF-8");

	Activity act1 = new Activity();
	act1.open();
	act1.newComment(event_id, user_id, comment);
	act1.close();
	String url="Forum.jsp"+"?event_id="+event_id;

%>
<jsp:forward page="<%=url%>"/>
<%
} catch(Exception e) {
%><%="mpla"%><%
}

%>