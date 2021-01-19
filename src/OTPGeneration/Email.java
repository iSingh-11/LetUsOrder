package OTPGeneration;
import java.util.Properties;
import java.util.Random;
import jakarta.mail.*;
import jakarta.mail.internet.*;
import javax.servlet.http.*;
import DatabaseConnectivity.Database;
import java.io.IOException;
import javax.servlet.ServletException;
public class Email extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	private static String OTP=null;
	private static String email=null;
	public void init() throws ServletException
	{
		super.init();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
		Database d=new Database();
		String page = request.getParameter("page");
		response.setContentType("text/html;charset=UTF-8");
		if((d.checkIfUserExists(request.getParameter("email")) || d.checkIfUserExists(email)) && request.getParameter("button")==null) 
		{
			System.out.println("Inside If");
			// Recipient's email ID is sent as argument.

			// Sender's email ID needs to be mentioned
			String from = "letusordercare@gmail.com";

			// SMTP Gmail Server
			String host = "smtp.gmail.com";

			// Get system properties
			Properties props = new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.setProperty("mail.smtp.host", host);
			Session session = Session.getInstance(props);
			MimeMessage msg = new MimeMessage(session);
	   
			// Using random method
			String numbers = "0123456789";     
			Random rndm_method = new Random(); 
			char[] otp = new char[6]; 
			for(int i = 0; i < 6; i++) 
			{ 
				// Use of charAt() method : to get character value 
				// Use of nextInt() as it is scanning the value as int 
				otp[i] = numbers.charAt(rndm_method.nextInt(numbers.length())); 
			} 
			
			// set the message content here
			try 
			{
				OTP=new String(otp);
				if(request.getParameter("email")!=null)
				{
					msg.addRecipient(Message.RecipientType.TO, new InternetAddress(request.getParameter("email")));
				}
				else
				{
					msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
				}
				msg.setText("Hello, your LetUsOrder Verification OTP is "+OTP);
				Transport.send(msg, from, "LetUsOrder@4");
				System.out.println("Sent message successfully....");
				request.getSession(true).setAttribute("OTPSent",true);
				request.getSession(true).setAttribute("OTPVerified",false);
				Integer a=(Integer)request.getSession(true).getAttribute("attempts");
				if(a==null) a=3;
				request.getSession(true).setAttribute("attempts",a);
				if(request.getParameter("email")!=null) email=request.getParameter("email");
				request.getRequestDispatcher("/"+page+".jsp").include(request, response);
				if(page.equals("ForgotPassword"))
				{
					response.getWriter().println("<script type='text/javascript'>$('.container div h3').addClass('mt-n2');$('form[action=\"VerifyOTP\"]').hide();$('.checkOTP form').show();$('.checkOTP').slideDown('slow');</script>");
				}
				else
				{
					
				}
			}
			catch (MessagingException e)
			{
				e.printStackTrace();
			}
		}
		else if(request.getParameter("button")==null)
		{
			System.out.println("Inside Else If button==null");
			if(page.equals("ForgotPassword"))
			{
				System.out.println("Inside Else If button==null and Page==ForgotPassword");
				request.getRequestDispatcher("/"+page+".jsp").include(request, response);
				response.getWriter().println("<script type='text/javascript'>$('#email').val('');$('form[action=\"VerifyOTP\"]').hide();$('.createAccount').slideDown('slow');</script>");
			}
			else
			{
				System.out.println("Inside Else If button==null and else");
				if(page.equals("Home") && d.checkIfUserExists(request.getParameter("uname")))
				{
					System.out.println("Inside Else If button==null and else if Page==Home");
					request.getRequestDispatcher("/"+page).include(request, response);
	                response.getWriter().println("<script type='text/javascript'>$('#message').modal('show');$('#message span').html('Username/Email you entered already has an account associated with it. If you dont remember the password, try to reset it from <a href=\"AccountRecovery\">Account Recovery Section</a>.');</script>");
	            }
				else
				{
					System.out.println("Inside Else If button==null and else else");
					if(page.equals("Home"))
					{
						System.out.println("Inside Else If button==null and else else if Page==Home");
						request.getSession(true).setAttribute("newEmail",request.getParameter("uname"));
						request.getSession(true).setAttribute("newPwd",request.getParameter("pwd1"));
						request.getSession(true).setAttribute("newSeller",request.getParameter("seller"));
					}
					// Recipient's email ID is sent as argument.

					// Sender's email ID needs to be mentioned
					String from = "letusordercare@gmail.com";

					// SMTP Gmail Server
					String host = "smtp.gmail.com";

					// Get system properties
					Properties props = new Properties();
					props.put("mail.smtp.starttls.enable", "true");
					props.setProperty("mail.smtp.host", host);
					Session session = Session.getInstance(props);
					MimeMessage msg = new MimeMessage(session);
		   
					// Using random method
					String numbers = "0123456789";     
					Random rndm_method = new Random(); 
					char[] otp = new char[6]; 
					for(int i = 0; i < 6; i++) 
					{ 
						// Use of charAt() method : to get character value 
						// Use of nextInt() as it is scanning the value as int 
						otp[i] = numbers.charAt(rndm_method.nextInt(numbers.length())); 
					} 
				
					// set the message content here
					try 
					{
						OTP=new String(otp);
						if(request.getParameter("uname")!=null)
						{
							msg.addRecipient(Message.RecipientType.TO, new InternetAddress(request.getParameter("uname")));
						}
						else
						{
							msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
						}
						msg.setText("Hello, your LetUsOrder Verification OTP is "+OTP);
						Transport.send(msg, from, "LetUsOrder@4");
						System.out.println("Sent message successfully....");
						request.getSession(true).setAttribute("OTPSent",true);
						request.getSession(true).setAttribute("OTPVerified",false);
						Integer a=(Integer)request.getSession(true).getAttribute("attempts");
						if(a==null) a=3;
						request.getSession(true).setAttribute("attempts",a);
						if(request.getParameter("uname")!=null) email=request.getParameter("uname");
						response.sendRedirect("/LetUsOrder/AccountVerification");
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
				}
			}
		}
		else
		{
			System.out.println("Inside Else");
			String btn=request.getParameter("button");
			if(page.equals("ForgotPassword") && btn.equals("Verify OTP"))
			{
				if(OTP.equals(request.getParameter("codeBox1")+request.getParameter("codeBox2")+request.getParameter("codeBox3")+request.getParameter("codeBox4")+request.getParameter("codeBox5")+request.getParameter("codeBox6")))
				{
					System.out.println("OTP has been Verified Successfully....");
					request.getSession(true).setAttribute("OTPSent",false);
					request.getSession(true).setAttribute("attempts",3);
					request.getSession(true).setAttribute("OTPVerified",true);
					request.getRequestDispatcher("/"+page+".jsp").include(request, response);
					response.getWriter().println("<script type='text/javascript'>$('form[action=\"VerifyOTP\"]').hide();$('.checkOTP').hide();$('.updatePassword form').show();$('.updatePassword').slideDown('slow');</script>");
				}
				else
				{
					System.out.println("OTP Verification Failed :(");
					request.setAttribute("errorMessage", "Incorrect OTP! Try Again");
					
					// Sender's email ID needs to be mentioned
					String from = "letusordercare@gmail.com";

					// SMTP Gmail Server
					String host = "smtp.gmail.com";

					// Get system properties
					Properties props = new Properties();
					props.put("mail.smtp.starttls.enable", "true");
					props.setProperty("mail.smtp.host", host);
					Session session = Session.getInstance(props);
					MimeMessage msg = new MimeMessage(session);
			   
					// Using random method
					String numbers = "0123456789";     
					Random rndm_method = new Random(); 
					char[] otp = new char[6]; 
					for(int i = 0; i < 6; i++) 
					{ 
						// Use of charAt() method : to get character value 
						// Use of nextInt() as it is scanning the value as int 
						otp[i] = numbers.charAt(rndm_method.nextInt(numbers.length())); 
					} 
					
					// set the message content here
					try 
					{
						OTP=new String(otp);
						msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
						msg.setText("Hello, your LetUsOrder Verification OTP is "+OTP);
						Transport.send(msg, from, "LetUsOrder@4");
						System.out.println("Sent message successfully....");
						request.getSession(true).setAttribute("OTPSent",true);
						request.getSession(true).setAttribute("OTPVerified",false);
						Integer a=(Integer)request.getSession(true).getAttribute("attempts");
						if(a==null) a=3;
						request.getSession(true).setAttribute("attempts",a);
						request.getRequestDispatcher("/"+page+".jsp").include(request, response);
						response.getWriter().println("<script type='text/javascript'>$('.container div h3').addClass('mt-n2');$('form[action=\"VerifyOTP\"]').hide();$('.checkOTP form').show();$('.checkOTP').slideDown('slow');</script>");	
					}
					catch(Exception p)
					{
						p.printStackTrace();
					}
				}
			}
			else if(page.equals("ForgotPassword") && btn.equals("Update Password"))
			{
				System.out.println("Update Password");
				if((boolean)request.getSession(true).getAttribute("OTPVerified"))
				{
					request.getSession(true).setAttribute("OTPSent",false);
					request.getSession(true).setAttribute("attempts",3);
					request.getSession(true).setAttribute("OTPVerified",false);
					d.updatePassword(email,request.getParameter("password"));
					System.out.println("Password Updated Successfully");
					request.getRequestDispatcher("/Home").include(request, response);
					response.getWriter().println("<script type='text/javascript'>$('#message').modal('show');$('#message span').text('Your Password has been updated Successfully!');</script>");            
				}
				else
				{
					response.sendRedirect("/LetUsOrder/Home");
				}
			}
			else if(page.equals("SignUpVerification") && btn.equals("Verify OTP"))
			{
				if(OTP.equals(request.getParameter("codeBox1")+request.getParameter("codeBox2")+request.getParameter("codeBox3")+request.getParameter("codeBox4")+request.getParameter("codeBox5")+request.getParameter("codeBox6")))
				{
					System.out.println("OTP has been Verified Successfully....");
					request.getSession(true).setAttribute("OTPSent",false);
					request.getSession(true).setAttribute("attempts",3);
					request.getSession(true).setAttribute("OTPVerified",true);
					response.sendRedirect("/LetUsOrder/AccountCompletion");
				}
				else
				{
					System.out.println("OTP Verification Failed :(");
					request.setAttribute("errorMessage", "Incorrect OTP! Try Again");
					
					// Sender's email ID needs to be mentioned
					String from = "letusordercare@gmail.com";

					// SMTP Gmail Server
					String host = "smtp.gmail.com";

					// Get system properties
					Properties props = new Properties();
					props.put("mail.smtp.starttls.enable", "true");
					props.setProperty("mail.smtp.host", host);
					Session session = Session.getInstance(props);
					MimeMessage msg = new MimeMessage(session);
			   
					// Using random method
					String numbers = "0123456789";     
					Random rndm_method = new Random(); 
					char[] otp = new char[6]; 
					for(int i = 0; i < 6; i++) 
					{ 
						// Use of charAt() method : to get character value 
						// Use of nextInt() as it is scanning the value as int 
						otp[i] = numbers.charAt(rndm_method.nextInt(numbers.length())); 
					} 
					
					// set the message content here
					try 
					{
						OTP=new String(otp);
						msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
						msg.setText("Hello, your LetUsOrder Verification OTP is "+OTP);
						Transport.send(msg, from, "LetUsOrder@4");
						System.out.println("Sent message successfully....");
						request.getSession(true).setAttribute("OTPSent",true);
						request.getSession(true).setAttribute("OTPVerified",false);
						Integer a=(Integer)request.getSession(true).getAttribute("attempts");
						if(a==null) a=3;
						request.getSession(true).setAttribute("attempts",a);
						request.getRequestDispatcher("/"+page+".jsp").include(request, response);
					}
					catch(Exception p)
					{
						p.printStackTrace();
					}
				}
			}
		}
   }
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
   {
	   doPost(request,response);
   }
   public void sendOrderDetails(String message,String username)
   {
	    // Recipient's email ID is sent as argument.

	    // Sender's email ID needs to be mentioned
	    String from = "letusordercare@gmail.com";

	    // SMTP Gmail Server
	    String host = "smtp.gmail.com";

	    // Get system properties
	    Properties props = new Properties();
	    props.put("mail.smtp.starttls.enable", "true");
		props.setProperty("mail.smtp.host", host);
		Session session = Session.getInstance(props);
		MimeMessage msg = new MimeMessage(session);
		   
		// set the message content here
		try 
		{
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(username));
			msg.setText(message);
			Transport.send(msg, from, "LetUsOrder@4");
			System.out.println("Sent message successfully....");
		}
		catch (MessagingException e)
		{
			e.printStackTrace();
		}
   }
}