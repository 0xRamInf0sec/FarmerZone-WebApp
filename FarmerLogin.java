

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

@WebServlet("/FarmerLogin")
public class FarmerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String number=request.getParameter("phonenumber");
		String password=request.getParameter("pass");
		//out.println(number);
		PrintWriter out=response.getWriter();
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerzone", "Bootathon","6383411123");
			PreparedStatement st=(PreparedStatement) con.prepareStatement("select Phonenumber,Password from Farmerregister where `Phonenumber` = ? and `Password`=?");
			String dbuser="";
			String dbpass="";
			st.setString(1,number);
			 st.setString(2,password);
			 ResultSet r1=st.executeQuery(); 
			 while(r1.next())
			 {
				 
				 dbuser=r1.getString("Phonenumber");
				// out.println(dbuser);
				 dbpass=r1.getString("Password");
			 }
			 
			 if(dbuser.equals(number) && dbpass.equals(password))
			 {
				HttpSession ses=request.getSession();
				ses.setAttribute("pno", number);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/FarmerDashboard.jsp");
				dispatcher.forward(request, response);
			 }
			 else
			 {
				 request.setAttribute("message", "Sorry Username or password is incorrect");
				 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Login.jsp");
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
