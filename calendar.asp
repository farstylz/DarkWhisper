<%@ Language=VBScript %>
<% Option Explicit %>
<!DOCTYPE html>

<%
	Function GetMonthName(iMonth)
		Select Case iMonth
			Case 1:
				GetMonthName = "January"
			Case 2:
				GetMonthName = "February"
			Case 3:
				GetMonthName = "March"
			Case 4:
				GetMonthName = "April"
			Case 5:
				GetMonthName = "May"
			Case 6:
				GetMonthName = "June"
			Case 7:
				GetMonthName = "July"
			Case 8:
				GetMonthName = "August"
			Case 9:
				GetMonthName = "September"
			Case 10:
				GetMonthName = "October"
			Case 11:
				GetMonthName = "November"
			Case 12:
				GetMonthName = "December"
			Case Else
				GetMonthName = "Invalid Month"
		End Select
	End Function

	'Next we obtain the date passed through the querystring.
	Dim dbCurrentDate
	dbCurrentDate = Request("Date")

	'Check to make sure Date doesnt contain a value passed through the querystring
	'Otherwise set to current date'
	If Len(dbCurrentDate) = 0 then
		dbCurrentDate = Date()
	End If


	'Creating an array that will store the 42 possible days of the month'
	Dim aCalendarDays(42)


	'Into aCalendarDays, we will place the days of the current month. We will use the
	'DatePart function to determine when the first day of the month is

	Dim iFirstWeekday
	iFirstWeekday = DatePart("w", DateSerial(Year(dbCurrentDate),_
							Month(dbCurrentDate), 1))

	'Now, we want to loop from 1 to the number of day in the current month
	'populating the array aCalendarDays.. Bascially were telling it to give
	'us the "d" day of the current year of next month's first day - 1 which is the last
	'day of current month.

	Dim iDaysInMonth
	iDaysInMonth = DatePart("d", DateSerial(Year(dbCurrentDate),_
							Month(dbCurrentDate)+1, 1-1))

	Dim iLoop
	For iLoop = 1 to iDaysInMonth
		aCalendarDays(iLoop + iFirstWeekday - 1) = iLoop
	Next

	'Now the array is populated. We need to display the array in calendar form.
	'creatings a table of 7 columns for for each DOTW. The total num of possible rows is 6.
	'minus 42 (the upper bound of the aCalendarDays array) minus the last array position used
	'(iFirstWeekday + iDaysInMonth) divided by 7 the number of days in week. Supposed to be simple!? :)

	Dim iColumns, iRows
	iColumns = 7
	iRows = 6 - cInt((42 - (iFirstWeekday + iDaysInMonth)) / 7)

	'Store next and previous months using Server.URLEncode to make sure values
	'can be passed through the querystring
	Dim strPrevMonth, strNextMonth
		strPrevMonth = Server.URLEncode(DateAdd("m", -1, dbCurrentDate))
		strNextMonth = Server.URLEncode(DateAdd("m", 1, dbCurrentDate))

%>

<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Dark Whisper Clan</title>
	<link href="css/dw.css" rel="stylesheet" type="text/css" />
	<link href="css/font.css" rel="stylesheet" type="text/css" />
	<link href="css/lightbox.css" rel="stylesheet" />
	<link href='http://fonts.googleapis.com/css?family=Volkhov:700italic|Open+Sans:400,600' rel='stylesheet' type='text/css'>
	<!--[if lt IE 9]>
	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<script src="js/jquery-1.10.2.min.js"></script>
	<script src="js/lightbox-2.6.min.js"></script>

