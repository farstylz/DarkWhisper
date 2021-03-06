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
            <div class="clearfix">
                <!-- on smaller size remove float to align links-->
			    <a href="/index.asp"><span class="icon-home"></span>Home</a>
			    <a href="/index.asp#members"><span class="icon-users"></span>Members</a>
			    <a href="/forums/categories.asp"><span class="icon-bubbles"></span>Forums</a>
			    <a href="/calendar.asp"><span class="icon-calendar"></span>Calendar</a>
                <div class="dropdown pull-right"> 
                    <% 
                    If bolLoggedIn = True Then
                    %>           
                    <a><%=Session("UserName")%></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="/user/account.asp?UserID=<%=Session("UserID")%>">Account Settings</a>
                        </li>
                        <li>
                            <a href="/logout.asp">Log Out</a>
                        </li>
                    </ul>
                </div>    
                <%
                Else
                    Response.Write "<a class='dropdown' href='/login.asp'>Login</a>"
                End If  
                %>
            </div>
		</nav>
	</header>
	
