<%@ Language=VBScript %>
<!--#include virtual="/adovbs.inc" -->
<!--#include file="databaseconnect.asp" -->

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
	"','" & strMessage & "'," & dtCreateTime

	Response.Write strSql
	Set objRS = objConn.Execute(strSql)

	objConn.Close
	Set objConn = Nothing

	Response.Write strTopicType
  Response.Write strSubject
	Response.Write strMessage
	Response.Write dtCreateTime
	Response.Write iUserID


%>
