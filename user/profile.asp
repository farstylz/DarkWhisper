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
			<div class="row light profile">
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
                    <dl>
                        <dt>Name:</dt>
                        <dd>Bob Bobtownian</dd>
                        <dt>Email:</dt>
                        <dd>Bob@bob.com</dd>
                        <br />
                        <dt>Forum Posts:</dt>
                        <dd>342</dd>
                        <dt>Last Post:</dt>
                        <dd>Does Diki Like Penis? 11:27 Oct 12th 2015</dd>
                        <br />
                        <dt>Bio:</dt>
                        <dd>I grew up in BOBTOWN. I'm the king there and it's awesome. Come visit the sometime!</dd>
                    </dl>
                </div>
             </div>
        </div>

    </section>