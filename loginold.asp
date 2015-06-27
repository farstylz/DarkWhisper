<%@ Language=VBScript %>
<!--#include virtual="/adovbs.inc" -->
<!--#include file="databaseconnect.asp" -->

<%
	Dim objRS, bolUserName, bolPassword, strUsername, strPassword, bolFailedLogin
		strUsername = Request.Form ("UserName")
		strPassword = Request.Form ("Password")
		bolFailedLogin = False


		If Not IsEmpty(strUserName) and Not IsEmpty(strPassword) Then

			Set objRS = Server.CreateObject("ADODB.Recordset")
			objRS.Open "tblMembers", objConn, , adLockOptimistic, adCmdTable

			Do While Not objRS.EOF or bolUserName
				If (StrComp(objRS("UserName"), strUsername, vbTextCompare) = 0) Then
					bolUserName = True
				Else
					objRS.MoveNext
				End If
			Loop

			If Not bolUserName Then
				bolFailedLogin = True
			End If

			Do While Not objRS.EOF or bolPassword
				If (strComp(objRS("Password"), strPassword, vbTextCompare) = 0) Then
					bolPassword = True
				Else
					objRS.MoveNext
				End If
			Loop

			If Not bolPassword Then
				bolFailedLogin = True
			End If
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
				<a href="register.html">Register Here!</a>
			</div>
		</div>
	</section>
</body>
</html>
