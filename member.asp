<%@ Language=VBScript %>
<!--#include virtual="includes/adovbs.inc" -->
<!--#include virtual="includes/databaseconnect.asp" -->
<!--#include virtual="includes/sessions.asp" -->
<!--#include virtual="includes/header.asp" -->
<%
    Dim strUserName, 


%>	

    <section>
		<div class="container">
			<div class="row clearfix">
                <%
                    
                If Not IsEmpty(strUserName) Then
                    ' Display Members Info

                %>   
                <div>
                    <h1></h1>


                </div>

                <%
                Else
                    'Error occured 

                %>
            </div>
        </div>
    </section>