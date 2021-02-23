<!doctype html>
<html lang="en">
<head>
<title>Orders</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="CSS/style.css">
<link rel="stylesheet" href="CSS/Shop.css">
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

.container {
	padding: 2rem 0rem;
}

.table-image {td , th { vertical-align:middle;
	
}
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
						if (ses.getAttribute("pno") != null) {
							String number = String.valueOf(ses.getAttribute("pno"));
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
				<li><a href="FarmerDashboard.jsp"><span
						class="fa fa-home mr-3"></span> Home</a></li>

				<li><a href="ContactsStore"><span id="messageSpan"
						class="fa fa-mobile mr-3"><small id="messaged"
							class="d-flex align-items-center justify-content-center"></small></span>
						Contacts</a></li>

				<li><a href="Shop.jsp"><span class="fa fa-store-alt mr-3"></span>
						Shop</a></li>
				<li class="active"><a href="Orders.jsp"><span
						class="fa fa-cart-plus mr-3"></span> Orders</a></li>

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
						<h3 id="quote">Orders</h3>
					</div>
				</div>
			</div>
			<hr></hr>

			<div id="results" class="container">
				<!--  -->

				<%
					String number = String.valueOf(ses.getAttribute("pno"));
				int f = 0;
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerzone", "Bootathon",
					"6383411123");
					PreparedStatement st = (PreparedStatement) con.prepareStatement("select * from payment where Farmernumber=?");
					st.setString(1, number);
					ResultSet r1 = st.executeQuery();

					out.println("<div class='card-columns'>");
					while (r1.next()) {
						f = 1;
						out.println("<div class='card'>");

						out.println("<div class='card-body text-center'>");

						//out.println("<td>");

						//out.println("</td>");

						//out.println("<td>");
						out.println("<p class='card-title'><b>" + r1.getString("Productname") + "</b></p>");
						//out.println("</td>");

						out.println("<p class='card-title'>Product : " + r1.getString("Quantity") + "</p>");
						out.println("<p class='card-title'>Description : " + r1.getString("Description") + "</p>");
						if (r1.getString("status").equals("waiting")) {
					out.println("<p style='color:orange' class='card-title'><b>Waiting to accept or cancel</b></p>");
					out.println("<form action='orderconfirm' method='POST'><input type='hidden' name='farmernum' value='"
							+ r1.getString("Farmernumber") + "'><input type='hidden' name='prod' value='"
							+ r1.getString("Productname")
							+ "'><b>CLick to accept </b><button type='submit' class='btn btn-success' style='border-radius: 50%'><i class='fa fa-check'></i></button></form>");
					out.println("<br>");
					//out.println("</td>");
					out.println("<form action='orderdenied' method='POST'><input type='hidden' name='farmernum' value='"
							+ r1.getString("Farmernumber") + "'><input type='hidden' name='prod' value='"
							+ r1.getString("Productname")
							+ "'><b>CLick to reject </b><button type='submit' class='btn btn-success' style='border-radius: 50%'><i class='fa fa-ban'></i></button></form>");
					out.println("<br>");
						} else if (r1.getString("status").equals("Accepted")) {
					out.println("<p style='color:Green' class='card-title'><b>Accepted..</b></p>");
						} else if (r1.getString("status").equals("Denied")) {
					out.println("<p style='color:Red' class='card-title'><b>Denied</b></p>");
						} else {
					out.println("<p style='color:Red' class='card-title'><b>Canceled by user</b></p>");
						}
						//out.println("<td>");

						out.println("</div>");

						out.println("</div>");
					}
				} catch (Exception e) {
					System.out.println(e);
				}
				out.println("</div>");
				if (f == 0) {
					out.println(
					"<i class='fa fa-close' style='font-size:100px;border:10px solid red;border-radius:50%;padding:1%;display:block;margin:auto;width:14%;text-align:center;color:red'></i>");
					out.println("<h1 style='text-align:center;color:red'>No Orders Available</h1>");
				}
				%>

			</div>
		</div>
	</div>
	<div id="myModal" class="modal">
		<span class="closebtn">&times;</span> <img class="modal-content"
			id="img01">
		<div id="caption"></div>
	</div>

</body>
<script src="JS/jquery.min.js"></script>
<script src="JS/popper.js"></script>
<script src="JS/bootstrap.min.js"></script>
<script src="JS/main.js"></script>
<script src="JS/Shop.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</html>