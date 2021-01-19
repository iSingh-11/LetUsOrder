package Categories;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DatabaseConnectivity.Database;
@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
    public AddToCart() 
    {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html;charset=UTF-8");
		
		String page = request.getParameter("page");
		String productImg = request.getParameter("productImg");
		String productName = request.getParameter("productName").trim();
		String productPrice = request.getParameter("productPrice");
    	String productType = request.getParameter("productType");
    	String quantity = request.getParameter("quantity");
    	
    	Database d=new Database();
    	boolean checknew=d.addToCart((String)request.getSession(true).getAttribute("activeEmail"),productImg,productName,productType,productPrice,quantity);
    	
    	if(checknew==true) request.getSession(true).setAttribute("cartQuantity",(int)request.getSession(true).getAttribute("cartQuantity")+1);
    	
    	String subTotal=d.getCartSubtotal((String)request.getSession(true).getAttribute("activeEmail"));
    	
    	request.getRequestDispatcher("/"+page+".jsp").include(request, response);
        response.getWriter().println("<script type='text/javascript'>$('.titleImg img').attr('src','"+productImg+"');$('.title h6').text('"+productName+" has been added to your Cart.');$('.title #s1').text('Price : ₹"+productPrice+"');$('.title #s2').text('Quantity : "+quantity+"');$('.title p').text('Your Cart Subtotal : ₹"+subTotal+"');$('#itemConfirmation').modal('show');</script>");    	
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request, response);
	}
}