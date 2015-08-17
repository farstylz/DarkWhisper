<%@ Language=VBScript %>
<!--#include virtual="/adovbs.inc" -->
<!--#include file="databaseconnect.asp" -->
<!--#include file="sessions.asp" -->
<!--#include file="header.asp" -->
	<section class="container">
		<!-- Forums -->
		<%
			Dim strForumName, iPageSize, iPageIndex, strSqlTopics, objRS2
			strTopicType = Request.Querystring("TopicType")
			iPageSize = 20
			iPage = Request.Querystring("Page")
			strSqlTopics = "GetTopics_ByPage2 '" & strTopicType & "'," & iPageSize & ","_
			& iPage

			Set objRS2 = CreateObject("ADODB.Recordset")
			Set objRS2 = objConn.Execute(strSqlTopics)

		%>

		<div>
			<h1>General Forum</h1>
			<b><a href="submittopic.asp?TopicType=General">Start a new topic!</a></b>
			<hr/>
			<table>
				<tr>
					<!-- Temp bullshit -->
					<th>Topic</th>
					<th>Author</th>
					<th>Replies</th>
					<th>Last Post</th>
				</tr>
				<%
				While Not objRS2.EOF
					Response.Write "<tr>"
					Response.Write "<td><a href='forumthread.asp?Page=1&topic=" & objRS2("TopicID") & "'>" & objRS2("Subject")  & "</a></td>"
					Response.Write "<td>" & objRS2("UserName") & "</td>"
					Response.Write "<td>1000</td>"
					Response.Write "<td>By Goatboy Today 12:52CST</td>"
					Response.Write "</tr>"
					Response.Flush
					objRS2.MoveNext

				Wend

				%>
			</table>
			<hr/>
			<b><a href="submittopic.asp?ForumName=General">Start a new topic!</a></b>
		</div>
	</section>
