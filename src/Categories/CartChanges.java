package Categories;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DatabaseConnectivity.Database;
@WebServlet("/CartChanges")
public class CartChanges extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
    public CartChanges() 
    {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html;charset=UTF-8");
		String name=request.getParameter("num1");
		String operand=request.getParameter("op1");
		Database d=new Database();
		d.doCartChanges((String)request.getSession(true).getAttribute("activeEmail"),name,operand);
		request.getSession(true).setAttribute("cartQuantity",d.getCartQuantity((String)request.getSession(true).getAttribute("activeEmail")));
		response.sendRedirect("/LetUsOrder/Cart");
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request, response);
	}
}