<!doctype html>
<html lang="en">
<head>
<title>Dashboard</title>
<meta charset="utf-8">
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
<body>
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
						ses.setAttribute("type", "consumer");
						String number = String.valueOf(ses.getAttribute("pno"));
						String loc = "";
						if (ses.getAttribute("pno") != null) {

							//System.out.println(number);
							try {
								Class.forName("com.mysql.jdbc.Driver");
								Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerzone", "Bootathon",
								"6383411123");
								PreparedStatement st = (PreparedStatement) con
								.prepareStatement("select * from consumerregister where `Phonenumber` = ?");
								st.setString(1, number);
								String dbfname = "";
								String dbflastname = "";

								ResultSet r1 = st.executeQuery();
								while (r1.next()) {

							dbfname = r1.getString("Firstname");

							dbflastname = r1.getString("Lastname");
							loc = r1.getString("Locationtext");
								}

								out.println(dbfname);
								out.println(dbflastname);
								con.close();
							} catch (Exception ec) {
								System.out.print(ec);
							}
						} else {
							request.setAttribute("Loginauthcon", "Please Login as Consumer first..");
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
				<li class="active"><a href="ConsumerDashboard.jsp"><span
						class="fa fa-home mr-3"></span> Home</a></li>
				<li><a href="ContactsStore"><span class="fa fa-mobile mr-3"
						id="messageSpan"><small id="messaged"
							class="d-flex align-items-center justify-content-center"></small></span>
						Contacts</a></li>
				<li><a href="ConsumerFollowing.jsp"><span
						class="fas fa-user-check mr-3"></span> Following</a></li>
				<li><a href="ConsumerShop.jsp"><span
						class="fa fa-store-alt mr-3"></span> Buy Products</a></li>
				<li><a href="ConsumerOrders.jsp"><span
						class="fa fa-cart-plus mr-3"></span> Orders</a></li>
				<li><a href="consumerCart.jsp"><span
						class="fa fa-shopping-cart mr-3"></span> Cart</a></li>

				<li><a href="ConsumerSettings.jsp"><span
						class="fa fa-cog mr-3"></span> Settings</a></li>
				<li><a href="logout.jsp"><span
						class="fa fa-sign-out-alt mr-3"></span> Sign Out</a></li>
			</ul>

		</nav>

		<!-- Page Content  -->
		<div id="content" class="p-4 p-md-5 pt-5">
			<div class="get-quote">
				<div class="row">
					<div class="col-sm-10 col-12">
						<h3 id="quote">Consumer</h3>
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
						<p class="card-text">Following</p>
						<%
							int c = 0;
						try {
							Class.forName("com.mysql.jdbc.Driver");
							Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerzone", "Bootathon",
							"6383411123");
							PreparedStatement st = (PreparedStatement) con.prepareStatement("select * from follow where `Follower` = ?");
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
						<p class="card-text">Product Purchased</p>
						<%
							String status = "Accepted";
						int p = 0;
						try {
							Class.forName("com.mysql.jdbc.Driver");
							Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerzone", "Bootathon",
							"6383411123");
							PreparedStatement st = (PreparedStatement) con
							.prepareStatement("select * from payment where `consumernumber` = ? and status=?");
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
				<div class="card bg-light">
					<div class="card-body text-center">
						<p class="card-text">Purchased amount</p>
						<%
							String stat = "Accepted";
						int amount = 0;
						String price = "";
						try {
							Class.forName("com.mysql.jdbc.Driver");
							Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerzone", "Bootathon",
							"6383411123");
							PreparedStatement st = (PreparedStatement) con
							.prepareStatement("select * from payment where `consumernumber` = ? and status=?");
							st.setString(1, number);
							st.setString(2, status);
							ResultSet r1 = st.executeQuery();
							while (r1.next()) {

								price = r1.getString("Price");
								amount = amount + Integer.parseInt(price);
							}

							con.close();
						} catch (Exception ec) {
							System.out.print(ec);
						}

						out.println("<h4 class='card-text'>Rs. " + amount + "</h4>");
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
			
			<h5>Enter location or name of the product...</h5>
			<div class="card bg-light">
				<div class="card-body">
					<div class="input-group mb-2">
					<form name="form" method="post">
						<input type="text" name="sb" class="form-control" placeholder="Search" onkeyup="search()">
						</form>
					</div>
					
				</div>
			</div>
			<br>
			
			<div id="results" class="container">
				<!-- Place for Search Results -->
				
			</div>
			<hr>


			<h2>Products nearby your location..</h2>
			<div class="card bg-light">
				<div class="card-columns">
					<%
						try {
						Class.forName("com.mysql.jdbc.Driver");
						Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerzone", "Bootathon",
						"6383411123");
						PreparedStatement st = (PreparedStatement) con
						.prepareStatement("select * from farmerproducts where Locationtext = ? ");
						st.setString(1, loc);
						System.out.println(loc);
						ResultSet r1 = st.executeQuery();

						while (r1.next()) {

							out.println("<div class='card'>");

							out.println("<div class='card-body text-center'>");

							out.println("<p class='card-title'><b>Product Name : " + r1.getString("Prodname") + "</b></p>");
							//out.println("</td>");
							out.println("<p class='card-title'>Quantity : " + r1.getString("Quantity") + "</p>");
							//System.out.println(r1.getString("Quantity"));
							//out.println("<td>");
							out.println("<p class='card-title'>Description : " + r1.getString("Description") + "</p>");
							out.println("<p class='card-title'>Price : " + r1.getString("Price") + "Rs.</p>");
							out.println("<p class='card-title'>Farmer Contact Number : " + r1.getString("Phonenumber") + "</p>");
							out.println("<form action='consumerCart' method='POST'><input type='hidden' name='farmloc' value='"
							+ r1.getString("Location") + "'><input type='hidden' name='quan' value='" + r1.getString("Quantity")
							+ "'><input type='hidden' name='price' value='" + r1.getString("Price")
							+ "'><input type='hidden' name='Desc' value='" + r1.getString("Description")
							+ "'><input type='hidden' name='consphno' value='" + number
							+ "'><input type='hidden' name='farmer' value='" + r1.getString("Phonenumber")
							+ "'><input type='hidden' name='prod' value='" + r1.getString("Prodname")
							+ "'><b>Add to cart </b><button type='submit' class='btn btn-success' style='border-radius: 50%'><i class='fa fa-shopping-cart'></i></button></form>");
							out.println("<br>");

							//out.println("<td>");
							out.println("<form action='UserProfile.jsp' method='POST'><input type='hidden' name='farmer' value='"
							+ r1.getString("Phonenumber")
							+ "'><b>View Farmer Profile</b> <button type='submit' class='btn btn-info' style='border-radius: 50%'><i class='fa fa-eye'></i></button></form>");
							//out.println("</td>");

							out.println("</div>");

							out.println("</div>");

						}
						con.close();
					} catch (Exception ec) {
						System.out.print(ec);
					}
					%>

				</div>
			</div>
			<br>
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
					} catch (e) {
						console.log(r + " " + e);
					}

				}
			}
			http.open("GET", "MessageCounter?senderNumber=" + num1, true);
			http.send();

		}
	</script>

	<script>
		var request;
		function search() {
			var v = document.form.sb.value;
			var url = "search.jsp?val=" + v;

			if (window.XMLHttpRequest) {
				request = new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				request = new ActiveXObject("Microsoft.XMLHTTP");
			}
			try {
				request.onreadystatechange = getInfo;
				request.open("POST", url, true);
				request.send();
			} catch (e) {
				alert("Unable to connect to server");
			}
		}

		function getInfo() {
			if (request.readyState == 4) {
				var val = request.responseText;
				document.getElementById('results').innerHTML = val;
			}
		}
	</script>

	<script src="JS/jquery.min.js"></script>
	<script src="JS/popper.js"></script>
	<script src="JS/bootstrap.min.js"></script>
	<script src="JS/main.js"></script>
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</body>
</html>