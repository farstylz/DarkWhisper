<%@ Language=VBScript %>
<!--#include virtual="includes/adovbs.inc" -->
<!--#include virtual="includes/databaseconnect.asp" -->
<!--#include virtual="includes/sessions.asp" -->
<!--#include virtual="includes/header.asp" -->
	<section>
		<div class="container">
			<div class="row">
				<div class="column two-thirds">
					<article class="art-content">
						<h1>Welcome Back MOFOS!</h1>
						<h2>Posted by: Stylz</h2>
						<p>Welcome back! I know it's been a long time but we can blame
							 Goat, Spawn and Xbox for that. Everyone is planning to set their
							 focus on upcoming MMO Elder Scrolls Online. With the return of
							 DAOC like PVP it's time for us to dust off our dicks and get back
							 to rape town! Diki of the "Le Boner Clan" calls the new game
							 "ASTOUNDING" and "PUNCH YOU IN THE DICK" fun! I don't know about
							 you guys, but that sounds GAY err awesome to me!</p>
					</article>
					<br>
					<article>
						<h2>We Quit!</h2>
						<h4>Posted by: Stylz</h4>
						<p>I know what your thinking, we usually last for at least a month.
							 Well fuck you! Leveling was a bitch and nbobody ever got on.
							 First world troubles, I know. Anyway... I'm going golfing. I'll
							 see you bitches later.</p>
					</article>
					<div class="row clearfix">
						<div class="column half pagebreak">
							<p> Screen Shot of the Day!
							<a href="images/teso_logo.jpg" data-lightbox="TESO1"  class="ssday">
								<img src="images/teso_logo.jpg"/> Flying Dragons!
							</a>
						</div>
						<div class="half pagebreak">
							<article>
								<h4>Random Shit right here!</h4>
								<p> Whatever man... I was there when it happened!. Eat a weiner
									  dog and stick it where the sun don't shine!.</p>
							</article>
						</div>
					</div>
				</div>
				<div class="column one-third">
					<aside>
                       <!----- Poll ----->
                        <% 
                            
                            Dim userIPAddress, objRSQuestions, objRSIPCheck, objRSAnswers
                            Dim strSqlQuestions, strSqlAnswers, strSqlIPCheck

                            'Get USer IP
                            userIPAddress = Request.ServerVariables("HTTP_X_FORWARDED_FOR")
                            IF userIPAddress = "" Then
                                userIPAddress = Request.ServerVariables("REMOTE_ADDR")
                            End IF  

                            'Check User's IP vs DB 
                            strSqlIPCheck = "Check_Poll_IP " & userIPAddress
                            objRSIPcheck = Server.CreateObject("ADODB.Recordset")
                            objRSIPcheck = objCOnn.Execute(strSqlIPCheck)
                            
                            If objRSIPCheck.EOF Then
                               
                                'Get Poll Questions ( hasn't voted yet)

                                strSqlQuestions = ""
                                objRSPoll = Server.CreateObject("ADODB.Recordset")
                                objRSPoll = objConn.Execute(strSqlQuestions)

                            Else
                                
                            'Get Poll Answers ( Already submitted )

                            strSqlAnswers = ""
                            objRSAnswers = Server.CreateObject("ADODB.Recordset")
                            objRSAnswers = objConn.Execute(strSqlAnswers)

                           
                        %>
						<form action="" method="post">
							<h2>What's Our Next Game?</h2>
							<input type="radio" name="game" value="lawbreakers"/> Law Breakers
							<br/>
							<input type="radio" name="game" value="blah"/> Blah
							<br/>
							<input type="radio" name="game" value="wow"/> Back to WoW
							<br/>
							<input type="radio" name="game" value="quit"/> I HATE GAMES!
							<br/>
							<input type="submit" value="submit"/>
						</form>
					</aside>
					<div class="pagebreak"></div>
					<aside>
						<a class="twitter-timeline" href="https://twitter.com/FarStyLz" data-widget-id="435184770801094657">Tweets by @FarStyLz</a>
						<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");
						</script>
					</aside>
				</div>
			</div>
		</div>
	</section>
	<div class="pagebreak"></div>
	<section class="light">
		<div class="container">
				<h1 id="members">Members</h1>
			<div class="row">
				<div class="column one-fourth">
					<figure class="member">
						<img src="images/dreadbit.png">
						<figcaption>Goatboy</figcaption>
						<span class="more">Member Since: 1996<br>Status: Active <br>Email: Goatboy42@suckit.com</span>
					</figure>
				</div>
				<div class="column one-fourth">
					<figure class="member">
						<img src="images/dreadbit.png">
						<figcaption>Spawn</figcaption>
						<span class="more">Member Since: 1998 <br>Status: Active<br>Email: RivalSummit@gmail.com</span>
					</figure>
				</div>
				<div class="column one-fourth">
					<figure class="member">
						<img src="images/dreadbit.png">
						<figcaption>Diki</figcaption>
						<span class="more">Member Since: 2001 <br>Status: Bi-Curious<br>zerospin@whatever.com
					</figure>
				</div>
				<div class="column one-fourth">
					<figure class="member">
						<img src="images/dreadbit.png">
						<figcaption>FarStyLz</figcaption>
						<span class="more">Member Since: 2000 <br>Status: Awesome<br>Email: Farstylz@gmail.com
					</figure>
				</div>
			</div>
			<div class="row">
				<div class="column one-fourth">
					<figure class="member">
						<img src="images/dreadbit.png">
						<figcaption>Geekboy2u</figcaption>
					</figure>
				</div>
				<div class="column one-fourth">
					<figure class="member">
						<img src="images/dreadbit.png">
						<figcaption>Robocop</figcaption>
					</figure>
				</div>
				<div class="column one-fourth">
					<figure class="member">
						<img src="images/dreadbit.png">
						<figcaption>Marco</figcaption>
					</figure>
				</div>
				<div class="column one-fourth">
					<figure class="member">
						<img src="images/dreadbit.png">
						<figcaption>Polo</figcaption>
					</figure>
				</div>
			</div>
		</div>
	</section>
	<footer class="navbar inverse">
		<a href="#">Back to Top</a>
	</footer>


</body>
</html>
