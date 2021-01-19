<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DatabaseConnectivity.Database"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
	// Check if this is new comer on your Webpage.
   if(session.isNew())
   {
      session.setAttribute("active",false);
      session.setAttribute("username",null);
      session.setAttribute("activeEmail",null);
      session.setAttribute("cartQuantity",null);
      session.setAttribute("attemptsOver",0);
      System.out.println("new");
   }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="https://thumbs.dreamstime.com/b/online-order-online-order-icon-146783797.jpg" />
    <title>LetUsOrder</title>
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
            width: 0px;
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
            $("input.search").on("focus",function() 
			{
    			$(".results").fadeIn(700);
 		    });
            $("input.search").on("blur",function() 
        	{
            	$(".results").fadeOut(700);
         	});
            $("input.search").on("keyup", function() 
            {
                var value = $(this).val().toLowerCase();
                $(".results a").filter(function() {
                  $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
            $('[data-toggle="tooltip"]').tooltip({container:'body'});
            //Responiveness
            $(".results , .results a").css("width",$("input.search").css("width"));
            
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
                $(".results , .results a").css("width",$("input.search").css("width"));
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
                    	<img src='Image/test.jpg' height='30' width='30' style='border-radius:20px;object-fit:cover;'>	
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
                            <input type="text" id="page" name="page" value="Home" style="display:none;">
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
	   }
	   else if((boolean)session.getAttribute("active")==false)
	   {
		   System.out.println("false");
		   out.println("<script type='text/javascript'>$('#logIn').parent().show();$('#signUp').parent().show();$('#username').parent().hide();</script>");
	   }
	   }
	   catch(Exception p)
	   {
		   session.setAttribute("active",false);
		   session.setAttribute("username",null);
		   session.setAttribute("activeEmail",null);
		   session.setAttribute("cartQuantity",null);
		   session.setAttribute("attemptsOver",0);
		   System.out.println("new else");
	   }
%>
    <div class="container pt-5 pb-5" style="margin-top:60px;">
        <div class="text-center col-12 col-md-12 offset-md-0 col-xl-12 offset-xl-0 col-lg-12 dropdown">
            <input class="form-control search" placeholder="🔍 Search here for Categories, Subcategories or Products...">

            <div class="text-center mt-1 ml-3 bg-light results dropdown-menu" style="max-height:170px;overflow-y:auto;overflow-x:hidden;">
                <a class="dropdown-item mx-auto px-auto catg" onClick="window.location.href='Clothing';" style="font-size:16px;font-weight:bold;display:none;" onMouseOver="this.style.backgroundColor='#0275d8';this.style.color='white';" onMouseOut="this.style.backgroundColor='white';this.style.color='black';">
                    Clothing <em style='font-size:13px;font-weight:normal;'>in Categories</em>
                </a>
                <a class="dropdown-item mx-auto px-auto catg" onClick="window.location.href='Electronics';" style="font-size:16px;font-weight:bold;display:none;" onMouseOver="this.style.backgroundColor='#0275d8';this.style.color='white';" onMouseOut="this.style.backgroundColor='white';this.style.color='black';">
                    Electronics <em style='font-size:13px;font-weight:normal;'>in Categories</em>
                </a>
                <a class="dropdown-item mx-auto px-auto catg" onClick="window.location.href='Groceries';" style="font-size:16px;font-weight:bold;display:none;" onMouseOver="this.style.backgroundColor='#0275d8';this.style.color='white';" onMouseOut="this.style.backgroundColor='white';this.style.color='black';">
                    Groceries <em style='font-size:13px;font-weight:normal;'>in Categories</em>
                </a>
                <a class="dropdown-item mx-auto px-auto catg" onClick="window.location.href='GadgetsAndAccessories';" style="font-size:16px;font-weight:bold;display:none;" onMouseOver="this.style.backgroundColor='#0275d8';this.style.color='white';" onMouseOut="this.style.backgroundColor='white';this.style.color='black';">
                    Gadgets & Accessories <em style='font-size:13px;font-weight:normal;'>in Categories</em>
                </a>
                <a class="dropdown-item mx-auto px-auto catg" onClick="window.location.href='HomeAndDecors';" style="font-size:16px;font-weight:bold;display:none;" onMouseOver="this.style.backgroundColor='#0275d8';this.style.color='white';" onMouseOut="this.style.backgroundColor='white';this.style.color='black';">
                    Home & Decors <em style='font-size:13px;font-weight:normal;'>in Categories</em>
                </a>
<%
	Database d=new Database();
	HashMap<String,ResultSet> h=d.getAllCategories();
	for(String i:h.keySet())
	{
		if(h.get(i)!=null)
		{
			i=i.trim();
			String link="";
			if(i.equals("clothing")) link="Clothing";
			else if(i.equals("electronics")) link="Electronics";
			else if(i.equals("groceries")) link="Groceries";
			else if(i.equals("homeanddecors")) link="HomeAndDecors";
			else if(i.equals("gadgets")) link="GadgetsAndAccessories";
			while(h.get(i).next())
			{
				out.println("<a class='dropdown-item mx-auto px-auto catg' onClick='window.location.href=\""+link+"\";' style='font-size:16px;font-weight:bold;display:none;' onMouseOver='this.style.backgroundColor=\"#0275d8\";this.style.color=\"white\";' onMouseOut='this.style.backgroundColor=\"white\";this.style.color=\"black\";'>");
                	out.println(h.get(i).getString(1)+" <em style='font-size:13px;font-weight:normal;'>in "+link+"</em>");
            	out.println("</a>");
			}
		}
	}
	h=d.getClothing();
	for(String i:h.keySet())
	{
		if(h.get(i)!=null)
		{
			while(h.get(i).next())
			{
				out.println("<a class='dropdown-item mx-auto px-auto catg' onClick='window.location.href=\"Clothing\";' style='font-size:16px;font-weight:bold;display:none;' onMouseOver='this.style.backgroundColor=\"#0275d8\";this.style.color=\"white\";' onMouseOut='this.style.backgroundColor=\"white\";this.style.color=\"black\";'>");
                	out.println(h.get(i).getString(2)+" <em style='font-size:13px;font-weight:normal;'>in "+i+"</em>");
            	out.println("</a>");
			}
		}
	}
	h=d.getElectronicItems();
	for(String i:h.keySet())
	{
		if(h.get(i)!=null)
		{
			while(h.get(i).next())
			{
				out.println("<a class='dropdown-item mx-auto px-auto catg' onClick='window.location.href=\"Electronics\";' style='font-size:16px;font-weight:bold;display:none;' onMouseOver='this.style.backgroundColor=\"#0275d8\";this.style.color=\"white\";' onMouseOut='this.style.backgroundColor=\"white\";this.style.color=\"black\";'>");
                	out.println(h.get(i).getString(2)+" <em style='font-size:13px;font-weight:normal;'>in "+i+"</em>");
            	out.println("</a>");
			}
		}
	}
	h=d.getGroceries();
	for(String i:h.keySet())
	{
		if(h.get(i)!=null)
		{
			while(h.get(i).next())
			{
				out.println("<a class='dropdown-item mx-auto px-auto catg' onClick='window.location.href=\"Groceries\";' style='font-size:16px;font-weight:bold;display:none;' onMouseOver='this.style.backgroundColor=\"#0275d8\";this.style.color=\"white\";' onMouseOut='this.style.backgroundColor=\"white\";this.style.color=\"black\";'>");
                	out.println(h.get(i).getString(2)+" <em style='font-size:13px;font-weight:normal;'>in "+i+"</em>");
            	out.println("</a>");
			}
		}
	}
	h=d.getGadgets();
	for(String i:h.keySet())
	{
		if(h.get(i)!=null)
		{
			while(h.get(i).next())
			{
				out.println("<a class='dropdown-item mx-auto px-auto catg' onClick='window.location.href=\"GadgetsAndAccessories\";' style='font-size:16px;font-weight:bold;display:none;' onMouseOver='this.style.backgroundColor=\"#0275d8\";this.style.color=\"white\";' onMouseOut='this.style.backgroundColor=\"white\";this.style.color=\"black\";'>");
                	out.println(h.get(i).getString(2)+" <em style='font-size:13px;font-weight:normal;'>in "+i+"</em>");
            	out.println("</a>");
			}
		}
	}
	h=d.getHomeAndDecors();
	for(String i:h.keySet())
	{
		if(h.get(i)!=null)
		{
			while(h.get(i).next())
			{
				out.println("<a class='dropdown-item mx-auto px-auto catg' onClick='window.location.href=\"HomeAndDecors\";' style='font-size:16px;font-weight:bold;display:none;' onMouseOver='this.style.backgroundColor=\"#0275d8\";this.style.color=\"white\";' onMouseOut='this.style.backgroundColor=\"white\";this.style.color=\"black\";'>");
                	out.println(h.get(i).getString(2)+" <em style='font-size:13px;font-weight:normal;'>in "+i+"</em>");
            	out.println("</a>");
			}
		}
	}
%>
            </div>
        </div>
        <div class="text-center col-12 col-md-12 offset-md-0 col-xl-12 offset-xl-0 col-lg-12 pt-5" style="position:static;">
            <h1 class="font-weight-bolder">Order online with LetUsOrder</h1>
            <p style="font-size:25px;">anything, anywhere & anytime :)</p>
        </div>
        <div class="text-center row mx-auto mt-1" style="height:100px;width:290px;">
        	<div onclick="window.location='Clothing'" class="text-center" style="border-radius:0px 0px 13px 13px;width:50px;height:90px;background-image:url('https://raw.githubusercontent.com/iSingh-11/github-git/master/Shopping-Bag-brown.png-removebg-preview%20(1).png');background-position:center;background-size:cover;">
        		<i data-toggle="tooltip" title="Clothing" data-placement="top" class='fas fa-tshirt' style='margin-top:50px;font-size:24px;color:white;'></i>
        	</div>
        	<div onclick="window.location='Electronics'" class="text-center" style="border-radius:0px 0px 13px 13px;margin-left:10px;width:50px;height:90px;background-image:url('https://raw.githubusercontent.com/iSingh-11/github-git/master/Shopping-Bag-brown.png-removebg-preview%20(1).png');background-position:center;background-size:cover;">
        		<i data-toggle="tooltip" title="Electronics" data-placement="top" class='fas fa-tv' style='margin-top:50px;font-size:24px;color:white;'></i>
        	</div>
        	<div onclick="window.location='Groceries'" class="text-center" style="border-radius:0px 0px 13px 13px;margin-left:10px;width:50px;height:90px;background-image:url('https://raw.githubusercontent.com/iSingh-11/github-git/master/Shopping-Bag-brown.png-removebg-preview%20(1).png');background-position:center;background-size:cover;">
        		<i data-toggle="tooltip" title="Groceries" data-placement="top" class='fas fa-carrot' style='margin-top:50px;font-size:24px;color:white;'></i>
        	</div>
        	<div onclick="window.location='GadgetsAndAccessories'" class="text-center" style="border-radius:0px 0px 13px 13px;margin-left:10px;width:50px;height:90px;background-image:url('https://raw.githubusercontent.com/iSingh-11/github-git/master/Shopping-Bag-brown.png-removebg-preview%20(1).png');background-position:center;background-size:cover;">
        		<i data-toggle="tooltip" title="Gadgets & Accessories" data-placement="top" class='fas fa-headphones' style='margin-top:50px;font-size:24px;color:white;'></i>
        	</div>
        	<div onclick="window.location='HomeAndDecors'" class="text-center" style="border-radius:0px 0px 13px 13px;margin-left:10px;width:50px;height:90px;background-image:url('https://raw.githubusercontent.com/iSingh-11/github-git/master/Shopping-Bag-brown.png-removebg-preview%20(1).png');background-position:center;background-size:cover;">
        		<i data-toggle="tooltip" title="Home & Decors" data-placement="top" class='fas fa-house-user' style='margin-top:50px;font-size:24px;color:white;'></i>
        	</div>
        </div>
        <div class="mt-n1">
            <div class="text-center col-12 col-md-12 offset-md-0 col-xl-12 offset-xl-0 col-lg-12 pt-3" style="position:static;">
                <h4 class="w-75 mx-auto">Here's how it works<br><small>3 Steps to Follow</small></h4>
                <div class="row">
                    <div class="text-center mx-auto col-10 col-md-4 offset-md-0 col-xl-4 offset-xl-0 col-lg-4">
                        <p style="background-color:white;border-radius:10px;">
                            <img height="170" width="170" src="https://st3.depositphotos.com/4060975/12948/v/950/depositphotos_129482622-stock-illustration-shopping-and-ecommerce-colored-vector.jpg"><br>
                            Look into Categories at first</p>
                    </div>
                    <div class="text-center mx-auto col-10 col-md-4 offset-md-0 col-xl-4 offset-xl-0 col-lg-4">
                        <p style="background-color:white;border-radius:10px;">
                            <img height="170" width="170"
                                src="https://previews.123rf.com/images/artinspiring/artinspiring1608/artinspiring160800610/63533064-shopping-cart-with-two-items-isolated-shopping-icon-on-white-background-icon-for-online-shop-.jpg"><br>
                            Add Items to your Cart</p>
                    </div>
                    <div class="text-center mx-auto col-10 col-md-4 offset-md-0 col-xl-4 offset-xl-0 col-lg-4">
                        <p style="background-color:white;border-radius:10px;">
                            <img height="170" width="170" src="https://png.pngtree.com/png-vector/20190115/ourlarge/pngtree-pin-map-graphic-icon-design-template-png-image_316195.jpg"><br>
                            Find a Place to buy from</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="message">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
            	<div class="alert alert-info alert-dismissible mb-0">
    				<button type="button" class="close" data-dismiss="modal">&times;</button>
    				<span style='font-size:17px;'></span>
  				</div>
            </div>
        </div>
   	</div>
<%
	   try
	   {
	   	   if((int)session.getAttribute("attemptsOver")==0)
	   	   {
	   		   //nothing to do
	       }
	   	   else if((int)session.getAttribute("attemptsOver")==1)
	       {
	   		   out.println("<script type='text/javascript'>$('#message').modal('show');$('#message span').text('You are redirected to Homepage because your Account Recovery attempts got over.');</script>");
           	   System.out.println("Forgot Password Redirect");
	       }
	   	   else if((int)session.getAttribute("attemptsOver")==2)
	       {
	   		   out.println("<script type='text/javascript'>$('#message').modal('show');$('#message span').text('You are redirected to Homepage because your Account Verification attempts got over.');</script>");
	   		   System.out.println("Account Verification Redirect");
	       }
	   	   else
	   	   {
	   		   out.println("<script type='text/javascript'>$('#message').modal('show');$('#message span').text('Thank You for joining LetUsOrder Community! We are glad to have you here :)');</script>");
	   		   System.out.println("New Account Redirect");
	   	   }
	   	   session.setAttribute("attemptsOver",0);
	   }
	   catch(Exception p)
	   {
		   session.setAttribute("attemptsOver",0);
	   }
	   
%>
    <div class="row w-100 mx-auto mt-n2 bg-dark text-white lastDiv pl-2">
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