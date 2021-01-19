package HomePage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DatabaseConnectivity.Database;
@WebServlet("/createNewAccount")
public class CreateAccount extends HttpServlet 
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
		String name=request.getParameter("name");
		String contact=request.getParameter("contact");
		String address=request.getParameter("address");
		String city=request.getParameter("city");
		String location=request.getParameter("lat-long");
		String email=(String)request.getSession(true).getAttribute("newEmail");
		String paswd=(String)request.getSession(true).getAttribute("newPwd");
		//String seler=(String)request.getSession(true).getAttribute("newSeller");
		
		File file = new File(System.getProperty("user.dir") + "/default.png"); //remember
		InputStream blob = new FileInputStream(file);
		System.out.print(blob);
		Database d=new Database();
		d.createAccount(blob,name,email,paswd,contact,address,city,location);
		
		request.getSession(true).setAttribute("active",true);
    	request.getSession(true).setAttribute("username",d.getName(email));
    	request.getSession(true).setAttribute("activeEmail",email);
    	request.getSession(true).setAttribute("cartQuantity",d.getCartQuantity(email));
    	d.getUserDp((String)request.getSession(true).getAttribute("activeEmail"));
    	request.getSession(true).setAttribute("attemptsOver",3);
		response.sendRedirect("/LetUsOrder/Home");
    }
}