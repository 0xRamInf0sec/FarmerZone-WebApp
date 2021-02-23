<!doctype html>
<html lang="en">
<head>
<title>Dashboard</title>
<meta charset="utf-8">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="CSS/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"
	integrity="sha384-u/bQvRA/1bobcXlcEYpsEdFVK/vJs3+T+nXLsBYJthmdBuavHvAW6UsmqO2Gd/F9"
	crossorigin="anonymous"></script>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">

<style>
.checked {
	color: orange;
}
</style>
<body onload="send()">
	<%@page import="java.util.*"%>
	<%@page import="java.io.IOException"%>
	<%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="com.mysql.jdbc.Connection"%>
	<%@page import="com.mysql.jdbc.PreparedStatement"%>


	<div class="wrapper d-flex align-items-stretch">
		<nav id="sidebar">
			<div class="custom-menu">
				<button type="button" id="sidebarCollapse" class="btn btn-primary">
				</button>
			</div>
			<div class="img bg-wrap text-center py-4"
				style="background-image: url(images/bg_1.jpg);">
				<div class="user-logo">
					<label for="file" class="img"><img id="profile"
						style="border-radius: 50%" height="100" width="100"
						src="images/logo.jpg"></label> <input style="display: none"
						id="file" type="file" onchange="loadFile(event)" />
					<h3>
						<%
							HttpSession ses = request.getSession();
						ses.setAttribute("type", "farmer");
						String number = String.valueOf(ses.getAttribute("pno"));
						if (ses.getAttribute("pno") != null) {

							//System.out.println(number);
							try {
								Class.forName("com.mysql.jdbc.Driver");
								Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerzone", "Bootathon",
								"6383411123");
								PreparedStatement st = (PreparedStatement) con
								.prepareStatement("select * from Farmerregister where `Phonenumber` = ?");
								st.setString(1, number);
								String dbfname = "";
								String dbflastname = "";
								ResultSet r1 = st.executeQuery();
								while (r1.next()) {

							dbfname = r1.getString("Firstname");
							// out.println(dbuser);
							dbflastname = r1.getString("Lastname");
								}

								out.println(dbfname);
								out.println(dbflastname);
								con.close();
							} catch (Exception ec) {
								System.out.print(ec);
							}

						} else {
							request.setAttribute("Loginauth", "Please Login as farmer first..");
							RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Login.jsp");
							dispatcher.forward(request, response);
						}
						%>
					</h3>
				</div>
			</div>
			<!-- span class="fa fa-download mr-3 notif"><small
							class="d-flex align-items-center justify-content-center">5</small></span> -->
			<ul class="list-unstyled components mb-5">
				<li class="active"><a href="FarmerDashboard.jsp"><span
						class="fa fa-home mr-3"></span> Home</a></li>
				<li><a href="ContactsStore"><span id="messageSpan"
						class="fa fa-mobile mr-3"><small id="messaged"
							class="d-flex align-items-center justify-content-center"></small></span>
						Contacts</a></li>
				<li><a href="Shop.jsp"><span class="fa fa-store-alt mr-3"></span>
						Shop</a></li>
				<li><a href="Orders.jsp"><span class="fa fa-cart-plus mr-3"></span>
						Orders</a></li>
				<li><a href="Assistant.jsp"><span class="fas fa-users mr-3"></span>
						Assistant</a></li>
				<li><a href="Statistics.jsp"><span
						class="fa fa-line-chart mr-3"></span> Stats and History</a></li>
				<li><a href="Settings.jsp"><span class="fa fa-cog mr-3"></span>
						Settings</a></li>
				<li><a href="logout.jsp"><span
						class="fa fa-sign-out-alt mr-3"></span> Sign Out</a></li>
			</ul>

		</nav>

		<!-- Page Content  -->
		<div id="content" class="p-4 p-md-5 pt-5">
			<div class="get-quote">
				<div class="row">
					<div class="col-sm-10 col-12">
						<h3 id="quote">Farmer</h3>
					</div>
					<!-- div class="col-sm-2 col-12">
						<a style="color: white;" class="btn btn-success"><i
							class="fa fa-plus mr-3"></i>To Sell</a>
					</div> -->
				</div>
			</div>

			<div class="card-columns">
				<!--div class="card bg-primary">
					<div class="card-body text-center">
						<p class="card-text">Some text inside the first card</p>
					</div>
				</div>
				<div class="card bg-warning">
					<div class="card-body text-center">
						<p class="card-text">Some text inside the second card</p>
					</div>
				</div>
				<div class="card bg-success">
					<div class="card-body text-center">
						<p class="card-text">Some text inside the third card</p>
						<h2 class="card-text">Some text inside the third card</h2>
						<button class="btn btn-info">Some text inside the third card</button>
					</div>
				</div>
				<div class="card bg-danger">
					<div class="card-body text-center">
						<p class="card-text">Some text inside the fourth card</p>
					</div>
				</div>-->

				<div class="card bg-light">
					<div class="card-body text-center">
						<p class="card-text">Followers</p>
						<%
							int c = 0;
						try {
							Class.forName("com.mysql.jdbc.Driver");
							Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerzone", "Bootathon",
							"6383411123");
							PreparedStatement st = (PreparedStatement) con.prepareStatement("select * from follow where `Following` = ?");
							st.setString(1, number);
							ResultSet r1 = st.executeQuery();
							while (r1.next()) {
								c++;
							}

							con.close();
						} catch (Exception ec) {
							System.out.print(ec);
						}

						out.println("<h4 class='card-text'>" + c + "</h4>");
						%>

					</div>
				</div>
				<div class="card bg-light">
					<div class="card-body text-center">
						<p class="card-text">Profit Earned</p>
						<%
							String status = "Accepted";
						int profit = 0;
						try {
							Class.forName("com.mysql.jdbc.Driver");
							Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerzone", "Bootathon",
							"6383411123");
							PreparedStatement st = (PreparedStatement) con
							.prepareStatement("select * from payment where `farmernumber` = ? and status=?");
							st.setString(1, number);
							st.setString(2, status);
							ResultSet r1 = st.executeQuery();
							while (r1.next()) {

								profit += Integer.valueOf(r1.getString("price"));
							}

							con.close();
						} catch (Exception ec) {
							System.out.print(ec);
						}

						out.println("<h4 class='card-text'>Rs." + profit + "</h4>");
						%>

					</div>
				</div>
				<div class="card bg-light">
					<div class="card-body text-center">
						<p class="card-text">Products sold</p>
						<%
							int p = 0;
						try {
							Class.forName("com.mysql.jdbc.Driver");
							Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerzone", "Bootathon",
							"6383411123");
							PreparedStatement st = (PreparedStatement) con
							.prepareStatement("select * from payment where `farmernumber` = ? and status=?");
							st.setString(1, number);
							st.setString(2, status);
							ResultSet r1 = st.executeQuery();
							while (r1.next()) {

								p++;
							}

							con.close();
						} catch (Exception ec) {
							System.out.print(ec);
						}

						out.println("<h4 class='card-text'>" + p + "</h4>");
						%>

					</div>
				</div>
				<!-- div class="card bg-info">
					<div class="card-body text-center">
						<p class="card-text">Some text inside the sixth card</p>
					</div>
				</div> -->
			</div>
			<hr></hr>

			<h2>Reports about you</h2>
			<div class="card bg-light container">
				<div class="card-text">Be Aware about this</div>
				<div class="card-body text-center">

					<div>

						<%
							int f = 0;

						try {
							Class.forName("com.mysql.jdbc.Driver");
							Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerzone", "Bootathon",
							"6383411123");
							PreparedStatement st = (PreparedStatement) con.prepareStatement("select * from reports where `number1` = ?");
							st.setString(1, number);
							ResultSet rs = st.executeQuery();
							while (rs.next()) {
								f = 1;
								out.println("<p class='card-text'>" + rs.getString(1) + " reports you : " + rs.getString(3) + "</p>");
							}
						} catch (Exception e) {
							System.out.println(e);
						}
						if (f == 0) {
							out.println(
							"<i class='fa fa-check' style='font-size:100px;border:10px solid green;border-radius:50%;padding:-2%;display:block;margin:auto;width:14%;text-align:center;color:green'></i>");
							out.println("<h1 style='color:green'>You doesn't have any reports</h1>");
							out.println("<h6 style='text-align:center>Good to go</h6>");
						}
						%>
					</div>
				</div>
			</div>

		</div>
	</div>
	<div id="response"></div>
	<script>
		var num1 =
	<%=number%>
		;
		var interval = setInterval(send, 1000);

		function send() {

			var span = document.getElementById("messageSpan");
			var count = document.getElementById("messaged");
			var http = new XMLHttpRequest();
			http.onreadystatechange = function() {
				if (http.readyState == 4) {
					var r = http.responseText;
					try {
						var obj = JSON.parse(r);
						var l = Object.values(obj);
						var mC = 0;
						for (var i = 0; i < l.length; i++) {
							if (l[i] > 0) {
								mC++;
							}

						}
						if (mC > 0) {
							span.classList.add("notif");
							count.innerHTML = mC;
						}

						//document.getElementById("response").innerHTML=l;
					} catch (e) {
						console.log(r);
					}

				}
			}
			http.open("GET", "MessageCounter?senderNumber=" + num1, true);
			http.send();

		}
	</script>
	<script src="JS/jquery.min.js"></script>
	<script src="JS/popper.js"></script>
	<script src="JS/bootstrap.min.js"></script>
	<script src="JS/main.js"></script>
</body>
</html>