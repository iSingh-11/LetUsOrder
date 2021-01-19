<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
	// Check if this is new comer on your Webpage.
   if(session.isNew())
   {
      System.out.println("new");
      out.println("<script type='text/javascript'>window.location.href ='/LetUsOrder/Home';</script>");
   }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="https://thumbs.dreamstime.com/b/online-order-online-order-icon-146783797.jpg" />
    <title>Thank you for ordering</title>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
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
  		background-color:rgb(220,220,220);
 		background-size:cover;
  		background-position:center;
  		background-repeat:no-repeat;
  		height:100%;

  		webkit-filter: blur(5px);
  		-moz-filter: blur(5px);
  		-o-filter: blur(5px);
  		-ms-filter: blur(5px);
  		filter: blur(5px);
	}
    </style>
    <script>
        $(document).ready(function()
		{
			$("#logIn").click(function()
            {
                $("#logTab").click();
            });
            $("#logTab").click(function()
            {
                $("#logTab").addClass("bg-info text-white");
                $("#signTab").removeClass("bg-info text-white");
            });
            $("#signUp").click(function()
            {
                $("#signTab").click();
            });
            $("#signTab").click(function()
            {
                $("#signTab").addClass("bg-info text-white");
                $("#logTab").removeClass("bg-info text-white");
            });
            $(".navbar-nav li:last div a,.navbar-nav li:last div form").mouseenter(function()
            {
            	$(this).css("background-color","#0275d8");
            	$(this).children("button").css("background-color","#0275d8");
            });
            $(".navbar-nav li:last div a,.navbar-nav li:last div form").mouseleave(function()
            {
                $(this).css("background-color","#292b2c");
                $(this).children("button").css("background-color","#343a40");
            });
        	var i=0;
            var myVar = setInterval(function()
            { 
            	$(".progress-bar").animate({width:"+=500px"},200,function()
            	{
            		if(i==3)
            		{
            			clearInterval(myVar);
            			$("h1").text("Thank You for Ordering with LetUsOrder :)");
            			$("h4").fadeIn("slow");
            		}
            		i++;
            	});
            },500);
            //Responiveness            
            $("#username").click(function()
            {
            	$(".navbar-nav li:last div").css("margin-left",$("#username em").css("width").slice(0,-2)-65+"px");
            });
            if($(window).width()<=758)
            {
                $("#collapsibleNavbar").css({"position":"","right":"","margin-right":""});
            }
            else
            {
                $("#collapsibleNavbar").css({"position":"absolute","right":"0","margin-right":"10px"});
            }
            $(window).resize(function() 
            {
                if($(window).width()<=758)
                {
                    $("#collapsibleNavbar").css({"position":"","right":"","margin-right":""});
                }
                else
                {
                    $("#collapsibleNavbar").css({"position":"absolute","right":"0","margin-right":"10px"});
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
                <li class="nav-item my-auto">
                    <a class="nav-link" id="logIn" style="color:white;" data-toggle="modal" href="#myModal">Have an Account? Log In</a>
                </li>
                <li class="nav-item mt-2 mb-2">
                    <button id="signUp" class="btn nav-link text-white font-weight-bolder btn-secondary px-2" data-toggle="modal" data-target="#myModal">Sign Up Here</button>
                </li>
                <li class="nav-item my-auto dropdown" style="display:none;position:relative;">
                    <a class="nav-link my-auto dropdown-toggle" id="username" style="color:white;font-weight:bold;font-size:20px;" href="#" data-toggle="dropdown">
                    	<i onClick="window.location.href ='Cart';" class="fa fa-shopping-cart" style="font-size:24px"><span class="badge badge-pill badge-info" style="margin:-3px 2px 0px 0px;font-family: Arial, Helvetica, sans-serif;font-size:10px;position:absolute;">1</span></i>
                    	&nbsp;&nbsp;&nbsp;&nbsp;<em class="my-auto">Username</em>
                    	<img src="Image/test.jpg" height='30' width='30' style='border-radius:20px;object-fit:cover;'>	
                    </a>
                    <div class="dropdown-menu" style="position:absolute;background-color:#292b2c;">
        				<a class="dropdown-item text-white profile" href="Profile">&nbsp;<i class="fa fa-user-circle-o" style="font-size:24px"></i>&nbsp; View Profile</a>
        				<a class="dropdown-item text-white" href="Cart">&nbsp;<i class="fa fa-shopping-cart" style="font-size:24px"></i>&nbsp; Cart Items</a>
        				<a class="dropdown-item text-white" href="Profile#orders">&nbsp;&nbsp;<i class="fas fa-shopping-bag" style="font-size:24px"></i>&nbsp; Orders So Far</a>
        				<a class="dropdown-item text-white" href="Profile#shops">&nbsp;&nbsp;<i class="fab fa-stripe-s" style="font-size:24px"></i>&nbsp; Shops I Own</a>
        				<form class="dropdown-item d-flex justify-content-center" action="BackToHome" method="post">
        					<button class="btn btn-dark text-white signOut" style="border:none;border-radius:10px;" type="submit">
        						<i class="fa fa-sign-out" style="font-size:24px"></i> Sign Out
        					</button>
        				</form>
      				</div>
                </li>
            </ul>
        </div>
    </nav>
    <!-- The Modal -->
    <div class="modal fade" id="myModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <ul class="nav nav-tabs">
                    <li class="w-50 text-center">
                        <button data-toggle="tab" id="logTab" href="#logMenu" style="font-size:20px;font-weight:bold;" class="btn w-100">Log In</button>
                    </li>
                    <li class="w-50 text-center">
                        <button data-toggle="tab" id="signTab" href="#signMenu" style="font-size:20px;font-weight:bold;" class="btn w-100">Sign Up</button>
                    </li>
                </ul>

                <div class="tab-content">
                    <div id="logMenu" class="tab-pane fade px-3 py-2">
                        <form action="InvalidCredentials" class="was-validated" method="post">
                            <div class="form-group">
                                <label for="uname">Username:</label>
                                <input type="text" class="form-control" id="uname" placeholder="Enter your email or username" name="uname" required>
                            </div>
                            <div class="form-group">
                                <label for="pwd">Password:</label>
                                <input type="password" class="form-control" id="pwd" placeholder="Enter your password" name="pwd" required>
                            </div>
                            <span style="color: #FF0000;">${errorMessage}</span>
                            <div class="form-inline form-group">
                                <div class="form-group form-check">
                                    <label class="form-check-label">
                                        <input type="checkbox" class="form-check-input" name="seller">Remember me
                                    </label>
                                </div>
                                <a href="AccountRecovery" class="text-info mr-3" style="position:absolute;right:0;">Forgot Password?</a>
                            </div>
                            <input type="text" id="page" name="page" value="Thankyou" style="display:none;">
                            <div class="d-flex justify-content-center mt-3">
                                <button type="submit" class="btn bg-info text-white font-weight-bold" style="border-radius:10px;width:150px;">Sign In</button>
                            </div>
                        </form>
                    </div>
                    <div id="signMenu" class="tab-pane fade px-3 py-2">
                        <form action="VerifyOTP" class="was-validated" oninput='pwd2.setCustomValidity(pwd2.value != pwd1.value ? "Passwords do not match." : "")'>
                            <div class="form-group">
                                <label for="uname">Email:</label>
                                <input type="text" class="form-control" id="email" placeholder="Enter your email" name="uname" required>
                            </div>
                            <div class="form-group">
                                <label for="pwd">Password:</label>
                                <input type="password" class="form-control" id="pwd1" placeholder="Enter password" name="pwd1" required>
                            </div>
                            <div class="form-group">
                                <label for="pwd">Confirm Password:</label>
                                <input type="password" class="form-control" id="pwd2" placeholder="Enter password again" name="pwd2" required>
                            </div>
                            <div class="w-100">
                                Are you a Seller? <input type="radio" name="seller" value='no' checked>&nbsp;No&nbsp;<input type="radio" name="seller" value='yes'>&nbsp;Yes
                            </div>
                            <input type="text" id="page" name="page" value="Home" style="display:none;">
                            <div class="d-flex justify-content-center mt-3">
                                <button type="submit" class="btn bg-info text-white font-weight-bold" style="border-radius:10px;width:150px;">Sign Up</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%
	   response.setContentType("text/html;charset=UTF-8");
       try
	   {
	   if((boolean)session.getAttribute("active")==true)
	   {
		   System.out.println("true");
		   out.println("<script type='text/javascript'>$('#logIn').parent().hide();$('#signUp').parent().hide();$('#username i span').text('"+session.getAttribute("cartQuantity")+"');$('#username em').text('"+session.getAttribute("username")+"');$('#username').parent().show();</script>");
	   	   if((boolean)session.getAttribute("orderPlaced")==false)
	   	   {
	   		   out.println("<script type='text/javascript'>window.location.href ='/LetUsOrder/Home';</script>");
	   	   }
	   	   else
	   	   {
	   		   session.setAttribute("orderPlaced",false);
	   	   }
	   }
	   else if((boolean)session.getAttribute("active")==false)
	   {
		   System.out.println("false");
		   out.println("<script type='text/javascript'>$('#logIn').parent().show();$('#signUp').parent().show();$('#username').parent().hide();</script>");
		   out.println("<script type='text/javascript'>window.location.href ='/LetUsOrder/Home';</script>");
	   }
	   }
	   catch(Exception p)
	   {
		   System.out.println("new else");
		   out.println("<script type='text/javascript'>window.location.href ='/LetUsOrder/Home';</script>");
	   }
%>
	<!-- hereeeeeeeeeeeeeeee -->
	<div class="container">
		<div class="row mt-5">
			<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 text-center mt-5">
				<h1 class="mt-4">Placing Order....</h1>
				<div class="progress mt-4 mb-4">
  					<div class="progress-bar progress-bar-striped progress-bar-animated" style="width:0%"></div>
				</div>
				<h4 style="display:none;">You'll receive Order Details on your registered Email<br>
				<small>Or Check inside <a href="Profile#orders">Orders</a> Section.</small></h4>
			</div>
		</div>
	</div>
	<div class="fixed-bottom row w-100 mx-auto mt-n2 bg-dark text-white lastDiv pl-2">
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