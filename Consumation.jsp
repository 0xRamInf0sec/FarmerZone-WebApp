<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:v="urn:schemas-microsoft-com:vml"
	xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="x-apple-disable-message-reformatting">
<!--[if !mso]><!-->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<!--<![endif]-->
<title>Thank You!</title>
<%@page import="java.util.*"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>

<%
	HttpSession ses = request.getSession();
String number = String.valueOf(request.getParameter("phonenumber"));

String productName = request.getParameter("prod");
String quantity = request.getParameter("quan");
String desc = request.getParameter("desc");
String price = request.getParameter("price");
String phoneNumber = request.getParameter("farmer");
String farmloc = request.getParameter("farmerloc");
HttpSession s = request.getSession();
String conloc = String.valueOf(s.getAttribute("consloc"));
System.out.println(conloc);
System.out.println(farmloc);
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerzone", "Bootathon",
	"6383411123");
	PreparedStatement st1 = (PreparedStatement) con
	.prepareStatement("DELETE from consumercart where Prodname=? and farmerphno=?");
	st1.setString(1, productName);
	st1.setString(2, phoneNumber);
	int r2 = st1.executeUpdate();
	if (r2 > 0) {
	} else {
	}

	con.close();
} catch (Exception ec) {
	System.out.print(ec);
}
%>

<style type="text/css">
a {
	color: #0000ee;
	text-decoration: underline;
}

@media only screen and (min-width: 660px) {
	.u-row {
		width: 640px !important;
	}
	.u-row .u-col {
		vertical-align: top;
	}
	.u-row .u-col-50 {
		width: 320px !important;
	}
	.u-row .u-col-100 {
		width: 640px !important;
	}
}

@media ( max-width : 660px) {
	.u-row-container {
		max-width: 100% !important;
		padding-left: 0px !important;
		padding-right: 0px !important;
	}
	.u-row .u-col {
		min-width: 320px !important;
		max-width: 100% !important;
		display: block !important;
	}
	.u-row {
		width: calc(100% - 40px) !important;
	}
	.u-col {
		width: 100% !important;
	}
	.u-col>div {
		margin: 0 auto;
	}
	.no-stack .u-col {
		min-width: 0 !important;
		display: table-cell !important;
	}
	.no-stack .u-col-50 {
		width: 50% !important;
	}
	.no-stack .u-col-100 {
		width: 100% !important;
	}
}

body {
	margin: 0;
	padding: 0;
}

table, tr, td {
	vertical-align: top;
	border-collapse: collapse;
}

p {
	margin: 0;
}

.ie-container table, .mso-container table {
	table-layout: fixed;
}

* {
	line-height: inherit;
}

a[x-apple-data-detectors='true'] {
	color: inherit !important;
	text-decoration: none !important;
}

@media ( max-width : 480px) {
	.hide-mobile {
		display: none !important;
		max-height: 0px;
		overflow: hidden;
	}
	.hide-desktop {
		display: block !important;
	}
}

body, table, td, a {
	-webkit-text-size-adjust: 100%;
	-ms-text-size-adjust: 100%;
}

table, td {
	mso-table-lspace: 0pt;
	mso-table-rspace: 0pt;
}

img {
	-ms-interpolation-mode: bicubic;
}

img {
	border: 0;
	height: auto;
	line-height: 100%;
	outline: none;
	text-decoration: none;
}

table {
	border-collapse: collapse !important;
}

body {
	height: 100% !important;
	margin: 0 !important;
	padding: 0 !important;
	width: 100% !important;
}

a[x-apple-data-detectors] {
	color: inherit !important;
	text-decoration: none !important;
	font-size: inherit !important;
	font-family: inherit !important;
	font-weight: inherit !important;
	line-height: inherit !important;
}

@media screen and (max-width: 480px) {
	.mobile-hide {
		display: none !important;
	}
	.mobile-center {
		text-align: center !important;
	}
}

div[style*="margin: 16px 0;"] {
	margin: 0 !important;
}
</style>



</head>

