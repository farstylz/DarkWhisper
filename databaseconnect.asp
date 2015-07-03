
<%
	Dim objConn
	Set objConn = Server.CreateObject("ADODB.Connection")

	'objConn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=darkwhisper.database.windows.net;Initial Catalog=DarkWhisper;UserId=darkwhisper;Password=geHF>ar;c!)5rK7f;"
	'objConn.Open "Provider=SQLOLEDB;SERVER=darkwhisper.database.windows.net;UID=darkwhisper;PWD=geHF>ar;c!)5rK7f;DATABASE=DarkWhisper"
	'objConn.Open "Provider=SQLNCLI10;Server=tcp:darkwhisper.database.windows.net;Database=DarkWhisper;Uid=darkwhisper@darkwhisper;Pwd=geHF>ar;c!)5rK7f;Encrypt=Yes;DataTypeCompatibility=80;"
	'objConn.Open "Provider=SQLNCLI10;Server=tcp:darkwhisper.database.windows.net;Database=DarkWhisper;Uid=darkwhisper@darkwhisper;Pwd=geHF>ar;c!)5rK7f;Encrypt=True;DataTypeCompatibility=80;"
	'objConn.Open "Server=tcp:[darkwhisper].database.windows.net;Database=DarkWHisper;User ID=[darkwhisper]@[darkwhisper];Password=geHF>ar;c!)5rK7f;Trusted_Connection=False;Encrypt=True;"
	'objConn.Open "DRIVER=SQL Server Native Client 11.0;Server=darkwhisper.database.windows.net;Databasse=DarkWhisper;UID=darkwhisper;PWD='geHF>ar;c!)5rK7f';Encrypt=yes;TrustServerCertificate=no;"
	objConn.Open "Driver={SQL Server Native Client 11.0};Server=tcp:darkwhisper.database.windows.net,1433;Database=DarkWhisper;Uid=darkwhisper@darkwhisper;Pwd={geHF>ar;c!)5rK7f};Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30;"
%>