</head>
<body>
	<section class="hero">
		<div class="container">
			<h1>Dark Whisper</h1>
		</div>
	</section>

	<header class="light">
		<nav class="navbar container">
			<a href="index.html"><span class="icon-home"></span>Home</a>
			<a href="#members"><span class="icon-users"></span>Members</a>
			<a href="forums.asp"><span class="icon-bubbles"></span>Forums</a>
			<a href="calendar.html"><span class="icon-calendar"></span>Calendar</a>
		</nav>
	</header>

	<section class="light">
		<div class="container">
			<table class="calendar">
				<tr>
					<th>
						<a href="calendar.asp?Date=<%=strPrevMonth%>">
							<< View Previous Month
						</a>
					</th>
					<th colspan="5">
							<%
							Response.Write(GetMonthName(Month(dbCurrentDate)))
							Response.Write", "& Year(dbCurrentDate)
							%>
					</th>
					<th>
						<a href="calendar.asp?Date=<%=strNextMonth%>">
							View Next Month >>
						</a>
					</th>
					<%
					'now loop through 1 through iRows, then 1 through iColumns'
					Dim iRowsLoop, iColumnsLoop
					For iRowsLoop = 1 to iRows
						'Create new row
						Response.Write"<tr>"
						For iColumnsLoop = 1 to iColumns
							'Create new column
							'if there is a day there display it, else black out the cell
							If aCalendarDays((iRowsLoop -1) *7 + iColumnsLoop) > 0 then
								'display the date
								Response.Write"<td>"
								Response.Write aCalendarDays((iRowsLoop -1) *7 + iColumnsLoop)
								Response.Write"</td>"
							Else
								'black out the cell
								Response.Write"<td class=""blank"">&nbsp;</td>"
							End If
						Next
							'close the row
							Response.Write"</tr>"
						Next
				%>
			</table>
			<br/>
			<form method="get" action="calendar.asp">
				<select name="Date">
					<option value="<%=DateSerial(Year(dbCurrentDate),1,1)%>"
						<% if Month(dbCurrentDate) = 1 then Response.Write "selected"%>>
						January
					</option>
					<option value="<%=DateSerial(Year(dbCurrentDate),2,1)%>"
						<% if Month(dbCurrentDate) = 2 then Response.Write "selected"%>>
						February
					</option>
					<option value="<%=DateSerial(Year(dbCurrentDate),3,1)%>"
						<% if Month(dbCurrentDate) = 3 then Response.Write "selected"%>>
						March
					</option>
					<option value="<%=DateSerial(Year(dbCurrentDate),4,1)%>"
						<% if Month(dbCurrentDate) = 4 then Response.Write "selected"%>>
						April
					</option>
					<option value="<%=DateSerial(Year(dbCurrentDate),5,1)%>"
						<% if Month(dbCurrentDate) = 5 then Response.Write "selected"%>>
						May
					</option>
					<option value="<%=DateSerial(Year(dbCurrentDate),6,1)%>"
						<% if Month(dbCurrentDate) = 6 then Response.Write "selected"%>>
						June
					</option>
					<option value="<%=DateSerial(Year(dbCurrentDate),7,1)%>"
						<% if Month(dbCurrentDate) = 7 then Response.Write "selected"%>>
						July
					</option>
					<option value="<%=DateSerial(Year(dbCurrentDate),8,1)%>"
						<% if Month(dbCurrentDate) = 8 then Response.Write "selected"%>>
						August
					</option>
					<option value="<%=DateSerial(Year(dbCurrentDate),9,1)%>"
						<% if Month(dbCurrentDate) = 9 then Response.Write "selected"%>>
						September
					</option>
					<option value="<%=DateSerial(Year(dbCurrentDate),10,1)%>"
						<% if Month(dbCurrentDate) = 10 then Response.Write "selected"%>>
						October
					</option>
					<option value="<%=DateSerial(Year(dbCurrentDate),11,1)%>"
						<% if Month(dbCurrentDate) = 11 then Response.Write "selected"%>>
						November
					</option>
					<option value="<%=DateSerial(Year(dbCurrentDate),12,1)%>"
						<% if Month(dbCurrentDate) = 22 then Response.Write "selected"%>>
						December
					</option>
				</select>
				<br/>
				<button type="submit">View Select Month</button>
			</form>
		</div>
	</section>
</body>
</html>
