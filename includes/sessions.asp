
<%
	Dim objRSSession, strSqlSession, bolLoggedIn
	If Not IsEmpty(Session("UserName")) And Not IsEmpty(Session("Password")) Then
		Set objRSSession = Server.CreateObject("ADODB.Recordset")
		strSqlSession = "UserLogin '" & Session("UserName") & "','" & Session("Password") & "'"
		Set objRSSession = objConn.Execute(strSqlSession)
		If objRSSession.EOF Then
			'Login Failed
			bolLoggedIn = False
		Else
			bolLoggedIn = True
			Response.Write Session("UserName") & " is currently logged in."
			Response.Write Session("UserID")
		End If
	End If
%>
