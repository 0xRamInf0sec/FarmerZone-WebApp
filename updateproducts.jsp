<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>To Update</title>
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
<link rel="stylesheet" href="CSS/Register.css">
<script src="JS/Register.js" type="text/javascript"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
<%@page import="java.util.*" %>
<%@page import="java.io.File" %>
<%@page import="java.io.FileInputStream" %>
<%@page import="java.io.*" %>
<%@page import="java.io.InputStream" %>
<%@page import="java.io.IOException" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Blob" %>
<%@page import="java.awt.image.BufferedImage" %>
<%@page import="javax.imageio.ImageIO" %>
<%@page import="com.mysql.jdbc.Connection" %>
<%@page import="com.mysql.jdbc.PreparedStatement" %>
<%
HttpSession ses=request.getSession();
String number=String.valueOf(ses.getAttribute("pno"));
String proname=request.getParameter("prod");
String quan=request.getParameter("quan");
String Desc=request.getParameter("desc");
String price=request.getParameter("price");
 %>
	<div id="google_translate_element"></div>

	<div class="container register">
		<div class="row">
			<div class="col-md-3 register-left">
				<img src="https://image.ibb.co/n7oTvU/logo_white.png" alt="" />
				<h3>Welcome</h3>
				<p>Trust is a valuable thing, don't lose it!</p>
				<a style="color: white;" href="Shop.jsp"><i class="fa fa-hand-o-left mr-2"></i>Back</a><br />
			</div>
			<div class="col-md-9 register-right">
				<!-- ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
					<li class="nav-item"><a class="nav-link active" id="home-tab"
						data-toggle="tab" href="#home" role="tab" aria-controls="home"
						aria-selected="true">Farmer</a></li>
					<li class="nav-item"><a class="nav-link" id="profile-tab"
						data-toggle="tab" href="#profile" role="tab"
						aria-controls="profile" aria-selected="false">Client</a></li>
				</ul> -->
				<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active" id="home" role="tabpanel"
			aria-labelledby="home-tab">
			<h3 class="register-heading">Update Product</h3>
			<form action="updateproducts" method="POST">
				<div class="row register-form">
					<div class="input-group mb-3">
						<input type="text" class="form-control"
							placeholder="Product name *" name="Prodname"
							value="<%out.print(proname);%>" />
					</div>
					<div class="input-group mb-3">
						<input type="number" min="1" class="form-control"
							placeholder="Product quantity *" name="prodquan"
							value="<%out.print(quan);%>" />
						<div class="input-group-append">
							<span class="input-group-text">kg</span>
						</div>
					</div>
						<div class="input-group mb-3">
							<textarea class="form-control" name="prodesc"
								placeholder="Product description *">
								<%
									out.print(Desc);
								%>
							</textarea>
						</div>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">Rs</span>
							</div>
							<input type="number" class="form-control" name="price"
								placeholder="Price *" value="<%out.print(price);%>">
						</div>
<input type="submit" class="btnRegister" value="Finish" />
					</div>
					
			</form>
		</div>

	</div>
			</div>
		</div>

	</div>
</body>
<script type="text/javascript">
	function googleTranslateElementInit() {
		new google.translate.TranslateElement({
			pageLanguage : 'en'
		}, 'google_translate_element');
	}
	// Add the following code if you want the name of the file appear on select
	$(".custom-file-input").on("change", function() {
	  var fileName = $(this).val().split("\\").pop();
	  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
	});
</script>

<script type="text/javascript"
	src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

</html>