<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="musicbox.Event, musicbox.EventDAO, java.sql.Date, java.util.*, java.text.*;" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>MusicBox</title>
		<meta http-equiv='content-type' content='text/html; charset=ISO-8859-7'>
		<link rel="stylesheet" href="../css/main.css" type="text/css">
		<link rel="stylesheet" href="../css/menu.css" type="text/css">
		<link rel="stylesheet" href="../css/responsive.css" type="text/css">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
		<link rel="icon" href="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcThX4FRtz4tsQQJhl6YdBGNAW-9myUYge_bfmR9t14E9tzjvXem7g"> 
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
		<h1>ΚΑΛΩΣ ΗΡΘΑΤΕ ΣΤΟ MusicBox!</h1>
		<h2>Ο απόλυτος οδηγός διασκέδασης</h2>
		<div class="bottom-search-area">
			<form id="search_form" action="FindEventController.jsp" method="get" name="search_form">
				<!-- Είδος μουσικής-->
				<select name="music" style="float:left">
					<option value="0">Tι μουσική ακούτε;</option>
					<option value="alternative">alternative</option>
					<option value="classical">classical</option>
					<option value="electronic">elecronic</option>
					<option value="greek">greek</option>
					<option value="hip hop">hip hop</option>
					<option value="jazz">jazz</option>
					<option value="pop">pop</option>
					<option value="rock">rock</option>
				</select>
				<!-- Τοποθεσία-->
				<select name="place" style="float:left">
					<option value="0">Που θέλετε να πάτε;</option>
					<option value="Athens">Αθήνα</option>
					<option value="Thessaloniki">Θεσσαλονίκη</option>
					<option value="Patra">Πάτρα</option>
					<option value="Hirakleion">Ηράκλειο</option>
					<option value="Larissa">Λάρισσα</option>
					<option value="Volos">Βόλος</option>
				</select>
				<!--Ημερομηνία-->
				<input type="text" name="date" placeholder="ηη/μμ/χχχχ" style="float:left">
				<!--Βudget-->
				<input type="number" name="budget" placeholder="Πόσα ευρώ διαθέτετε;" min="0" max="100" style="float:left">
				<button id="submit_location" class="search-button form-inline btn btn-primary btn-large" type="submit">Αναζήτηση</button>
			</form>
		</div>
	</body>
</html>