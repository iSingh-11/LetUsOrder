package Categories;
import java.io.IOException;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DatabaseConnectivity.Database;
import OTPGeneration.Email;
@WebServlet("/PlaceOrder")
public class PlaceOrder extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
    public PlaceOrder() 
    {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html;charset=UTF-8");
		response.sendRedirect("/LetUsOrder/Thankyou");
		String payment=request.getParameter("pay");
		double total=Double.parseDouble((String)request.getSession(true).getAttribute("total"));
		double subtotal=Double.parseDouble((String)request.getSession(true).getAttribute("subtotal"));
		double taxes=Double.parseDouble((String)request.getSession(true).getAttribute("taxes"));
		double shipping=Double.parseDouble((String)request.getSession(true).getAttribute("shipping"));
		String username=(String)request.getSession(true).getAttribute("activeEmail");
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");  
	    LocalDateTime now = LocalDateTime.now(); 
		String date=dtf.format(now);
		
		Database d=new Database();
		int i=0,count=d.getCartQuantity(username),ordernum=d.getNewOrderNumber();
		while(i<count)
		{
			String product=(String)request.getSession(true).getAttribute("item"+i);
			int qty=Integer.parseInt((String)request.getSession(true).getAttribute("qty"+i));
			String soldby=(String)request.getSession(true).getAttribute("shop"+i);
			int itemtotal=(Integer)request.getSession(true).getAttribute("itemtotal"+i);
			String type=(String)request.getSession(true).getAttribute("type"+i);
			
			String OrderID="LUO_#"+ordernum;
			double price=itemtotal+itemtotal*0.02+shipping/count;
			d.placeOrder(OrderID,soldby,username,product,type,qty,price,payment,date);
			
			request.getSession(true).removeAttribute("item"+i);
			request.getSession(true).removeAttribute("qty"+i);
			request.getSession(true).removeAttribute("shop"+i);
			request.getSession(true).removeAttribute("itemtotal"+i);
			request.getSession(true).removeAttribute("type"+i);
			d.doCartChanges(username,product,"*");
			ordernum++;
			i++;
		}
		request.getSession(true).removeAttribute("total");
		request.getSession(true).removeAttribute("subtotal");
		request.getSession(true).removeAttribute("taxes");
		request.getSession(true).removeAttribute("shipping");
		request.getSession(true).setAttribute("cartQuantity",0);
		
		Email em=new Email();
		String message="Hello "+d.getName(username)+", Thank You for ordering with LetUsOrder :)\nYour Order Total is Rs. "+total+" ( "+subtotal+" + "+taxes+" + "+shipping+" ) including taxes and shipping charges respectively. You can check for individual product details inside Orders Section of your LetUsOrder Account.\n\nYour orders will reach you soon meanwhile you can contact Shop Owner for custom instructions if any.\n\nHave a Good Day :)\n\nRegards,\nTeam LetUsOrder";
		em.sendOrderDetails(message, username);
		request.getSession(true).setAttribute("orderPlaced",true);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request, response);
	}
}