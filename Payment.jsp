<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment</title>
<link
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>
<script
	src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<style>
* {
	margin: 0;
	padding: 0
}

html {
	height: 100%
}

body {
	background-color: #000000
}

.card0 {
	margin: 50px 12px 40px 12px;
	border: 0
}

.card1 {
	margin: 0;
	padding: 0;
	object-fit: contain;
	height: 100%;
	background-color: #EDE7F6;
	position: relative;
	border-top-left-radius: 10px !important;
	border-bottom-left-radius: 10px !important
}

#sub-heading1 {
	font-size: 55px
}

#sub-heading2 {
	font-size: 20px;
	color: grey
}

.gift-input {
	background: none
}

#heading {
	font-size: 33px;
	color: #000000;
	padding-bottom: 20px
}

.placeicon {
	font-family: fontawesome !important
}

.card2 {
	padding: 25px;
	padding-left: 35px;
	padding-right: 35px;
	margin: 0;
	height: 100%;
	border-top-right-radius: 10px !important;
	border-bottom-right-radius: 10px !important
}

.text-dark {
	color: grey !important
}

.form-card {
	height: 100%;
	position: relative
}

.form-card input, .form-card textarea {
	padding: 5px 1px 10px 1px;
	border: none;
	border-bottom: 1px solid lightgrey;
	border-radius: 0px;
	margin-bottom: 35px;
	margin-top: 2px;
	width: 100%;
	box-sizing: border-box;
	font-family: montserrat;
	color: #2C3E50;
	font-size: 20px;
	font-weight: bold;
	letter-spacing: 1px
}

.form-card input:focus, .form-card textarea:focus {
	-moz-box-shadow: none !important;
	-webkit-box-shadow: none !important;
	box-shadow: none !important;
	border: none;
	font-weight: bold;
	border-bottom: 1.5px solid skyblue;
	padding-bottom: 9.5px;
	outline-width: 0
}

.form-card .btn-success {
	color: #ffffff !important;
	margin-bottom: 25px !important;
	font-weight: 300;
	width: 100%;
	border-radius: 4px;
	letter-spacing: 2px;
	font-family: Trebuchet MS !important
}

.bottom {
	bottom: 0;
	position: absolute;
	width: 100%
}

@media ( max-width : 768px) {
	.bottom {
		position: relative
	}
	.card1 {
		padding-right: 15px;
		border-top-left-radius: 10px !important;
		border-top-right-radius: 10px !important;
		border-bottom-left-radius: 0px !important;
		border-bottom-right-radius: 0px !important
	}
	.card2 {
		border-bottom-left-radius: 10px !important;
		border-bottom-right-radius: 10px !important;
		border-top-left-radius: 0px !important;
		border-top-right-radius: 0px !important
	}
}

.fit-image {
	width: 100%;
	object-fit: cover
}

.radio-group {
	position: relative;
	margin-bottom: 25px
}

.radio {
	display: inline-block;
	width: 204;
	height: 64;
	border-radius: 0;
	background: #B2EBF2;
	box-sizing: border-box;
	border-top: 3px solid #E8F5E9;
	cursor: pointer;
	margin: 8px 0px 8px 0px;
	transition: 0.3s
}

.radio:hover {
	border-top: 3px #B2EBF2 solid;
	transition: 0.3s
}

.radio.selected {
	border-top: 3px solid #0091EA;
	transition: 0.3s
}
</style>
<body>
<%
	String productName = request.getParameter("prod");
	String quantity = request.getParameter("quan");
	String desc = request.getParameter("desc");
	String price = request.getParameter("price");
	String phoneNumber = request.getParameter("farmer");
	String farmloc= request.getParameter("farmerlocation");
