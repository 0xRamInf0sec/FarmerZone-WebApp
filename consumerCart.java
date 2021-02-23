

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class consumerCart
 */
@WebServlet("/consumerCart")
public class consumerCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		String consphno=request.getParameter("consphno");
		String Productname=request.getParameter("prod");
		String Productquan=request.getParameter("quan");
		String price=request.getParameter("price");
		//System.out.println(Productquan);
		String Productdesc=request.getParameter("Desc");
		String FarmerLoc=request.getParameter("farmloc");
		
		
		String farmerno=request.getParameter("farmer");
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerzone", "Bootathon","6383411123");
			PreparedStatement st=(PreparedStatement) con.prepareStatement("INSERT into consumercart values(?,?,?,?,?,?,?)");
			st.setString(1,consphno);
			st.setString(2,Productname);
			st.setString(3,Productquan);
			st.setString(4,Productdesc);
			st.setString(5,price);
			st.setString(6,farmerno);
			st.setString(7, FarmerLoc);
			 int r1=st.executeUpdate(); 
			 if(r1>0)
			 {
				 request.setAttribute("cartmessage", "Product added to cart");
				 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/consumerCart.jsp");
				 dispatcher.forward(request, response);
			 }
			 else
			 {
				 request.setAttribute("cartmessage", "Something went wrong!");
				 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ConsumerShop.jsp");
				 dispatcher.forward(request, response);
			 }
			 
			
			con.close();
		}
		catch(Exception ec)
		{
			System.out.print(ec);
		}
	}

}
