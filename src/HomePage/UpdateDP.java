package HomePage;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import DatabaseConnectivity.Database;
@WebServlet("/UpdateDP")
@MultipartConfig
public class UpdateDP extends HttpServlet 
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
		InputStream inputStream = null;
        Part filePart = request.getPart("image");
        System.out.println(filePart.getName());
        System.out.println(filePart.getSize());
        System.out.println(filePart.getContentType());
        inputStream = filePart.getInputStream();
        Database d=new Database();
        String uname=(String)request.getSession(true).getAttribute("activeEmail");
        d.updateDP(uname,inputStream);
        d.getUserDp(uname);
        response.sendRedirect("/LetUsOrder/MyProfile.jsp");
	}
}