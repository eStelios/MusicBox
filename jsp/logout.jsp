<%@ page contentType = "text/html; charset=UTF-8"%>
<%@ page import="java.sql.*, java.util.*, java.io.*" %>
<%@ page import = "musicbox.User" %>
<%@ page session="false" language="java"  %>

<%try{
	HttpSession session = request.getSession(true);
	String s = session.getAttribute("login").toString();
	session.removeAttribute( "login" ); 
	String redirectURL = "login.jsp";
    response.sendRedirect(redirectURL);
	}catch(Exception e) {
	String redirectURL = "login.jsp";
    response.sendRedirect(redirectURL);
	}
%>
