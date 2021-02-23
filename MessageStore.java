

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MessageStore
 */
@WebServlet("/MessageStore")
public class MessageStore extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageStore() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String senderNumber=request.getParameter("senderNumber");
		String receiverNumber=request.getParameter("receiverNumber");
		String message=request.getParameter("msg");
		String msgType=request.getParameter("msgType");
		String who=request.getParameter("senderNumber");
		PrintWriter out=response.getWriter();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/chats","root","");
			Statement statement=connection.createStatement();
			ResultSet rs=statement.executeQuery("SHOW TABLES;");
			String altTableName1="a"+senderNumber+"_"+receiverNumber;
			String altTableName2="a"+receiverNumber+"_"+senderNumber;
			String tableName=getTable(rs,altTableName1.toLowerCase(),altTableName2.toLowerCase());
			LocalDateTime myDateObj = LocalDateTime.now();  
		    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("E, MMM dd yyyy hh:mm a");  
		    
		    String time = myDateObj.format(myFormatObj);  
		    //System.out.println("After Formatting: " + formattedDate);
			if(tableName.equals("null1")||tableName.equals("catch")) {
				statement.executeUpdate("create table "+altTableName1+"(message TEXT,time TEXT,msgType TEXT,who TEXT,status TEXT);");
				statement.executeUpdate("insert into "+altTableName1+" values('"+message+"','"+time+"','"+msgType+"','"+who+"','unread');");
				
				
			}
			else {
				statement.executeUpdate("insert into "+tableName+" values('"+message+"','"+time+"','"+msgType+"','"+who+"','unread');");
				
			}
			out.println(time);
		} catch (Exception e) {
			out.println("Failed :"+e);
		}
		
	}

	private String getTable(ResultSet rs, String altTableName1, String altTableName2) {
		
		try {
			while(rs.next()) {
				String temp=rs.getString(1);
				if(temp.equals(altTableName1)) {
					return altTableName1;
				}
				if(temp.equals(altTableName2)) {
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
