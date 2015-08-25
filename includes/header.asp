<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Dark Whisper Clan</title>
	<link href="/css/dw.css" rel="stylesheet" type="text/css" />
	<link href="/css/font.css" rel="stylesheet" type="text/css" />
	<link href="/css/lightbox.css" rel="stylesheet" />
	<link href='http://fonts.googleapis.com/css?family=Volkhov:700italic|Open+Sans:400,600' rel='stylesheet' type='text/css'>
	<!--[if lt IE 9]>
	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<script src="/js/jquery-1.10.2.min.js"></script>
	<script src="/js/lightbox-2.6.min.js"></script>

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
            <!-- Create a dropdown for user login/out and management page -->
			<a href="/index.asp"><span class="icon-home"></span>Home</a>
			<a href="/index.asp#members"><span class="icon-users"></span>Members</a>
			<a href="/forums/forums.asp"><span class="icon-bubbles"></span>Forums</a>
			<a href="/calendar.asp"><span class="icon-calendar"></span>Calendar</a>
            <% 
            If bolLoggedIn = True Then
                Response.Write "<a href='/member.asp?UserID=" & Session("UserID") & "'>" & Session("UserName") & "</a>"
            Else
                Response.Write "<a class='navbar-login' href='/login.asp'>Login</a>"
            End If  
            %>
		</nav>
	</header>
	
