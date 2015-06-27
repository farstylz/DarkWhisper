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
		<!-- Forums -->
		<div>
			<h1>Message Boards</h1>
			<table>
				<tr>
					<!-- Forum Name, Topics, Replies, Recent Posts -->
					<th>F</th>
					<th>Topics</th>
					<th>Replies</th>
					<th>Last Post</th>
				</tr>
				<tr>
					<td><a href="generalforum.asp">General Forum</a></td>
					<td>42</td>
					<td>1000</td>
					<td>By Goatboy Today 12:52CST</td>
				</tr>
				<tr>
					<td>Games</td>
					<td>4</td>
					<td>10</td>
					<td>By Diki Yesterday 11:30CST</td>
				</tr>
				<tr>
					<td>General Forum</td>
					<td>42</td>
					<td>1000</td>
					<td>By Goatboy Today 12:52CST</td>
				</tr>
				<tr>
					<td>Games</td>
					<td>4</td>
					<td>10</td>
					<td>By Diki Yesterday 11:30CST</td>
				</tr>
			</table>
		</div>
	</section>
