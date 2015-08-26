<%@ Language=VBScript %>
<!--#include virtual="includes/adovbs.inc" -->
<!--#include virtual="includes/databaseconnect.asp" -->
<!--#include virtual="includes/sessions.asp" -->
<!--#include virtual="includes/header.asp" -->
<%
	Dim iTopicID, iPage, strSqlTopic, strSqlPosts, objRSTopic, objRSPosts , iCategory
    iCategory = Request.QueryString("Category")
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
        
        <h2><a href="/forums/categories.asp">Forum</a> > <a href="/forums/generalforum.asp?Category=<%=iCategory%>&Page=1"><%=iCategory%></a></h2>
		<%
        'GET TOPIC

        If bolLoggedin = True Then
		    Response.Write "<a href='submitreply.asp?CategoryID=" & iCategory & "&TopicID=" & iTopicID & "'>Post A Reply!</a>"
        Else
            Response.Write "<a href='/login.asp'>Post A Reply!</a>"
        End If
                 
		While Not objRSTopic.EOF
		%>
        <div class="row clearfix">
            <div class="column full">
			    <table width="100%">
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
        </div>
		<%
		objRSTopic.MoveNext
		Wend

        'GET POSTS
        For posts = 1 to iPageSize 
            While Not objRSPosts.EOF
		%>
        <div class="row clearfix">
            <div class="column full">
			    <table width="100%">
				    <tr class="forum2">
					    <td>Posted by: <%=objRSPosts("UserName")%> At: <%=objRSPosts("Time")%> <br/>Member Since: <%=objRSPosts("UserJoinDate")%></td>
				    </tr>
				    <tr class="forum3">
					    <td><%=objRSPosts("Message")%></td>
				    </tr>
			    </table>
            </div>
        </div>
		<%
		    objRSPosts.MoveNext
		    Wend
        Next
        Response.Write "<a href='submitreply.asp?CategoryID=" & iCategory & "&TopicID=" & iTopicID & "'>Post A Reply!</a>"
		%>


	</div>
</section>
