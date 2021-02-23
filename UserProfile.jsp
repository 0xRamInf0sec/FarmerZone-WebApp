<!doctype html>
<html lang="en">
<head>
<title><%@page import="java.util.*"%> <%@page
		import="java.io.IOException"%> <%@page
		import="java.sql.DriverManager"%> <%@page
		import="java.sql.ResultSet"%> <%@page
		import="com.mysql.jdbc.Connection"%> <%@page
		import="com.mysql.jdbc.PreparedStatement"%> <%
 	boolean isFollow = false;
 String receiverNumber = request.getParameter("farmer");
 HttpSession ses = request.getSession();
 String senderNumber = String.valueOf(ses.getAttribute("pno"));
 String dbfname = "";
 String dbflastname = "";
 String email = "";
 String address = "";
 try {
 	Class.forName("com.mysql.jdbc.Driver");
 	Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerzone", "Bootathon",
 	"6383411123");
 	PreparedStatement st = (PreparedStatement) con
 	.prepareStatement("select * from farmerregister where `Phonenumber` = ?");
 	st.setString(1, receiverNumber);

 	ResultSet r1 = st.executeQuery();
 	while (r1.next()) {

 		dbfname = r1.getString("Firstname");
 		dbflastname = r1.getString("Lastname");
 		email = r1.getString("Email");
 		address = r1.getString("Location");
 	}

 	con.close();
 } catch (Exception ec) {
 	System.out.print(ec);
 }
 //Fetch all details here
 String userProfileImg = "\"https://bootdey.com/img/Content/avatar/avatar7.png\"";
 String nameString = dbfname + " " + dbflastname;
 String type = "Farmer";//Famer or client
 try {
 	Class.forName("com.mysql.jdbc.Driver");
 	Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerzone", "Bootathon",
 	"6383411123");
 	PreparedStatement st = (PreparedStatement) con.prepareStatement("select * from follow where `follower` = ?");
 	st.setString(1, senderNumber);

 	ResultSet r1 = st.executeQuery();
 	while (r1.next()) {
 		if (r1.getString("Following").equals(receiverNumber)) {
 	isFollow = true;
 	break;
 		}
 	}

 	con.close();
 } catch (Exception ec) {
 	System.out.print(ec);
 }

 String follow = isFollow ? "Following" : "Follow";
 String companyName = "Nil";
 String companyType = "Nil";
 String companyDescription = "Nil";
 String companyAddress = "Nil";
 String rating = "0";

 try {
 	Class.forName("com.mysql.jdbc.Driver");
 	Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerzone", "Bootathon",
 	"6383411123");
 	PreparedStatement st = (PreparedStatement) con.prepareStatement("select * from ratings where `number` = ?");
 	st.setString(1, receiverNumber);
 	double c = 0;
 	double count = 0;
 	ResultSet r1 = st.executeQuery();
 	while (r1.next()) {
 		c += r1.getDouble(2);
 		count++;
 	}
 	try {
 		rating = count == 0 ? "0" : String.valueOf((double) c / count);

 	} catch (Exception e) {
 		rating = "0";
 	}

 	con.close();
 } catch (Exception ec) {
 	System.out.print(ec);
 }
 //String senderNumber = "9876543210";
 //String receiverNumber = "7896543012";
 out.println(nameString);
 %></title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script> -->
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

