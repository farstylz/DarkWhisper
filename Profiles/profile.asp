<%@ Language=VBScript %>
<!--#include virtual="includes/adovbs.inc" -->
<!--#include virtual="includes/databaseconnect.asp" -->
<!--#include virtual="includes/sessions.asp" -->
<!--#include virtual="includes/header.asp" -->
<%
    Dim strMember
    strMember = Request.QueryString("Member")

%>	

    <section>
		<div class="container">
			<div class="row">
                <%
                    
                'If Not IsEmpty(Member) Then
                    ' Display Members Info

                %>   
                <div class="column one-fourth">
                    <div class="user-image">
                        <img src="/images/dreadbit.png" alt="Alternate Text" />
                    </div>        
                </div>
                <%
                'Else
                    'Error occured 
                'End If  

                %>
                <!-- TODO  Add Name and Bio to DB for Users -->
                <div class="three-fourths">
                    <h1><%=strMember%></h1>
                    <div>Name:</div>
                    <div>Email:</div>
                    <br />
                    <div>Forum Posts:</div>
                    <div>Last Post</div>
                    <br />
                    <div>Bio:</div>
                </div>
             </div>
        </div>

    </section>