
<%
	Dim objConn
	Set objConn = Server.CreateObject("ADODB.Connection")

	objConn.open "Provider=SQLOLEDB;SERVER=STYLZ-PC\SQLEXPRESS;UID=stylz;PWD=kitkat2;DATABASE=DarkWhisperDB"

%>
