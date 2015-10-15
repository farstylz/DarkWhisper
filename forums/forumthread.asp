<%@ Language=VBScript %>
<!--#include virtual="includes/adovbs.inc" -->
<!--#include virtual="includes/databaseconnect.asp" -->
<!--#include virtual="includes/sessions.asp" -->
<!--#include virtual="includes/header.asp" -->
<%
	Dim iTopicID, iPage, strSqlTopic, strSqlPosts, objRSTopic, objRSPosts , iCategory, iRow, strClassName
    iCategory = Request.QueryString("Category")
	iTopicID = Request.Querystring("Topic")
	iPageSize = 10
	iPage = Request.Querystring("Page")
	strSqlTopic = "Get_Topic2 " & iTopicID & "," &  iPageSize
    'strSqlPosts = "Get_Posts " & iTopicID
    strSqlPosts = "GetPostsTest " & iTopicID & "," & iPageSize & "," & iPage

    Set objRSPosts = CreateObject("ADODB.Recordset")
    Set objRSPosts = objConn.Execute(strSqlPosts)

	Set objRSTopic = CreateObject("ADODB.Recordset")
	Set objRSTopic = objConn.Execute(strSqlTopic)

%>

<section>
	<div class="container">
        
        <h3><a href="/forums/categories.asp">Forum</a> > <a href="/forums/generalforum.asp?Category=<%=iCategory%>&Page=1"><%=iCategory%></a></h3>
		<%
        'GET TOPIC

        If bolLoggedin = True Then
		    Response.Write "<a href='submitreply.asp?CategoryID=" & iCategory & "&TopicID=" & iTopicID & "'>Post A Reply!</a>"
        Else
            Response.Write "<a href='/login.asp'>Post A Reply!</a>"
        End If
           
		While Not objRSTopic.EOF
            If iPage = 1 Then   
		%>
            <h1><%=objRSTopic("Subject")%></h1>                   
                <div class="topic row">
                    <div class="column one-fourth">
                        <strong><a href="//user/profile.asp/profile.asp?Member=<%=objRSTopic("UserName")%>"><%=objRSTopic("UserName")%></a></strong>
                        <div class="user-image">
                            <img src="/images/dreadbit.png" alt="Alternate Text" />
                        </div>
                        <div>
                            Member Since: <%=objRSTopic("UserJoinDate")%>
                        </div>
                    </div>
                    <div class="column three-fourths">
                        <%=objRSTopic("Time")%>
                        <div>
                            <%=objRSTopic("Message")%>
                        </div>
                    </div>
                </div>
		    <%
            Else
            %>       
            <h1 class="forumbreak"><%=objRSTopic("Subject")%></h1>        
            <% 
            End If 
		objRSTopic.MoveNext
	    Wend 
        
        'GET POSTS
        iRow = 1 
        For posts = 1 to iPageSize 
            While Not objRSPosts.EOF
                strClassName = ""
                If iRow Mod 2 = 1 Then
                    strClassName = "light"
                End If
                        
		%>          
			    <div class="post row <%=strClassName%>">
				    <div class="column one-fourth">
                        <strong><a href="//user/profile.asp/profile.asp?Member=<%=objRSPosts("UserName")%>"><%=objRSPosts("UserName")%></a></strong> 
                        <div class="user-image">
                            <img src="/images/dreadbit.png" alt="Alternate Text" />
                        </div>     
                        <div>
                            Member Since: <%=objRSPosts("JoinDate")%>
                        </div>                
                    </div>
                    <div class="column three-fourths">
                            <%=objRSPosts("Time")%> 
                        <div>
                            <%=objRSPosts("Message")%>
                        </div>
                    </div>
			    </div>

		<%
                iRow = iRow + 1
		    objRSPosts.MoveNext
		    Wend
        Next       
		%>
        <br />
        <div>
        <%
        Response.Write "<a href='submitreply.asp?CategoryID=" & iCategory & "&TopicID=" & iTopicID & "'>Post A Reply!</a>"
        %>
        </div>
	</div>
</section>
<footer class="navbar inverse container">
		<a href="#">Back to Top</a>

</footer>


</body>
</html>
