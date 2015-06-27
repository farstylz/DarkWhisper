<%@ Language=VBScript %>
<!--#include virtual="/adovbs.inc" -->
<!--#include file="databaseconnect.asp" -->
<!--#include file="sessions.asp" -->
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Dark Whisper Clan</title>
	<link href="css/dw.css" rel="stylesheet" type="text/css" />
	<link href="css/font.css" rel="stylesheet" type="text/css" />
	<link href="css/lightbox.css" rel="stylesheet" />
	<link href='http://fonts.googleapis.com/css?family=Volkhov:700italic|Open+Sans:400,600' rel='stylesheet' type='text/css'>
	<!--[if lt IE 9]>
	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<script src="js/jquery-1.10.2.min.js"></script>
	<script src="js/lightbox-2.6.min.js"></script>

</head>
<body>
	<section class="hero">
		<div class="container">
			<h1>Dark Whisper</h1>
		</div>
	</section>
	<header class="light">
		<nav class="navbar container">
			<!-- todo Fix responsiveness .. broken after adding login. -->
			<a href="login.asp">Login</a>
			<a href="index.asp"><span class="icon-home"></span>Home</a>
			<a href="#members"><span class="icon-users"></span>Members</a>
			<a href="forums.asp"><span class="icon-bubbles"></span>Forums</a>
			<a href="calendar.asp"><span class="icon-calendar"></span>Calendar</a>
		</nav>
	</header>
	<section class="container">
		<!-- todo add querystring from whichever forum the topic will come from -->
		<!-- todo add verification that user is logged in. Else redirect them. -->
		<div>
			<form method="post" action="processtopic.asp">
				<%
				Dim strForum
				strForum = Request.Querystring("ForumName")
				%>
				<input hidden name="Forum" value="<%= strForum %>"/>
				<Label>Subject:</label><br/>
				<input type="text" name="Subject"><br/>
				<Label>Message:</label><br/>
				<input type="text" name="Message" size="75"><br/>
				<input type="submit" value="Submit">
			</form>
