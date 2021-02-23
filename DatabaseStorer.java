

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DatabaseStorer")
public class DatabaseStorer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DatabaseStorer() {
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String userNumber=request.getParameter("userNumber");
		String followNumber=request.getParameter("followNumber");
		
		String dbName="farmerzone";
		String followTableName = "follow";
		try {
			int what=Integer.valueOf(request.getParameter("what"));
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dbName, "Bootathon", "6383411123");
			Statement statement = connection.createStatement();
			if(userNumber!=null) {
				if(followNumber!=null||!followNumber.isEmpty()) {
					if(what==1) {
						statement.executeUpdate("delete from "+followTableName+" where (follower='"+userNumber+"' and following='"+followNumber+"')");//0 following 1
						out.println("Follow");
					}
					else {
						statement.executeUpdate("insert into "+followTableName+" values('"+userNumber+"','"+followNumber+"')");//0 following 1
						out.println("Following");
					}
					
				}
				else {
					out.println("Follow fnum=null");
				}
			}
			else {
				out.println("Follow unum=null");
			}
			
		}catch (Exception e) {
			out.println(e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
