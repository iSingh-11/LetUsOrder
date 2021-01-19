package HomePage;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DatabaseConnectivity.Database;
@WebServlet("/UpdateInfo")
public class UpdateInfo extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	public void init() throws ServletException
	{
		super.init();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html;charset=UTF-8");
		Database d=new Database();
		String name = request.getParameter("name");
    	String address = request.getParameter("address");
    	String city = request.getParameter("city");
    	String contact = request.getParameter("contact");
    	String location = request.getParameter("location");
    	String username = (String)request.getSession(true).getAttribute("activeEmail");
    	request.getSession(true).setAttribute("username",name);
    	d.updateInfo(username,name,address,city,contact,location);
    	response.sendRedirect("/LetUsOrder/Profile");
	}
}