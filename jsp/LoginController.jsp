<%@ page contentType = "text/html; charset=UTF-8"%>
<%@ page import="musicbox.Event, musicbox.EventDAO, musicbox.Activity, musicbox.User, java.io.*, java.util.*, java.text.*, java.sql.*" %>
<%@ page session="false" language="java"  %> 

<%!
private HttpSession session;

private boolean checkSessionVariable() {

    try {

      String loginStatus = session.getAttribute("login").toString();
      if (loginStatus.equals("login is correct"))
        return true;
      else
        return false;
    } catch (NullPointerException e) {
      return false;
    }
}

private boolean checkSessionVariable2() {

    try {
      String loginStatus = session.getAttribute("Forum").toString();
      if (loginStatus.equals("yes"))
        return true;
      else
        return false;
    } catch (NullPointerException e) {
		return false;
    }
}
%>

<% 
session = request.getSession(true);
if(checkSessionVariable()) {
	String temp_event_id = request.getParameter("event_id");
	int event_id;
	try{
		event_id = Integer.parseInt(temp_event_id);
	}catch (NumberFormatException nfe) {
	event_id=0;
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<title>MusicBox</title>
		<meta http-equiv='content-type' content='text/html; charset=ISO-8859-7'>
		<link rel="stylesheet" href="../css/main.css" type="text/css">
		<link rel="stylesheet" href="../css/menu.css" type="text/css">
		<link rel="stylesheet" href="../css/login.css" type="text/css">
		<link rel="icon" href="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcThX4FRtz4tsQQJhl6YdBGNAW-9myUYge_bfmR9t14E9tzjvXem7g">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
		<script src="script.js"></script>
		<script src="../js/prefixfree.min.js"></script>
	</head>
	<body background="../img/live1.jpg">
		<div id='cssmenu'>
			<div class="tabsBar">
				<ul class="tabs">
					<li class='active'><a href="http://localhost:8080/MusicBox/jsp/main.jsp"><span>Αρχική</span></a></li>
					<li class='last btn-special' style="float:right"><a href="http://localhost:8080/MusicBox/jsp/logout.jsp"><span>Αποσύνδεση</span></a></li>
					<li style="float:right"><a href="http://localhost:8080/MusicBox/jsp/login.jsp"><span>Σύνδεση</span></a></li>
					<li style="float:right"><a href="http://localhost:8080/MusicBox/jsp/register.jsp"><span>Εγγραφή</span></a></li>
				</ul>
			</div>
		</div>
		<div class='errorprinter'>
		<p class="error">Παρακαλώ αποσυνδεθείτε απο τον λογαριασμό σας πριν συνδεθείτε σε άλλο προφίλ</p>
		</div>
		<div class="header">
			<div>Music<span>Box</span></div>
		</div>
		<br>
		<div class="login">
		<form action="LoginController.jsp" method="post" name="login_form">
			<input type="text" placeholder="username" name="username"><br>
			<input type="password" placeholder="password" name="password"><br>
			<input type="hidden" name="event_id" value="<%=event_id%>">
			<input type="submit" value="Login">
			<br>
		</form>
		<a href="http://localhost:8080/MusicBox/jsp/register.jsp">Δεν έχετε λογαριασμό;</a>
		<br>
		
		</div>
		<script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>
	</body>
</html>
<%
}else{
	request.setCharacterEncoding("ISO-8859-7");
 
    String username = request.getParameter("username");
    String password = request.getParameter("password");
	
	 username = new String(username.getBytes("ISO-8859-1"), "UTF-8");
     password = new String(password.getBytes("ISO-8859-1"), "UTF-8");
	
	User user = new User();
	user.open();
	
	if (!user.isUserRegistered(username, password)) {
		session = request.getSession(true);
		session.setAttribute("login", "login is correct");
		session.setAttribute("username", username);
		user.close();
		String temp_event_id = request.getParameter("event_id");
		int event_id;
		try{
			event_id = Integer.parseInt(temp_event_id);
		}catch (NumberFormatException nfe) {
		event_id=0;
		}

		if((checkSessionVariable2()) && (event_id!=0)) {
			String url="Forum.jsp"+"?event_id="+event_id;
%>
			<jsp:forward page="<%=url%>"/>
<%
		}else {
			String redirectURL2 = "main.jsp";
			response.sendRedirect(redirectURL2);
			
		}
    } else {
				String temp_event_id = request.getParameter("event_id");
	int event_id;
	try{
		event_id = Integer.parseInt(temp_event_id);
	}catch (NumberFormatException nfe) {
	event_id=0;
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<title>MusicBox</title>
		<meta http-equiv='content-type' content='text/html; charset=ISO-8859-7'>
		<link rel="stylesheet" href="../css/main.css" type="text/css">
		<link rel="stylesheet" href="../css/menu.css" type="text/css">
		<link rel="stylesheet" href="../css/login.css" type="text/css">
		<link rel="icon" href="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcThX4FRtz4tsQQJhl6YdBGNAW-9myUYge_bfmR9t14E9tzjvXem7g">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
		<script src="script.js"></script>
		<script src="../js/prefixfree.min.js"></script>
	</head>
	<body background="../img/live1.jpg">
		<div id='cssmenu'>
			<div class="tabsBar">
				<ul class="tabs">
					<li class='active'><a href="http://localhost:8080/MusicBox/jsp/main.jsp"><span>Αρχική</span></a></li>
					<li class='last btn-special' style="float:right"><a href="http://localhost:8080/MusicBox/jsp/logout.jsp"><span>Αποσύνδεση</span></a></li>
					<li style="float:right"><a href="http://localhost:8080/MusicBox/jsp/login.jsp"><span>Σύνδεση</span></a></li>
					<li style="float:right"><a href="http://localhost:8080/MusicBox/jsp/register.jsp"><span>Εγγραφή</span></a></li>
				</ul>
			</div>
		</div>
		<div class='errorprinter'>
		<p class="error">Λάθος συνδυασμός username/password</p>
		</div>
		<div class="header">
			<div>Music<span>Box</span></div>
		</div>
		<br>
		<div class="login">
		<form action="LoginController.jsp" method="post" name="login_form">
			<input type="text" placeholder="username" name="username"><br>
			<input type="password" placeholder="password" name="password"><br>
			<input type="hidden" name="event_id" value="<%=event_id%>">
			<input type="submit" value="Login">
			<br>
		</form>
		<a href="http://localhost:8080/MusicBox/jsp/register.jsp">Δεν έχετε λογαριασμό;</a>
		</div>
		<script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>
	</body>
</html>
<%
		user.close();
	}
}
%>