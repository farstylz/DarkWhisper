<%@ Language=VBScript %>
<!--#include virtual="includes/adovbs.inc" -->
<!--#include file="includes/databaseconnect.asp" -->

<%
	function cleanSQL( tmpString )
	 if not isNull( tmpString ) then
				tmpString = replace(tmpString, "'", "''", 1, -1)
				tmpString = replace(tmpString, "%27", "''", 1, -1)
	 end if

	 cleanSQL = tmpString
	end function

	'todo - user auth. current sessions always writes out UserName
	Dim strSql, strTopicID, strMessage, iUserID, dtCreateTime

	strTopicID = Request.Form("TopicID")
	strMessage = cleanSQL(Request.Form("Message"))
	dtCreateTime = Now
	iUserID = Session("UserID")

	Set objRS = CreateObject("ADODB.Recordset")
	strSql = "PostReply " & iUserID & "," & strTopicID & ",'" & strMessage & "','" & dtCreateTime & "'"

	Response.Write strSql
	Set objRS = objConn.Execute(strSql)

	objConn.Close
	Set objConn = Nothing

%>
