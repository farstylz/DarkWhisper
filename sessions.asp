
<%
	Dim objRS, strSql, bolLoggedIn
	If Not IsEmpty(Session("UserName")) And Not IsEmpty(Session("Password")) Then
		Set objRS = Server.CreateObject("ADODB.Recordset")
		strSql = "UserLogin '" & Session("UserName") & "','" & Session("Password") & "'"
		Set objRS = objConn.Execute(strSql)
		If objRS.EOF Then
			'Login Failed
			bolLoggedIn = False
		Else
			bolLoggedIn = True
			Response.Write Session("UserName") & " is currently logged in."
		End If
		objConn.Close
		Set objConn = Nothing
	End If
%>
