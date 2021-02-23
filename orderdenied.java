

import java.io.IOException;
import java.sql.DriverManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class orderdenied
 */
@WebServlet("/orderdenied")
public class orderdenied extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String farmernumber=request.getParameter("farmernum");
		String productname=request.getParameter("prod");
		String status="Denied";
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerzone", "Bootathon","6383411123");
			PreparedStatement st=(PreparedStatement) con.prepareStatement("UPDATE payment SET status=? where Farmernumber=? and Productname=? ");
			
			
			st.setString(1, status);
			st.setString(2,farmernumber);
			st.setString(3,productname);
			//System.out.println(st);
			int r1=st.executeUpdate();
			 //System.out.print(r1);
			 if(r1>0)
			 {
				 //request.setAttribute("productsadd", "Products updated Successfully...");
				 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Shop.jsp");
				 dispatcher.forward(request, response);
			 }
			 else
			 {
				 //request.setAttribute("productsaddfail", "Something gone wrong while updating products...");
				 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Shop.jsp");
				 dispatcher.forward(request, response);
			 }
		}
		catch(Exception ec)
		{
			System.out.print(ec);
		}
	}

}
