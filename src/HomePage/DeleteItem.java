package HomePage;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DatabaseConnectivity.Database;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
@WebServlet("/deleteItem")
public class DeleteItem extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	public void init() throws ServletException
	{
		super.init();
	}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	String name=request.getParameter("itemName");
    	String type=request.getParameter("itemType");
    	String shop=request.getParameter("shopToDl");
    	Database d=new Database();
    	d.deleteItem(name,type,shop);
    	response.sendRedirect("/LetUsOrder/Profile#shops");
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	doPost(request, response);
    }
}