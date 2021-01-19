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
      System.out.println("new");
   }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="https://thumbs.dreamstime.com/b/online-order-online-order-icon-146783797.jpg" />
    <title>LetUsOrder Electronics</title>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
  		background-image: url('https://img.wallpapersafari.com/desktop/1680/1050/4/32/m2reJG.jpeg');
 		background-size:cover;
  		background-position:center;
  		background-repeat:no-repeat;
  		height:100%;

  		webkit-filter: blur(10px);
  		-moz-filter: blur(10px);
  		-o-filter: blur(10px);
  		-ms-filter: blur(10px);
  		filter: blur(10px);
	}
	.sidenav 
	{
  		padding-bottom:10px;
 		width: 33px;
  		position:absolute;
  		z-index: 1;
  		top: 0;
  		left: 0;
  		background-color: #343a40;
  		overflow-x: hidden;
  		transition: 0.5s;
  		padding-top: 10px;
  		border-radius:0px 0px 5px 5px;
	}
	.fa-rotate-45 
	{
    	-webkit-transform: rotate(45deg);
    	-moz-transform: rotate(45deg);
    	-ms-transform: rotate(45deg);
    	-o-transform: rotate(45deg);
    	transform: rotate(45deg);
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
            $(".cat").click(function()
            {
            	var p=this;
            	if($(".sidenav").css("width").slice(0,-2)-0==33)
            	{
            		$(".sidenav").animate({"width":"220px"},200,function()
            		{
            			if($(p).next().is(':visible'))
                		{
                			$(p).next().slideUp(300);
                			$(p).children("i").removeClass("fa-rotate-45");
                		}
                		else
                		{
                			$(".cat").next().slideUp(300);
                			$(p).next().slideDown(300);
                			$(".cat").children("i").removeClass("fa-rotate-45");
          				  	$(p).children("i").addClass("fa-rotate-45");
                		}
            		});
            	}
            	else
            	{
            		if($(p).next().is(':visible'))
            		{
            			$(p).next().slideUp(300);
            			$(p).children("i").removeClass("fa-rotate-45");
            		}
            		else
            		{
            			$(".cat").next().slideUp(300);
            			$(p).next().slideDown(300);
            			$(".cat").children("i").removeClass("fa-rotate-45");
      				  	$(p).children("i").addClass("fa-rotate-45");
            		}
            	}
            });
            $(".sidenav div:first").click(function()
            {
            	if($(".sidenav").css("width").slice(0,-2)-0==33)
            	{
            		$(".sidenav").animate({"width":"220px"});
            	}
            	else
            	{
            		$(".cat").next().slideUp(300);
            		$(".cat").children("i").removeClass("fa-rotate-45");
            		$(".sidenav").animate({"width":"33px"});
            	}
            });
            $(".subfilter span").click(function()
            {
            	$(".subfilter span").removeClass("badge-primary").addClass("badge-light");
            	$(this).removeClass("badge-light").addClass("badge-primary");
            	
            	var value = $(".search").val().toLowerCase();
            	var city = $("input[name='city']:checked").val().toLowerCase();
            	if($(this).text()=="All")
            	{
            		for(var j=0; j<$(".items > div.row").length; j++)
            		{
            			if($(".items > div.row:eq("+j+")").children().text().toLowerCase().indexOf(value) > -1 && $(".items > div.row:eq("+j+")").children().text().toLowerCase().indexOf(city) > -1)
            			{
            				$(".items > div.row:eq("+j+")").show(300);
            			}
            			else
            			{
            				$(".items > div.row:eq("+j+")").hide(300);
            			}
            		}
            		if($(".smarttv:visible,.laptops:visible,.lights:visible,.appliances:visible,.smartphones:visible").length==0)
            		{
            			$(".noResults").show(300);
            		}
            		else
            		{
            			$(".noResults").hide(300);
            		}
            	}
            	else if($(this).text()=="Smart TV")
            	{
            		$(".laptops,.lights,.appliances,.smartphones").hide(300);
            		for(var j=0; j<$(".smarttv").length; j++)
            		{
            			if($(".smarttv:eq("+j+")").children().text().toLowerCase().indexOf(value) > -1 && $(".smarttv:eq("+j+")").children().text().toLowerCase().indexOf(city) > -1)
            			{
            				$(".smarttv:eq("+j+")").show(300);
            			}
            			else
            			{
            				$(".smarttv:eq("+j+")").hide(300);
            			}
            		}
            		if($(".smarttv:visible").length==0)
            		{
            			$(".noResults").show(300);
            		}
            		else
            		{
            			$(".noResults").hide(300);
            		}
            	}
            	else if($(this).text()=="Laptops")
            	{
            		$(".smarttv,.lights,.appliances,.smartphones").hide(300);
            		for(var j=0; j<$(".laptops").length; j++)
            		{
            			if($(".laptops:eq("+j+")").children().text().toLowerCase().indexOf(value) > -1 && $(".laptops:eq("+j+")").children().text().toLowerCase().indexOf(city) > -1)
            			{
            				$(".laptops:eq("+j+")").show(300);
            			}
            			else
            			{
            				$(".laptops:eq("+j+")").hide(300);
            			}
            		}
            		if($(".laptops:visible").length==0)
            		{
            			$(".noResults").show(300);
            		}
            		else
            		{
            			$(".noResults").hide(300);
            		}
            	}
            	else if($(this).text()=="Lights")
            	{
            		$(".smarttv,.laptops,.appliances,.smartphones").hide(300);
            		for(var j=0; j<$(".lights").length; j++)
            		{
            			if($(".lights:eq("+j+")").children().text().toLowerCase().indexOf(value) > -1 && $(".lights:eq("+j+")").children().text().toLowerCase().indexOf(city) > -1)
            			{
            				$(".lights:eq("+j+")").show(300);
            			}
            			else
            			{
            				$(".lights:eq("+j+")").hide(300);
            			}
            		}
            		if($(".lights:visible").length==0)
            		{
            			$(".noResults").show(300);
            		}
            		else
            		{
            			$(".noResults").hide(300);
            		}
            	}
            	else if($(this).text()=="Appliances")
            	{
            		$(".smarttv,.laptops,.lights,.smartphones").hide(300);
            		for(var j=0; j<$(".appliances").length; j++)
            		{
            			if($(".appliances:eq("+j+")").children().text().toLowerCase().indexOf(value) > -1 && $(".appliances:eq("+j+")").children().text().toLowerCase().indexOf(city) > -1)
            			{
            				$(".appliances:eq("+j+")").show(300);
            			}
            			else
            			{
            				$(".appliances:eq("+j+")").hide(300);
            			}
            		}
            		if($(".appliances:visible").length==0)
            		{
            			$(".noResults").show(300);
            		}
            		else
            		{
            			$(".noResults").hide(300);
            		}
            	}
            	else if($(this).text()=="Smartphones")
            	{
            		$(".smarttv,.laptops,.lights,.appliances").hide(300);
            		for(var j=0; j<$(".smartphones").length; j++)
            		{
            			if($(".smartphones:eq("+j+")").children().text().toLowerCase().indexOf(value) > -1 && $(".smartphones:eq("+j+")").children().text().toLowerCase().indexOf(city) > -1)
            			{
            				$(".smartphones:eq("+j+")").show(300);
            			}
            			else
            			{
            				$(".smartphones:eq("+j+")").hide(300);
            			}
            		}
            		if($(".smartphones:visible").length==0)
            		{
            			$(".noResults").show(300);
            		}
            		else
            		{
            			$(".noResults").hide(300);
            		}
            	}
            });
            $(".search").on("keyup", function() 
            {
                var value = $(this).val().toLowerCase();
                var city = $("input[name='city']:checked").val().toLowerCase();
                if($(".subfilter span.badge-primary").text()=="All")
            	{
                	$(".items > div.row").not(".noResults").filter(function() 
                	{
                		$(this).toggle($(this).children().text().toLowerCase().indexOf(value) > -1 && $(this).children().text().toLowerCase().indexOf(city) > -1);
                	});
            	}
                else if($(".subfilter span.badge-primary").text()=="Smart TV")
                {
                	$(".items > div.smarttv").filter(function() 
                    {
                		$(this).toggle($(this).children().text().toLowerCase().indexOf(value) > -1 && $(this).children().text().toLowerCase().indexOf(city) > -1);
                	});
                }
                else if($(".subfilter span.badge-primary").text()=="Laptops")
                {
                	$(".items > div.laptops").filter(function() 
                    {
                		$(this).toggle($(this).children().text().toLowerCase().indexOf(value) > -1 && $(this).children().text().toLowerCase().indexOf(city) > -1);
                	});
                }
                else if($(".subfilter span.badge-primary").text()=="Lights")
                {
                	$(".items > div.lights").filter(function() 
                    {
                		$(this).toggle($(this).children().text().toLowerCase().indexOf(value) > -1 && $(this).children().text().toLowerCase().indexOf(city) > -1);
                	});
                }
                else if($(".subfilter span.badge-primary").text()=="Appliances")
                {
                	$(".items > div.appliances").filter(function() 
                    {
                		$(this).toggle($(this).children().text().toLowerCase().indexOf(value) > -1 && $(this).children().text().toLowerCase().indexOf(city) > -1);
                	});
                }
                else if($(".subfilter span.badge-primary").text()=="Smartphones")
                {
                	$(".items > div.smartphones").filter(function() 
                    {
                		$(this).toggle($(this).children().text().toLowerCase().indexOf(value) > -1 && $(this).children().text().toLowerCase().indexOf(city) > -1);
                	});
                }
                
                if($(".items > div.row:visible").not(".noResults").length==0)
                {
        			$(".noResults").show();
        		}
        		else
        		{
        			$(".noResults").hide(300);
        		}
            });
            $(".morefilter button:first").click(function()
            {
            	$(".morefilterdrop").slideToggle(150);
            	$(".morefilter").toggleClass("mb-2");
            });
            $(".morefilter button.reset").click(function()
            {
            	$(".search").val("");
            	$(".subfilter span:first").click();
            	$("input[name='city']:first").prop("checked",true);
            	$(".search").keyup();
            });
            $("input[name='city']").on("change",function()
            {
            	$(".search").keyup();
            });
            $("#cityRadio,.addToCart,.buyItem").click(function()
            {
            	if($(this).attr("data-active")=='null')
            	{
            		$("#logIn").click();
            		$("input[name='city']:first").prop("checked",true);
            	}
            });
            //Responiveness            
            $("#username").click(function()
            {
            	$(".navbar-nav li:last div").css("margin-left",$("#username em").css("width").slice(0,-2)-65+"px");
            });
            if($(window).width()<=758)
            {
                $("#collapsibleNavbar").css({"position":"","right":"","margin-right":""});
                $(".items img").css({"height":"90px","width":"90px"});
                $(".items span").css("font-size","16px");
                $(".items em").css("font-size","14px");
                $(".items p").css("font-size","12px");
                if($(window).width()>=510)
                {
                	$(".carousel-item img").css("height","230px");
                    $(".carousel").css("height","230px");
                }
                else
                {
                	$(".carousel-item img").css("height","140px");
                    $(".carousel").css("height","140px");
                }
            }
            else
            {
                $("#collapsibleNavbar").css({"position":"absolute","right":"0","margin-right":"10px"});
                $(".carousel-item img").css("height","350px");
                $(".carousel").css("height","350px");
                $(".items img").css({"height":"150px","width":"150px"});
                $(".items span").css("font-size","20px");
                $(".items em").css("font-size","17px");
                $(".items p").css("font-size","14px");
            }
            $(".sidenav").css("margin-top",$(".carousel").css("height"));
            $(window).resize(function() 
            {
                if($(window).width()<=758)
                {
                    $("#collapsibleNavbar").css({"position":"","right":"","margin-right":""});
                    $(".items img").css({"height":"90px","width":"90px"});
                    $(".items span").css("font-size","16px");
                    $(".items em").css("font-size","14px");
                    $(".items p").css("font-size","12px");
                    if($(window).width()>=510)
                    {
                    	$(".carousel-item img").css("height","230px");
                        $(".carousel").css("height","230px");
                    }
                    else
                    {
                    	$(".carousel-item img").css("height","140px");
                        $(".carousel").css("height","140px");
                    }
                }
                else
                {
                    $("#collapsibleNavbar").css({"position":"absolute","right":"0","margin-right":"10px"});
                    $(".carousel-item img").css("height","350px");
                    $(".carousel").css("height","350px");
                    $(".items img").css({"height":"150px","width":"150px"});
                    $(".items span").css("font-size","20px");
                    $(".items em").css("font-size","17px");
                    $(".items p").css("font-size","14px");
                }
                $(".sidenav").css("margin-top",$(".carousel").css("height"));
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
			LetUsOrder<span class="badge badge-pill badge-light ml-n4" style="font-size:10px;position:absolute;">Electronics</span>
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
                                        <input type="checkbox" class="form-check-input" name="me">Remember me
                                    </label>
                                </div>
                                <a href="AccountRecovery" class="text-info mr-3" style="position:absolute;right:0;">Forgot Password?</a>
                            </div>
                            <input type="text" id="page" name="page" value="Electronics" style="display:none;">
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
%>
	<div id="demo" class="carousel slide w-100 mx-auto" data-ride="carousel" style="margin-top:64px;">
    	<ul class="carousel-indicators">
      		<li data-target="#demo" data-slide-to="0"></li>
      		<li data-target="#demo" data-slide-to="1"></li>
      		<li data-target="#demo" data-slide-to="2" class="active"></li>
      		<li data-target="#demo" data-slide-to="3"></li>
      		<li data-target="#demo" data-slide-to="4"></li>
    	</ul>
    	<div class="carousel-inner">
      		<div class="carousel-item">
        		<img src="https://raw.githubusercontent.com/iSingh-11/github-git/master/Capture3.jpg" class="w-100" style="object-fit:cover;">
      		</div>
      		<div class="carousel-item">
        		<img src="https://raw.githubusercontent.com/iSingh-11/github-git/master/Capture9.jpg" class="w-100" style="object-fit:cover;">
      		</div>
      		<div class="carousel-item active">
        		<img src="https://raw.githubusercontent.com/iSingh-11/github-git/master/Capture4.jpg" class="w-100" style="object-fit:cover;">
      		</div>
      		<div class="carousel-item">
        		<img src="https://raw.githubusercontent.com/iSingh-11/github-git/master/Capture6.jpg" class="w-100" style="object-fit:cover;">
      		</div>
      		<div class="carousel-item">
        		<img src="https://raw.githubusercontent.com/iSingh-11/github-git/master/Capture4.jpg" class="w-100" style="object-fit:cover;">
      		</div>
   	 	</div>
   		<a class="carousel-control-prev" href="#demo" data-slide="prev">
      		<span class="carousel-control-prev-icon"></span>
    	</a>
    	<a class="carousel-control-next" href="#demo" data-slide="next">
      		<span class="carousel-control-next-icon"></span>
    	</a>
  	</div>
  	<div id="mySidenav" class="sidenav">
  		<div class="closebtn mx-auto px-auto" style="width:205px;height:32px !important;font-size:22px;cursor:pointer;color:white;">&nbsp;&#9776;&nbsp;&nbsp;Explore More</div>
  		<div class="cat mt-2 mx-auto" style="cursor:pointer;font-size:21px;background-color:white;width:205px;height:32px;border-radius:5px 5px 5px 5px;">
  			&nbsp;<i class="fas fa-carrot"></i>&nbsp; Groceries
  		</div>
  		<div class="down card-body mx-auto" style="display:none;font-size:18px;background-color:white;width:205px;height:220px;border-radius:0px 0px 5px 5px;">
        	<ul>
            	<li style="margin-left:-25px;margin-top:-15px;cursor:pointer;"><a href="Groceries" class='text-dark'>Beauty And Hygiene</a></li>
                <li style="margin-left:-25px;cursor:pointer;"><a href="Groceries" class='text-dark'>Fruits And Vegetables</a></li>
                <li style="margin-left:-25px;cursor:pointer;"><a href="Groceries" class='text-dark'>Masks And Gloves</a></li>
                <li style="margin-left:-25px;cursor:pointer;"><a href="Groceries" class='text-dark'>T20 SnackStore</a></li>
                <li style="margin-left:-25px;cursor:pointer;"><a href="Groceries" class='text-dark'>Cleaning And Household</a></li>
            </ul>
        </div>
  		<div class="cat mt-2 mx-auto" style="cursor:pointer;font-size:21px;background-color:white;width:205px;height:32px;border-radius:5px 5px 5px 5px;">
  			&nbsp;<i class="fas fa-tshirt"></i>&nbsp;Clothing
  		</div>
  		<div class="down card-body mx-auto" style="display:none;font-size:18px;background-color:white;width:205px;height:150px;border-radius:0px 0px 5px 5px;">
        	<ul>
            	<li style="margin-left:-25px;margin-top:-15px;cursor:pointer;"><a href="Clothing" class='text-dark'>Top Wear</a></li>
                <li style="margin-left:-25px;cursor:pointer;"><a href="Clothing" class='text-dark'>Bottom Wear</a></li>
                <li style="margin-left:-25px;cursor:pointer;"><a href="Clothing" class='text-dark'>Festive Wear</a></li>
                <li style="margin-left:-25px;cursor:pointer;"><a href="Clothing" class='text-dark'>Inner Wear</a></li>
                <li style="margin-left:-25px;cursor:pointer;"><a href="Clothing" class='text-dark'>Sleep Wear</a></li>
            </ul>
        </div>
  		<div class="cat mt-2 mx-auto" style="cursor:pointer;font-size:21px;background-color:white;width:205px;height:32px;border-radius:5px 5px 5px 5px;">
  			&nbsp;<i class="fas fa-headphones"></i>&nbsp; Gadgets
  		</div>
  		<div class="down card-body mx-auto" style="display:none;font-size:18px;background-color:white;width:205px;height:150px;border-radius:0px 0px 5px 5px;">
        	<ul>
            	<li style="margin-left:-25px;margin-top:-15px;cursor:pointer;"><a href="GadgetsAndAccessories" class='text-dark'>SmartWatches</a></li>
                <li style="margin-left:-25px;cursor:pointer;"><a href="GadgetsAndAccessories" class='text-dark'>Fitness Bands</a></li>
                <li style="margin-left:-25px;cursor:pointer;"><a href="GadgetsAndAccessories" class='text-dark'>Ear Wears</a></li>
                <li style="margin-left:-25px;cursor:pointer;"><a href="GadgetsAndAccessories" class='text-dark'>Cameras</a></li>
                <li style="margin-left:-25px;cursor:pointer;"><a href="GadgetsAndAccessories" class='text-dark'>Speakers</a></li>
            </ul>
        </div>
  		<div class="cat mt-2 mx-auto" style="cursor:pointer;font-size:21px;background-color:white;width:205px;height:32px;border-radius:5px 5px 5px 5px;">
  			&nbsp;<i class="fas fa-house-user"></i>&nbsp; Home & Decors
  		</div>
  		<div class="down card-body mx-auto" style="display:none;font-size:18px;background-color:white;width:205px;height:150px;border-radius:0px 0px 5px 5px;">
        	<ul>
            	<li style="margin-left:-25px;margin-top:-15px;cursor:pointer;"><a href="HomeAndDecors" class='text-dark'>Wall Accents</a></li>
                <li style="margin-left:-25px;cursor:pointer;"><a href="HomeAndDecors" class='text-dark'>Wall Art</a></li>
                <li style="margin-left:-25px;cursor:pointer;"><a href="HomeAndDecors" class='text-dark'>Table Decor</a></li>
                <li style="margin-left:-25px;cursor:pointer;"><a href="HomeAndDecors" class='text-dark'>Spiritual</a></li>
                <li style="margin-left:-25px;cursor:pointer;"><a href="HomeAndDecors" class='text-dark'>Home Garden</a></li>
            </ul>
        </div>
	</div>
	<div style="position:fixed;float:right;right:0;border-radius:50px !important;margin-top:100px;"><button class='btn btn-sm btn-light' onClick="$('html,body').animate({ scrollTop: 0 }, 'slow');"><i class='fas fa-long-arrow-alt-up' style='font-size:24px'></i></button></div>
	<div class="container pt-4">
        <div class="text-center col-12 col-md-12 col-xl-12 col-lg-12">
            <input class="form-control search" placeholder="🔍 Search here for Electronic Items...">
		</div>
		<div class="text-center col-12 col-md-12 col-xl-12 col-lg-12 mt-2 text-white subfilter" style="font-size:20px;">
			Look in : 
			<span class="badge badge-pill badge-primary" style="cursor:pointer;">All</span>
			<span class="badge badge-pill badge-light" style="cursor:pointer;">Smart TV</span>
			<span class="badge badge-pill badge-light" style="cursor:pointer;">Laptops</span>
			<span class="badge badge-pill badge-light" style="cursor:pointer;">Lights</span>
			<span class="badge badge-pill badge-light" style="cursor:pointer;">Appliances</span>
			<span class="badge badge-pill badge-light" style="cursor:pointer;">Smartphones</span>
		</div>
		<div class="text-center col-12 col-md-12 col-xl-12 col-lg-12 mt-2 mb-2 mx-auto text-white morefilter" style="font-size:20px;">
			<button class='btn btn-sm btn-primary' style="border-radius:7px;">&#9776; More Filters</button>
			<button class='btn btn-sm btn-danger reset' style="border-radius:7px;">Reset Search</button>
		</div>
		<div class="text-center col-12 col-md-12 col-xl-12 col-lg-12 mt-2 mx-auto text-white morefilterdrop" style="display:none;">
<%
	Database d=new Database();
	String city=d.getUserCity(session.getAttribute("activeEmail"));
	out.println("Availability : <input type='radio' name='city' value='' data-active='"+session.getAttribute("activeEmail")+"' checked> Any&nbsp;&nbsp;<input type='radio' id='cityRadio' name='city' value='"+city+"' data-active='"+session.getAttribute("activeEmail")+"'> My City");
%>	
		</div>
		<div class="row items mx-auto">
<%
	HashMap<String,ResultSet> r=d.getElectronicItems();
	for(String i:r.keySet())
	{
		if(r.get(i)!=null)
		{
			while(r.get(i).next())
			{
				out.println("<div class='row mx-auto w-100 "+i+"'>");
					out.println("<div class='col-3 col-md-2 col-xl-2 col-lg-2 bg-light mt-3 pt-3' style='border-radius:10px 0px 0px 10px;'>");
						out.println("<img class='mx-auto d-block' src='"+r.get(i).getString(1)+"'>");
					out.println("</div>");
					out.println("<div class='col-9 col-md-10 col-xl-10 col-lg-10 bg-light mt-3 pt-3' style='border-radius:0px 10px 10px 0px;'>");
						out.println("<span style='font-weight:bold;'>"+r.get(i).getString(2)+"</span><br>");
						out.println("<em style='font-weight:bold;'>Price : ₹"+r.get(i).getString(3)+"</em>");
						out.println("<p>"+r.get(i).getString(4)+"</p>");
						if((boolean)session.getAttribute("active")==false)
						out.println("<form action='ItemConfirmation' method='post' onsubmit='return false'>");
						else
						out.println("<form action='ItemConfirmation' method='post' onsubmit='return true'>");
							out.println("<input type='text' name='productImg' value='"+r.get(i).getString(1)+"' style='display:none;'>");
							out.println("<input type='text' name='productName' value='"+r.get(i).getString(2)+"' style='display:none;'>");
							out.println("<input type='text' name='productPrice' value='"+r.get(i).getString(3)+"' style='display:none;'>");
							out.println("<input type='text' name='productType' value='"+i+"' style='display:none;'>");
							out.println("<input type='text' name='page' value='Electronics' style='display:none;'>");
							out.println("<p class='mb-1' for='quantity'>Select Quantity :&nbsp;<select name='quantity' id='quantity'><option>1</option><option>2</option><option>3</option><option>4</option></select></p>");
							if(!r.get(i).getString(7).equals(""))
							{
								out.println("<button type='submit' class='addToCart btn btn-sm btn-info' style='border-radius:5px;font-weight:bold;' data-active='"+session.getAttribute("activeEmail")+"'>Add To Cart</button>");
								out.println("<button type='submit' class='buyItem btn btn-sm btn-info' style='border-radius:5px;font-weight:bold;' data-active='"+session.getAttribute("activeEmail")+"'>Buy</button>");
								out.println("<p class='mt-1'>Sold By : <a href='Shops#Electronics'>"+r.get(i).getString(7)+"</a> in "+r.get(i).getString(6)+"</p>");
							}
							else
							{
								out.println("<p class='mt-1 font-weight-bolder'><a href='#'>Product is Currently Unavailable :(</a></p>");
							}
						out.println("</form>");
					out.println("</div>");
				out.println("</div>");
			}
		}
	}
%>
			<div class='row mx-auto w-100 noResults' style="display:none;">
				<div class='col-12 col-md-12 col-xl-12 col-lg-12 bg-light mt-3 py-3 text-center' style='border-radius:10px;'>
					<h4>No Results Found :(</h4>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="itemConfirmation">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content p-2">
            	<div class="alert alert-success">
  					<strong>&#x2714; Added to Cart Successfully!</strong>
				</div>
            	<div class="row">
            		<div class='col-8 col-md-9 col-xl-9 col-lg-9 title'>
            			<h6 class="ml-2"></h6>
            			<span class="ml-2 mt-n2" id="s1" style='font-weight:normal;'>Price : ₹</span><br>
            			<span class="ml-2" id="s2" style='font-weight:normal;'>Quantity : </span>
            			<p class="ml-2">Your Cart Subtotal : ₹ ( items)</p>
            			<div class="d-flex justify-content-center mt-n2">
            				<button class='btn btn-sm btn-info' style='border-radius:5px;font-weight:bold;' onClick="window.location.href ='/LetUsOrder/Cart';">Review Items in Cart</button>&nbsp;&nbsp;
            				<button class='btn btn-sm btn-info' style='border-radius:5px;font-weight:bold;' data-dismiss="modal">Continue Shopping</button>
            			</div>
            		</div>
            		<div class='titleImg' style="position:absolute;right:0;margin-right:7px;">
            			<img src="" height="100" width="95">
            		</div>
            	</div>
            </div>
        </div>
    </div>
	<div class="row w-100 mx-auto bg-dark text-white lastDiv pl-2" style="margin-top:81px;">
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