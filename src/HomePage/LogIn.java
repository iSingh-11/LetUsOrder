package HomePage;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DatabaseConnectivity.Database;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
@WebServlet("/LogIn")
public class LogIn extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	public void init() throws ServletException
	{
		super.init();
	}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	try
    	{
    		Database d=new Database();
    		String uname = request.getParameter("uname");
        	String pwd = request.getParameter("pwd");
        	String page = request.getParameter("page");
        	response.setContentType("text/html;charset=UTF-8");

            if(d.checkCredentials(uname,pwd))
            {               	
            	System.out.println("Here");
            	request.getSession(true).setAttribute("active",true);
            	request.getSession(true).setAttribute("username",d.getName(uname));
            	request.getSession(true).setAttribute("activeEmail",uname);
            	request.getSession(true).setAttribute("cartQuantity",d.getCartQuantity(uname));
            	d.getUserDp((String)request.getSession(true).getAttribute("activeEmail"));
                response.sendRedirect("/LetUsOrder/"+page);
                System.out.println("Here All Okayyy");
            } 
            else 
            {      
            	request.setAttribute("errorMessage", "Username and/or Password is Incorrect");
            	System.out.println("Else Here");
                request.getRequestDispatcher("/"+page).include(request, response);
                response.getWriter().println("<script type='text/javascript'>$('#logIn').click();$('#logTab').click();$('#logTab').addClass('bg-info text-white');</script>");
                System.out.println("Else Here All Okayyy");
            }
    	}
    	catch(Exception e)
    	{
    		System.out.println("Connection Failed from Database");
    		e.printStackTrace();
    	}
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	doPost(request, response);
    }
}