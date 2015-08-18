<%@ Language=VBScript %>

<!--#include virtual="includes/adovbs.inc" -->
<!--#include file="includes/databaseconnect.asp" -->
<!--#include file="includes/header.asp" -->
<%
	Dim objRS, objRS2, strUserName, strPassword, strEmail, strEmail2, strEmail3, _
		strSql, bolUserName, bolEmail, bolFailedEmail, dtJoinDate
	bolUserName = False
	bolEmail = False
	bolFailedEmail = False
	strUserName = Request.Form ("UserName")
	strPassword = Request.Form ("Password")
	strEmail2 = Request.Form ("Email2")
	strEmail3 = Request.Form ("Email3")



	If Not IsEmpty(strUserName) and Not IsEmpty(strPassword) and Not _
			isEmpty(strEmail2) and Not IsEmpty(strEmail3) Then

		strVerifyEmail = (StrComp(strEmail2, strEmail3, vbTextCompare))

		If strVerifyEmail = 0 Then
			strEmail = strEmail2
			dtJoinDate = Date
			Set objRS2 = Server.CreateObject("ADODB.Recordset")
			strSql = "CheckRegister '" & strUserName & "','" & strEmail & "'"
			Set objRS2 = objConn.Execute(strSql)
			If objRS2.EOF Then
				Set objRS = Server.CreateObject("ADODB.Recordset")
				strSql = "UserRegister '" & strUserName & "','" & strPassword & "','" & _
					strEmail & "','" & dtJoinDate & "'"
				Set objRS = objConn.Execute(strSql)
				Session("UserName") = strUserName
				session("Password") = strPassword
				Response.Redirect "index.asp"
			Else
				If objRS2("UserName") = strUserName Then
					bolUserName = True
				ElseIf objRS2("Email") = strEmail Then
					bolEmail = True
				End If
			End If
			objConn.Close
			Set objConn = Nothing
		Else
			bolFailedEmail = True
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
				<form method=post action="register.asp">
					<%
					If bolUserName = True Then
						Response.Write "Username already Exists."
						Response.Write "<br/>"
					ElseIf bolEmail = True Then
						Response.Write "Email already Registered."
						Response.Write "<br/>"
					ElseIf bolFailedEmail = True Then
						Response.Write "Email doesn't match."
						Response.Write "<br/>"
					End If
					%>
					<label>User Name:</label><br/>
					<input required type="text" name="UserName"><br/>
					<label>Password:</label><br/>
					<input requried type="text" name="Password"><br/>
					<label>Email:</label><br/>
					<input required type="text" name="Email2"><br/>
					<label>Confirm Email:</label><br/>
					<input required type="text" name="Email3"><br/>
					<input type="submit" value="Register">
			  </form>
				<br/>
				<a href="urltoforgotpass">Forgot Password?</a>
			</div>
		</div>
	</section>
</body>
</html>
