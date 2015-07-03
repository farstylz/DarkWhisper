<%@ Language=VBScript %>
<!--#include virtual="/adovbs.inc" -->
<!--#include file="databaseconnect.asp" -->
<!--#include file="sessions.asp" -->
<!--#include file="header.asp" -->
<%
	Dim iTopicID, iPageIndex, strSqlForumThread, objRSThread
	iTopicID = Request.Querystring("Topic")
	strSubject = Request.Querystring("Page")
	strSqlForumThread = "Forum_GetThread_ByPage" & iTopicID & "," &  iPageIndex

	Set objRSThread = CreateObject("ADODB.Recordset")
	Set objRSThread = objConn.Execute(strSqlForumThread)

%>

<section class="light">
	<div class="container">
		<%
		Response.Write "<a href='submitreply.asp?TopicID=" & iTopicID & "'>Post A Reply!</a>"
		%>


	</div>
</section>
