<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="https://thumbs.dreamstime.com/b/online-order-online-order-icon-146783797.jpg" />
    <title>LetUsOrder Account Recovery</title>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        /* width */
        ::-webkit-scrollbar {
            width: 10px;
        }
        /* Track */
        ::-webkit-scrollbar-track {
            background: #333;
        }

        /* Handle */
        ::-webkit-scrollbar-thumb {
            background: #555;
        }

        /* Handle on hover */
        ::-webkit-scrollbar-thumb:hover {
            background: #777;
        }
        #Home 
        {
  		/* this is needed or the background will be offset by a few pixels at the top */
  			overflow: auto;
  			position: relative;
		}
	#Home:before 
	{
 		content: "";
  		position: fixed;
  		left: 0;
  		right: 0;
  		z-index: -1;

  		display: block;
  		background-image: url('https://image.freepik.com/free-vector/safe-food-delivery-keeping-distance_23-2148550117.jpg');
 		background-size:cover;
  		background-position:center;
  		background-repeat:no-repeat;
  		height:100%;

  		webkit-filter: blur(15px);
  		-moz-filter: blur(15px);
  		-o-filter: blur(15px);
  		-ms-filter: blur(15px);
  		filter: blur(15px);
	}
		input[type=number]::-webkit-inner-spin-button, 
		input[type=number]::-webkit-outer-spin-button 
		{ 
    		-webkit-appearance: none;
    		-moz-appearance: none;
    		appearance: none;
    		margin: 0; 
		}
		#codeBox1,
		#codeBox2,
		#codeBox3,
		#codeBox4,
		#codeBox5,
		#codeBox6 
		{
			height: 45px;
			width: 45px;
			font-size: 25px;
			text-align: center;
			border: 1px solid #000000;
		}
    </style>
    <script>
        $(document).ready(function()
		{
            //Responiveness
            if($(window).width()<=758)
            {
                $("#collapsibleNavbar").css({"position":"","right":"","margin-right":""});
                $(".lastDiv").removeClass("fixed-bottom");
            }
            else
            {
                $("#collapsibleNavbar").css({"position":"absolute","right":"0","margin-right":"10px"});
                $(".lastDiv").addClass("fixed-bottom");
            }
            $(window).resize(function() 
            {
                if($(window).width()<=758)
                {
                    $("#collapsibleNavbar").css({"position":"","right":"","margin-right":""});
                    $(".lastDiv").removeClass("fixed-bottom");
                }
                else
                {
                    $("#collapsibleNavbar").css({"position":"absolute","right":"0","margin-right":"10px"});
                    $(".lastDiv").addClass("fixed-bottom");
                }
            });
            //Ends Here
        });
    </script>
</head>

<body id="Home">
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark py-0">
        <a class="navbar-brand my-auto" href="Home">
            <img src="https://thumbs.dreamstime.com/b/online-order-online-order-icon-146783797.jpg" height="30" width="30" class="my-auto">
        </a>
        <a class="navbar-text text-white w-auto font-weight-bolder" href="Home" style="position:static;font-size:32px;text-decoration:none;">
			LetUsOrder
		</a>
		
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav">
                <li class="nav-item my-auto">
                    <a class="nav-link text-info" href="FAQs.html">Get Help/FAQs</a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="container" style="padding-top:270px;">
        <div class="mx-auto py-4 px-3 text-center col-12 col-md-8 col-xl-6 col-lg-7 bg-light" style="border:0.15rem solid #fca118;border-radius:20px;background-color:rgb(250,245,239);">
        	<h3 class="mx-n4" style="font-size:28px;font-weight:bold;">Account Recovery</h3>
        	<form action="VerifyOTP" class="was-validated mt-3" method="post" style="display:non;">
            	<div class="form-group">
                	<label for="uname">A verification code will be sent if your email is registered with us:</label>
                    <input type="text" class="form-control mt-1" id="email" placeholder="Enter your email" name="email" required>
                </div>
                <input type="text" id="page" name="page" value="ForgotPassword" style="display:none;">
                <div class="d-flex justify-content-center mt-3">
                	<button type="submit" class="btn bg-secondary text-light font-weight-bold" style="font-size:17px;border-radius:10px;width:170px;">Generate OTP</button>
                </div>
        	</form>
        	<div class="mt-3 createAccount" style="display:none;">
        		Sorry, the email you entered has no account associated with it. Click on the button to create a new account.
        		<form action="createAccount" class="d-flex justify-content-center mt-3" method="post">
        			<input type="text" id="page" name="page" value="ForgotPassword" style="display:none;">
                	<button type="submit" class="btn bg-secondary text-light font-weight-bold" style="font-size:17px;border-radius:10px;width:170px;">Sign Up Here</button>
                </form>
        	</div>
        	<div class="mt-3 checkOTP" style="display:none;">
        		A verification code has been sent to your registered email.<br>
        		<form action="VerifyOTP" method="post">
        			<input type="text" id="page" name="page" value="ForgotPassword" style="display:none;">
        			<button type="submit" class="btn btn-info btn-sm" style="border-radius:10px;">Resend OTP</button>
        			<span>(2 attempts remaining)</span>
        		</form>
        		<form action="VerifyOTP" method="post">
        			<div class="d-flex justify-content-center mt-3">
        				<input type="number" id="codeBox1" name="codeBox1" maxlength="1" onkeyup="onKeyUpEvent(1, event)" onfocus="onFocusEvent(1)" class="mr-1"/>
						<input type="number" id="codeBox2" name="codeBox2" maxlength="1" onkeyup="onKeyUpEvent(2, event)" onfocus="onFocusEvent(2)" class="mr-1"/>
						<input type="number" id="codeBox3" name="codeBox3" maxlength="1" onkeyup="onKeyUpEvent(3, event)" onfocus="onFocusEvent(3)" class="mr-1"/>
						<input type="number" id="codeBox4" name="codeBox4" maxlength="1" onkeyup="onKeyUpEvent(4, event)" onfocus="onFocusEvent(4)" class="mr-1"/>
						<input type="number" id="codeBox5" name="codeBox5" maxlength="1" onkeyup="onKeyUpEvent(5, event)" onfocus="onFocusEvent(5)" class="mr-1"/>
						<input type="number" id="codeBox6" name="codeBox6" maxlength="1" onkeyup="onKeyUpEvent(6, event)" onfocus="onFocusEvent(6)" />
					</div>
        			<input type="text" id="page" name="page" value="ForgotPassword" style="display:none;">
        			<input type="text" id="button" name="button" value="Verify OTP" style="display:none;">
                	<div class="d-flex justify-content-center mt-3">
                		<button type="submit" class="btn bg-secondary text-light font-weight-bold" style="font-size:17px;border-radius:10px;width:170px;">Verify OTP</button>
                	</div>
                	<span style="color: #FF0000;">${errorMessage}</span>
                </form>
                <script>
					function getCodeBoxElement(index) 
      				{
        				return document.getElementById('codeBox' + index);
      				}
     				function onKeyUpEvent(index, event) 
     				{
        				const eventCode = event.which || event.keyCode;
        				if (getCodeBoxElement(index).value.length === 1) 
        				{
          					if (index !== 6) 
          					{
            					getCodeBoxElement(index+ 1).focus();
          					} 
          					else 
          					{
            					getCodeBoxElement(index).blur();
            				}
        				}
        				if (eventCode === 8 && index !== 1) 
        				{
         					getCodeBoxElement(index - 1).focus();
       		 			}
     			 	}
      				function onFocusEvent(index) 
      				{
       					for (item = 1; item < index; item++) 
       					{
          					const currentElement = getCodeBoxElement(item);
          					if (!currentElement.value) 
          					{
              					currentElement.focus();
              					break;
          					}
        				}
     			 	}
				</script>
        	</div>
