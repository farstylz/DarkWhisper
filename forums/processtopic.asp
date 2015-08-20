<%@ Language=VBScript %>
<!--#include virtual="includes/adovbs.inc" -->
<!--#include virtual="includes/databaseconnect.asp" -->


<%
	'todo - user auth. current sessions always writes out UserName
	Dim strSql, strTopicType, strSubject, strMessage, iUserID, dtCreateTime

	strTopicType = Request.Form("TopicType")
	strSubject = Request.Form("Subject")
	strMessage = Request.Form("Message")
	dtCreateTime = Now
	iUserID = Session("UserID")

	Set objRS = CreateObject("ADODB.Recordset")
	strSql = "StartTopic " & iUserID & ",'" & strTopicType & "','" & strSubject & _
	"','" & strMessage & "','" & dtCreateTime & "'"

	Response.Write strSql
	Set objRS = objConn.Execute(strSql)

	objConn.Close
	Set objConn = Nothing

%>
