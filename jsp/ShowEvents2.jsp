<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="musicbox.Event, musicbox.EventDAO, java.util.*" %>

<%
List<Event> eventlist = null;
eventlist = (List)request.getAttribute("searchresults");




%>

<!DOCTYPE html>
<html>
	<head>
		<title>MusicBox</title>
		<meta http-equiv='content-type' content='text/html; charset=ISO-8859-7'>
		<link rel="stylesheet" href="../css/main.css" type="text/css">
		<link rel="stylesheet" href="../css/menu.css" type="text/css">
		<link rel="stylesheet" href="../css/results.css" type="text/css">
		<link rel="icon" href="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcThX4FRtz4tsQQJhl6YdBGNAW-9myUYge_bfmR9t14E9tzjvXem7g">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
		<script src="script.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1">
			<style type="text/css" media="screen">
		@import url(http://fonts.googleapis.com/css?family=Ubuntu);
		
		* {padding: 0; }
		
		body {
			font-family: Ubuntu, arial, verdana;
			background: #0586AD;
		}
		
		/*----------
		Blocks
		----------*/
		/*Pricing table and price blocks*/
		.pricing_table {
			line-height: 150%; 
			font-size: 12px; 
			margin: 0 auto; 
			width: 75%; 
			max-width: 800px; 
			padding-top: 10px;
			margin-top: 100px;
		}
		
		.price_block {
			text-align: center; 
			width: 100%; 
			color: #fff; 
			float: left; 
			list-style-type: none; 
			transition: all 0.25s; 
			position: relative; 
			box-sizing: border-box;
			
			margin-bottom: 10px; 
			border-bottom: 1px solid transparent; 
		}
		
		/*Price heads*/
		.pricing_table h3 {
			text-transform: uppercase; 
			padding: 5px 0; 
			background: #333; 
			margin: -10px 0 1px 0;
		}
		
		/*Price tags*/
		.price {
			display: table; 
			background: #444; 
			width: 100%; 
			height: 70px; 
		}
		.price_figure {
			font-size: 24px; 
			text-transform: uppercase; 
			vertical-align: middle; 
			display: table-cell;
		}
		.price_number {
			font-weight: bold; 
			display: block;
		}
		.price_tenure {
			font-size: 11px; 
		}
		
		/*Features*/
		.features {
			background: #DEF0F4; 
			color: #000;
		}
		.features li {
			padding: 8px 15px;
			border-bottom: 1px solid #ccc; 
			font-size: 11px; 
			list-style-type: none;
		}
		
		.footer {
			padding: 15px; 
			background: #DEF0F4;
		}
		.action_button {
			text-decoration: none; 
			color: #fff; 
			font-weight: bold; 
			border-radius: 5px; 
			background: linear-gradient(#666, #333); 
			padding: 5px 20px; 
			font-size: 11px; 
			text-transform: uppercase;
		}
		
		.price_block:hover {
			box-shadow: 0 0 0px 5px rgba(0, 0, 0, 0.5); 
			transform: scale(1.04) translateY(-5px); 
			z-index: 1; 
			border-bottom: 0 none;
		}
		.price_block:hover .price {
			background:linear-gradient(#DB7224, #F9B84A); 
			box-shadow: inset 0 0 45px 1px #DB7224;
		}
		.price_block:hover h3 {
			background: #222;
		}
		.price_block:hover .action_button {
			background: linear-gradient(#F9B84A, #DB7224); 
		}
		
		
		@media only screen and (min-width : 480px) and (max-width : 768px) {
			.price_block {width: 50%;}
			.price_block:nth-child(odd) {border-right: 1px solid transparent;}
			.price_block:nth-child(3) {clear: both;}
			
			.price_block:nth-child(odd):hover {border: 0 none;}
		}
		@media only screen and (min-width : 768px){
			.price_block {width: 25%;}
			.price_block {border-right: 1px solid transparent; border-bottom: 0 none;}
			.price_block:last-child {border-right: 0 none;}
			
			.price_block:hover {border: 0 none;}
		}	
		
		.skeleton, .skeleton ul, .skeleton li, .skeleton div, .skeleton h3, .skeleton span, .skeleton p {
			border: 5px solid rgba(255, 255, 255, 0.9);
			border-radius: 5px;
			margin: 7px !important;
			background: rgba(0, 0, 0, 0.05) !important;
			padding: 0 !important;
			text-align: left !important;
			display: block !important;
			
			width: auto !important;
			height: auto !important;
			
			font-size: 10px !important;
			font-style: italic !important;
			text-transform: none !important;
			font-weight: normal !important;
			color: black !important;
		}
		.skeleton .label {
			font-size: 11px !important;
			font-style: italic !important;
			text-transform: none !important;
			font-weight: normal !important;
			color: white !important;
			border: 0 none !important;
			padding: 5px !important; 
			margin: 0 !important;
			float: none !important;
			text-align: left !important;
			text-shadow: 0 0 1px white;
			background: none !important;
		}
		.skeleton {
			display: none !important;
			margin: 100px !important;
			clear: both;
		}
	</style>
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
	<ul align="center" class="pricing_table">
<%
	Event event = null;
	
	for (int i = 0; i < eventlist.size(); i++) {
		event = eventlist.get(i);
%>
		<li class="price_block">
			<h3><%=event.getStage() %></h3>
			<div class="price">
				<div class="price_figure">
					<span class="price_number"><%=event.getDescription() %></span>
				</div>
			</div>
			<ul class="features">
				<li><%=event.getDate() %></li>
				<li><%=event.getTime() %></li>
				<li><%=event.getPlace() %></li>
				<li><%=event.getMusic() %></li>
				<li>Είσοδος:<%=event.getBudget() %></li>
				<li><a href="<%=event.getLink() %>">Περισσότερες πληροφορίες</a></li>
			</ul>
			<div class="footer">
				<form action="Forum.jsp">
					<input type="hidden" name="event_id" value="<%=event.getEvent_id() %>">
					<button class="action_button" type="submit">Forum</button>
				</form>
			</div>
		</li>
<%  }
	if(eventlist.isEmpty()) {
 %>
<h2>Δεν βρέθηκαν διαθέσιμες εκδηλώσεις</h2>
 <%  } %>
	</ul>
	
	
	<ul class="skeleton pricing_table" style="margin-top: 100px; overflow: hidden;">
		<li class="label" style="margin: 0 none;">ul.pricing_table</li>
		<li class="price_block">
			<span class="label">li.price_block</span>
			<h3><span class="label">h3</span></h3>
			<div class="price">
				<span class="label">div.price</span>
				<div class="price_figure">
					<span class="label">div.price_figure</span>
					<span class="price_number">
						<span class="label">span.price_number</span>
					</span>
					<span class="price_tenure">
						<span class="label">span.price_tenure</span>
					</span>
				</div>
			</div>
			<ul class="features">
				<li class="label">ul.features</li>
				<br /><br /><br />
			</ul>
			<div class="footer">
				<span class="label">div.footer</span>
			</div>
		</li>
		
		
		<li class="price_block" style="opacity: 0.5;">
			<span class="label">li.price_block</span>
			<h3><span class="label">h3</span></h3>
			<div class="price">
				<span class="label">div.price</span>
				<div class="price_figure">
					<span class="label">div.price_figure</span>
					<span class="price_number">
						<span class="label">span.price_number</span>
					</span>
					<span class="price_tenure">
						<span class="label">span.price_tenure</span>
					</span>
				</div>
			</div>
			<ul class="features">
				<li class="label">ul.features</li>
				<br /><br /><br />
			</ul>
			<div class="footer">
				<span class="label">div.footer</span>
			</div>
		</li>
		<li class="price_block" style="opacity: 0.25;">
			<span class="label">li.price_block</span>
			<h3><span class="label">h3</span></h3>
			<div class="price">
				<span class="label">div.price</span>
				<div class="price_figure">
					<span class="label">div.price_figure</span>
					<span class="price_number">
						<span class="label">span.price_number</span>
					</span>
					<span class="price_tenure">
						<span class="label">span.price_tenure</span>
					</span>
				</div>
			</div>
			<ul class="features">
				<li class="label">ul.features</li>
				<br /><br /><br />
			</ul>
			<div class="footer">
				<span class="label">div.footer</span>
			</div>
		</li>
	</ul>
	<script src="../js/prefixfree.min.js" type="text/javascript"></script>
	</body>
</html>