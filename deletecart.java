

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
 * Servlet implementation class deletecart
 */
@WebServlet("/deletecart")
public class deletecart extends HttpServlet {
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
			PreparedStatement st=(PreparedStatement) con.prepareStatement("DELETE from consumercart WHERE Prodname=? and custphone=?");
			
			st.setString(1,Productname);
			st.setString(2,number);
			
			 int r1=st.executeUpdate(); 
			 if(r1>0)
			 {
				 request.setAttribute("cartdelmessagewr", "Product deleted from cart");
				 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/consumerCart.jsp");
				 dispatcher.forward(request, response);
			 }
			 else
			 {
				 request.setAttribute("cartdelmessagewr", "Something went wrong!");
				 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ConsumerCart.jsp");
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
