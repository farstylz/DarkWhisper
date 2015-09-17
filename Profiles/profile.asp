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
                   <strong>User's Name</strong>
                    <div class="user-image">
                        <img src="/images/dreadbit.png" alt="Alternate Text" />
                    </div>
                    <div>
                        Member Since: Ex May 3, 2005
                    </div>    
                    <div>
                    </div>
                </div>
                <%
                'Else
                    'Error occured 
                'End If  

                %>
           
                <div class="three-fourths">
                    <h1>TEST TEST TEST</h1>
                    <form>
                        <input hidden name="UserName" value="<%=Session("UserName")%>" />
                        <label>Comment:</label><br />
                        <input class="textbox" type="text" name="Comment" /><br />
                        <input type="button" value="Submit" />
                    </form>
                </div>
             </div>
        </div>

    </section>