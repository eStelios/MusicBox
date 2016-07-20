<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="musicbox.Event, musicbox.EventDAO, musicbox.Activity, java.io.*, java.util.*, java.sql.*, java.sql.Timestamp, java.util.Date, java.text.SimpleDateFormat;" %>
<%@ page session="false" language="java"  %> 

<%
String temp = request.getParameter("event_id");
int event_id=0;
try{
	event_id = Integer.parseInt(temp);
}catch (NumberFormatException nfe) {
%>
<%="exception while parsing string to int"%>
<%
}

ResultSet rs = null;
ResultSet rs1 = null;
ResultSet rs2 = null;
ResultSet rs3 = null;

try{
	Activity act= new Activity();
	act.open();
	rs1 = act.getAllComments(event_id);
	if (rs1 == null) {
        act.close();
%>
<%="lathos"%>
<%
        return;
      }
%>
<html>
	<head>
		<title>MusicBox</title>
		<meta http-equiv='content-type' content='text/html; charset=windows-1253'>
		<link rel="stylesheet" href="../css/main.css" type="text/css">
		<link rel="stylesheet" href="../css/menu.css" type="text/css">
		<link rel="stylesheet" href="../css/responsive.css" type="text/css">
		<link rel="stylesheet" href="../css/forum.css" type="text/css">
		<link rel="icon" href="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcThX4FRtz4tsQQJhl6YdBGNAW-9myUYge_bfmR9t14E9tzjvXem7g">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="viewport" content="initial-scale=1.0; maximum-scale=1.0; width=device-width;">
		<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
		<script src="script.js"></script>
	</head>
	<body>
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
		<div class="table-title">
			<h3>MusicBox Forum</h3>
		</div>
		<table class="table-fill">
		<thead>
				<tr>
					<th class="text-left">Ημερομηνία</th>
					<th class="text-left">Χρήστης</th>
					<th class="text-left">Σχόλιο</th>
				</tr>
			</thead>
			<tbody class="table-hover">
<%
	if(!rs1.next()) {
%>
				<tr>
					<td colspan="3">Δεν έχει σχολιάσει κανείς</td>
				</tr>
<%

    } else {
			rs1.previous();
			while (rs1.next()) {
				String comment = rs1.getString("comment");
				Date date1 = rs1.getDate("date");
				String DATE_FORMAT = "dd/MM/yyyy";
				SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
				String date2 = sdf.format(date1);
				int user_id = rs1.getInt("user_id");
				ResultSet rs5 = act.getUsername(user_id);
%>

<%
				if ((rs5.next()) && (!comment.equals("its not a comment"))) {
				String username = rs5.getString("username");
%>
				<tr>
					<td class="text-left"><%=date2%></td>
					<td class="text-left"><%=username%></td>
					<td class="text-left"><%=comment%></td>
				</tr>
<%
			}
		}
	}

%>
			</tbody>
		</table>
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
%>
<%
session = request.getSession(true);
if(!checkSessionVariable()) {
	
	session.setAttribute("Forum", "yes");
%>
		<form action="login.jsp" method="get" align="center" name="loginBeforeComment">
			<input type="hidden" name="event_id" value="<%=event_id%>">
			<br>
			<button id="submit_location" class="search-button form-inline btn btn-primary btn-large" type="submit">Συνδεθείτε για να μπορείτε να κάνετε σχόλια</button>
		</form> 
<%
}else {
	String username = session.getAttribute("username").toString();
	rs2 = act.getUserId(username);
	if (rs2.next()) {
		int user_id = rs2.getInt("user_id");
	
%>
		<br>
		<form action="newCommentController.jsp" method="GET" align="center" name="insertCommmenForm">
			
			<input type="text" name="comment" placeholder="γράψτε το σχόλιο σας...">
			<input type="hidden" name="event_id" value="<%=event_id%>">
			<input type="hidden" name="user_id" value="<%=user_id%>">
			<br>
			<br>
			<button id="submit_location" class="search-button form-inline btn btn-primary btn-large" type="submit">Καταχώρηση</button>
		</form> 
<%
int count = act.getNumberOfAttends(event_id);
%>
		<br>
		<p align="center">Θα πάνε: <%=count%> χρήστες</p>
		<form action="Attend.jsp" method="get" name="attendForm">
			<input type="hidden" name="event_id" value="<%=event_id%>">
			<input type="hidden" name="user_id" value="<%=user_id%>">
			<br>
			<button id="submit_location" class="search-button form-inline btn btn-primary btn-large" type="submit">Θα πάω</button>
		</form>
<%
	}
}
%>

		<br>
	</body>
</html>
<%
act.close();
} catch (Exception e) {
%>
<%="exception c"%>
<%

    }
%>

