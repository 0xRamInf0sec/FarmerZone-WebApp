
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

/**
 * Servlet implementation class ContactsStore
 */
@WebServlet("/ContactsStore")
public class ContactsStore extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ContactsStore() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession ses=request.getSession();
		String number=String.valueOf(ses.getAttribute("pno"));
		
		PrintWriter out = response.getWriter();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/chats", "root", "");
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SHOW TABLES;");
			String aList=getTable(rs, number);
			String nameList="";
			String contacts[] = aList.split(" ");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerzone", "root", "");
			statement = connection.createStatement();
			for (int j = 0; j < contacts.length; j++) {
				rs = statement.executeQuery("select * from farmerregister where Phonenumber='" + contacts[j]+"'");
				if (!rs.next()) {
					rs = statement.executeQuery("select * from consumerregister where Phonenumber='" + contacts[j]+"'");
				}
				else {
					nameList+=rs.getString(1)+" "+rs.getString(2)+"_";
					continue;
				}
				if (!rs.next()) {
					continue;
				}
				else {
					nameList+=rs.getString(1)+" "+rs.getString(2)+"_";
				}
			}
			
			
			
			rs.first();
			
			//System.out.println("number :"+number);
			String dString="Contacts.jsp";
			if (ses.getAttribute("type").equals("consumer")) {
				dString="ConsumerContact.jsp";
			}
			RequestDispatcher rd=request.getRequestDispatcher(dString);  
			//servlet2 is the url-pattern of the second servlet  
			 request.setAttribute("contacts",aList);
			 request.setAttribute("names",nameList);
			 request.setAttribute("userNumber",number);
			rd.forward(request, response);
			//out.println();
		} catch (Exception e) {
			out.println("Failed :" + e);
		}

	}

	private String getTable(ResultSet rs, String n) {
		String l="";
		try {
			while (rs.next()) {
				String temp = rs.getString(1);
				temp=temp.replace("a","");
				String arr[]=temp.split("_");
				//System.out.println(temp);
				//if (arr[0].equals(n)) {
					if(arr[0].equals(n)) {
						l+=arr[1]+" ";
					}
					else if(arr[1].equals(n)) {
						l+=arr[0]+" ";
					}
				//}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return l;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
