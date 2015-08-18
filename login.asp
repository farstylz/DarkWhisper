<%@ Language=VBScript %>
<% Option Explicit %>
<!--#include virtual="includes/adovbs.inc" -->
<!--#include file="includes/databaseconnect.asp" -->
<!--#include file="includes/sessions.asp" -->
<!--#include file="includes/header.asp" -->
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
			Response.Write Session("UserID")
			'Response.Redirect "index.asp"
		End If
		objConn.Close
		Set objConn = Nothing
	End If
%>
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
