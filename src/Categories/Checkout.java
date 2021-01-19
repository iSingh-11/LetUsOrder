package Categories;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DatabaseConnectivity.Database;
@WebServlet("/CheckOut")
public class Checkout extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
    public Checkout() 
    {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html;charset=UTF-8");
		Database d=new Database();
		int i=0,count=d.getCartQuantity((String)request.getSession(true).getAttribute("activeEmail"));
		while(i<count)
		{
			String item=request.getParameter("item"+i);
			String qty=request.getParameter("qty"+i);
			String type=request.getParameter("type"+i);
			request.getSession(true).setAttribute("item"+i,item);
			request.getSession(true).setAttribute("qty"+i,qty);
			request.getSession(true).setAttribute("type"+i,type);
			System.out.println(request.getSession(true).getAttribute("item"+i)+" "+request.getSession(true).getAttribute("qty"+i)+" "+request.getSession(true).getAttribute("shop"+i)+" "+request.getSession(true).getAttribute("itemtotal"+i)+" "+request.getSession(true).getAttribute("type"+i));
			i++;
		}
		String total=request.getParameter("total");
		String subtotal=request.getParameter("subtotal");
		String taxes=request.getParameter("taxes");
		String shipping=request.getParameter("shipping");
		request.getSession(true).setAttribute("total",total);
		request.getSession(true).setAttribute("subtotal",subtotal);
		request.getSession(true).setAttribute("taxes",taxes);
		request.getSession(true).setAttribute("shipping",shipping);
		System.out.println(request.getSession(true).getAttribute("total")+" "+request.getSession(true).getAttribute("subtotal")+" "+request.getSession(true).getAttribute("taxes")+" "+request.getSession(true).getAttribute("shipping"));
		response.sendRedirect("/LetUsOrder/Cart");
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request, response);
	}
}