<%@ Language=VBScript %>
<!--#include virtual="/adovbs.inc" -->
<!--#include file="databaseconnect.asp" -->

<%
	'todo - user auth. current sessions always writes out UserName
	Dim strSql, strForum, strSubject, strMessage, iUserID, dtCreateTime

	strForum = Request.Form("Forum")
	strSubject = Request.Form("Subject")
	strMessage = Request.Form("Message")
	dtCreateTime = Now
	iUserID = Session("UserID")

	Set objRS = CreateObject("ADODB.Recordset")
	strSql = "StartTopic '" & iUserID & "','" & strForum & "','" & strSubject & _
	"','" & strMessage & "','" & dtCreateTime & "'"

	Set objRS = objConn.Execute(strSql)

	objConn.Close
	Set objConn = Nothing

	Response.Write strForum
  Response.Write strSubject
	Response.Write strMessage
	Response.Write dtCreateTime
	Response.Write iUserID


%>
