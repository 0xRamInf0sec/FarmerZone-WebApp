

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class updateproducts
 */
@WebServlet("/updateproducts")
public class updateproducts extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession ses=request.getSession();
		if(ses.getAttribute("pno") != null)
		{
			String number=String.valueOf(ses.getAttribute("pno"));
			String Productname=request.getParameter("Prodname");
			String Prodquantity=request.getParameter("prodquan");
			String Description=request.getParameter("prodesc");
			String Price=request.getParameter("price");
			//out.println(number);
			PrintWriter out=response.getWriter();
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerzone", "Bootathon","6383411123");
				PreparedStatement st=(PreparedStatement) con.prepareStatement("UPDATE farmerproducts SET Prodname=?,Quantity=?,Description=?,Price=? where Phonenumber=? and Prodname=?");
				
				
				st.setString(1, Productname);
				st.setString(2,Prodquantity);
				st.setString(3,Description);
				st.setString(4, Price);
				st.setString(5,number);
				st.setString(6, Productname);
				//System.out.println(st);
				int r1=st.executeUpdate();
				 //System.out.print(r1);
				 if(r1>0)
				 {
					 request.setAttribute("productsadd", "Products updated Successfully...");
					 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Shop.jsp");
					 dispatcher.forward(request, response);
				 }
				 else
				 {
					 request.setAttribute("productsaddfail", "Something gone wrong while updating products...");
					 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Shop.jsp");
					 dispatcher.forward(request, response);
				 }
			}
			catch(Exception ec)
			{
				System.out.print(ec);
			}
		}
		else
		{
			request.setAttribute("Loginauth", "Please Login as farmer first..");
			 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Login.jsp");
			 dispatcher.forward(request, response);
		
	}

}
}
