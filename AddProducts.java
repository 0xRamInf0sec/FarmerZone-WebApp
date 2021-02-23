

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;


@WebServlet("/AddProducts")
public class AddProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession ses=request.getSession();
		
		if(ses.getAttribute("pno") != null)
		{
			String number=String.valueOf(ses.getAttribute("pno"));
			//System.out.print(number);
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerzone", "Bootathon","6383411123");
				PreparedStatement st=(PreparedStatement) con.prepareStatement("Select * from farmerregister where Phonenumber=?");
				st.setString(1,number);
				String location = "";
				String locationt="";
				ResultSet r=st.executeQuery();
				while(r.next())
				{
					location=r.getString("Location");
					locationt=r.getString("Locationtext");
				}
				
				String Productname=request.getParameter("Prodname");
				String Prodquantity=request.getParameter("prodquan");
				String Description=request.getParameter("prodesc");
				String Price=request.getParameter("price");
				//out.println(number);
				PrintWriter out=response.getWriter();
				try{
					PreparedStatement st1=(PreparedStatement) con.prepareStatement("Insert into farmerproducts values(?,?,?,?,?,?,?)");
					st1.setString(1,number);
					st1.setString(2, Productname);
					st1.setString(3,Prodquantity);
					st1.setString(4,Description);
					st1.setString(5, Price);
					st1.setString(6, location);
					st1.setString(7,locationt);
					int r1=st1.executeUpdate();
					 //System.out.print(r1);
					 if(r1>0)
					 {
						 request.setAttribute("productsadd", "Products Added Successfully...");
						 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Shop.jsp");
						 dispatcher.forward(request, response);
					 }
					 else
					 {
						 request.setAttribute("productsaddfail", "Something gone wrong while adding products...");
						 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Shop.jsp");
						 dispatcher.forward(request, response);
					 }
				}
				catch(Exception ec)
				{
					System.out.print(ec);
				}
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
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