abbr {
	text-decoration: none;
}
</style>
<body>
	<div class="container">
		<div class="main-body">
			<nav aria-label="breadcrumb" class="main-breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="ConsumerDashboard.jsp">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">User
						Profile</li>
				</ol>
			</nav>

			<div class="alert alert-success" id="report-alert">
				<button type="button" class="close" data-dismiss="alert">x</button>
				<strong>Success! </strong>Reported
			</div>

			<div class="alert alert-success" id="rate-alert">
				<button type="button" class="close" data-dismiss="alert">x</button>
				<strong>Success! </strong> Rated
			</div>
			<h1></h1>

			<div class="row gutters-sm">
				<div class="col-md-4 mb-3">
					<div class="card">
						<div class="card-body">
							<div class="d-flex flex-column align-items-center text-center">

								<img src=<%=userProfileImg%> onclick="showImg(this)" alt="Admin"
									class="rounded-circle" width="150">
								<div class="mt-3">
									<h4>
										<%
											out.println(nameString);
										%>
									</h4>

									<p class="text-secondary mb-1">
										<%
											out.println(type);
										%>
									</p>
									<p class="text-secondary mb-1">
										<%
											out.println(rating);
										%><i class="fa fa-star checked"></i>/5
									</p>
									<table>
										<tr>
											<td>
												<button id="followBtn" style="width: 100%"
													class="btn btn-primary" value="<%out.println(follow);%>"
													onclick="showModalN('followModal',this)">
													<%
														out.println(follow);
													%>
												</button>
											</td>

											<td>
												<form action="Messaging.jsp" method="POST">
													<input name="client" style="display: none;"
														value='<%=nameString%>' /> <input name="senderNumber"
														type="hidden" value='<%=senderNumber%>' /> <input
														name="receiverNumber" style="display: none;"
														value='<%=receiverNumber%>' /> <input type="submit"
														id="msgBtn" style="width: 100%"
														class="btn btn-outline-primary" value="Message">
												</form>
											</td>
										</tr>
										<tr>
											<td><button style="width: 100%"
													class="btn btn-outline-danger"
													onclick="showModal('reportModal')">Report</button></td>
											<td><button style="width: 100%"
													onclick="showModal('ratingModal')"
													class=" btn btn-outline-warning">Rate</button></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="card mt-3">
						<iframe width="100%"
							src="https://www.youtube.com/embed/U7-zemx9sb4" frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
						<!-- ul class="list-group list-group-flush">
							<li
								class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
								<h6 class="mb-0">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round"
										class="feather feather-globe mr-2 icon-inline">
										<circle cx="12" cy="12" r="10"></circle>
										<line x1="2" y1="12" x2="22" y2="12"></line>
										<path
											d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path></svg>
									Website
								</h6> <span class="text-secondary">https://farmerzone.com</span>
							</li>
							<li
								class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
								<h6 class="mb-0">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round"
										class="feather feather-github mr-2 icon-inline">
										<path
											d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22"></path></svg>
									Github
								</h6> <span class="text-secondary">farmerzone</span>
							</li>
							<li
								class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
								<h6 class="mb-0">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round"
										class="feather feather-twitter mr-2 icon-inline text-info">
										<path
											d="M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z"></path></svg>
									Twitter
								</h6> <span class="text-secondary">@farmerzone</span>
							</li>
							<li
								class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
								<h6 class="mb-0">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round"
										class="feather feather-instagram mr-2 icon-inline text-danger">
										<rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect>
										<path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path>
										<line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line></svg>
									Instagram
								</h6> <span class="text-secondary">farmerzone</span>
							</li>
							<li
								class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
								<h6 class="mb-0">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round"
										class="feather feather-facebook mr-2 icon-inline text-primary">
										<path
											d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path></svg>
									Facebook
								</h6> <span class="text-secondary">farmerzone</span>
							</li>
						</ul> -->

					</div>
				</div>
				<div class="col-md-8">
					<div class="card mb-3">
						<div class="card-body">
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Full Name</h6>
								</div>
								<div class="col-sm-9 text-secondary"><%=nameString%></div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Email</h6>
								</div>
								<div class="col-sm-9 text-secondary"><%=email%></div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Phone</h6>
								</div>
								<div class="col-sm-9 text-secondary"><%=receiverNumber%></div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Mobile</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									+91
									<%=receiverNumber%></div>
							</div>
							<hr>
							<!-- <div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Address</h6>
								</div>
								<div class="col-sm-9 text-secondary"></div>

							</div>-->
						</div>
					</div>
					<hr></hr>
					<div class="row gutters-sm">
						<h4>His Products</h4>
						<div class="card-columns">
							<%
								try {
								Class.forName("com.mysql.jdbc.Driver");
								Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerzone", "Bootathon",
								"6383411123");
								PreparedStatement st = (PreparedStatement) con.prepareStatement("select * from farmerproducts where Phonenumber=?");
								st.setString(1, receiverNumber);
								ResultSet r1 = st.executeQuery();

								while (r1.next()) {

									out.println("<div class='card bg-light'>");

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
									+ "'><input type='hidden' name='consphno' value='" + senderNumber
									+ "'><input type='hidden' name='farmer' value='" + r1.getString("Phonenumber")
									+ "'><input type='hidden' name='prod' value='" + r1.getString("Prodname")
									+ "'><b>Add to cart </b><button type='submit' class='btn btn-success' style='border-radius: 50%'><i class='fa fa-shopping-cart'></i></button></form>");
									out.println("<br>");

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
		</div>
	</div>
	<div id="myModal" class="modal">
		<span class="closebtn">&times;</span> <img class="modal-content"
			id="img01">
		<div id="caption"></div>
	</div>
	<div id="reportModal" class="modal">
		<span class="closebtn" onclick="closeModal('reportModal')">&times;</span>
		<div style="padding: 0% 10%;">
			<div class="card" style="background-color: white; padding: 10%;">
				<div class="form-group">
					<textarea id="textarea" class="form-control"
						placeholder="Description *" rows=5></textarea>
				</div>
				<div class="custom-file mb-3">
					<input type="file" class="custom-file-input" id="customFile"
						name="filename"> <label class="custom-file-label"
						for="customFile">Image Proof</label>
				</div>
				<p id="helper"></p>
				<div style="float: right; padding-top: 5%">
					<button id="reportButton" class="btn btn-success"
						onclick="submitReport('<%=senderNumber%>','<%=receiverNumber%>')">Submit</button>
				</div>
			</div>
		</div>
	</div>
	<div id="response"></div>
	<div id="followModal" class="modal">
		<span class="closebtn" onclick="closeModal('followModal')">&times;</span>
		<div style="padding: 0% 10%;">
			<div class="card" style="background-color: white; padding: 10%;">
				<div class="form-group">
					<p>
						Are you sure want to<span id="span"> Follow</span>?
					</p>
					<div style="float: right;">
						<button onclick="send('followBtn','0')" class="btn btn-success">Yes</button>
						&nbsp&nbsp
						<button onclick="closeModal('followModal')" class="btn btn-danger">No</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="ratingModal" class="modal">
		<span class="closebtn" onclick="closeModal('ratingModal')">&times;</span>
		<div style="padding: 0% 10%; text-align: center;">
			<div class="card" style="background-color: white; padding: 10%;">
				<p>
					<b>Rate Him Honestly and Genuinely!</b>
				</p>
				<div style="cursor: pointer;">
					<i id="star1" class="fa fa-star" onclick="rate(1)"></i> <i
						id="star2" class="fa fa-star" onclick="rate(2)"></i> <i id="star3"
						class="fa fa-star" onclick="rate(3)"></i> <i id="star4"
						class="fa fa-star" onclick="rate(4)"></i> <i id="star5"
						class="fa fa-star" onclick="rate(5)"></i>
				</div>
				<p id="result"></p>
				<div>
					<button id="rateButton" onclick="submitRate('<%=receiverNumber%>')"
						class="btn btn-success">Submit</button>
				</div>
			</div>
		</div>
	</div>

