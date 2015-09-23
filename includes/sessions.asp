
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
		End If
	End If

    If Not Request.Cookies("PollComplete") = True Then
        Response.Cookies("PollComplete") = False
    End If
%>
