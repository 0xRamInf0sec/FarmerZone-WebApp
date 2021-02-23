<!doctype html>
<html lang="en">
<head>
<title>Settings</title>
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

<script src="JS/Register.js" type="text/javascript"></script>

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
							String number = String.valueOf(request.getParameter("phonenumber"));
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
				<li><a href="ContactsStore"><span
						class="fa fa-mobile mr-3" id="messageSpan"><small
							id="messaged"
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

				<li class="active"><a href="ConsumerSettings.jsp"><span
						class="fa fa-cog mr-3"></span> Settings</a></li>
				<li><a href="logout.jsp"><span
						class="fa fa-sign-out-alt mr-3"></span> Sign Out</a></li>
			</ul>

		</nav>

		<!-- Page Content  -->
		<div id="content" class="p-4 p-md-5 pt-5">
			<div class="alert alert-success alert-dismissible">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>Note!</strong> Don't forget to save changes.
			</div>
			<div>
				<h2>Personal Details</h2>
				<div class="card">
					<div class="card-header" id="heading1">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" type="button"
								data-toggle="collapse" data-target="#collapse1"
								aria-expanded="false">Change Username</button>
						</h5>
					</div>
					<div id="collapse1" class="collapse" aria-labelledby="heading1"
						data-parent="#accordionExample">
						<div class="card-body">
							<div class="input-group mb-3">
								<input type="text" class="form-control"
									placeholder="Enter Username *" value="" />
							</div>
						</div>
					</div>
				</div>

				<div class="card">
					<div class="card-header" id="heading2">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" type="button"
								data-toggle="collapse" data-target="#collapse2"
								aria-expanded="false">Change Password</button>
						</h5>
					</div>
					<div id="collapse2" class="collapse" aria-labelledby="heading2"
						data-parent="#accordionExample">
						<div class="card-body">
							<div class="input-group mb-3">
								<input id="pass" type="password" class="form-control"
									placeholder="New Password *" value="" />
								<div class="input-group-append">
									<button onclick="show('pass')" class="btn btn-outline-primary">
										<i class="fa fa-eye"></i>
									</button>
								</div>
							</div>
							<div class="input-group mb-3">
								<input id="cpass" type="password" class="form-control"
									placeholder="Confirm Password *" value="" />
								<div class="input-group-append">
									<button onclick="show('cpass')" class="btn btn-outline-primary">
										<i class="fa fa-eye"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="card">
					<div class="card-header" id="heading3">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" type="button"
								data-toggle="collapse" data-target="#collapse3"
								aria-expanded="false">Change Email</button>
						</h5>
					</div>
					<div id="collapse3" class="collapse" aria-labelledby="heading3"
						data-parent="#accordionExample">
						<div class="card-body">
							<div class="form-group">
								<input type="email" class="form-control"
									placeholder="New Email *" value="" />
							</div>
						</div>
					</div>
				</div>

				<div class="card">
					<div class="card-header" id="heading4">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" type="button"
								data-toggle="collapse" data-target="#collapse4"
								aria-expanded="false">Change Mobile Number</button>
						</h5>
					</div>
					<div id="collapse4" class="collapse" aria-labelledby="heading4"
						data-parent="#accordionExample">
						<div class="card-body">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">+91</span>
								</div>
								<input type="text" minlength="10" maxlength="10"
									name="txtEmpPhone" class="form-control"
									placeholder="Your Phone *" value="" pattern="[0-9]*" />
							</div>
						</div>
					</div>
				</div>

				<div class="card">
					<div class="card-header" id="heading5">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" type="button"
								data-toggle="collapse" data-target="#collapse5"
								aria-expanded="false">Change Aadhaar</button>
						</h5>
					</div>
					<div id="collapse5" class="collapse" aria-labelledby="heading5"
						data-parent="#accordionExample">
						<div class="card-body">
							<div class="form-group">
								<input type="text" minlength="16" maxlength="16"
									name="txtEmpPhone" class="form-control"
									placeholder="Your Aadhaar *" value="" pattern="[0-9]*" />
							</div>
						</div>
					</div>
				</div>

				<div class="card">
					<div class="card-header" id="heading6">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" type="button"
								data-toggle="collapse" data-target="#collapse6"
								aria-expanded="false">Change Location</button>
						</h5>
					</div>
					<div id="collapse6" class="collapse" aria-labelledby="heading6"
						data-parent="#accordionExample">
						<div class="card-body">
							<div class="input-group mb-3">
								<input type="text" class="form-control" id="locate"
									placeholder="Your Location *" value="" />
								<div class="input-group-append">
									<button onclick="getLiveLocation('locate')">Track</button>
								</div>
							</div>
						</div>
					</div>
				</div>

				<hr></hr>

				<div>

					<div style="float: right; padding-top: 5%">
						<button class="btn btn-success" onclick="showModalForPass()">Save
							Changes</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="myModal" class="modal">
		<span class="closebtn">&times;</span>
		<div style="padding: 0% 10%;">
			<div class="card" style="background-color: white; padding: 10%;">
				<div class="input-group mb-3">
					<input id="opass" type="password" class="form-control"
						placeholder="Old Password *" value="" />
					<div class="input-group-append">
						<button onclick="show('opass')" class="btn btn-outline-primary">
							<i class="fa fa-eye"></i>
						</button>
					</div>
				</div>
				<a href="ComingSoon.html" class="btn btn-link">Forgot Password?</a>
				<div style="float: right; padding-top: 5%">
					<button class="btn btn-success">Finish</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="JS/jquery.min.js"></script>
<script src="JS/popper.js"></script>
<script src="JS/bootstrap.min.js"></script>
<script src="JS/main.js"></script>
<script src="JS/Shop.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</html>