<!doctype html>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.*"%>
<html lang="en">
<head>
<title>Statistics | History</title>
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
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

<style>
#container, #pie-container, #s-container, #per-container {
	border: 2px solid black;
}

.raised {
	padding: 10px;
	border: 1px solid #77aaff;
	box-shadow: -1px 1px #77aaff, -2px 2px #77aaff, -3px 3px #77aaff, -4px
		4px #77aaff, -5px 5px #77aaff;
}

#myBtn {
	display: none;
	position: fixed;
	bottom: 20px;
	right: 30px;
	z-index: 99;
	border-radius: 50%;
}

.highcharts-figure, .highcharts-data-table table {
	min-width: 310px;
	max-width: 800px;
	margin: 1em auto;
}

#container {
	height: 400px;
}

.dftBtn {
	background: rgba(0, 0, 0, 0.2);
	text-decoration: none;
	padding: 2% 4%;
	border-radius: 10%;
	cursor: pointer;
}

.dftBtn:hover {
	background: rgba(0, 0, 0, 0.4);
}

.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #EBEBEB;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}

.highcharts-data-table caption {
	padding: 1em 0;
	font-size: 1.2em;
	color: #555;
}

.highcharts-data-table th {
	font-weight: 600;
	padding: 0.5em;
}

.highcharts-data-table td, .highcharts-data-table th,
	.highcharts-data-table caption {
	padding: 0.5em;
}

.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even)
	{
	background: #f8f8f8;
}

.highcharts-data-table tr:hover {
	background: #f1f7ff;
}
</style>

