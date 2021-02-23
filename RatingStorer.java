

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

/**
 * Servlet implementation class RatingStorer
 */
@WebServlet("/RatingStorer")
public class RatingStorer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RatingStorer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String number=request.getParameter("recipient");
		String rating=request.getParameter("rate");
		
		String dbName="farmerzone";
		String tableName = "ratings";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dbName, "Bootathon", "6383411123");
			Statement statement = connection.createStatement();
			if(number!=null) {
				if(rating!=null||!rating.isEmpty()) {
					statement.executeUpdate("delete from "+tableName+" where number='"+number+"'");
					statement.executeUpdate("insert into "+tableName+" values('"+number+"','"+rating+"')");//0 following 1
					out.println(rating);
				}
				else {
					out.println("rating fnum=null");
				}
			}
			else {
				out.println("rating num=null");
			}
			
		}catch (Exception e) {
			out.println(e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
