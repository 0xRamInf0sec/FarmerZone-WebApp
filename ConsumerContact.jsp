<!doctype html>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<html lang="en">
<head>
<title>Contacts</title>
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
<link rel="stylesheet" href="CSS/Contacts.css">
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
<body onload="send()">

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
					<h3><%
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
						%></h3>
				</div>
			</div>
			<!-- span class="fa fa-download mr-3 notif"><small
							class="d-flex align-items-center justify-content-center">5</small></span> -->
			<ul class="list-unstyled components mb-5">
				<li><a href="ConsumerDashboard.jsp"><span
						class="fa fa-home mr-3"></span> Home</a></li>
						<li class="active"><a href="ContactsStore"><span
						class="fa fa-mobile mr-3" id="messageSpan"><small id="messaged"
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
						<h3 id="quote">Contacts</h3>
					</div>
				</div>
			</div>
			<hr></hr>

			<div id="results" class="container">
				<div class="card mb-sm-3 mb-md-0 contacts_card">
					<div class="card-header">
						<div class="input-group">
							<input type="text" placeholder="Search..." name=""
								class="form-control search">
							<div class="input-group-prepend">
								<span class="input-group-text search_btn"><i
									class="fas fa-search"></i></span>
							</div>
						</div>
					</div>
					<div class="card-body contacts_body">
						<ul class="contacts">
							<%
								int f = 0;
							String c = (String) request.getAttribute("contacts");
							String c2 = (String) request.getAttribute("names");
							//out.println(c);
							//out.println(c2);
							
							//c = c.replace("\"", "");
							String userNumber = (String) request.getAttribute("userNumber");
							//out.println(c);
							String contacts[] = c.split(" ");
							String names[]=c2.split("_");
							for (int i = 0; i < contacts.length; i++) {
								if (contacts[i] == null || contacts[i].isEmpty()) {
									continue;
								}
								
								
								f = 1;
								
								out.println("<li class='list'>");

								out.println("<div class='d-flex bd-highlight'>");

								out.println("<div class='img_cont'>");

								out.println(
								"<img src='https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg' onclick='showImg(this)' class='rounded-circle user_img'>");
								out.println("<span class='online_icon'><small id='mSpan"+i+"'></small></span>");

								out.println("</div>");

								out.println("<div class='user_info' onclick='document.getElementById('submit'"+i+").click()'>");

								out.println("<span>" + names[i] + "</span>");
								out.println("<p>" + contacts[i] + "</p>");

								out.println("<form action='Messaging.jsp' method='post'>" + "<input style='display:none' name='client' value='"
								+ names[i] + "'/>" + "<input style='display:none' name='senderNumber' value='" + userNumber + "'/>"
								+ "<input style='display:none' name='receiverNumber' value='" + contacts[i] + "'/>"
								+ "<input id='submit"+i+"' class='btn btn-success' value='chat' type='submit'/></form>");

								out.println("</div>");

								out.println("</div>");
								out.println("</li>");
							}
							if (f == 0) {
									out.println(
									"<i class='fa fa-close' style='font-size:100px;border:10px solid red;border-radius:50%;padding:1%;display:block;margin:auto;width:14%;text-align:center;color:red'></i>");
									out.println("<h1 style='text-align:center;color:red'>No Contacts Available</h1>");
									out.println("<h6 style='text-align:center>Try Somebody</h6>");
								}
							%>

						</ul>
					</div>
					<div class="card-footer"></div>
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
<script>
function getIt(i){
	alert(i);
	document.getElementById("submit"+i.toString()).click();
}
var num1=<%=request.getSession().getAttribute("pno")%>;
var interval=setInterval(send,1000);
function send(){
	
		var http=new XMLHttpRequest();
		http.onreadystatechange=function(){
			if(http.readyState==4){
				var r=http.responseText;
				try{
					var obj=JSON.parse(r);
					var l=Object.keys(obj);
					var v=Object.values(obj);
					for(var i=0;i<l.length;i++){
						if(v[i]<=0){
							continue;
						}
						var span=document.getElementById("mSpan"+i);
						span.classList.add("msgCount");
						span.innerHTML=v[i];
					}
					
					//document.getElementById("response").innerHTML=l;
				}
				catch(e){
					console.log(r+"/n"+e);
				}
				
				
			}
		}
		http.open("GET","MessageCounter?senderNumber="+num1,true);
		http.send();
	
}
</script>
<script src="JS/jquery.min.js"></script>
<script src="JS/popper.js"></script>
<script src="JS/bootstrap.min.js"></script>
<script src="JS/main.js"></script>
<script src="JS/Shop.js"></script>
<script src="JS/Contacts.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</html>