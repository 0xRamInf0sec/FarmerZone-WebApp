
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class MessageRetriever
 */
@WebServlet("/MessageRetriever")
public class MessageRetriever extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MessageRetriever() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String senderNumber = request.getParameter("senderNumber");
		String receiverNumber = request.getParameter("receiverNumber");
		
		//String message = request.getParameter("msg");
		//String msgType = request.getParameter("msgType");
		//String who = request.getParameter("who");
		
		PrintWriter out = response.getWriter();
		//out.println(senderNumber+receiverNumber);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/chats", "root", "");
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SHOW TABLES;");
			String altTableName1 = "a" + senderNumber + "_" + receiverNumber;
			String altTableName2 = "a" + receiverNumber + "_" + senderNumber;
			String tableName = getTable(rs, altTableName1.toLowerCase(), altTableName2.toLowerCase());
			//out.println(tableName);
			if (tableName.equals("null1") || tableName.equals("catch")) {
				out.println("Failed :"+tableName);

			} else {
				ResultSet resultSet=statement.executeQuery("select * from "+tableName+";");
				ArrayList<Messages> al=new ArrayList<Messages>();
				while(resultSet.next()) {
					al.add(new Messages(resultSet.getString(1),resultSet.getString(2),resultSet.getString(3),resultSet.getString(4),resultSet.getString(5)));
				}
				String json=new Gson().toJson(al);
				out.println(json);
			}
			//out.println("Success");
		} catch (Exception e) {
			out.println("Failed :" + e);
		}

	}
	class Messages{
		String message;
		String time;
		String type;
		String who;
		String status;
		public Messages(String message, String time, String type, String who) {
			this.message = message;
			this.time = time;
			this.type = type;
			this.who = who;
		}
		public Messages(String message, String time, String type, String who,String status) {
			this.message = message;
			this.time = time;
			this.type = type;
			this.who = who;
			this.status=status;
		}
		
	}

	private String getTable(ResultSet rs, String altTableName1, String altTableName2) {

		try {
			while (rs.next()) {
				String temp = rs.getString(1);
				if (temp.equals(altTableName1)) {
					return altTableName1;
				}
				if (temp.equals(altTableName2)) {
					return altTableName2;
				}
			}
		} catch (Exception e) {
			System.out.println(e);
			return "catch";
		}
		return "null1";
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
