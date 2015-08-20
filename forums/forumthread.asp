<%@ Language=VBScript %>
<!--#include virtual="includes/adovbs.inc" -->
<!--#include virtual="includes/databaseconnect.asp" -->
<!--#include virtual="includes/sessions.asp" -->
<!--#include virtual="includes/header.asp" -->
<%
	Dim iTopicID, iPage, strSqlTopic, strSqlPosts, objRSTopic, objRSPosts
	iTopicID = Request.Querystring("Topic")
	iPageSize = 20
	iPage = Request.Querystring("Page")
	strSqlTopic = "Get_Topic2 " & iTopicID & "," &  iPageSize
    strSqlPosts = "Get_Posts " & iTopicID

    Set objRSPosts = CreateObject("ADODB.Recordset")
    Set objRSPosts = objConn.Execute(strSqlPosts)

	Set objRSTopic = CreateObject("ADODB.Recordset")
	Set objRSTopic = objConn.Execute(strSqlTopic)

%>

<section class="light">
	<div class="container">
		<%
        'GET TOPIC
		Response.Write "<a href='submitreply.asp?TopicID=" & iTopicID & "'>Post A Reply!</a>"

		While Not objRSTopic.EOF
		%>
        <div class="column full">
			<table>
				<tr class="forum1">
					<th><%=objRSTopic("Subject")%></th>
				</tr>
				<tr class="forum2">
					<td>Posted by: <%=objRSTopic("UserName")%> At: <%=objRSTopic("Time")%> <br/>Member Since: <%=objRSTopic("UserJoinDate")%></td>
				</tr>
				<tr class="forum3">
					<td><%=objRSTopic("Message")%></td>
				</tr>
			</table>
        </div>
		<%
		Response.Write objRSTopic("TotalPosts")
		Response.Write "<br/>"
		Response.Write objRSTopic("TotalPages")
		objRSTopic.MoveNext
		Wend

        'GET POSTS
        For posts = 1 to iPageSize 
            While Not objRSPosts.EOF
		%>
            <div class="column full">
			    <table>
				    <tr>
					    <td>Posted by: <%=objRSPosts("UserName")%> At: <%=objRSPosts("Time")%> <br/>Member Since: <%=objRSPosts("UserJoinDate")%></td>
				    </tr>
				    <tr>
					    <td><%=objRSPosts("Message")%></td>
				    </tr>
			    </table>
            </div>
		<%
		    objRSPosts.MoveNext
		    Wend
        Next
		%>



	</div>
</section>
