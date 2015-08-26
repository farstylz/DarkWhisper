<%@ Language=VBScript %>
<!--#include virtual="includes/adovbs.inc" -->
<!--#include virtual="includes/databaseconnect.asp" -->


<%
	function cleanSQL( tmpString )
	 if not isNull( tmpString ) then
				tmpString = replace(tmpString, "'", "''", 1, -1)
				tmpString = replace(tmpString, "%27", "''", 1, -1)
	 end if

	 cleanSQL = tmpString
	end function

	'todo - user auth. current sessions always writes out UserName
	Dim strSql, iTopicID, strMessage, iUserID, dtCreateTime, iCategory

    iCategory = Request.Form("CategoryID")
	iTopicID = Request.Form("TopicID")
	strMessage = cleanSQL(Request.Form("Message"))
	dtCreateTime = Now
	iUserID = Session("UserID")

	Set objRS = CreateObject("ADODB.Recordset")
	strSql = "PostReply " & iUserID & "," & iTopicID & ",'" & strMessage & "','" & dtCreateTime & "'," & iCategory 

	Response.Write strSql
	Set objRS = objConn.Execute(strSql)

	objConn.Close
	Set objConn = Nothing

    Response.Redirect "/forums/forumthread.asp?Category=" & iCategory & "&Page=1&Topic=" & iTopicID 

%>