<body>

	<%
		//Need To Fetch

	//String products[] = {"Nuts"};
	HttpSession ses = request.getSession();
	String number = String.valueOf(ses.getAttribute("pno"));
	//number="8793456012";
	ArrayList<String> products = new ArrayList<String>();
	ArrayList<String> userNumList = new ArrayList<String>();
	Map<String, String> users = new TreeMap<String, String>();
	Map<String, Integer> soldCount = new TreeMap<String, Integer>();
	Map<String, Integer> totalPrices = new TreeMap<String, Integer>();
	Map<String, Integer> totalSoldQuantities = new TreeMap<String, Integer>();
	Map<String, ArrayList<ArrayList<Object>>> soldDatesByPrice = new TreeMap<String, ArrayList<ArrayList<Object>>>();
	Map<String, ArrayList<ArrayList<Object>>> soldDatesByQuantity = new TreeMap<String, ArrayList<ArrayList<Object>>>();
	Map<String, Integer> userPrices = new TreeMap<String, Integer>();
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerzone", "Bootathon", "6383411123");
		Statement statement = con.createStatement();
		ResultSet rs = statement
		.executeQuery("select * from payment where status='Accepted' and Farmernumber='" + number + "'");
		while (rs.next()) {
			String product = rs.getString(1).toLowerCase();
			String quantity = rs.getString(2).toLowerCase();
			String price = rs.getString(4).toLowerCase();
			String buyer = rs.getString(8).toLowerCase();
			String buyerName = buyer;
			String date = rs.getString(10).toLowerCase();

			ArrayList<Object> alPrice = new ArrayList<Object>();
			alPrice.add(date);
			alPrice.add(Integer.valueOf(price));
			ArrayList<Object> alQuantity = new ArrayList<Object>();
			alQuantity.add(date);
			alQuantity.add(Integer.valueOf(quantity));

			if (!products.contains(product)) {
		products.add(product);
			}
			if (!userNumList.contains(buyer)) {
		userNumList.add(buyer);
			}

			if (soldCount.containsKey(product)) {
		soldCount.put(product, soldCount.get(product) + 1);
		totalPrices.put(product, totalPrices.get(product) + Integer.valueOf(price));
		totalSoldQuantities.put(product, totalSoldQuantities.get(product) + Integer.valueOf(quantity));
		ArrayList<ArrayList<Object>> temp1 = soldDatesByPrice.get(product);
		
		for(ArrayList<Object> o:temp1){
			if(o.contains(date)){
				alPrice.set(1,Integer.valueOf(String.valueOf(o.get(1)))+Integer.valueOf(price));
				break;
			}
		}
		
		temp1.add(alPrice);
		ArrayList<ArrayList<Object>> temp2 = soldDatesByQuantity.get(product);
		for(ArrayList<Object> o:temp2){
			if(o.contains(date)){
				alQuantity.set(1,Integer.valueOf(String.valueOf(o.get(1)))+Integer.valueOf(quantity));
				break;
			}
		}
		temp2.add(alQuantity);
		soldDatesByPrice.put(product, temp1);
		soldDatesByQuantity.put(product, temp2);
			} else {
		soldCount.put(product, 1);
		totalPrices.put(product, Integer.valueOf(price));
		totalSoldQuantities.put(product, Integer.valueOf(quantity));
		ArrayList<ArrayList<Object>> temp1 = new ArrayList<ArrayList<Object>>();
		temp1.add(alPrice);
		ArrayList<ArrayList<Object>> temp2 = new ArrayList<ArrayList<Object>>();
		temp2.add(alQuantity);
		soldDatesByPrice.put(product, temp1);
		soldDatesByQuantity.put(product, temp2);
			}
			if (userPrices.containsKey(buyerName)) {
		userPrices.put(buyerName, userPrices.get(buyerName) + Integer.valueOf(price));
			} else {
		userPrices.put(buyerName, Integer.valueOf(price));
			}

		}
		
		for (String i : userNumList) {
			ResultSet rs1 = statement.executeQuery("select * from consumerregister where Phonenumber='" + i + "'");
			if (rs1.next()) {
				users.put(i, (rs1.getString(1) + " " + rs1.getString(2)));
			}
		}

	} catch (Exception e) {
		out.println("Error :" + e);
	}
	//int soldCount[] = {3};
	//int totalPrices[] = {700};
	//int totalSoldQuantities[] = {14};
	//Object soldDatesByPrice[][][] = {{{"Jan 28", 350}, {"Jan 29", 200}, {"Jan 31", 150}},};//[Date][Price]
	//Object soldDatesByQuantity[][][] = {{{"Jan 28", 7}, {"Jan 29", 4}, {"Jan 31", 3}},};//[Date][Quantity]
	//String users[] = {"Jhon", "Durairaj", "Bhavani"};
	//int userTotalPrices[] = {700, 200, 150};

	String maxP = "Sell Something...";
	String maxQ = "Sell Something...";
	String maxC = "Sell Something...";
	String maxU = "Sell Something...";
	int m1 = 0, m2 = 0, m3 = 0, m4 = 0;

	for (String i : products) {
		int temp1 = totalPrices.get(i);
		if (m1 < temp1) {
			m1 = temp1;
			maxP = i;
		}
		int temp2 = totalSoldQuantities.get(i);
		if (m2 < temp2) {
			m2 = temp2;
			maxQ = i;
		}
		int temp3 = soldCount.get(i);
		if (m3 < temp3) {
			m3 = temp3;
			maxC = i;
		}
	}
	for (Map.Entry<String, Integer> e : userPrices.entrySet()) {
		String key = e.getKey();
		int value = e.getValue();
		if (m4 < value) {
			m4 = value;
			maxU = key;
		}
	}
	maxU=users.get(maxU)==null?(maxU):(users.get(maxU));
	%>


	<button onclick="topFunction()"
		class="btn btn-lg btn-floating btn-primary" id="myBtn">
		<i class="fa fa-arrow-up"></i>
	</button>

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
				<li><a href="FarmerDashboard.jsp"><span
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

				<li class="active"><a href="Statistics.jsp"><span
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
						<h3 id="quote">Statistics</h3>
					</div>

				</div>
				<ul>

					<li><a href="#sales">Sales</a></li>
					<li><a href="#purchases">Purchases</a></li>
					<li><a href="#stocks">Stocks</a></li>
					<li><a href="#users">Users</a></li>
				</ul>
			</div>
			<hr></hr>

			<div class="card-columns" style="color: white;">
				<div class="card bg-warning">
					<div class="card-body text-center">
						<p class="card-text">Sale of the year</p>
						<h4 class='card-text'><%=maxP%></h4>

					</div>
				</div>
				<div class="card bg-warning">
					<div class="card-body text-center">
						<p class="card-text">Purchase of the year</p>
						<h4 class='card-text'><%=maxC%></h4>

					</div>
				</div>
				<div class="card bg-warning">
					<div class="card-body text-center">
						<p class="card-text">Demand of the year</p>
						<h4 class='card-text'><%=maxQ%></h4>
					</div>
				</div>

			</div>
			<hr></hr>

			<div
				style="width: 300px; color: white; top: 0; bottom: 0; left: 0; right: 0; margin: auto;">
				<div class="card bg-success">
					<div class="card-body text-center">
						<p class="card-text">Buyer of the year</p>

						<h4 class='card-text'><%=maxU%></h4>
						<a class="btn btn-success">Gift him</a>
					</div>
				</div>
			</div>
			<hr></hr>

			<div id="results" class="container">
				<div id="sales">
					<figure class="highcharts-figure">
						<div id="container"></div>
						<p class="highcharts-description">Chart Paragraph.</p>
					</figure>
				</div>
				<hr></hr>
				<div id="purchases">
					<figure class="highcharts-figure">
						<div id="pie-container"></div>
						<p class="highcharts-description">Chart Paragraph.</p>
					</figure>
				</div>
				<hr></hr>
				<div id="stocks">
					<figure class="highcharts-figure">
						<div id="s-container"></div>
						<p class="highcharts-description">Chart Paragraph.</p>
					</figure>
				</div>
				<hr></hr>
				<div id="users">
					<figure class="highcharts-figure">
						<div id="per-container"></div>
						<p class="highcharts-description">Chart Paragraph.</p>
					</figure>
				</div>
				<hr></hr>
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
	//Create the chart

	Highcharts
			.chart(
					'container',
					{
						chart : {
							type : 'column'
						},
						title : {
							text : 'Product sales'
						},
						subtitle : {
							text : 'Click the columns to view timeline. '
						},
						accessibility : {
							announceNewData : {}
						},
						credits : {
							enabled : false
						},
						xAxis : {
							type : 'category'
						},
						yAxis : {
							title : {
								text : 'Total sales in (Rupees INR)'
							}

						},
						legend : {
							enabled : true
						},
						plotOptions : {
							series : {
								borderWidth : 0,
								dataLabels : {
									enabled : true,
									format : 'Rs.{point.y:.1f}'
								}
							}
						},

						tooltip : {
							headerFormat : '<span style="font-size:11px">{series.name}</span><br>',
							pointFormat : '<span style="color:{point.color}">{point.name}</span>: <b>Rs.{point.y:.2f}</b> of total<br/>'
						},

						series : [ {
							name : "Products",
							colorByPoint : true,
							data : [
<%for (String i : products) {
	out.println("{name:'" + i + "',y:" + totalPrices.get(i) + ",drilldown:'" + i + "'},");
}%>
	]
						} ],
						drilldown : {
							series : [
<%for (String i : products) {
	out.println("{name:'" + i + "',id:'" + i + "',data:[");
	for (ArrayList<Object> a : soldDatesByPrice.get(i)) {
		out.println("[ '" + a.get(0) + "'," + a.get(1) + " ],");
	}
	out.println("]},");
}%>
	]
						}
					});

	Highcharts
			.chart(
					'pie-container',
					{
						chart : {
							type : 'pie'
						},
						title : {
							text : 'Number of Purchases per product'
						},
						subtitle : {
							text : ''
						},
						credits : {
							enabled : false
						},

						accessibility : {
							announceNewData : {
								enabled : true
							},
							point : {
								valueSuffix : ''
							}
						},

						plotOptions : {
							series : {
								dataLabels : {
									enabled : true,
									format : '{point.name}: {point.y}'
								}
							}
						},

						tooltip : {
							headerFormat : '<span style="font-size:11px">{series.name}</span><br>',
							pointFormat : '<span style="color:{point.color}">{point.name}</span>: <b>{point.y}</b> of total<br/>'
						},

						series : [ {
							name : "Browsers",
							colorByPoint : true,
							data : [
<%for (String i : products) {
	out.println("{name:'" + i + "',y:" + soldCount.get(i) + ",drilldown:'" + i + "'},");
}%>
	]
						} ],
					});

	Highcharts
			.chart(
					's-container',
					{
						chart : {
							type : 'column'
						},
						title : {
							text : 'Stock Exchanges'
						},
						subtitle : {
							text : 'Click the columns to view timeline. '
						},
						accessibility : {
							announceNewData : {}
						},
						credits : {
							enabled : false
						},
						xAxis : {
							type : 'category'
						},
						yAxis : {
							title : {
								text : 'Total sales in (Rupees INR)'
							}

						},
						legend : {
							enabled : true
						},
						plotOptions : {
							series : {
								borderWidth : 0,
								dataLabels : {
									enabled : true,
									format : '{point.y}kg'
								}
							}
						},

						tooltip : {
							headerFormat : '<span style="font-size:11px">{series.name}</span><br>',
							pointFormat : '<span style="color:{point.color}">{point.name}</span>: <b>{point.y}kg</b> of total<br/>'
						},

						series : [ {
							name : "Products",
							colorByPoint : true,
							data : [
<%for (String i : products) {
	out.println("{name:'" + i + "',y:" + totalSoldQuantities.get(i) + ",drilldown:'" + i + "'},");
}%>
	]
						} ],
						drilldown : {
							series : [
<%for (String i : products) {
	out.println("{name:'" + i + "',id:'" + i + "',data:[");
	for (ArrayList<Object> a : soldDatesByQuantity.get(i)) {
		out.println("[ '" + a.get(0) + "'," + a.get(1) + " ],");
	}
	out.println("]},");
}%>
	]
						}
					});

	Highcharts
			.chart(
					'per-container',
					{
						chart : {
							type : 'column'
						},
						title : {
							text : 'Customer\'s Purchases'
						},
						subtitle : {
							text : 'Click the columns to view timeline. '
						},
						accessibility : {
							announceNewData : {}
						},
						credits : {
							enabled : false
						},
						xAxis : {
							type : 'category'
						},
						yAxis : {
							title : {
								text : 'Total sales in (Rupees INR)'
							}

						},
						legend : {
							enabled : true
						},
						plotOptions : {
							series : {
								borderWidth : 0,
								dataLabels : {
									enabled : true,
									format : 'Rs.{point.y:.2f}'
								}
							}
						},

						tooltip : {
							headerFormat : '<span style="font-size:11px">{series.name}</span><br>',
							pointFormat : '<span style="color:{point.color}">{point.name}</span>: <b>Rs.{point.y:.2f}</b> of total<br/>'
						},

						series : [ {
							name : "Products",
							colorByPoint : true,
							data : [
<%for (Map.Entry<String, Integer> e : userPrices.entrySet()) {
	String key = users.get(e.getKey())==null?(e.getKey()):(users.get(e.getKey()));
	int value = e.getValue();
	out.println("{name:'" + key + "',y:" + value + ",drilldown:'" + key + "'},");
}%>
	]
						} ],
					});
</script>

<script>
	var mybutton = document.getElementById("myBtn");

	//When the user scrolls down 20px from the top of the document, show the button
	window.onscroll = function() {
		scrollFunction()
	};

	function scrollFunction() {
		if (document.body.scrollTop > 20
				|| document.documentElement.scrollTop > 20) {
			mybutton.style.display = "block";
		} else {
			mybutton.style.display = "none";
		}
	}

	//When the user clicks on the button, scroll to the top of the document
	function topFunction() {
		document.body.scrollTop = 0;
		document.documentElement.scrollTop = 0;
	}
</script>
<script src="JS/jquery.min.js"></script>
<script src="JS/popper.js"></script>
<script src="JS/bootstrap.min.js"></script>
<script src="JS/main.js"></script>
<script src="JS/Shop.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</html>