<body class="clean-body"
	style="margin: 0; padding: 0; -webkit-text-size-adjust: 100%; background-color: #e7e7e7">
	<table
		style="border-collapse: collapse; table-layout: fixed; border-spacing: 0; mso-table-lspace: 0pt; mso-table-rspace: 0pt; vertical-align: top; min-width: 320px; Margin: 0 auto; background-color: #e7e7e7; width: 100%"
		cellpadding="0" cellspacing="0">
		<tbody>
			<tr style="vertical-align: top">
				<td
					style="word-break: break-word; border-collapse: collapse !important; vertical-align: top">

					<div id="u_row_1"
						class="u-row-container v-row-padding--vertical v-row-background-image--outer v-row-background-color"
						style="padding: 0px; background-color: transparent">
						<div class="u-row v-row-columns-background-color-background-color"
							style="Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #67a92b;">
							<div class="v-row-background-image--inner"
								style="border-collapse: collapse; display: table; width: 100%; background-color: transparent;">

								<div id="u_column_1" class="u-col u-col-100"
									style="max-width: 320px; min-width: 640px; display: table-cell; vertical-align: top;">
									<div class="v-col-background-color"
										style="width: 100% !important;">
										<!--[if (!mso)&(!IE)]><!-->
										<div class="v-col-padding v-col-border"
											style="padding: 0px; border-top: 0px solid transparent; border-left: 0px solid transparent; border-right: 0px solid transparent; border-bottom: 0px solid transparent;">
											<!--<![endif]-->

											<table id="u_content_image_1" class="u_content_image"
												style="font-family: arial, helvetica, sans-serif;"
												role="presentation" cellpadding="0" cellspacing="0"
												width="100%" border="0">
												<tbody>
													<tr>
														<td class="v-container-padding-padding"
															style="overflow-wrap: break-word; word-break: break-word; padding: 15px 10px; font-family: arial, helvetica, sans-serif;"
															align="left">

															<table width="100%" cellpadding="0" cellspacing="0"
																border="0">
																<tr>
																	<td class="v-text-align"
																		style="padding-right: 0px; padding-left: 0px;"
																		align="center"><h1 align="center"
																			style="color: white;"
																			class="v-src-width v-src-max-width">FARMER ZONE</h1></td>
																</tr>
															</table>

														</td>
													</tr>
												</tbody>
											</table>

											<!--[if (!mso)&(!IE)]><!-->
										</div>
										<!--<![endif]-->
									</div>
								</div>
								<!--[if (mso)|(IE)]></td><![endif]-->
								<!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
							</div>
						</div>
					</div>



					<div id="u_row_7"
						class="u-row-container v-row-padding--vertical v-row-background-image--outer v-row-background-color"
						style="padding: 0px; background-color: transparent">
						<div class="u-row v-row-columns-background-color-background-color"
							style="Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #ffffff;">
							<div class="v-row-background-image--inner"
								style="border-collapse: collapse; display: table; width: 100%; background-color: transparent;">
								<!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td class="v-row-padding v-row-background-image--outer v-row-background-color" style="padding: 0px;background-color: transparent;" align="center"><table cellpadding="0" cellspacing="0" border="0" style="width:640px;"><tr class="v-row-background-image--inner v-row-columns-background-color-background-color" style="background-color: #ffffff;"><![endif]-->

								<!--[if (mso)|(IE)]><td align="center" width="640" class="v-col-padding v-col-background-color v-col-border" style="width: 640px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;" valign="top"><![endif]-->
								<div id="u_column_10" class="u-col u-col-100"
									style="max-width: 320px; min-width: 640px; display: table-cell; vertical-align: top;">
									<div class="v-col-background-color"
										style="width: 100% !important;">
										<!--[if (!mso)&(!IE)]><!-->
										<div class="v-col-padding v-col-border"
											style="padding: 0px; border-top: 0px solid transparent; border-left: 0px solid transparent; border-right: 0px solid transparent; border-bottom: 0px solid transparent;">
											<!--<![endif]-->

											<table id="u_content_image_2" class="u_content_image"
												style="font-family: arial, helvetica, sans-serif;"
												role="presentation" cellpadding="0" cellspacing="0"
												width="100%" border="0">
												<tbody>
													<tr>
														<td class="v-container-padding-padding"
															style="overflow-wrap: break-word; word-break: break-word; padding: 20px 10px; font-family: arial, helvetica, sans-serif;"
															align="left">

															<table width="100%" cellpadding="0" cellspacing="0"
																border="0">
																<tr>
																	<td class="v-text-align"
																		style="padding-right: 0px; padding-left: 0px;"
																		align="center"><img align="center" border="0"
																		src="https://img.bayengage.com/assets/1602242596297-img (2).png"
																		alt="Image" title="Image"
																		style="outline: none; text-decoration: none; -ms-interpolation-mode: bicubic; clear: both; display: inline-block !important; border: none; height: auto; float: none; width: 100%; max-width: 147px;"
																		width="147" class="v-src-width v-src-max-width" /></td>
																</tr>
															</table>

														</td>
													</tr>
												</tbody>
											</table>

											<!--[if (!mso)&(!IE)]><!-->
										</div>
										<!--<![endif]-->
									</div>
								</div>
								<!--[if (mso)|(IE)]></td><![endif]-->
								<!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
							</div>
						</div>
					</div>



					<div id="u_row_9"
						class="u-row-container v-row-padding--vertical v-row-background-image--outer v-row-background-color"
						style="padding: 0px; background-color: transparent">
						<div class="u-row v-row-columns-background-color-background-color"
							style="Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #ffffff;">
							<div class="v-row-background-image--inner"
								style="border-collapse: collapse; display: table; width: 100%; background-color: transparent;">
								<!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td class="v-row-padding v-row-background-image--outer v-row-background-color" style="padding: 0px;background-color: transparent;" align="center"><table cellpadding="0" cellspacing="0" border="0" style="width:640px;"><tr class="v-row-background-image--inner v-row-columns-background-color-background-color" style="background-color: #ffffff;"><![endif]-->

								<!--[if (mso)|(IE)]><td align="center" width="640" class="v-col-padding v-col-background-color v-col-border" style="width: 640px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;" valign="top"><![endif]-->
								<div id="u_column_12" class="u-col u-col-100"
									style="max-width: 320px; min-width: 640px; display: table-cell; vertical-align: top;">
									<div class="v-col-background-color"
										style="width: 100% !important;">
										<!--[if (!mso)&(!IE)]><!-->
										<div class="v-col-padding v-col-border"
											style="padding: 0px; border-top: 0px solid transparent; border-left: 0px solid transparent; border-right: 0px solid transparent; border-bottom: 0px solid transparent;">
											<!--<![endif]-->

											<table id="u_content_text_7" class="u_content_text"
												style="font-family: arial, helvetica, sans-serif;"
												role="presentation" cellpadding="0" cellspacing="0"
												width="100%" border="0">
												<tbody>
													<tr>
														<td class="v-container-padding-padding"
															style="overflow-wrap: break-word; word-break: break-word; padding: 10px 10px 30px; font-family: arial, helvetica, sans-serif;"
															align="left">

															<div class="v-color v-text-align v-line-height"
																style="color: #000000; line-height: 140%; text-align: left; word-wrap: break-word;">
																<p
																	style="font-size: 14px; line-height: 140%; text-align: center;">
																	<strong><span
																		style="font-size: 32px; line-height: 44.8px; color: #67a92b;">Thank
																			you for your purchase</span></strong>
																</p>
															</div>

														</td>
													</tr>
												</tbody>
											</table>

											<!--[if (!mso)&(!IE)]><!-->
										</div>
										<!--<![endif]-->
									</div>
								</div>
								<!--[if (mso)|(IE)]></td><![endif]-->
								<!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
							</div>
						</div>
					</div>



					<div id="u_row_8"
						class="u-row-container v-row-padding--vertical v-row-background-image--outer v-row-background-color"
						style="padding: 0px; background-color: transparent">
						<div class="u-row v-row-columns-background-color-background-color"
							style="Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #ffffff;">
							<div class="v-row-background-image--inner"
								style="border-collapse: collapse; display: table; width: 100%; background-color: transparent;">
								<!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td class="v-row-padding v-row-background-image--outer v-row-background-color" style="padding: 0px;background-color: transparent;" align="center"><table cellpadding="0" cellspacing="0" border="0" style="width:640px;"><tr class="v-row-background-image--inner v-row-columns-background-color-background-color" style="background-color: #ffffff;"><![endif]-->

								<!--[if (mso)|(IE)]><td align="center" width="640" class="v-col-padding v-col-background-color v-col-border" style="width: 640px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;" valign="top"><![endif]-->
								<div id="u_column_11" class="u-col u-col-100"
									style="max-width: 320px; min-width: 640px; display: table-cell; vertical-align: top;">
									<div class="v-col-background-color"
										style="width: 100% !important;">
										<!--[if (!mso)&(!IE)]><!-->
										<div class="v-col-padding v-col-border"
											style="padding: 0px; border-top: 0px solid transparent; border-left: 0px solid transparent; border-right: 0px solid transparent; border-bottom: 0px solid transparent;">
											<!--<![endif]-->

											<table id="u_content_text_8" class="u_content_text"
												style="font-family: arial, helvetica, sans-serif;"
												role="presentation" cellpadding="0" cellspacing="0"
												width="100%" border="0">
												<tbody>
													<tr>
														<td class="v-container-padding-padding"
															style="overflow-wrap: break-word; word-break: break-word; padding: 10px 10px 30px; font-family: arial, helvetica, sans-serif;"
															align="left">

															<div class="v-color v-text-align v-line-height"
																style="color: #000000; line-height: 200%; text-align: left; word-wrap: break-word;">
																<p
																	style="font-size: 14px; line-height: 200%; text-align: center;">
																	<strong><span
																		style="color: #545454; font-size: 14px; line-height: 28px;">Visit
																			your</span> <a href="ConsumerDashboard.jsp"
																		style="color: #67a92b; font-size: 14px; line-height: 28px;">Home
																			Page</a> <span
																		style="color: #545454; font-size: 14px; line-height: 28px;">page
																			to get many products, and services.</span></strong>
																</p>
																<p
																	style="font-size: 14px; line-height: 200%; text-align: center;">
																	<strong><span
																		style="color: #545454; font-size: 14px; line-height: 28px;">If
																			you have any questions, please contact us at</span> <span
																		style="color: #67a92b; font-size: 14px; line-height: 28px;">farmerzone@gmail.com</span></strong>
																</p>
															</div>

														</td>
													</tr>
												</tbody>
											</table>

											<!--[if (!mso)&(!IE)]><!-->
										</div>
										<!--<![endif]-->
									</div>
								</div>
								<!--[if (mso)|(IE)]></td><![endif]-->
								<!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
							</div>
						</div>
					</div>



					<div id="u_row_11"
						class="u-row-container v-row-padding--vertical v-row-background-image--outer v-row-background-color"
						style="padding: 0px; background-color: transparent">
						<div class="u-row v-row-columns-background-color-background-color"
							style="Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #ffffff;">
							<div class="v-row-background-image--inner"
								style="border-collapse: collapse; display: table; width: 100%; background-color: transparent;">
								<!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td class="v-row-padding v-row-background-image--outer v-row-background-color" style="padding: 0px;background-color: transparent;" align="center"><table cellpadding="0" cellspacing="0" border="0" style="width:640px;"><tr class="v-row-background-image--inner v-row-columns-background-color-background-color" style="background-color: #ffffff;"><![endif]-->

								<!--[if (mso)|(IE)]><td align="center" width="640" class="v-col-padding v-col-background-color v-col-border" style="width: 640px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;" valign="top"><![endif]-->
								<div id="u_column_14" class="u-col u-col-100"
									style="max-width: 320px; min-width: 640px; display: table-cell; vertical-align: top;">
									<div class="v-col-background-color"
										style="width: 100% !important;">
										<!--[if (!mso)&(!IE)]><!-->
										<div class="v-col-padding v-col-border"
											style="padding: 0px; border-top: 0px solid transparent; border-left: 0px solid transparent; border-right: 0px solid transparent; border-bottom: 0px solid transparent;">
											<!--<![endif]-->

											<table id="u_content_divider_3" class="u_content_divider"
												style="font-family: arial, helvetica, sans-serif;"
												role="presentation" cellpadding="0" cellspacing="0"
												width="100%" border="0">
												<tbody>
													<tr>
														<td class="v-container-padding-padding"
															style="overflow-wrap: break-word; word-break: break-word; padding: 20px 10px 30px; font-family: arial, helvetica, sans-serif;"
															align="left">

															<table height="0px" align="center" border="0"
																cellpadding="0" cellspacing="0" width="100%"
																style="border-collapse: collapse; table-layout: fixed; border-spacing: 0; mso-table-lspace: 0pt; mso-table-rspace: 0pt; vertical-align: top; border-top: 1px solid #BBBBBB; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%">
																<tbody>
																	<tr style="vertical-align: top">
																		<td
																			style="word-break: break-word; border-collapse: collapse !important; vertical-align: top; font-size: 0px; line-height: 0px; mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%">
																			<span>&#160;</span>
																		</td>
																	</tr>
																</tbody>
															</table>

														</td>
													</tr>
												</tbody>
											</table>

											<!--[if (!mso)&(!IE)]><!-->
										</div>
										<!--<![endif]-->
									</div>
								</div>
								<!--[if (mso)|(IE)]></td><![endif]-->
								<!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
							</div>
						</div>
					</div>
					<div id="u_row_10"
						class="u-row-container v-row-padding--vertical v-row-background-image--outer v-row-background-color"
						style="padding: 0px; background-color: transparent">
						<div class="u-row v-row-columns-background-color-background-color"
							style="Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #ffffff;">
							<div class="v-row-background-image--inner"
								style="border-collapse: collapse; display: table; width: 100%; background-color: transparent;">
								<!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td class="v-row-padding v-row-background-image--outer v-row-background-color" style="padding: 0px;background-color: transparent;" align="center"><table cellpadding="0" cellspacing="0" border="0" style="width:640px;"><tr class="v-row-background-image--inner v-row-columns-background-color-background-color" style="background-color: #ffffff;"><![endif]-->

								<!--[if (mso)|(IE)]><td align="center" width="640" class="v-col-padding v-col-background-color v-col-border" style="width: 640px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;" valign="top"><![endif]-->
								<div id="u_column_15" class="u-col u-col-100"
									style="max-width: 320px; min-width: 640px; display: table-cell; vertical-align: top;">
									<div class="v-col-background-color"
										style="width: 100% !important;">
										<!--[if (!mso)&(!IE)]><!-->
										<div class="v-col-padding v-col-border"
											style="padding: 0px; border-top: 0px solid transparent; border-left: 0px solid transparent; border-right: 0px solid transparent; border-bottom: 0px solid transparent;">
											<!--<![endif]-->

											<table id="u_content_social_1" class="u_content_social"
												style="font-family: arial, helvetica, sans-serif;"
												role="presentation" cellpadding="0" cellspacing="0"
												width="100%" border="0">
												<tbody>
													<tr>
														<td align="left" style="padding-top: 20px;">
															<table cellspacing="0" cellpadding="0" border="0"
																width="100%">
																<tr>
																	<td width="75%" align="left" bgcolor="#eeeeee"
																		style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px;">
																		Order Details #</td>
																	<td width="25%" align="left" bgcolor="#eeeeee"
																		style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px;">
																		Value</td>
																</tr>
																<tr>
																	<td width="75%" align="left"
																		style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 15px 10px 5px 10px;">
																		<%=productName%></td>
																	<td width="25%" align="left"
																		style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 15px 10px 5px 10px;">
																		<%=price%></td>
																</tr>
																<tr>
																	<td width="75%" align="left"
																		style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 15px 10px 5px 10px;">
																		GST</td>
																	<td width="25%" align="left"
																		style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 15px 10px 5px 10px;">
																		Rs.0.00</td>
																</tr>
																<tr>
																	<td width="75%" align="left"
																		style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;">
																		Quantity</td>
																	<td width="25%" align="left"
																		style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;">
																		<%=quantity%>kg
																	</td>
																</tr>
																<tr>
																	<td width="75%" align="left"
																		style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;">
																		Description</td>
																	<td width="25%" align="left"
																		style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;">
																		<%=desc%></td>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td align="left" style="padding-top: 20px;">
															<table cellspacing="0" cellpadding="0" border="0"
																width="100%">
																<tr>
																	<td width="75%" align="left"
																		style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px; border-top: 3px solid #eeeeee; border-bottom: 3px solid #eeeeee;">
																		TOTAL</td>
																	<td width="25%" align="left"
																		style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px; border-top: 3px solid #eeeeee; border-bottom: 3px solid #eeeeee;">
																		<%=price%></td>
																</tr>
															</table>
														</td>
													</tr>

												</tbody>
											</table>

											<!--[if (!mso)&(!IE)]><!-->
										</div>
										<!--<![endif]-->
									</div>
								</div>
								<!--[if (mso)|(IE)]></td><![endif]-->
								<!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
							</div>
						</div>
					</div>
					<div id="u_row_11"
						class="u-row-container v-row-padding--vertical v-row-background-image--outer v-row-background-color"
						style="padding: 0px; background-color: transparent">
						<div class="u-row v-row-columns-background-color-background-color"
							style="Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #ffffff;">
							<div class="v-row-background-image--inner"
								style="border-collapse: collapse; display: table; width: 100%; background-color: transparent;">
								<!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td class="v-row-padding v-row-background-image--outer v-row-background-color" style="padding: 0px;background-color: transparent;" align="center"><table cellpadding="0" cellspacing="0" border="0" style="width:640px;"><tr class="v-row-background-image--inner v-row-columns-background-color-background-color" style="background-color: #ffffff;"><![endif]-->

								<!--[if (mso)|(IE)]><td align="center" width="640" class="v-col-padding v-col-background-color v-col-border" style="width: 640px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;" valign="top"><![endif]-->
								<div id="u_column_14" class="u-col u-col-100"
									style="max-width: 320px; min-width: 640px; display: table-cell; vertical-align: top;">
									<div class="v-col-background-color"
										style="width: 100% !important;">
										<!--[if (!mso)&(!IE)]><!-->
										<div class="v-col-padding v-col-border"
											style="padding: 0px; border-top: 0px solid transparent; border-left: 0px solid transparent; border-right: 0px solid transparent; border-bottom: 0px solid transparent;">
											<!--<![endif]-->

											<table id="u_content_divider_3" class="u_content_divider"
												style="font-family: arial, helvetica, sans-serif;"
												role="presentation" cellpadding="0" cellspacing="0"
												width="100%" border="0">
												<tbody>
													<tr>
														<td class="v-container-padding-padding"
															style="overflow-wrap: break-word; word-break: break-word; padding: 20px 10px 30px; font-family: arial, helvetica, sans-serif;"
															align="left">

															<table height="0px" align="center" border="0"
																cellpadding="0" cellspacing="0" width="100%"
																style="border-collapse: collapse; table-layout: fixed; border-spacing: 0; mso-table-lspace: 0pt; mso-table-rspace: 0pt; vertical-align: top; border-top: 1px solid #BBBBBB; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%">
																<tbody>
																	<tr style="vertical-align: top">
																		<td
																			style="word-break: break-word; border-collapse: collapse !important; vertical-align: top; font-size: 0px; line-height: 0px; mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%">
																			<span>&#160;</span>
																		</td>
																	</tr>
																</tbody>
															</table>

														</td>
													</tr>
												</tbody>
											</table>

											<!--[if (!mso)&(!IE)]><!-->
										</div>
										<!--<![endif]-->
									</div>
								</div>
								<!--[if (mso)|(IE)]></td><![endif]-->
								<!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
							</div>
						</div>
					</div>

					<div id="u_row_3"
						class="u-row-container v-row-padding--vertical v-row-background-image--outer v-row-background-color"
						style="padding: 0px; background-color: transparent">
						<div class="u-row v-row-columns-background-color-background-color"
							style="Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #ffffff;">
							<div class="v-row-background-image--inner"
								style="border-collapse: collapse; display: table; width: 100%; background-color: transparent;">
								<!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td class="v-row-padding v-row-background-image--outer v-row-background-color" style="padding: 0px;background-color: transparent;" align="center"><table cellpadding="0" cellspacing="0" border="0" style="width:640px;"><tr class="v-row-background-image--inner v-row-columns-background-color-background-color" style="background-color: #ffffff;"><![endif]-->

								<!--[if (mso)|(IE)]><td align="center" width="640" class="v-col-padding v-col-background-color v-col-border" style="width: 640px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;" valign="top"><![endif]-->
								<div id="u_column_13" class="u-col u-col-100"
									style="max-width: 320px; min-width: 640px; display: table-cell; vertical-align: top;">
									<div class="v-col-background-color"
										style="width: 100% !important;">
										<!--[if (!mso)&(!IE)]><!-->
										<div class="v-col-padding v-col-border"
											style="padding: 0px; border-top: 0px solid transparent; border-left: 0px solid transparent; border-right: 0px solid transparent; border-bottom: 0px solid transparent;">
											<!--<![endif]-->

											<table id="u_content_text_9" class="u_content_text"
												style="font-family: arial, helvetica, sans-serif;"
												role="presentation" cellpadding="0" cellspacing="0"
												width="100%" border="0">
												<tbody>
													<tr>
														<td align="center" height="100%" valign="top" width="100%"
															style="padding: 0 35px 35px 35px; background-color: #ffffff;"
															bgcolor="#ffffff">
															<table align="center" border="0" cellpadding="0"
																cellspacing="0" width="100%" style="max-width: 660px;">
																<tr>
																	<td align="center" valign="top" style="font-size: 0;">
																		<div
																			style="display: inline-block; max-width: 50%; min-width: 240px; vertical-align: top; width: 100%;">
																			<table align="left" border="0" cellpadding="0"
																				cellspacing="0" width="100%"
																				style="max-width: 300px;">
																				<tr>
																					<td align="left" valign="top"
																						style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px;">
																						<p style="font-weight: 800;">Delivery Address</p>
																						<p id="destine">Tracking...</p>
																					</td>
																				</tr>
																				<tr>
																					<td align="left" valign="top"
																						style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px;">
																						<p style="font-weight: 800;">Origin Address</p>
																						<p id="origin">Tracking...</p>
																					</td>
																				</tr>
																			</table>
																		</div>
																		<div
																			style="display: inline-block; max-width: 50%; min-width: 240px; vertical-align: top; width: 100%;">
																			<table align="left" border="0" cellpadding="0"
																				cellspacing="0" width="100%"
																				style="max-width: 300px;">
																				<tr>
																					<td align="left" valign="top"
																						style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px;">
																						<p style="font-weight: 800;">Estimated
																							Delivery Date</p>
																						<p>
																							<%
																								LocalDateTime dTime = LocalDateTime.now();
																							DateTimeFormatter formatter = DateTimeFormatter.ofPattern("E, MMM dd yyyy");
																							%><%=dTime.format(formatter)%></p>
																					</td>
																				</tr>
																			</table>
																		</div>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</tbody>
											</table>

											<!--[if (!mso)&(!IE)]><!-->
										</div>
										<!--<![endif]-->
									</div>
								</div>
								<!--[if (mso)|(IE)]></td><![endif]-->
								<!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
							</div>
						</div>
					</div>
					<div id="u_row_11"
						class="u-row-container v-row-padding--vertical v-row-background-image--outer v-row-background-color"
						style="padding: 0px; background-color: transparent">
						<div class="u-row v-row-columns-background-color-background-color"
							style="Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #ffffff;">
							<div class="v-row-background-image--inner"
								style="border-collapse: collapse; display: table; width: 100%; background-color: transparent;">
								<!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td class="v-row-padding v-row-background-image--outer v-row-background-color" style="padding: 0px;background-color: transparent;" align="center"><table cellpadding="0" cellspacing="0" border="0" style="width:640px;"><tr class="v-row-background-image--inner v-row-columns-background-color-background-color" style="background-color: #ffffff;"><![endif]-->

								<!--[if (mso)|(IE)]><td align="center" width="640" class="v-col-padding v-col-background-color v-col-border" style="width: 640px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;" valign="top"><![endif]-->
								<div id="u_column_14" class="u-col u-col-100"
									style="max-width: 320px; min-width: 640px; display: table-cell; vertical-align: top;">
									<div class="v-col-background-color"
										style="width: 100% !important;">
										<!--[if (!mso)&(!IE)]><!-->
										<div class="v-col-padding v-col-border"
											style="padding: 0px; border-top: 0px solid transparent; border-left: 0px solid transparent; border-right: 0px solid transparent; border-bottom: 0px solid transparent;">
											<!--<![endif]-->

											<table id="u_content_divider_3" class="u_content_divider"
												style="font-family: arial, helvetica, sans-serif;"
												role="presentation" cellpadding="0" cellspacing="0"
												width="100%" border="0">
												<tbody>
													<tr>
														<td class="v-container-padding-padding"
															style="overflow-wrap: break-word; word-break: break-word; padding: 20px 10px 30px; font-family: arial, helvetica, sans-serif;"
															align="left">

															<table height="0px" align="center" border="0"
																cellpadding="0" cellspacing="0" width="100%"
																style="border-collapse: collapse; table-layout: fixed; border-spacing: 0; mso-table-lspace: 0pt; mso-table-rspace: 0pt; vertical-align: top; border-top: 1px solid #BBBBBB; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%">
																<tbody>
																	<tr style="vertical-align: top">
																		<td
																			style="word-break: break-word; border-collapse: collapse !important; vertical-align: top; font-size: 0px; line-height: 0px; mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%">
																			<span>&#160;</span>
																		</td>
																	</tr>
																</tbody>
															</table>

														</td>
													</tr>
												</tbody>
											</table>

											<!--[if (!mso)&(!IE)]><!-->
										</div>
										<!--<![endif]-->
									</div>
								</div>
								<!--[if (mso)|(IE)]></td><![endif]-->
								<!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
							</div>
						</div>
					</div>
					<div id="u_row_11"
						class="u-row-container v-row-padding--vertical v-row-background-image--outer v-row-background-color"
						style="padding: 0px; background-color: transparent">
						<div class="u-row v-row-columns-background-color-background-color"
							style="Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #ffffff;">
							<div class="v-row-background-image--inner"
								style="border-collapse: collapse; display: table; width: 100%; background-color: transparent;">
								<!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td class="v-row-padding v-row-background-image--outer v-row-background-color" style="padding: 0px;background-color: transparent;" align="center"><table cellpadding="0" cellspacing="0" border="0" style="width:640px;"><tr class="v-row-background-image--inner v-row-columns-background-color-background-color" style="background-color: #ffffff;"><![endif]-->

								<!--[if (mso)|(IE)]><td align="center" width="640" class="v-col-padding v-col-background-color v-col-border" style="width: 640px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;" valign="top"><![endif]-->
								<div id="u_column_14" class="u-col u-col-100 container"
									style="max-width: 320px; min-width: 640px; display: table-cell; vertical-align: top;">
									<div class="v-col-background-color"
										style="width: 100% !important;">
										<!--[if (!mso)&(!IE)]><!-->
										<div class="v-col-padding v-col-border"
											style="padding: 0px; border-top: 0px solid transparent; border-left: 0px solid transparent; border-right: 0px solid transparent; border-bottom: 0px solid transparent;">
											<!--<![endif]-->

											<table id="u_content_divider_3" class="u_content_divider"
												style="font-family: arial, helvetica, sans-serif;"
												role="presentation" cellpadding="0" cellspacing="0"
												width="100%" border="0">
												<tbody>
													<tr>

														<div class="card-columns">
															<div class="card">
																<div class="card-body">
																	<h4 class="card-title">Distance</h4>
																	<p id="distance" class="card-text">Calculating...</p>
																</div>

															</div>
															<div class="card">
																<div class="card-body">
																	<h4 class="card-title">Estimated Time</h4>
																	<p id="dur" class="card-text">Calculating...</p>

																</div>
															</div>
															<div class="card">
																<div class="card-body">
																	<h4 class="card-title">Estimated Traffic Time</h4>
																	<p id="traffic" class="card-text">Calculating...</p>

																</div>
															</div>
														</div>
														</td>
													</tr>
												</tbody>
											</table>

											<!--[if (!mso)&(!IE)]><!-->
										</div>
										<!--<![endif]-->
									</div>
								</div>
								<!--[if (mso)|(IE)]></td><![endif]-->
								<!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
							</div>
						</div>
					</div>
					<div id="u_row_11"
						class="u-row-container v-row-padding--vertical v-row-background-image--outer v-row-background-color"
						style="padding: 0px; background-color: transparent">
						<div class="u-row v-row-columns-background-color-background-color"
							style="Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #ffffff;">
							<div class="v-row-background-image--inner"
								style="border-collapse: collapse; display: table; width: 100%; background-color: transparent;">
								<!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td class="v-row-padding v-row-background-image--outer v-row-background-color" style="padding: 0px;background-color: transparent;" align="center"><table cellpadding="0" cellspacing="0" border="0" style="width:640px;"><tr class="v-row-background-image--inner v-row-columns-background-color-background-color" style="background-color: #ffffff;"><![endif]-->

								<!--[if (mso)|(IE)]><td align="center" width="640" class="v-col-padding v-col-background-color v-col-border" style="width: 640px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;" valign="top"><![endif]-->
								<div id="u_column_14" class="u-col u-col-100"
									style="max-width: 320px; min-width: 640px; display: table-cell; vertical-align: top;">
									<div class="v-col-background-color"
										style="width: 100% !important;">
										<!--[if (!mso)&(!IE)]><!-->
										<div class="v-col-padding v-col-border"
											style="padding: 0px; border-top: 0px solid transparent; border-left: 0px solid transparent; border-right: 0px solid transparent; border-bottom: 0px solid transparent;">
											<!--<![endif]-->

											<table id="u_content_divider_3" class="u_content_divider"
												style="font-family: arial, helvetica, sans-serif;"
												role="presentation" cellpadding="0" cellspacing="0"
												width="100%" border="0">
												<tbody>
													<tr>
														<td class="v-container-padding-padding"
															style="overflow-wrap: break-word; word-break: break-word; padding: 20px 10px 30px; font-family: arial, helvetica, sans-serif;"
															align="left">

															<table height="0px" align="center" border="0"
																cellpadding="0" cellspacing="0" width="100%"
																style="border-collapse: collapse; table-layout: fixed; border-spacing: 0; mso-table-lspace: 0pt; mso-table-rspace: 0pt; vertical-align: top; border-top: 1px solid #BBBBBB; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%">
																<tbody>
																	<tr style="vertical-align: top">
																		<td
																			style="word-break: break-word; border-collapse: collapse !important; vertical-align: top; font-size: 0px; line-height: 0px; mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%">
																			<span>&#160;</span>
																		</td>
																	</tr>
																</tbody>
															</table>

														</td>
													</tr>
												</tbody>
											</table>

											<!--[if (!mso)&(!IE)]><!-->
										</div>
										<!--<![endif]-->
									</div>
								</div>
								<!--[if (mso)|(IE)]></td><![endif]-->
								<!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
							</div>
						</div>
					</div>


					<div id="u_row_10"
						class="u-row-container v-row-padding--vertical v-row-background-image--outer v-row-background-color"
						style="padding: 0px; background-color: transparent">
						<div class="u-row v-row-columns-background-color-background-color"
							style="Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #ffffff;">
							<div class="v-row-background-image--inner"
								style="border-collapse: collapse; display: table; width: 100%; background-color: transparent;">
								<!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td class="v-row-padding v-row-background-image--outer v-row-background-color" style="padding: 0px;background-color: transparent;" align="center"><table cellpadding="0" cellspacing="0" border="0" style="width:640px;"><tr class="v-row-background-image--inner v-row-columns-background-color-background-color" style="background-color: #ffffff;"><![endif]-->

								<!--[if (mso)|(IE)]><td align="center" width="640" class="v-col-padding v-col-background-color v-col-border" style="width: 640px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;" valign="top"><![endif]-->
								<div id="u_column_13" class="u-col u-col-100"
									style="max-width: 320px; min-width: 640px; display: table-cell; vertical-align: top;">
									<div class="v-col-background-color"
										style="width: 100% !important;">
										<!--[if (!mso)&(!IE)]><!-->
										<div class="v-col-padding v-col-border"
											style="padding: 0px; border-top: 0px solid transparent; border-left: 0px solid transparent; border-right: 0px solid transparent; border-bottom: 0px solid transparent;">
											<!--<![endif]-->

											<table id="u_content_text_9" class="u_content_text"
												style="font-family: arial, helvetica, sans-serif;"
												role="presentation" cellpadding="0" cellspacing="0"
												width="100%" border="0">
												<tbody>
													<tr>
														<td class="v-container-padding-padding"
															style="overflow-wrap: break-word; word-break: break-word; padding: 10px; font-family: arial, helvetica, sans-serif;"
															align="left">

															<div class="v-color v-text-align v-line-height"
																style="color: #000000; line-height: 140%; text-align: left; word-wrap: break-word;">
																<p
																	style="font-size: 14px; line-height: 140%; text-align: center;">
																	<span style="font-size: 20px; line-height: 28px;"><strong><span
																			style="line-height: 28px; color: #555555; font-size: 20px;">WE
																				ARE SOCIAL, JOIN US</span></strong></span>
																</p>
															</div>

														</td>
													</tr>
												</tbody>
											</table>

											<!--[if (!mso)&(!IE)]><!-->
										</div>
										<!--<![endif]-->
									</div>
								</div>
								<!--[if (mso)|(IE)]></td><![endif]-->
								<!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
							</div>
						</div>
					</div>



					<div id="u_row_12"
						class="u-row-container v-row-padding--vertical v-row-background-image--outer v-row-background-color"
						style="padding: 0px; background-color: transparent">
						<div class="u-row v-row-columns-background-color-background-color"
							style="Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #ffffff;">
							<div class="v-row-background-image--inner"
								style="border-collapse: collapse; display: table; width: 100%; background-color: transparent;">
								<!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td class="v-row-padding v-row-background-image--outer v-row-background-color" style="padding: 0px;background-color: transparent;" align="center"><table cellpadding="0" cellspacing="0" border="0" style="width:640px;"><tr class="v-row-background-image--inner v-row-columns-background-color-background-color" style="background-color: #ffffff;"><![endif]-->

								<!--[if (mso)|(IE)]><td align="center" width="640" class="v-col-padding v-col-background-color v-col-border" style="width: 640px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;" valign="top"><![endif]-->
								<div id="u_column_15" class="u-col u-col-100"
									style="max-width: 320px; min-width: 640px; display: table-cell; vertical-align: top;">
									<div class="v-col-background-color"
										style="width: 100% !important;">
										<!--[if (!mso)&(!IE)]><!-->
										<div class="v-col-padding v-col-border"
											style="padding: 0px; border-top: 0px solid transparent; border-left: 0px solid transparent; border-right: 0px solid transparent; border-bottom: 0px solid transparent;">
											<!--<![endif]-->

											<table id="u_content_social_1" class="u_content_social"
												style="font-family: arial, helvetica, sans-serif;"
												role="presentation" cellpadding="0" cellspacing="0"
												width="100%" border="0">
												<tbody>
													<tr>
														<td class="v-container-padding-padding"
															style="overflow-wrap: break-word; word-break: break-word; padding: 10px 10px 30px; font-family: arial, helvetica, sans-serif;"
															align="left">

															<div align="center">
																<div style="display: table; max-width: 167px;">
																	<!--[if (mso)|(IE)]><table width="167" cellpadding="0" cellspacing="0" border="0"><tr><td style="border-collapse:collapse;" align="center"><table width="100%" cellpadding="0" cellspacing="0" border="0" style="border-collapse:collapse; mso-table-lspace: 0pt;mso-table-rspace: 0pt; width:167px;"><tr><![endif]-->


																	<!--[if (mso)|(IE)]><td width="32" style="width:32px; padding-right: 10px;" valign="top"><![endif]-->
																	<table align="left" border="0" cellspacing="0"
																		cellpadding="0" width="32" height="32"
																		style="border-collapse: collapse; table-layout: fixed; border-spacing: 0; mso-table-lspace: 0pt; mso-table-rspace: 0pt; vertical-align: top; margin-right: 10px">
																		<tbody>
																			<tr style="vertical-align: top">
																				<td align="left" valign="middle"
																					style="word-break: break-word; border-collapse: collapse !important; vertical-align: top">
																					<a href="https://facebook.com/" title="Facebook"
																					target="_blank"> <img
																						src="https://cdn.tools.unlayer.com/social/icons/circle/facebook.png"
																						alt="Facebook" title="Facebook" width="32"
																						style="outline: none; text-decoration: none; -ms-interpolation-mode: bicubic; clear: both; display: block !important; border: none; height: auto; float: none; max-width: 32px !important">
																				</a>
																				</td>
																			</tr>
																		</tbody>
																	</table>
																	<!--[if (mso)|(IE)]></td><![endif]-->

																	<!--[if (mso)|(IE)]><td width="32" style="width:32px; padding-right: 10px;" valign="top"><![endif]-->
																	<table align="left" border="0" cellspacing="0"
																		cellpadding="0" width="32" height="32"
																		style="border-collapse: collapse; table-layout: fixed; border-spacing: 0; mso-table-lspace: 0pt; mso-table-rspace: 0pt; vertical-align: top; margin-right: 10px">
																		<tbody>
																			<tr style="vertical-align: top">
																				<td align="left" valign="middle"
																					style="word-break: break-word; border-collapse: collapse !important; vertical-align: top">
																					<a href="https://twitter.com/" title="Twitter"
																					target="_blank"> <img
																						src="https://cdn.tools.unlayer.com/social/icons/circle/twitter.png"
																						alt="Twitter" title="Twitter" width="32"
																						style="outline: none; text-decoration: none; -ms-interpolation-mode: bicubic; clear: both; display: block !important; border: none; height: auto; float: none; max-width: 32px !important">
																				</a>
																				</td>
																			</tr>
																		</tbody>
																	</table>
																	<!--[if (mso)|(IE)]></td><![endif]-->

																	<!--[if (mso)|(IE)]><td width="32" style="width:32px; padding-right: 10px;" valign="top"><![endif]-->
																	<table align="left" border="0" cellspacing="0"
																		cellpadding="0" width="32" height="32"
																		style="border-collapse: collapse; table-layout: fixed; border-spacing: 0; mso-table-lspace: 0pt; mso-table-rspace: 0pt; vertical-align: top; margin-right: 10px">
																		<tbody>
																			<tr style="vertical-align: top">
																				<td align="left" valign="middle"
																					style="word-break: break-word; border-collapse: collapse !important; vertical-align: top">
																					<a href="https://instagram.com/" title="Instagram"
																					target="_blank"> <img
																						src="https://cdn.tools.unlayer.com/social/icons/circle/instagram.png"
																						alt="Instagram" title="Instagram" width="32"
																						style="outline: none; text-decoration: none; -ms-interpolation-mode: bicubic; clear: both; display: block !important; border: none; height: auto; float: none; max-width: 32px !important">
																				</a>
																				</td>
																			</tr>
																		</tbody>
																	</table>
																	<!--[if (mso)|(IE)]></td><![endif]-->

																	<!--[if (mso)|(IE)]><td width="32" style="width:32px; padding-right: 0px;" valign="top"><![endif]-->
																	<table align="left" border="0" cellspacing="0"
																		cellpadding="0" width="32" height="32"
																		style="border-collapse: collapse; table-layout: fixed; border-spacing: 0; mso-table-lspace: 0pt; mso-table-rspace: 0pt; vertical-align: top; margin-right: 0px">
																		<tbody>
																			<tr style="vertical-align: top">
																				<td align="left" valign="middle"
																					style="word-break: break-word; border-collapse: collapse !important; vertical-align: top">
																					<a href="https://pinterest.com/" title="Pinterest"
																					target="_blank"> <img
																						src="https://cdn.tools.unlayer.com/social/icons/circle/pinterest.png"
																						alt="Pinterest" title="Pinterest" width="32"
																						style="outline: none; text-decoration: none; -ms-interpolation-mode: bicubic; clear: both; display: block !important; border: none; height: auto; float: none; max-width: 32px !important">
																				</a>
																				</td>
																			</tr>
																		</tbody>
																	</table>
																	<!--[if (mso)|(IE)]></td><![endif]-->


																	<!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
																</div>
															</div>

														</td>
													</tr>
												</tbody>
											</table>

											<!--[if (!mso)&(!IE)]><!-->
										</div>
										<!--<![endif]-->
									</div>
								</div>
								<!--[if (mso)|(IE)]></td><![endif]-->
								<!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
							</div>
						</div>
					</div> <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
				</td>
			</tr>

		</tbody>
	</table>



</body>
<script>
	
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var myObj = JSON.parse(this.responseText);
			document.getElementById("destine").innerHTML = myObj.destination_addresses;
			document.getElementById("origin").innerHTML = myObj.origin_addresses;
			document.getElementById("distance").innerHTML = myObj.rows[0].elements[0].distance.text;
			document.getElementById("dur").innerHTML = myObj.rows[0].elements[0].duration.text;
			document.getElementById("traffic").innerHTML = myObj.rows[0].elements[0].duration_in_traffic.text;

		}
	};
	xmlhttp
			.open(
					"GET",
					"https://api.distancematrix.ai/maps/api/distancematrix/json?origins=<%=conloc%>+&destinations=<%=farmloc%>&departure_time=now&key=jlOTmg0vwBmaHjerS4TjhuXEbWtQ8",
					true);
	xmlhttp.send();
</script>
</html>