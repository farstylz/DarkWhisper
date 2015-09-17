<%@ Language=VBScript %>
<!--#include virtual="includes/adovbs.inc" -->
<!--#include virtual="includes/databaseconnect.asp" -->
<!--#include virtual="includes/sessions.asp" -->
<!--#include virtual="includes/header.asp" -->
	<section class="container">
		<!-- Forums -->
		<%
			Dim strForumName, iPage, iPageSize, iPageIndex, iCategory, strSqlTopics, strSqlReplies, strSqlRecent
            Dim objRSTopics, objRSReplies, objRSRecent
			iCategory = Request.Querystring("Category")
			iPageSize = 20
			iPage = Request.Querystring("Page")
			strSqlTopics = "GetTopics_ByPage2 '" & iCategory & "'," & iPageSize & "," & iPage

			Set objRSTopics = CreateObject("ADODB.Recordset")
			Set objRSTopics = objConn.Execute(strSqlTopics)

		%>

		<div>
            <h4><a href="/forums/categories.asp">Forum</a> > <a href="/forums/generalforum.asp?Category=<%=iCategory%>&Page=1"><%=iCategory%></a></h4>
			<h1><%=iCategory%></h1>
            <%
            If bolLoggedIn = True Then
			    Response.Write "<b><a href='submittopic.asp?Category=" & iCategory & "'>Start a new topic!</a></b>"
            Else
                Response.Write "<a href='/login.asp'>Post A Reply!</a>"
            End If
            %>
			<hr/>
			<table>
				<tr>
					<!-- Topics -->
					<th>Topic</th>
					<th>Author</th>
					<th>Replies</th>
					<th>Most Recent</th>
				</tr>
				<%
				While Not objRSTopics.EOF
                    
                    strSqlReplies = "Get_Post_Replies " & objRSTopics("TopicID")
                    Set objRSReplies = CreateObject("ADODB.Recordset")
                    Set objRSReplies = objConn.Execute(strSqlReplies)

                    strSqlRecent = "Get_Most_Recent " & objRSTopics("TopicID")
                    Set objRSRecent = CreateObject("ADODB.Recordset")
                    Set objRSRecent = objConn.Execute(strSqlRecent)
                %>
                    
                    <tr>
                        <td><a href="forumthread.asp?Category=<%=iCategory%>&Page=1&topic=<%=objRSTopics("TopicID")%>"><%=objRSTopics("Subject")%></a></td>
                        <td>Posted By:<a href="../profiles/profile.asp?Member=<%=objRSTopics("UserName")%>"><%=objRSTopics("UserName")%></a><br /><%=objRSTopics("Time")%></td>
                        <td><%=objRsReplies("TotalReplies")%></td>
                    
                    
					
                <%
                    IF objRSRecent.EOF Then
                %>
                        <td>By:<a href="../profiles/profile.asp?Member=<%=objRSTopics("UserName")%>"><%=objRSTopics("UserName")%></a><br /><%=objRSTopics("Time")%></td>                       
                <%
                    Else
                %>					                        
                        <td>By:<a href="../profiles/profile.asp?Member=<%=objRSTopics("UserName")%>"><%=objRSRecent("UserName")%></a><br /><%=objRSRecent("Time")%></td>
                    </tr>
                <%
                    End If
                    objRSReplies.Close
                    Set objRSReplies = Nothing 
                    objRSRecent.Close
                    Set objRSRecent = Nothing
					objRSTopics.MoveNext

				Wend
				%>
			</table>
			<hr/>
			<b><a href="submittopic.asp?Category=<%=iCategory%>">Start a new topic!</a></b>
		</div>
	</section>
