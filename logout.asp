<%@ Language=VBScript %>

<!--#include virtual="includes/adovbs.inc" -->
<!--#include virtual="includes/databaseconnect.asp" -->
<!--#include virtual="includes/sessions.asp" -->
<%
    Session.Abandon
    Response.Redirect "/index.asp"
%>