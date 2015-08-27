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
	Dim strSql, iCategory, strSubject, strMessage, iUserID, dtCreateTime

	iCategory = Request.Form("Category")
	strSubject = cleanSQL(Request.Form("Subject"))
	strMessage = cleanSQl(Request.Form("Message"))
	dtCreateTime = Now
	iUserID = Session("UserID")

	Set objRS = CreateObject("ADODB.Recordset")
	strSql = "StartTopic " & iUserID & ",'" & iCategory & "','" & strSubject & "','" & strMessage & "','" & dtCreateTime & "'"

	Response.Write strSql
	Set objRS = objConn.Execute(strSql)

	objConn.Close
	Set objConn = Nothing

    Response.Redirect "/forums/forumthread.asp?Category=" & iCategory & "&Page=1&Topic=" & iTopicID 

%>