</body>
<script>
	var num1 =
<%=senderNumber%>
	;
	var num2 =
<%=receiverNumber%>
	;

	function send(b, i) {
		var bu = document.getElementById(b);
		var x = bu.value;
		console.log(x.toString().trim() + " --- "
				+ (x.toString().trim() === "Following"))
		if (x.toString().trim() === "Following") {
			i = '1';
			//document.getElementById("span").innerHTML="Unfollow";	
		} else {
			i = '0';
			//document.getElementById("span").innerHTML="Follow";
		}
		var http = new XMLHttpRequest();
		http.onreadystatechange = function() {
			if (http.readyState == 4) {

				closeModal('followModal');

				bu.innerHTML = http.responseText;
				bu.value = http.responseText;
			}
		}
		http.open("GET", "DatabaseStorer?userNumber=" + num1 + "&followNumber="
				+ num2 + "&what=" + i, true);
		http.send();
	}
	function showModalN(id, a) {
		//alert(a);
		var x = a.value;
		console.log(x.toString().trim() + " --- "
				+ (x.toString().trim() === "Following"))
		if (x.toString().trim() === "Following") {
			document.getElementById("span").innerHTML = " Unfollow";
		} else {
			document.getElementById("span").innerHTML = " Follow";
		}

		var modal = document.getElementById(id);
		modal.style.display = "block";
	}
</script>
<script src="JS/jquery.min.js"></script>
<script src="JS/popper.js"></script>
<script src="JS/bootstrap.min.js"></script>
<script src="JS/main.js"></script>
<script src="JS/Shop.js"></script>
<script src="JS/UserProfile.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</html>