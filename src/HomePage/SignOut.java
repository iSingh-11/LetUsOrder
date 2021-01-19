package HomePage;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/SignOut")
public class SignOut extends HttpServlet 
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
		request.getSession(true).setAttribute("active",false);
    	request.getSession(true).setAttribute("username",null);
    	request.getSession(true).setAttribute("activeEmail",null);
    	request.getSession(true).setAttribute("cartQuantity",null);
    	request.getSession(true).invalidate();
		response.sendRedirect("/LetUsOrder/Home");
    }
}