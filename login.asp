<%@ Language=VBScript %>
<!--#include virtual="/adovbs.inc" -->
<!--#include file="databaseconnect.asp" -->

<%
	Dim objRS, strUserName, strPassword, strSql, bolFailedLogin
		bolFailedLogin = False
		strUserName = Request.Form ("UserName")
		strPassword = Request.Form ("Password")

	If Not IsEmpty(strUserName) and Not IsEmpty(strPassword) Then
		Set objRS = Server.CreateObject("ADODB.Recordset")
		strSql = "UserLogin '" & strUserName & "','" & strPassword & "'"
		Set objRS = objConn.Execute(strSql)
		If objRS.EOF Then
			'Login Failed
			bolFailedLogin = True
		Else
			'Login Success
			'Todo - Figure out how to hash the pw's
			Session("UserName") = objRS("UserName")
			Session("Password") = objRS("Password")
			Session("UserID") = objRS("UserID")
			Response.Redirect "index.asp"
		End If
		objConn.Close
		Set objConn = Nothing
	End If
%>
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
	<section>
		<div class="container">
			<div class="light">
				<form method=post action="login.asp">
					<%
						If bolFailedLogin = True Then
							Response.Write "Invalid User Name or Password."
							Response.Write "<br/>"
						End If
					%>
					<label>User Name:</label><br/>
					<input required type="text" name="UserName"/><br/>
					<label>Password:</label><br/>
					<input required type="password" name="Password"/><br/>
					<input type="submit" value="Login"/>
			  </form>
				<hr>
				Not a member? <br/>
				<a href="register.asp">Register Here!</a>
			</div>
		</div>
	</section>
</body>
</html>
