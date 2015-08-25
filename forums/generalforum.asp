<%@ Language=VBScript %>
<!--#include virtual="includes/adovbs.inc" -->
<!--#include virtual="includes/databaseconnect.asp" -->
<!--#include virtual="includes/sessions.asp" -->
<!--#include virtual="includes/header.asp" -->
	<section class="container">
		<!-- Forums -->
		<%
			Dim strForumName, iPageSize, iPageIndex, strSqlTopics, objRSTopics, objRSReplies, objRSRecent
			strTopicType = Request.Querystring("TopicType")
			iPageSize = 20
			iPage = Request.Querystring("Page")
			strSqlTopics = "GetTopics_ByPage2 '" & strTopicType & "'," & iPageSize & ","_
			& iPage

			Set objRSTopics = CreateObject("ADODB.Recordset")
			Set objRSTopics = objConn.Execute(strSqlTopics)

            Set objRSReplies = CreateObject("ADODB.Recordset")
            Set objRSReplies = objConn.Execute(objRSTopics("TopicID"))


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
					<th>Most Recent</th>
				</tr>
				<%
				While Not objRSTopics.EOF
					Response.Write "<tr>"
					Response.Write "<td><a href='forumthread.asp?Page=1&topic=" & objRSTopics("TopicID") & "'>" & objRSTopics("Subject")  & "</a></td>"
					Response.Write "<td>" & objRSTopics("UserName") & "</td>"
					Response.Write "<td>" & objRsReplies("TotalReplies") & "</td>"
					Response.Write "<td>By Goatboy Today 12:52CST</td>"
					Response.Write "</tr>"
					Response.Flush
					objRSTopics.MoveNext

				Wend

				%>
			</table>
			<hr/>
			<b><a href="submittopic.asp?ForumName=General">Start a new topic!</a></b>
		</div>
	</section>
