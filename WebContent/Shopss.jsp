<%@page import="java.util.HashSet"%>
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
      System.out.println("new");
   }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="https://thumbs.dreamstime.com/b/online-order-online-order-icon-146783797.jpg" />
    <title>LetUsOrder Shops</title>
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
  		background-image: url('https://wallpaperaccess.com/full/518331.jpg');
 		background-size:cover;
  		background-position:center;
  		background-repeat:no-repeat;
  		height:100%;

  		webkit-filter: blur(0px);
  		-moz-filter: blur(0px);
  		-o-filter: blur(0px);
  		-ms-filter: blur(0px);
  		filter: blur(0px);
	}
		.amb
        {
            -webkit-box-shadow: 0 0 5px 2px aqua;
    		-moz-box-shadow: 0 0 5px 2px aqua;
    		box-shadow: 0 0 5px 2px aqua;
    		border-radius:25px;
    		background-color:rgb(250,245,239);
        }
.button
{
	font-weight:bold;
	font-size:20px;
	font-family:Times New Roman;
	border-radius:10px;
	width:210px;
	margin-top:20px;
	margin-bottom:10px;
}
.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
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
            $(document).on('show.bs.modal', '.modal', function ()
            {
            	var zIndex = 1040 + (10 * $('.modal:visible').length);
                $(this).css('z-index', zIndex);
                setTimeout(function()
                {
                	$('.modal-backdrop').not('.modal-stack').css('z-index', zIndex - 1).addClass('modal-stack');
                },0);
            });
            $("a[href='#shopProducts']").click(function()
            {
            	var lastDiv=$(this).parent().next();
                var modal=$('#shopProducts').find(".modal-content");
                for(var i=0; i<lastDiv.children("h6").length; i++)
                {
                	modal.append("<div class='row py-2 pl-3 w-100'><div class='col-3 col-md-3 col-lg-3 col-xl-3'><img class='mx-auto d-block' src='"+lastDiv.find("img:eq("+i+")").attr("src")+"' height='100' width='100'></div><div class='col-9 col-md-9 col-lg-9 col-xl-9 w-100 bg-white productDiv'><h6>"+lastDiv.find("h6:eq("+i+")").text()+"</h6><em>Price : ₹"+lastDiv.find("em:eq("+i+")").text()+"</em><br><span class='mt-n5'>Subcategory : "+lastDiv.find("span:eq("+i+")").text()+"</span></div></div>");
                }
                modal.append("<div id='type' style='display:none;'>"+$(this).siblings("span").children("span").text()+"</div>");
                modal.append("<div style='display:none;'>"+$(this).parent().prev().children("h6").text()+"</div>");
            });
            $('#shopProducts').on('hidden.bs.modal',function ()
            {
            	$(this).find('.modal-content').empty();
            });
            //Responiveness            
            $("#username").click(function()
            {
            	$(".navbar-nav li:last div").css("margin-left",$("#username em").css("width").slice(0,-2)-65+"px");
            });
            if($(window).width()<=758)
            {
                $("#collapsibleNavbar").css({"position":"","right":"","margin-right":""});
                if($(window).width()<510)
                {
                	$(".amb").removeClass("px-5");
                }
                else
                {
                	$(".amb").addClass("px-5");
                }
                $(".lastDiv").removeClass("fixed-bottom");
            }
            else
            {
                $("#collapsibleNavbar").css({"position":"absolute","right":"0","margin-right":"10px"});
                $(".amb").addClass("px-5");
                $(".lastDiv").addClass("fixed-bottom");
            }
            $(window).resize(function() 
            {
                if($(window).width()<=758)
                {
                    $("#collapsibleNavbar").css({"position":"","right":"","margin-right":""});
                    if($(window).width()<510)
                    {
                    	$(".amb").removeClass("px-5");
                    }
                    else
                    {
                    	$(".amb").addClass("px-5");
                    }
                    $(".lastDiv").removeClass("fixed-bottom");
                }
                else
                {
                    $("#collapsibleNavbar").css({"position":"absolute","right":"0","margin-right":"10px"});
                    $(".amb").addClass("px-5");
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
			LetUsOrder<span class="badge badge-pill badge-light ml-n4" style="font-size:10px;position:absolute;">Shops</span>
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
                            <input type="text" id="page" name="page" value="Shops" style="display:none;">
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
		   System.out.println("new else");
	   }
       Database d=new Database();
       ResultSet r=d.getGroceriesShops();
%>
	<div class="container mx-auto" style="padding-top:100px;">
		<div class="row mx-auto">
			<div class='w-100'><button type="button" id='Groceries' class="button mx-auto d-block btn btn-info btn-lg" onClick="$('.amb1').slideToggle('slow');"><span>Groceries</span></button>
			</div><div class="col-12 col-md-12 col-lg-12 col-xl-12 pt-4 mx-auto mt-3 pb-3 amb amb1">
				<div class="row">
<%
	while(r!=null && r.next())
	{
		out.println("<div class='col-12 col-md-6 col-lg-4 col-xl-3 mt-3' style='cursor:pointer;'>");
			out.println("<div class='w-100 alert-primary px-2 py-1' style='border-radius:10px 10px 0px 0px;'>");
				out.println("<h6 style='font-size:17px;'>"+r.getString(1)+"</h6>");
			out.println("</div>");
			out.println("<div class='w-100 bg-white px-2 py-1 mt-n2' style='border-radius:0px 0px 10px 10px;'>");
				out.println("<span style='font-size:15px;'>Category : <span style='font-weight:bold;'>"+r.getString(5)+"</span></span>");
				out.println("<p style='font-size:15px;line-height: 1.25;'>"+r.getString(3)+", "+r.getString(2)+"<br><a href='#'>"+r.getString(4)+"</a></p>");
				out.println("<a href='#shopProducts' data-toggle='modal'>View Products</a>");
			out.println("</div>");
			out.println("<div style='display:none;'>");
    		HashSet<ResultSet> rs=d.getShopProducts(r.getString(1),r.getString(5));
    		for(ResultSet p:rs)
    		{
    			if(p!=null)
    			{
    				while(p.next())
    				{
    					out.println("<img src='"+p.getString(1)+"' height=40 width=40>");
    					out.println("<h6>"+p.getString(2)+"</h6>");
    					out.println("<em>"+p.getString(3)+"</em>");
    					out.println("<p>"+p.getString(4)+"</p>");
    					out.println("<span>"+p.getString(5)+"</span><br><br>");
    				}
    			}
    		}
    		out.println("</div>");
		out.println("</div>");
	}
%>
				</div>
			</div>
			<div class='w-100'><button type="button" id='Electronics' class="button mx-auto d-block btn btn-info btn-lg" onClick="$('.amb2').slideToggle('slow');"><span>Electronics</span></button>
			</div><div class="col-12 col-md-12 col-lg-12 col-xl-12 pt-4 mx-auto mt-3 pb-3 amb amb2">
				<div class="row">
<%
	r=d.getElectronicsShops();
	while(r!=null && r.next())
	{
		out.println("<div class='col-12 col-md-6 col-lg-4 col-xl-3 mt-3' style='cursor:pointer;'>");
			out.println("<div class='w-100 alert-primary px-2 py-1' style='border-radius:10px 10px 0px 0px;'>");
				out.println("<h6 style='font-size:17px;'>"+r.getString(1)+"</h6>");
			out.println("</div>");
			out.println("<div class='w-100 bg-white px-2 py-1 mt-n2' style='border-radius:0px 0px 10px 10px;'>");
				out.println("<span style='font-size:15px;'>Category : <span style='font-weight:bold;'>"+r.getString(5)+"</span></span>");
				out.println("<p style='font-size:15px;line-height: 1.25;'>"+r.getString(3)+", "+r.getString(2)+"<br><a href='#'>"+r.getString(4)+"</a></p>");
				out.println("<a href='#shopProducts' data-toggle='modal'>View Products</a>");
			out.println("</div>");
			out.println("<div style='display:none;'>");
    		HashSet<ResultSet> rs=d.getShopProducts(r.getString(1),r.getString(5));
    		for(ResultSet p:rs)
    		{
    			if(p!=null)
    			{
    				while(p.next())
    				{
    					out.println("<img src='"+p.getString(1)+"' height=40 width=40>");
    					out.println("<h6>"+p.getString(2)+"</h6>");
    					out.println("<em>"+p.getString(3)+"</em>");
    					out.println("<p>"+p.getString(4)+"</p>");
    					out.println("<span>"+p.getString(5)+"</span><br><br>");
    				}
    			}
    		}
    		out.println("</div>");
		out.println("</div>");
	}
%>
				</div>
			</div>
			<div class='w-100'><button type="button" id='HomeAndDecors' class="button mx-auto d-block btn btn-info btn-lg" onClick="$('.amb3').slideToggle('slow');"><span>Home & Decors</span></button>
			</div><div class="col-12 col-md-12 col-lg-12 col-xl-12 pt-4 mx-auto mt-3 pb-3 amb amb3">
				<div class="row">
<%
	r=d.getHomeDecorsShops();
	while(r!=null && r.next())
	{
		out.println("<div class='col-12 col-md-6 col-lg-4 col-xl-3 mt-3' style='cursor:pointer;'>");
			out.println("<div class='w-100 alert-primary px-2 py-1' style='border-radius:10px 10px 0px 0px;'>");
				out.println("<h6 style='font-size:17px;'>"+r.getString(1)+"</h6>");
			out.println("</div>");
			out.println("<div class='w-100 bg-white px-2 py-1 mt-n2' style='border-radius:0px 0px 10px 10px;'>");
				out.println("<span style='font-size:15px;'>Category : <span style='font-weight:bold;'>"+r.getString(5)+"</span></span>");
				out.println("<p style='font-size:15px;line-height: 1.25;'>"+r.getString(3)+", "+r.getString(2)+"<br><a href='#'>"+r.getString(4)+"</a></p>");
				out.println("<a href='#shopProducts' data-toggle='modal'>View Products</a>");
			out.println("</div>");
			out.println("<div style='display:none;'>");
    		HashSet<ResultSet> rs=d.getShopProducts(r.getString(1),r.getString(5));
    		for(ResultSet p:rs)
    		{
    			if(p!=null)
    			{
    				while(p.next())
    				{
    					out.println("<img src='"+p.getString(1)+"' height=40 width=40>");
    					out.println("<h6>"+p.getString(2)+"</h6>");
    					out.println("<em>"+p.getString(3)+"</em>");
    					out.println("<p>"+p.getString(4)+"</p>");
    					out.println("<span>"+p.getString(5)+"</span><br><br>");
    				}
    			}
    		}
    		out.println("</div>");
		out.println("</div>");
	}
%>
				</div>
			</div>
			<div class='w-100'><button type="button" id='Clothing' class="button mx-auto d-block btn btn-info btn-lg" onClick="$('.amb4').slideToggle('slow');"><span>Clothing</span></button>
			</div><div class="col-12 col-md-12 col-lg-12 col-xl-12 pt-4 mx-auto mt-3 mb-5 pb-3 amb amb4">
				<div class="row">
<%
	r=d.getClothingShops();
	while(r!=null && r.next())
	{
		out.println("<div class='col-12 col-md-6 col-lg-4 col-xl-3 mt-3' style='cursor:pointer;'>");
			out.println("<div class='w-100 alert-primary px-2 py-1' style='border-radius:10px 10px 0px 0px;'>");
				out.println("<h6 style='font-size:17px;'>"+r.getString(1)+"</h6>");
			out.println("</div>");
			out.println("<div class='w-100 bg-white px-2 py-1 mt-n2' style='border-radius:0px 0px 10px 10px;'>");
				out.println("<span style='font-size:15px;'>Category : <span style='font-weight:bold;'>"+r.getString(5)+"</span></span>");
				out.println("<p style='font-size:15px;line-height: 1.25;'>"+r.getString(3)+", "+r.getString(2)+"<br><a href='#'>"+r.getString(4)+"</a></p>");
				out.println("<a href='#shopProducts' data-toggle='modal'>View Products</a>");
			out.println("</div>");
			out.println("<div style='display:none;'>");
    		HashSet<ResultSet> rs=d.getShopProducts(r.getString(1),r.getString(5));
    		for(ResultSet p:rs)
    		{
    			if(p!=null)
    			{
    				while(p.next())
    				{
    					out.println("<img src='"+p.getString(1)+"' height=40 width=40>");
    					out.println("<h6>"+p.getString(2)+"</h6>");
    					out.println("<em>"+p.getString(3)+"</em>");
    					out.println("<p>"+p.getString(4)+"</p>");
    					out.println("<span>"+p.getString(5)+"</span><br><br>");
    				}
    			}
    		}
    		out.println("</div>");
		out.println("</div>");
	}
%>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="shopProducts">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
            </div>
        </div>
    </div>
	<div class="row w-100 mx-auto bg-dark text-white lastDiv mt-5 pl-2">
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