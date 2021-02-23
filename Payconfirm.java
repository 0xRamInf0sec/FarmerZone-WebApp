

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Payconfirm
 */
@WebServlet("/Payconfirm")
public class Payconfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession ses=request.getSession();
		String number=String.valueOf(ses.getAttribute("pno"));
		String productName = request.getParameter("prod");
		String quantity = request.getParameter("quan");
		String desc = request.getParameter("desc");
		String price = request.getParameter("price");
		String phoneNumber = request.getParameter("farmer");
		String farmloc= request.getParameter("farmerloc");
		HttpSession s=request.getSession();
		String conloc=String.valueOf(s.getAttribute("consloc"));
		LocalDateTime dTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MMM dd");
		String date=dTime.format(formatter);
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerzone", "Bootathon","6383411123");
			PreparedStatement st=con.prepareStatement("Insert into payment values(?,?,?,?,?,?,?,?,?,?)");
			 st.setString(1,productName);
			 st.setString(2,quantity);
			 st.setString(3, desc);
			 st.setString(4, price);
			 st.setString(5, phoneNumber);
			 st.setString(6,farmloc);
			 st.setString(7, conloc);
			 st.setString(8, number);
			 st.setString(9, "waiting");
			 st.setString(10, date);
			 int r1=st.executeUpdate();
			 if(r1>0) {
			  // pw.println("<script>alert('Phone number already registered')</script>");
				 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Consumation.jsp");
				 dispatcher.forward(request, response);
			 }
			 else
			 {
				 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Payment.jsp");
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
