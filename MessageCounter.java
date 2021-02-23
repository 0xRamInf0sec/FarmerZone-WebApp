
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

/**
 * Servlet implementation class MessageCounter
 */
@WebServlet("/MessageCounter")
public class MessageCounter extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MessageCounter() {
		super();
		
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession ses=request.getSession();
		String number=String.valueOf(request.getParameter("senderNumber"));
		Map<String, Integer> map = new TreeMap<String, Integer>();
		PrintWriter out = response.getWriter();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/chats", "root", "");
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SHOW TABLES;");
			while (rs.next()) {
				String tName=rs.getString(1);
				String temp = tName;
				temp=temp.replace("a","");
				String arr[] = temp.split("_");
				// System.out.println(temp);
				// if (arr[0].equals(n)) {
				statement = connection.createStatement();
				if (arr[0].equals(number)) {
					//out.println(tName);
					int msgCount=0;
					ResultSet rs1 = statement.executeQuery("select * from "+tName+" where status='unread' and who='"+arr[1]+"'");
					while(rs1.next()) {
						msgCount++;
					}
					map.put(arr[1], msgCount);
				} else if (arr[1].equals(number)) {
					int msgCount=0;
					ResultSet rs2 = statement.executeQuery("select * from "+tName+" where status='unread' and who='"+arr[0]+"'");
					while(rs2.next()) {
						msgCount++;
					}
					map.put(arr[0], msgCount);
				}
			}
			out.println(new Gson().toJson(map));
		}catch (Exception e) {
			out.println("Error "+e);
		}
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
