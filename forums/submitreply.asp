<%@ Language=VBScript %>
<!--#include virtual="includes/adovbs.inc" -->
<!--#include virtual="includes/databaseconnect.asp" -->
<!--#include virtual="includes/sessions.asp" -->
<!--#include virtual="includes/header.asp" -->

<section class="container">
	<!-- todo add querystring from whichever forum the topic will come from -->
	<!-- todo add verification that user is logged in. Else redirect them. -->
	<div>
		<form method="post" action="processreply.asp">
			<%
			Dim iTopicID, iCategory
			iTopicID = Request.Querystring("TopicID")
            iCategory = Request.QueryString("CategoryID")
			%>
			<input hidden name="TopicID" value="<%= iTopicID %>"/>
            <input hidden name="CategoryID" value="<%= iCategory %>"/>
			<Label>Message:</label><br/>
			<input type="text" name="Message" size="75"><br/>
			<input type="submit" value="Submit">
		</form>
	<div>
<section>
