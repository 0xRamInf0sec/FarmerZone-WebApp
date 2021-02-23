

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class deleteprod
 */
@WebServlet("/deleteprod")
public class deleteprod extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		HttpSession ses=request.getSession();
		String number=String.valueOf(ses.getAttribute("pno"));
		
		String Productname=request.getParameter("prod");
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerzone", "Bootathon","6383411123");
			PreparedStatement st=(PreparedStatement) con.prepareStatement("DELETE from farmerproducts where Prodname=? and Phonenumber=?");
			st.setString(1,Productname);
			st.setString(2,number);
			PreparedStatement st1=(PreparedStatement) con.prepareStatement("DELETE from consumercart where Prodname=? and farmerphno=?");
			st1.setString(1,Productname);
			st1.setString(2,number);
			 int r1=st.executeUpdate(); 
			 int r2=st1.executeUpdate();
			 if(r1>0)
			 {
				 if(r2>0)
				 {
				 request.setAttribute("cartmessagesuc", "Product Deleted successfull");
				 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Shop.jsp");
				 dispatcher.forward(request, response);
				 }
			 }
			 else
			 {
				 request.setAttribute("cartmessagefai", "Something went wrong!");
				 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Shop.jsp");
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
