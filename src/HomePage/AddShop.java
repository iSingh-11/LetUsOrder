package HomePage;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DatabaseConnectivity.Database;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
@WebServlet("/newShop")
public class AddShop extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	public void init() throws ServletException
	{
		super.init();
	}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	String name=request.getParameter("shopname");
    	String adds=request.getParameter("shopaddress");
    	String catg=request.getParameter("shopcategory");
    	String city=request.getParameter("shopcity");
    	String loctn=request.getParameter("shoplocation");
    	Database d=new Database();
    	d.addNewShop((String)request.getSession(true).getAttribute("activeEmail"),name,city,adds,catg,loctn);
    	response.sendRedirect("/LetUsOrder/Profile#shops");
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	doPost(request, response);
    }
}