<%@ Language=VBScript %>
<!--#include virtual="includes/adovbs.inc" -->
<!--#include virtual="includes/databaseconnect.asp" -->
<!--#include virtual="includes/sessions.asp" -->
<!--#include virtual="includes/header.asp" -->
<section class="container">
	<!-- Forums -->
	<%
		Dim strForumName, iPage, iPageSize, iPageIndex, iCategory, strSqlTopics, strSqlReplies, strSqlRecent
        Dim objRSTopics, objRSReplies, objRSRecent, iPageCount, iPageTemp, iRow, strClassName
		iCategory = Request.Querystring("Category")
		iPageSize = 10
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
			Response.Write "<b><a href='submittopic.asp?Category=" & iCategory & "'>Start A New Topic!</a></b>"
        Else
            Response.Write "<a href='/login.asp'>Start A New Topic!</a>"
        End If
        %>
        <br />
		<div>
			<div class="row forumbreak">
				<!-- Topics -->
				<div class="column half">Topic</div>
				<div class="column one-fifth">Author</div>
				<div class="column one-tenth">Replies</div>
				<div class="column one-fifth">Most Recent</div>
			</div>
			<%
            iRow = 1
			While Not objRSTopics.EOF
                    
                strSqlReplies = "Get_Post_Replies " & objRSTopics("TopicID")
                Set objRSReplies = CreateObject("ADODB.Recordset")
                Set objRSReplies = objConn.Execute(strSqlReplies)

                strSqlRecent = "Get_Most_Recent " & objRSTopics("TopicID")
                Set objRSRecent = CreateObject("ADODB.Recordset")
                Set objRSRecent = objConn.Execute(strSqlRecent)
                    
                'Get count of replies for pagification 
                iReplies = Cint(objRSReplies("TotalReplies"))
                iPageTemp = (iReplies -1) / iPageSize 
                iPageCount = Int(iPageTemp)
        
                strClassName = ""
                If iRow Mod 2 = 0 Then
                    strClassName = "light"
                End If

                iRow = iRow + 1
            %>           
                    <div class="row thread <%=strClassName%>">
                        <div class="column half"><a href="forumthread.asp?Category=<%=iCategory%>&Page=1&topic=<%=objRSTopics("TopicID")%>"><%=objRSTopics("Subject")%></a>
                            <%
                                If iPageCount > 0 Then
                                    For iCount = 1 to (iPageCount +1)
                            %>
                                        <a class="pagelink" href="forumthread.asp?Category=<%=iCategory%>&Page=<%=iCount%>&topic=<%=objRSTopics("TopicID")%>"><%=iCount%></a>
                            <%
                                    Next
                                End If
                            %>
                        </div>
                        <div class="column one-fifth">Posted By:<a href="..//user/profile.asp/profile.asp?Member=<%=objRSTopics("UserName")%>"><%=objRSTopics("UserName")%></a><br /><%=objRSTopics("Time")%></div>
                        <div class="column one-tenth"><%=objRsReplies("TotalReplies")%></div>
                                       
					
                <%
                    IF objRSRecent.EOF Then
                %>
                        <div class="column one-fifth">By:<a href="..//user/profile.asp/profile.asp?Member=<%=objRSTopics("UserName")%>"><%=objRSTopics("UserName")%></a><br /><%=objRSTopics("Time")%></div>                       
                <%
                    Else
                %>					                        
                        <div class="column one-fifth">By:<a href="..//user/profile.asp/profile.asp?Member=<%=objRSTopics("UserName")%>"><%=objRSRecent("UserName")%></a><br /><%=objRSRecent("Time")%></div>                   
                <%
                    End If
                %>
                        </div>
                <%
                objRSReplies.Close
                Set objRSReplies = Nothing 
                objRSRecent.Close
                Set objRSRecent = Nothing
				objRSTopics.MoveNext

			Wend
			%>
		</div>
	</div>
    <br/>
	<b><a href="submittopic.asp?Category=<%=iCategory%>">Start a new topic!</a></b>
</section>
