<%@ Language=VBScript %>
<!--#include virtual="includes/adovbs.inc" -->
<!--#include file="includes/databaseconnect.asp" -->
<!--#include file="includes/sessions.asp" -->
<!--#include file="includes/header.asp" -->
<%
	Dim iTopicID, iPage, strSqlTopic, strSqlPosts, objRSTopic, objRSPosts
	iTopicID = Request.Querystring("Topic")
	iPageSize = 20
	iPage = Request.Querystring("Page")
	strSqlTopic = "Get_Topic2 " & iTopicID & "," &  iPageSize


	Set objRSTopic = CreateObject("ADODB.Recordset")
	Set objRSTopic = objConn.Execute(strSqlTopic)

%>

<section class="light">
	<div class="container">
		<%
		Response.Write "<a href='submitreply.asp?TopicID=" & iTopicID & "'>Post A Reply!</a>"

		While Not objRSTopic.EOF
		%>
			<table>
				<tr>
					<th><%=objRSTopic("Subject")%></th>
				</tr>
				<tr>
					<td>Posted by: <%=objRSTopic("UserName")%> At: <%=objRSTopic("Time")%> <br/>Member Since: <%=objRSTopic("UserJoinDate")%></td>
				</tr>
				<tr>
					<td><%=objRSTopic("Message")%></td>
				</tr>
			</table>
		<%
		Response.Write objRSTopic("TotalPosts")
		Response.Write "<br/>"
		Response.Write objRSTopic("TotalPages")
		objRSTopic.MoveNext
		Wend
		%>




	</div>
</section>
