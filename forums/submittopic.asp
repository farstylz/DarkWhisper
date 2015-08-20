<%@ Language=VBScript %>
<!--#include virtual="includes/adovbs.inc" -->
<!--#include virtual="includes/databaseconnect.asp" -->
<!--#include virtual="includes/sessions.asp" -->
<!--#include virtual="includes/header.asp" -->
	<section class="container">
		<!-- todo add querystring from whichever forum the topic will come from -->
		<!-- todo add verification that user is logged in. Else redirect them. -->
		<div>
			<form method="post" action="processtopic.asp">
				<%
				Dim strTopicType
				strTopicType = Request.Querystring("TopicType")
				%>
				<input hidden name="TopicType" value="<%= strTopicType %>"/>
				<Label>Subject:</label><br/>
				<input type="text" name="Subject"><br/>
				<Label>Message:</label><br/>
				<input type="text" name="Message" size="75"><br/>
				<input type="submit" value="Submit">
			</form>
		<div>
	<section>
