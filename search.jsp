<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*"%>

<%
String s=request.getParameter("val");
if(s==null || s.trim().equals("")){
out.print("<b>Please Type anything to search</b>");

}else{
 out.println("<img src='http://cdn.lowgif.com/full/2919845499e55757-searching-gif-find-download-on-gifer.gif' width='50' height='50' alt='Searching'></img>");

 out.println("<br>");
 

String search=s;


try{
	HttpSession ses=request.getSession();
	String number=String.valueOf(ses.getAttribute("pno"));
	System.out.println(number);

Statement stmt=null;
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerzone","Bootathon","6383411123");

stmt = con.createStatement();
String sql="select * from farmerproducts where Prodname like '%"+search+"%' or Locationtext like '%"+search+"%' " ;
 ResultSet rs = stmt.executeQuery(sql);
 if(rs.next()==false)
 {
	 out.print("<p style='color:red'>Did not find anything to this product or location</b>");
 }
 else
 {
	 out.print("<p style='color:green'>Search available</b>");
	do{
		 
		 out.println("<div class='card'>");
			
			out.println("<div class='card-columns text-center'>");
			
			//out.println("<td>");
			//out.println("<div>");
			
			//out.println("<img class='img' style='border-radius: 50%' height='100' width='100' src='" + ImageIO.write(bImage2, "jpg", new File("output.jpg") )
			//+ "' onclick='showImg(this)'>");
			//out.println("</div>");
			//out.println("</td>");

			//out.println("<td>");
			out.println("<p class='card-title'><b>Product Name : " + rs.getString("Prodname") + "</b></p>");
			//out.println("</td>");
			//out.println("<p class='card-title'>Quantity : " + rs.getString("Quantity") + "</p>");
			//System.out.println(r1.getString("Quantity"));
			//out.println("<td>");
			out.println("<p class='card-title'>Location : " + rs.getString("Locationtext") + "</p>");
			//out.println("<p class='card-title'>Price : " + rs.getString("Price") + "Rs.</p>");
			//out.println("<p class='card-title'>Farmer Contact Number : " + rs.getString("Phonenumber") + "</p>");
			out.println("<form action='consumerCart' method='POST'><input type='hidden' name='farmloc' value='"+ rs.getString("Location")+"'><input type='hidden' name='quan' value='"+ rs.getString("Quantity")+"'><input type='hidden' name='price' value='"+ rs.getString("Price")+"'><input type='hidden' name='Desc' value='"+rs.getString("Description")+"'><input type='hidden' name='consphno' value='"+number+"'><input type='hidden' name='farmer' value='"+rs.getString("Phonenumber")+"'><input type='hidden' name='prod' value='"+rs.getString("Prodname")+"'><b>Add to cart </b><button type='submit' class='btn btn-success' style='border-radius: 50%'><i class='fa fa-shopping-cart'></i></button></form>");
			out.println("<br>");

			//out.println("<td>");
			out.println("<form action='UserProfile.jsp' method='POST'><input type='hidden' name='farmer' value='"+rs.getString("Phonenumber")+"'><b>View Farmer Profile</b> <button type='submit' class='btn btn-info' style='border-radius: 50%'><i class='fa fa-eye'></i></button></form>");
			//out.println("</td>");
			
			out.println("</div>");
			
			out.println("</div>");
		 } while(rs.next());
 
 
       }
 out.println("<hr>");
rs.close();
stmt.close();
con.close();
}
catch(Exception e)
{
e.printStackTrace();
}
}


%>
</body>
</html>