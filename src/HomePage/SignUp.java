package HomePage;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/SignUp")
public class SignUp extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	public void init() throws ServletException
	{
		super.init();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html;charset=UTF-8");
		request.getRequestDispatcher("/Home").include(request, response);
        response.getWriter().println("<script type='text/javascript'>$('#signUp').click();$('#signTab').click();$('#signTab').addClass('bg-info text-white');</script>");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}
}