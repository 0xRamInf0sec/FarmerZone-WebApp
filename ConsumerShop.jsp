<!doctype html>
<html lang="en">
<head>
<title>Shop</title>
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
	<div>
		<%
			if (request.getAttribute("productsadd") == null) {

		} else {
			out.print("<div style='background-color:green;padding:5px;text-align:center;'>");
			out.print("<p style='color:white'>status : " + request.getAttribute("productsadd") + "</p></div>");
		}
		if (request.getAttribute("productsaddfail") == null) {

		} else {
			out.print("<div style='background-color:red;padding:5px;text-align:center;'>");
			out.print("<p style='color:white'>status : " + request.getAttribute("productsaddfail") + "</p></div>");
		}
		%>

	</div>
	<%@page import="java.util.*"%>
	<%@page import="java.io.File"%>
	<%@page import="java.io.FileInputStream"%>
	<%@page import="java.io.*"%>
	<%@page import="java.io.InputStream"%>
	<%@page import="java.io.IOException"%>
	<%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Blob"%>
	<%@page import="java.awt.image.BufferedImage"%>
	<%@page import="javax.imageio.ImageIO"%>
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
						String number = String.valueOf(ses.getAttribute("pno"));
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
				<li><a href="ConsumerDashboard.jsp"><span
						class="fa fa-home mr-3"></span> Home</a></li>
				<li><a href="ContactsStore"><span class="fa fa-mobile mr-3"
						id="messageSpan"><small id="messaged"
							class="d-flex align-items-center justify-content-center"></small></span>
						Contacts</a></li>
				<li><a href="ConsumerFollowing.jsp"><span
						class="fas fa-user-check mr-3"></span> Following</a></li>
				<li class="active"><a href="ConsumerShop.jsp"><span
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
						<h3 id="quote">Customer</h3>
					</div>
				</div>
			</div>
			<hr></hr>

			<h2>Products to Buy</h2>
			<div id="results" class="container">
				<!--  -->
				<div class="card-columns">
					<%
						try {
						Class.forName("com.mysql.jdbc.Driver");
						Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerzone", "Bootathon",
						"6383411123");
						PreparedStatement st = (PreparedStatement) con.prepareStatement("select * from farmerproducts");

						ResultSet r1 = st.executeQuery();

						while (r1.next()) {

							out.println("<div class='card'>");

							out.println("<div class='card-body text-center'>");

							//out.println("<td>");
							//out.println("<div>");

							//out.println("<img class='img' style='border-radius: 50%' height='100' width='100' src='" + ImageIO.write(bImage2, "jpg", new File("output.jpg") )
							//+ "' onclick='showImg(this)'>");
							//out.println("</div>");
							//out.println("</td>");

							//out.println("<td>");
							out.println("<p class='card-title'><b>Product Name : " + r1.getString("Prodname") + "</b></p>");
							//out.println("</td>");
							out.println("<p class='card-title'>Quantity : " + r1.getString("Quantity") + "kg</p>");
							//System.out.println(r1.getString("Quantity"));
							//out.println("<td>");
							out.println("<p class='card-title'>Description : " + r1.getString("Description") + "</p>");
							out.println("<p class='card-title'>Price : Rs." + r1.getString("Price") + "</p>");
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