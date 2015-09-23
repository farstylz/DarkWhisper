<%@ Language=VBScript %>
<!--#include virtual="includes/adovbs.inc" -->
<!--#include virtual="includes/databaseconnect.asp" -->
<!--#include virtual="includes/sessions.asp" -->

<%
    Dim strSql, objRS, iOptionID, strPollID, iPollID, userIPAddress

    'Get USer IP
    userIPAddress = Request.ServerVariables("HTTP_X_FORWARDED_FOR")
    IF userIPAddress = "" Then
        userIPAddress = Request.ServerVariables("REMOTE_ADDR")
    End IF  

    'Get Form Data
    strPollID = Request.QueryString("name")
    iOptionID = Request.Form(strPollID)   
    iPollID = CInt(strPollID)

    strSql = "Update_Poll_Data " & iOptionID & "," & iPollID & ",'" & userIPAddress & "'"
    
    Set objRS = Server.CreateObject("ADODB.Recordset")
    Set objRS = ObjConn.Execute(strSql)

    'If the script hasn't failed by now set pollcomplete to true
    Response.Cookies("PollComplete") = True
    Response.Cookies("PollComplete").Expires = Date + 30 

    Response.Redirect("/index.asp")

%>
