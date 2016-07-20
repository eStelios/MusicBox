﻿<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="musicbox.Event, musicbox.EventDAO, musicbox.Activity, java.io.*, java.util.*, java.sql.*" %>
<%@ page session="false" language="java"  %> 

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
		<div class="header">
			<div>Music<span>Box</span></div>
		</div>
		<br>
		<div class="login">
		<form action="	RegisterController.jsp" method="post" name="register_form">
			<input type="text" placeholder="username" name="username"><br>
			<input type="password" placeholder="password" name="password"><br>
			<input type="submit" value="Register">
			<br>
		</form>
		<a href="http://localhost:8080/MusicBox/jsp/login.jsp">Έχετε ήδη λογαριασμό;</a>
		</div>
		<script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>
	</body>
</html>