%>
	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-12 col-sm-10 col-md-12 col-lg-11 col-xl-10">
				<div class="card card0">
					<div class="row">
						<div class="col-md-6 d-block p-0 box">
							<div class="card rounded-0 border-0 card1 pr-xl-4 pr-lg-3">
								<div class="row justify-content-center">
									<div class="col-11">
										<h3 class="text-center mt-4 mb-4" id="heading0">Product Delivery
											details</h3>
									</div>
								</div>
								<div class="row justify-content-center">
									<div class="col-5 fit-image">
										<img src="https://i.imgur.com/NnVWuER.png" height="200px"
											width="200px">
									</div>
								</div>
								<div class="row justify-content-center">
									<div class="col-11">
										<h1 class="text-center mt-4 mb-0" id="sub-heading1">Easy
											</h1>
									</div>
								</div>
								<div class="row justify-content-center">
									<div class="col-11">
										<p class="text-center mt-0 mb-3" id="sub-heading2">
											way to buy products</p>
									</div>
								</div>
								<form class="form-card p-4 pl-5">
									<div class="row">
										<div class="col-md-6">
											<div class="row">
												<div class="col-12">
													<label class="gift">Product Name</label>
												</div>
												<div class="col-12">
													<input class="gift-input" type="text" name="to"
														value=<%=productName %> readonly>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="row">
												<div class="col-12">
													<label class="gift">Quantity</label>
												</div>
												<div class="col-12">
													<input class="gift-input" type="text" name="from"
														value=<%=desc %> readonly>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-12">
											<label class="gift">Description</label><br> <input
												class="gift-input" type="text" name="desc"
												value=<%=quantity %>>
										</div>
									</div>
									<div class="row">
										<div class="col-12">
											<label class="gift">Price</label><br> <input
												class="gift-input" type="text" name="msg"
												value=<%=price %> readonly>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="col-md-6 col-sm-12 p-0 box">
							<div class="card rounded-0 border-0 card2">
								<div class="form-card">
									<h2 id="heading" class="text-center">Payment Information</h2>
									<div class="radio-group">
										<div class='radio selected' data-value="credit">
											<img src="https://i.imgur.com/28akQFX.jpg" width="200px"
												height="60px">
										</div>
										<div class='radio' data-value="paypal">
											<img src="https://i.imgur.com/5QFsx7K.jpg" width="200px"
												height="60px">
										</div>
										<br>
									</div>
									<h3 id="credit" class="mb-3">Credit card</h3>
									<input type="text" name="holdername" placeholder="Team 28">
									<div class="row">
										<div class="col-12">
											<input type="text" name="cardno" id="cr_no"
												placeholder="0000 0000 0000 0000" minlength="19"
												maxlength="19">
										</div>
									</div>
									<div class="row form-group">
										<div class="col-9 col-md-7">
											<input type="text" name="exp" id="exp" placeholder="MM/YY"
												minlength="5" maxlength="5">
										</div>
										<div class="col-3 col-md-5">
											<input type="password" name="cvcpwd"
												placeholder="&#9679;&#9679;&#9679;" class="placeicon"
												minlength="3" maxlength="3">
										</div>
									</div>
									<div class="row form-group">
										<div class="col-12">
											<div
												class="custom-control custom-checkbox custom-control-inline">
												<input id="chk1" type="checkbox" name="chk"
													class="custom-control-input"> <label for="chk1"
													class="custom-control-label">Business account</label>
											</div>
										</div>
									</div>
									<br/>
									<br>
									<br><br><br><br>
									<div class="bottom">
									<div class="row justify-content-center">
											<div class="col-md-8">
											<form action='Payconfirm' method='POST'>
											<input type='hidden' name='quan' value=<%=desc %>>
											<input type='hidden' name='desc' value=<%=quantity %>>
											<input type='hidden' name='price' value=<%=price %>>
											<input type='hidden' name='farmer' value=<%=phoneNumber %>>
											<input type='hidden' name='prod' value=<%=productName %>>
											<input type='hidden' name='farmerloc' value=<%=farmloc %>>
												<input type="submit" value="Pay on Delivery"
													class="btn btn-success">
													</form>
											</div>
										</div>
										<div class="row justify-content-center">
											<div class="col-12">
												<h4 id="total" class="text-center">
													Total: <%=price+" INR" %> + <span class="text-dark">GST</span>
												</h4>
											</div>
										</div>
										<div class="row justify-content-center">
											<div class="col-md-8">
											<form action='Payconfirm' method='POST'>
											<input type='hidden' name='quan' value=<%=desc %>>
											<input type='hidden' name='desc' value=<%=quantity %>>
											<input type='hidden' name='price' value=<%=price %>>
											<input type='hidden' name='farmer' value=<%=phoneNumber %>>
											<input type='hidden' name='prod' value=<%=productName %>>
											<input type='hidden' name='farmerloc' value=<%=farmloc %>>
												<input type="submit" value="PURCHASE"
													class="btn btn-success">
													</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="JS/Payment.js"></script>
</html>