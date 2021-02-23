<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="Register.css">
<script src="JS/Register.js" type="text/javascript"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_element');
}
</script>

<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<body>
<div>
<%if(request.getAttribute("message")==null)
{
	
}
else
{
	out.print("<div style='background-color:red;padding:5px;text-align:center;'>");
	out.print("<h3 style='color:white'>Error : "+request.getAttribute("message")+"</h3></div>");
}
 %>

</div>
<div id="google_translate_element">
<b>Click Here to Translate the page</b>
</div>

	<div class="container register">
		<div class="row">
			<div class="col-md-3 register-left">
				<img src="https://image.ibb.co/n7oTvU/logo_white.png" alt="" />
				<h3>Welcome</h3>
				<p>You are just 30 seconds away to get!</p>
				<a style="background-color:white;color:black;padding:3% 10%;border-radius:1.5rem;text-decoration:none;" href="Login.jsp">Login</a><br />
			</div>
			<div class="col-md-9 register-right">
				<ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
					<li class="nav-item"><a class="nav-link active" id="home-tab"
						data-toggle="tab" href="#home" role="tab" aria-controls="home"
						aria-selected="true">Farmer</a></li>
					<li class="nav-item"><a class="nav-link" id="profile-tab"
						data-toggle="tab" href="#profile" role="tab"
						aria-controls="profile" aria-selected="false">Client</a></li>
				</ul>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="home" role="tabpanel"
						aria-labelledby="home-tab">
						<h3 class="register-heading">Apply as a Farmer</h3>
						<form action="FarmerRegister" method="POST">
						<div class="row register-form">
							<div class="col-md-6">
								<div class="form-group">
									<input type="text" class="form-control"
										placeholder="First Name *" name="fname" value="" />
								</div>
								<div class="form-group">
									<input type="text" class="form-control"
										placeholder="Last Name *" name="lname" value="" />
								</div>
								<div class="input-group mb-3">
									<input id="fpass" type="password" class="form-control"
										placeholder="Password *" name="fpass" value="" />
									<div class="input-group-append">
										<a onclick="show('fpass')" class="btn btn-outline-primary">
											<i class="fa fa-eye"></i>
										</a>
									</div>
								</div>
								<div class="input-group mb-3">
									<input id="fcpass" type="password" class="form-control"
										placeholder="Confirm Password *" value="" />
									<div class="input-group-append">
										<a onclick="show('fcpass')" class="btn btn-outline-primary">
											<i class="fa fa-eye"></i>
										</a>
									</div>
								</div>


								<div class="form-group">
									<div class="maxl">
										<label class="radio inline"> <input type="radio"
											name="gender" value="male" checked> <span>
												Male </span>
										</label> <label class="radio inline"> <input type="radio"
											name="gender" value="female"> <span>Female </span>
										</label>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<input type="email" class="form-control"
										placeholder="Your Email *" value="" name="email" />
								</div>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text">+91</span>
									</div>
									<input type="text" minlength="10" maxlength="10"
										name="txtEmpPhone" class="form-control"
										placeholder="Your Phone *" value="" pattern="[0-9]*" />
								</div>
								<div class="form-group">
									<input type="text" minlength="12" maxlength="12"
										name="txtEmpAadhar" class="form-control"
										placeholder="Your Aadhaar *" value="" pattern="[0-9]*" />
								</div>
								<div class="form-group" >
									<input id="form" type="text" class="form-control" id="location1"
										onclick="getLiveLocation('location1')" name="location" placeholder="Your Location *"
										readonly value="" />
								</div>
								<div class="form-group">
									<input type="text"
										name="locationtext" class="form-control"
										placeholder="Location *" value=""/>
								</div>
								<input type="submit" class="btnRegister" value="Register" />
							</div>
						</div>
						</form>
					</div>
					<div class="tab-pane fade show" id="profile" role="tabpanel"
						aria-labelledby="profile-tab">
						<h3 class="register-heading">Apply as a Client</h3>
						<form action="ConsumerRegister" method="POST">
						<div class="row register-form">
							<div class="col-md-6">
								<div class="form-group">
									<input type="text" class="form-control"
										placeholder="First Name *" name="fname" value="" />
								</div>
								<div class="form-group">
									<input type="text" class="form-control"
										placeholder="Last Name *" name="lname" value="" />
								</div>
								<div class="input-group mb-3">
									<input id="cpass" type="password" class="form-control"
										placeholder="Password *" name="fpass"value="" />
									<div class="input-group-append">
										<a onclick="show('cpass')" class="btn btn-outline-primary">
											<i class="fa fa-eye"></i>
										</a>
									</div>
								</div>
								<div class="input-group mb-3">
									<input id="ccpass" type="password" class="form-control"
										placeholder="Confirm Password *" value="" />
									<div class="input-group-append">
										<a onclick="show('ccpass')" class="btn btn-outline-primary">
											<i class="fa fa-eye"></i>
										</a>
									</div>
								</div>


								<div class="form-group">
									<div class="maxl">
										<label class="radio inline"> <input type="radio"
											name="gender" value="male" checked> <span>
												Male </span>
										</label> <label class="radio inline"> <input type="radio"
											name="gender" value="female"> <span>Female </span>
										</label>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<input type="email" class="form-control"
										placeholder="Your Email *" value="" name="email" />
								</div>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text">+91</span>
									</div>
									<input type="text" minlength="10" maxlength="10"
										name="txtEmpPhone" class="form-control"
										placeholder="Your Phone *" value="" pattern="[0-9]*" />
								</div>
								<div class="form-group">
									<input type="text" minlength="12" maxlength="12"
										name="txtEmpAadhar" class="form-control"
										placeholder="Your Aadhaar *" value="" pattern="[0-9]*" />
								</div>
								<div class="form-group">
									<input type="text" class="form-control" id="location2"
										onclick="getLiveLocation('location2')" name="location" placeholder="Your Location *"
										readonly value="" />
										
								</div>
								<div class="form-group">
									<input type="text"
										name="locationtext" class="form-control"
										placeholder="Location *" value=""/>
								</div>
								<input type="submit" class="btnRegister" value="Register" />
							</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
<script>
	
</script>
</html>