<%
	response.setContentType("text/html;charset=UTF-8");
	try
	{
		if((boolean)session.getAttribute("OTPSent")==true)
		{
			System.out.println("Yes OTP has been sent");
			int a=(int)session.getAttribute("attempts");
			a=a-1;
			if(a>=0)
			{
				if(a>0)
				{
					out.println("<script type='text/javascript'>$('.checkOTP form:first span:first').text('("+a+" attempts remaining)');</script>");
				}
				else
				{
					out.println("<script type='text/javascript'>$('.checkOTP form:first button').hide();$('.checkOTP form:first span:first').text('No More Attempts Remaining');</script>");
				}
				session.setAttribute("attempts",a);
			}
			else
			{
				session.setAttribute("OTPSent",false);
				session.setAttribute("attempts",3);
				session.setAttribute("OTPVerified",false);
				System.out.println("Attemps over, redirecting to home page");
				request.getSession(true).setAttribute("attemptsOver",1);
				out.println("<script type='text/javascript'>window.location.href ='/LetUsOrder/Home';</script>");
			}
		}
	}
	catch(Exception e)
	{
		session.setAttribute("OTPSent",false);
		session.setAttribute("attempts",3);
		session.setAttribute("OTPVerified",false);
		System.out.println("No OTP sent yet");
	}
%>
        	<div class="mt-2 updatePassword" style="display:none;">
        		<span class="mx-n1">OTP has been Verified Successfully!</span>
        		<form action="VerifyOTP" class="justify-content-center mt-2 was-validated" method="post" oninput='cpassword.setCustomValidity(cpassword.value != password.value ? "Passwords do not match." : "")'>
        		    <input type="password" class="form-control" id="password" placeholder="Enter new password" name="password" required>
                    <input type="password" class="form-control mt-2" id="cpassword" placeholder="Enter new password again" name="cpassword" required>
        			<input type="text" id="page" name="page" value="ForgotPassword" style="display:none;">
                	<input type="text" id="button" name="button" value="Update Password" style="display:none;">
                	<button type="submit" class="mt-3 btn bg-secondary text-light font-weight-bold" style="font-size:17px;border-radius:10px;width:170px;">Update Password</button>
                </form>
        	</div>
    	</div> 
   </div>
	<div class="row w-100 mx-auto bg-dark text-white lastDiv pl-2" style="margin-top:205px;">
        Copyright © 2020 LetUsOrder. All rights reserved.&nbsp;
        <div style="width:230px;">Connect with us :
            <a href="https://www.facebook.com/LetUs0rder" target="_blank" style="color:white;" onMouseOut="this.style.color='white';" onMouseOver="this.style.color='gray';">
                <i class="fa fa-facebook-f"></i>
            </a>&nbsp;
            <a href="https://www.instagram.com/LetUsOrder" target="_blank" style="color:white;" onMouseOut="this.style.color='white';" onMouseOver="this.style.color='gray';">
                <i class="fa fa-instagram"></i>
            </a>&nbsp;
            <a href="https://www.twitter.com/LetUsOrder" target="_blank" style="color:white;" onMouseOut="this.style.color='white';" onMouseOver="this.style.color='gray';">
                <i class="fa fa-twitter"></i>
            </a>&nbsp;
            <a href="customer@letusorder.com" target="_blank" style="color:white;" onMouseOut="this.style.color='white';" onMouseOver="this.style.color='gray';">
                <i class="fa fa-envelope"></i>
            </a>
        </div>
    </div>
    </body>
</html>