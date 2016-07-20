<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="musicbox.Event, musicbox.EventDAO, java.sql.Date, java.util.*, java.text.*;" %>
<%@ page errorPage="error.jsp"%>

<%
String music = request.getParameter("music");
String place = request.getParameter("place");
String date = request.getParameter("date");

String temp = request.getParameter("budget");
int budget;
try{
	budget = Integer.parseInt(temp);
}catch (NumberFormatException nfe) {
	budget = 101;
}

try {
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>MusicBox</title>
		<meta http-equiv='content-type' content='text/html; charset=ISO-8859-7'>
		<link rel="stylesheet" href="../css/main.css" type="text/css">
		<link rel="stylesheet" href="../css/menu.css" type="text/css">
		<link rel="icon" href="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcThX4FRtz4tsQQJhl6YdBGNAW-9myUYge_bfmR9t14E9tzjvXem7g">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
		<script src="script.js"></script>
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
<%

			if (music.equals("0")) {
		%>		<p class='error'>Δεν έχετε συμπληρώσει είδος μουσικής</p>	<%
			}
			if (place.equals("0")) {
		%>		<p class='error'>Δεν έχετε συμπληρώσει περιοχή</p>  <%
			}
			if (!(date.length() > 0)) {
		%>		<p class='error'>Δεν έχετε συμπληρώσει ημερομηνία</p>  <%
			}
			if (budget==101) {
		%>		<p class='error'>Δεν έχετε συμπληρώσει διαθέσιμα χρήματα</p>  <%
			}
			
%>	
		</div>
	</body>
</html>
<%
}catch(Exception ex) {
%>
<%="Exception1: " + ex.getMessage()%>
<%
}	
%>