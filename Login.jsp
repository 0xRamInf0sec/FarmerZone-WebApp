<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="data:image/png;base64,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" type="image/png">
<meta charset="ISO-8859-1">
<title>Login</title>
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
<script src="Register.js" type="text/javascript"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_element');
}
</script>
<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<style>

</style>
<div><%
if(request.getAttribute("Loginauthcon")==null)
{
	
}
else
{
	out.print("<div style='background-color:red;padding:5px;text-align:center;'>");
	out.print("<p style='color:white'>"+request.getAttribute("Loginauthcon")+"</p></div>");
}
if(request.getAttribute("Loginauth")==null)
{
	
}
else
{
	out.print("<div style='background-color:red;padding:5px;text-align:center;'>");
	out.print("<p style='color:white'>"+request.getAttribute("Loginauth")+"</p></div>");
}
if(request.getAttribute("Loginmessage")==null)
{
	
}
else
{
	out.print("<div style='background-color:green;padding:5px;text-align:center;'>");
	out.print("<h3 style='color:white'>"+request.getAttribute("Loginmessage")+"</h3></div>");
}
						if(request.getAttribute("message")==null)
						{
							
						}
						else
						{
							out.print("<div style='background-color:red;padding:5px;text-align:center;'>");
							out.print("<h3 style='color:white'>Error : "+request.getAttribute("message")+"</h3></div>");
						}
						%></div>

<body>
<div id="google_translate_element">
<b>Click Here to Translate the page</b></div>

	<div class="container register">
		<div class="row">
			<div class="col-md-3 register-left">
				<img src="https://image.ibb.co/n7oTvU/logo_white.png" alt="" />
				<h3>Welcome</h3>
				<p>You are just 30 seconds away to get!</p>
				<a style="color: white;" href="Register.jsp">Do you want to
					create an account?</a><br />
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
						<h3 class="register-heading">Login as a Farmer</h3>
						<form action="FarmerLogin" method="POST">
						<div class="row register-form">
							<div class="input-group mb-3">
								<input type="text" class="form-control"
									placeholder="Phone number *" name="phonenumber" onkeyup="Checking()" value="" required />
							</div>
							<div id="phone">
							</div>
							<div class="input-group mb-3">
								<input id="cpass" type="password" name="pass" class="form-control"
									placeholder="Password *" value="" required/>
								<div class="input-group-append">
									<a onclick="show('cpass')" class="btn btn-outline-primary">
										<i class="fa fa-eye"></i>
									</a>
								</div>
							</div>

							<input type="submit" class="btnRegister" value="Login" />
						</div>
						</form>
						
						
						</div>
					<div class="tab-pane fade show" id="profile" role="tabpanel"
						aria-labelledby="profile-tab">
						<h3 class="register-heading">Login as a Client</h3>
						<form action="ConsumerLogin" method="POST">
						<div class="row register-form">
							<div class="input-group mb-3">
								<input type="text" class="form-control"
									placeholder="Email or Phone number *" name="phonenumber" value="" required/>
							</div>

							<div class="input-group mb-3">
								<input id="cpass" type="password" class="form-control"
									placeholder="Password *" name="pass" value=""  required/>
								<div class="input-group-append">
									<a onclick="show('cpass')" class="btn btn-outline-primary">
										<i class="fa fa-eye"></i>
									</a>
								</div>
							</div>
							
							<input type="submit" class="btnRegister" value="Login" />
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>