package HomePage;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DatabaseConnectivity.Database;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
@WebServlet("/deleteShop")
public class DeleteShop extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	public void init() throws ServletException
	{
		super.init();
	}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	String shopname=request.getParameter("shopName");
    	String shoptype=request.getParameter("shopType");
    	Database d=new Database();
    	d.deleteShop((String)request.getSession(true).getAttribute("activeEmail"),shopname,shoptype);
    	response.sendRedirect("/LetUsOrder/Profile#shops");
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	doPost(request, response);
    }
}