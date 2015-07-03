
<%
	Dim objConn
	Set objConn = Server.CreateObject("ADODB.Connection")

	objConn.Open "Driver={SQL Server Native Client 11.0};Server=tcp:darkwhisper.database.windows.net,1433;Database=DarkWhisper;Uid=darkwhisper@darkwhisper;Pwd={geHF>ar;c!)5rK7f};Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30;"
%>
