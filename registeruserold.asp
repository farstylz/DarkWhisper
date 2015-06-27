<%@ Language=VBScript %>

<!--#include virtual="/adovbs.inc" -->
<!--#include file="databaseconnect.asp" -->
<html>
	<body>
		<%
			Dim objRS, bolAlreadyExists
			bolAlreadyExists = False
			Set objRS = Server.CreateObject("ADODB.Recordset")
			objRS.open "tblMembers", objConn, ,adLockOptimistic, adCmdTable
			Do While Not (objRS.EOF Or bolAlreadyExists)
				If (StrComp(objRS("UserName"), Request.Form("UserName"), _
					vbTextCompare)) = 0 Then
					bolAlreadyExists = True
					Response.Redirect "http://localhost/dark-whisper/register.html?Registration=UserExists"
				End If
				If (StrComp(objRS("Email"), Request.Form("Email"), _
					vbTextCompare)) = 0  Then
				bolAlreadyExists = True
				Response.Redirect "http://localhost/dark-whisper/register.html?Registration=EmailExists"
				End If
				objRS.MoveNext
			Loop
			If Not bolAlreadyExists Then
				objRS.AddNew
				objRS("UserName") = Request.Form("UserName")
				objRS("Password") = Request.Form("Password")
				objRS("Email") = Request.Form("Email")
				objRS.Update
				Response.Write "Thanks for Registering!"
				Response.Write "<br/>"
				Response.Write "<a href='index.html'>Return to homepage</a>"
			End If
			objRS.Close
			ObjConn.Close
		%>
	</body>
</html>
