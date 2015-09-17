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
		%>
        <h1><%=objRSTopic("Subject")%></h1>
		<div class="forum">
			<div class="thread row">
                <div class="column one-fourth">
                    <strong><a href="/profiles/profile.asp?Member=<%=objRSTopic("UserName")%>"><%=objRSTopic("UserName")%></a></strong>
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
		    objRSTopic.MoveNext
	    Wend

            'GET POSTS
            For posts = 1 to iPageSize 
                While Not objRSPosts.EOF
		    %>
          
				<div class="post row">
					<div class="column one-fourth">
                        <strong><a href="/profiles/profile.asp?Member=<%=objRSPosts("UserName")%>"><%=objRSPosts("UserName")%></a></strong> 
                        <div class="user-image">
                            <img src="/images/dreadbit.png" alt="Alternate Text" />
                        </div>     
                        <div>
                            Member Since: <%=objRSPosts("UserJoinDate")%>
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
		        objRSPosts.MoveNext
		        Wend
            Next       
		    %>
        </div>
        <%
            Response.Write "<a href='submitreply.asp?CategoryID=" & iCategory & "&TopicID=" & iTopicID & "'>Post A Reply!</a>"
        %>
	</div>
</section>
