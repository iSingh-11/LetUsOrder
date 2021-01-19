package HomePage;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DatabaseConnectivity.Database;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
@WebServlet("/addNewProduct")
public class AddNewProduct extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	public void init() throws ServletException
	{
		super.init();
	}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	String existing=request.getParameter("existing");
    	String shop=request.getParameter("shop");
    	String type=request.getParameter("type");
    	String catg=request.getParameter("catg");
    	
    	String link=request.getParameter("link");
    	String name=request.getParameter("name");
    	String description=request.getParameter("description");
    	String category=request.getParameter("category");
    	String price=request.getParameter("price");
    	Database d=new Database();
    	d.addNewProduct(existing,shop,type,catg,link,name,description,category,price);
    	response.sendRedirect("/LetUsOrder/Profile#shops");
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	doPost(request, response);
    }
}