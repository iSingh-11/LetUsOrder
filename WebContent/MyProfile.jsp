<%@page import="java.util.HashMap"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DatabaseConnectivity.Database"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
	// Check if this is new comer on your Webpage.
   if(session.isNew())
   {
	   out.println("<script type='text/javascript'>window.location.href ='/LetUsOrder/Home';</script>");
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
  		background-image: url('https://www.wallpapertip.com/wmimgs/28-285015_wallpaper-for-profile-pic.jpg');
 		background-size:cover;
  		background-position:center;
  		background-repeat:no-repeat;
  		height:100%;

  		webkit-filter: blur(px);
  		-moz-filter: blur(px);
  		-o-filter: blur(px);
  		-ms-filter: blur(px);
  		filter: blur(px);
	}
		.amb
        {
            -webkit-box-shadow: 0 0 5px 2px aqua;
    		-moz-box-shadow: 0 0 5px 2px aqua;
    		box-shadow: 0 0 5px 2px aqua;
    		border-radius:25px;
    		background-color:rgb(245,245,245);
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
            $("label[for='file']").mouseover(function()
           	{
            	$(this).css("color","white");
           	});
            $("label[for='file']").mouseout(function()
            {
            	$(this).css("color","lightgrey");
            });
            $(".edit").click(function()
            {
            	$(this).slideUp(300,function()
            	{
            		$(".save").slideDown(300);
            		$("form[action='updateInfo']").find("input").attr("disabled",false);
            		$("form[action='updateInfo']").find("input:first").focus();
            	});
            });
            $(".shopDiv .close").click(function()
            {
            	$("input[name='shopName']").val($(this).siblings("div.name").children("h6").text());
            	$("input[name='shopType']").val($(this).siblings("div.info").children("span").children("span").text());
            	$("#deleteShop").modal("show");
            });
            $("body").on('click',".productDiv .close",function()
            {
            	$("input[name='itemName']").val($(this).siblings("h6").text());
                $("input[name='itemType']").val($(this).siblings("span").text().slice(14));
                $("input[name='shopToDl']").val($('#shopProducts').find(".modal-content div:last").text());
                $("#deleteItem").modal("show");
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
            		modal.append("<div class='row py-2 pl-3 w-100'><div class='col-3 col-md-3 col-lg-3 col-xl-3'><img class='mx-auto d-block' src='"+lastDiv.find("img:eq("+i+")").attr("src")+"' height='100' width='100'></div><div class='col-9 col-md-9 col-lg-9 col-xl-9 w-100 bg-white productDiv'><button type='button' class='close' style='position:absolute;right:0;margin:-5px -5px 0px 0px;'>&times;</button><h6>"+lastDiv.find("h6:eq("+i+")").text()+"</h6><em>Price : ₹"+lastDiv.find("em:eq("+i+")").text()+"</em><br><span class='mt-n5'>Subcategory : "+lastDiv.find("span:eq("+i+")").text()+"</span></div></div>");
            	}
            	if(lastDiv.children("h6").length==0)
            	{
            		modal.append("<div class='row py-2 pl-3 w-100'><div class='col-12 col-md-12 col-lg-12 col-xl-12'><h6 style='text-align:center;'>No Products found :(<br>Click on the button to Add a Product.</h6></div></div>");
            	}
            	modal.append("<div class='d-flex justify-content-center mt-n1 mb-2'><button class='btn text-white btn-info btn-sm newProduct' style='border-radius:20px;font-weight:bold;' onclick='$(\"#addProduct\").modal(\"show\")'>Add a new Product</button></div>");
            	modal.append("<div id='type' style='display:none;'>"+$(this).siblings("span").children("span").text()+"</div>");
            	modal.append("<div style='display:none;'>"+$(this).parent().prev().children("h6").text()+"</div>");
            });
            $('#shopProducts').on('hidden.bs.modal',function ()
            {
                $(this).find('.modal-content').empty();
            });
            $("body").on('click',"button.newProduct",function()
            {
            	$("input[name='shop']").val($('#shopProducts').find(".modal-content div:last").text());
            	$("input[name='type']").val($('#shopProducts').find(".modal-content div#type").text());
            	$("#addProduct").find("form").hide();
            	$("form."+$("input[name='type']").val().toLowerCase()).show();
            	$("#addProduct").find("form:last").show();
            	$("select#category").append($("div.option"+$("input[name='type']").val().toLowerCase()).html());
            	if($("input[name='type']").val().toLowerCase()=="electronics")
            	{
            		$("select#category").append($("div.optiongadgets").html());
            	}
            });
            $('#addProduct').on('hidden.bs.modal',function ()
            {
            	$("#addProduct").find("img").attr("src","https://lifediagnostics.com/wp-content/uploads/light-gray-stripes-background.jpg");
            	$("#addProduct").find("form").find("select").val("");
            	$("#addProduct").find("form").find("input[type!=submit]").val("");
            	$("#addProduct").find("form").find("textarea").val("");
            	$("select#category").html("<option></option>");
            });
            $("input[name='link']").on("keyup", function() 
            {
            	$("#addProduct").find("img").attr("src",$(this).val());
            	if($(this).val()=="")
            	{
            		$("#addProduct").find("img").attr("src","https://lifediagnostics.com/wp-content/uploads/light-gray-stripes-background.jpg");
            	}
            });
            $('select').change(function()
           	{
            	$("#addProduct").find("img").attr("src",$("option[value='"+$(this).val()+"']").attr("data-img"));
            	$("input[name='catg']").val($("option[value='"+$(this).val()+"']").attr("data-catg"));
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
            }
            else
            {
                $("#collapsibleNavbar").css({"position":"absolute","right":"0","margin-right":"10px"});
                $(".amb").addClass("px-5");
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
                }
                else
                {
                    $("#collapsibleNavbar").css({"position":"absolute","right":"0","margin-right":"10px"});
                    $(".amb").addClass("px-5");
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
                            <input type="text" id="page" name="page" value="Profile" style="display:none;">
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
		   out.println("<script type='text/javascript'>window.location.href ='/LetUsOrder/Home';</script>");
	   }
	   }
	   catch(Exception p)
	   {
		   out.println("<script type='text/javascript'>window.location.href ='/LetUsOrder/Home';</script>");
	   }
	   Database d=new Database();
	   String address=d.getUserAddress((String)session.getAttribute("activeEmail"));
	   String city=d.getUserCity((String)session.getAttribute("activeEmail"));
	   String location=d.getUserLocation((String)session.getAttribute("activeEmail"));
	   String contact=d.getUserContact((String)session.getAttribute("activeEmail"));
%>
	<div class="container mx-auto" style="padding-top:100px;">
		<div class="row mx-auto">
			<div class="col-12 col-md-12 col-lg-12 col-xl-12 mx-auto text-center">
				<img class="mx-auto d-block yourDP" style="border-radius:120px;object-fit:cover;" src="Image/test.jpg" width="250" height="250">
				<form class="mx-auto mt-n2" action="updateDp" method="post" enctype="multipart/form-data">
					<p><input type="file" accept="image/*" name="image" id="file" style="display:none;" onchange="$('#updateDp').click();"></p>
					<label for="file" style="cursor:pointer;color:lightgrey;"><i class="fas fa-camera-retro"></i>&nbsp;&nbsp;Change your profile picture</label>
					<button type="submit" id='updateDp' style="display:none;"></button>
				</form>
			</div>
			<div class="col-12 col-md-12 col-lg-12 col-xl-12 pt-4 mx-auto mt-3 pb-3 amb">
				<form action="updateInfo" class="mx-auto was-validated" method="post">
					<span class="display-4" style="font-size:28px;">Personal</span><br>
					Your Personal Details
					<div class="float-right mt-n3">
						<button type="button" class="btn btn-sm btn-info edit" style="border-radius:20px;width:100px;font-weight:bold;">Edit</button>
						<button type="submit" class="btn btn-sm btn-info save" style="border-radius:20px;width:100px;font-weight:bold;display:none;">Save</button>
					</div>
                    <div class="form-group" style="margin-top:15px;">
                    	<label for="name" style="font-weight:bold;">Name :</label>
    					<% out.println("<input type='text' class='form-control' id='name' name='name' placeholder='Enter name' value='"+session.getAttribute("username")+"' required disabled>");%>
					</div>
  					<div class="form-group">
  						<label for="address" style="font-weight:bold;">Address :</label>
    					<% out.println("<input type='text' class='form-control' id='address' name='address' placeholder='Enter address' value='"+address+"' required disabled>");%>
  					</div>
  					<div class="form-group">
  						<label for="city" style="font-weight:bold;">City :</label>
    					<% out.println("<input type='text' class='form-control' id='city' name='city' placeholder='Enter city' value='"+city+"' required disabled>");%>
  					</div>
  					<div class="form-group">
  						<label for="location" style="font-weight:bold;">Location :</label>
    					<% out.println("<input type='text' class='form-control' id='location' name='location' placeholder='Example:30.726435,76.791637' value='"+location+"' required disabled>");%>
  					</div>
  					<div class="form-group" id="orders">
  						<label for="contact" style="font-weight:bold;">Contact :</label>
    					<% out.println("<input type='number' class='form-control' id='contact' name='contact' placeholder='Enter contact no.' value='"+contact+"' required disabled>");%>
  					</div>
            	</form>
			</div>
			<div class="col-12 col-md-12 col-lg-12 col-xl-12 pt-4 mx-auto mt-3 pb-3 amb">
				<span class="display-4" style="font-size:28px;">Orders</span><br>
				Your Order Details will appear here
				<div class="row">
<%
	ResultSet rs=d.getOrders((String)session.getAttribute("activeEmail"));
	while(rs.next())
	{
		out.println("<div class='col-12 col-md-6 col-lg-4 col-xl-3 mt-3' style='cursor:pointer;'>");
			out.println("<div class='w-100 alert-primary px-2 py-1' style='border-radius:10px 10px 0px 0px;'>");
				out.println("<h6>OrderID : "+rs.getString(1)+"</h6>");
			out.println("</div>");
			out.println("<div class='w-100 row bg-white px-2 pt-2 mt-n2' style='border-radius:0px 0px 10px 10px;margin:0px;'>");
				out.println("<div class='w-25'>");
					out.println("<img height=50 width=50 src='"+d.getProductImage(rs.getString(3),rs.getString(4))+"'>");
				out.println("</div>");
				out.println("<div class='w-75 pl-1'>");
					out.println("<span>"+rs.getString(3)+"</span>");
				out.println("</div>");
				out.println("<p style='font-size:14px;'>");
					out.println("ItemType : "+rs.getString(4)+"<br>");
					out.println("Quantity : "+rs.getString(5)+"<br>");
					out.println("SoldBy : <a href='Shops'>"+rs.getString(2)+"</a><br>");
					out.println("Date Of Order : "+rs.getString(8)+"<br>");
					out.println("PaymentVia : "+rs.getString(7)+"<br>");
					out.println("Net Price : <span style='font-weight:bold;'>₹"+rs.getString(6)+"</span>");
				out.println("</p>");
			out.println("</div>");						
		out.println("</div>");
	}
%>
					<div class='col-12 col-md-6 col-lg-4 col-xl-3 mt-3' style="cursor:pointer;" id='shops'>
						<div class='w-100 alert-primary px-2 py-1' style='border-radius:10px 10px 0px 0px;'>
							<h6>Want to make an order?</h6>
						</div>
						<div class='w-100 bg-white px-2 py-2 mt-n2' style='border-radius:0px 0px 10px 10px;'>
							<p style='font-size:16px;line-height: 1.25;'>Explore Categories, add items to Cart and Order now!</p>
							<ul class="text-primary" style='font-size:15px;'>
								<li><a class="text-primary" href="Groceries">Groceries</a></li>
								<li><a class="text-primary" href="Electronics">Electronics</a></li>
								<li><a class="text-primary" href="GadgetsAndAccessories">Gadgets & Accessories</a></li>
								<li><a class="text-primary" href="Clothing">Clothing</a></li>
								<li><a class="text-primary" href="HomeAndDecors">Home & Decors</a></li>
							</ul>
						</div>						
					</div>
				</div>
			</div>
			<div class="col-12 col-md-12 col-lg-12 col-xl-12 pt-4 mx-auto mt-3 pb-3 amb">
				<span class="display-4" style="font-size:28px;">Shops</span><br>
				Your Shop Details will appear here
				<div class="row">
<%
	rs=d.getShopInfo((String)session.getAttribute("activeEmail"));
	while(rs.next())
	{
    	out.println("<div class='col-12 col-md-6 col-lg-4 col-xl-3 mt-3 shopDiv'>");
    		out.println("<button type='button' class='close' style='position:absolute;right:0;margin-right:15px;'>&times;</button>");
    		out.println("<div class='w-100 alert-primary px-2 py-1 name' style='border-radius:10px 10px 0px 0px;'>");
    			out.println("<h6 style='font-size:17px;'>"+rs.getString(1)+"</h6>");
    		out.println("</div>");
    		out.println("<div class='w-100 bg-white px-2 py-1 mt-n2 info' style='border-radius:0px 0px 10px 10px;'>");
    			out.println("<span style='font-size:15px;'>Category : <span style='font-weight:bold;'>"+rs.getString(5)+"</span></span>");
    			out.println("<p style='font-size:15px;line-height: 1.25;'>"+rs.getString(3)+", "+rs.getString(2)+"</p>");
    			out.println("<a href='#shopProducts' data-toggle='modal'>View/Add Products</a>");
    		out.println("</div>");
    		out.println("<div style='display:none;'>");
    		HashSet<ResultSet> r=d.getShopProducts(rs.getString(1),rs.getString(5));
    		for(ResultSet p:r)
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
					<div class='col-12 col-md-6 col-lg-4 col-xl-3 mt-3' style="cursor:pointer;" data-target='#addNewShop' data-toggle='modal'>
						<div class='w-100 alert-primary px-2 py-1' style='border-radius:10px 10px 0px 0px;'>
							<h6>➕ Add your Shop Details</h6>
						</div>
						<div class='w-100 bg-white px-2 py-1 mt-n2' style='border-radius:0px 0px 10px 10px;'>
							<p style='font-size:15px;line-height: 1.25;'>You can add your shop info here</p>
						</div>						
					</div>
                </div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="addNewShop">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content px-3 py-2">
            	<form class="was-validated" action="newShop" method="post">
            		<label for="shopname">Name :</label>
  					<input type='text' class='form-control' id='shopname' name='shopname' placeholder="Enter Shop Name" required>
  					<label for="shopaddress" class='mt-1'>Address :</label>
  					<textarea class='form-control' id='shopaddress' name='shopaddress' placeholder="Enter Shop Address" required></textarea>
  					<label for="shoplocation">Location :</label>
  					<input type='text' class='form-control' id='shoplocation' name='shoplocation' placeholder="Example: 31.34792,75.56488" required>
  					<div class='row'>
						<div class='w-50 pl-3 pr-1'>
  							<label for="shopcategory" class='mt-1'>Category :</label>
  							<select class='form-control' id='shopcategory' name='shopcategory' required>
  								<option></option>
<%
	rs=d.getCategories();
	while(rs.next())
	{
		out.print("<option>"+rs.getString(1)+"</option>");
	}
%>
  							</select>
  						</div>
  						<div class='w-50 pr-3 pl-1'>
  							<label for="shopcity" class='mt-1'>City :</label>
  							<input type='text' class='form-control' id='shopcity' name='shopcity' placeholder="Enter Shop City" required>
  						</div>
  					</div>
  					<input class='btn btn-sm btn-info mx-auto d-block mt-3' type='submit' value='Add new Shop' style='border-radius:20px;width:150px;'>
            	</form>
            </div>
        </div>
    </div>
	<div class="modal fade" id="deleteShop">
        <div class="modal-dialog mx-auto modal-dialog-centered" style="width:285px;">
            <div class="modal-content" style="width:285px;-webkit-border-radius: 20px !important;-moz-border-radius: 20px !important;border-radius: 20px !important; ">
            	<div class="pt-2 px-2 w-100 font-weight-bold" style="border-radius:20px 20px 0px 0px;font-size:14px;">
            		Do you really want to delete this Shop?
            	</div>
            	<form action="deleteShop" method="post">
            		<input type="text" name="shopName" style="display:none;">
            		<input type="text" name="shopType" style="display:none;">
            		<div class="d-flex justify-content-center mt-2 mb-2">
            			<button type="submit" class="btn text-white btn-dark btn-sm" style="border-radius:20px;font-weight:bold;width:60px;">Yes</button>&nbsp;&nbsp;
            			<button type="button" class="btn text-white btn-dark btn-sm" style="border-radius:20px;font-weight:bold;width:60px;" onclick="$('#deleteShop').modal('hide')">No</button>
            		</div>
            	</form>
            </div>
        </div>
    </div>
    <div class="modal fade" id="deleteItem">
        <div class="modal-dialog mx-auto modal-dialog-centered" style="width:285px;">
            <div class="modal-content" style="width:285px;-webkit-border-radius: 20px !important;-moz-border-radius: 20px !important;border-radius: 20px !important; ">
            	<div class="pt-2 px-2 w-100 font-weight-bold" style="border-radius:20px 20px 0px 0px;font-size:14px;">
            		Do you really want to delete this Item?
            	</div>
            	<form action="deleteItem" method="post">
            		<input type="text" name="itemName" style="display:none;">
            		<input type="text" name="itemType" style="display:none;">
            		<input type="text" name="shopToDl" style="display:none;">
            		<div class="d-flex justify-content-center mt-2 mb-2">
            			<button type="submit" class="btn text-white btn-dark btn-sm" style="border-radius:20px;font-weight:bold;width:60px;">Yes</button>&nbsp;&nbsp;
            			<button type="button" class="btn text-white btn-dark btn-sm" style="border-radius:20px;font-weight:bold;width:60px;" onclick="$('#deleteItem').modal('hide')">No</button>
            		</div>
            	</form>
            </div>
        </div>
    </div>
    <div class="modal fade" id="shopProducts">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
            </div>
        </div>
    </div>
    <div class="modal fade" id="addProduct">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content px-3 py-2">
            	<img class='mx-auto d-block' src='https://lifediagnostics.com/wp-content/uploads/light-gray-stripes-background.jpg' height='100' width='100'>
            	<div id="or1"><form class='was-validated electronics mt-2' action="addNewProduct" method="post">
            		<div class="form-group">
  						<label for="electronics">Select an existing Product :</label>
  						<select class="form-control" id="electronics" name='existing' required>
  							<option value='' data-img='https://lifediagnostics.com/wp-content/uploads/light-gray-stripes-background.jpg'></option>
<%
	HashMap<String,ResultSet> h=d.getElectronicItems();
	for(String i:h.keySet())
	{
		if(h.get(i)!=null)
		{
			while(h.get(i).next())
			{
				out.print("<option value='"+h.get(i).getString(2)+"' data-catg='"+i+"' data-img='"+h.get(i).getString(1)+"'>"+h.get(i).getString(2)+"</option>");
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
				out.print("<option value='"+h.get(i).getString(2)+"' data-catg='"+i+"' data-img='"+h.get(i).getString(1)+"'>"+h.get(i).getString(2)+"</option>");
			}
		}
	}
%>
  						</select>
					</div>
					<input name='shop' style="display:none;">
            		<input name='type' style="display:none;">
            		<input name='catg' style="display:none;">
            		<input class='btn btn-sm btn-info mx-auto d-block mt-n1' type='submit' value='Add Product' style='border-radius:20px;width:150px;'> 
            	</form>
            	<form class='was-validated homeanddecors mt-2' action="addNewProduct" method="post">
					<div class="form-group">
  						<label for="homeanddecors">Select an existing Product :</label>
  						<select class="form-control" id="homeanddecors" name='existing' required>
  							<option value='' data-img='https://lifediagnostics.com/wp-content/uploads/light-gray-stripes-background.jpg'></option>
<%
	h=d.getHomeAndDecors();
	for(String i:h.keySet())
	{
		if(h.get(i)!=null)
		{
			while(h.get(i).next())
			{
				out.print("<option value='"+h.get(i).getString(2)+"' data-catg='"+i+"' data-img='"+h.get(i).getString(1)+"'>"+h.get(i).getString(2)+"</option>");
			}
		}
	}
%>
  						</select>
					</div>
					<input name='shop' style="display:none;">
            		<input name='type' style="display:none;">
            		<input name='catg' style="display:none;">
            		<input class='btn btn-sm btn-info mx-auto d-block mt-n1' type='submit' value='Add Product' style='border-radius:20px;width:150px;'> 
            	</form>
            	<form class='was-validated groceries mt-2' action="addNewProduct" method="post">
					<div class="form-group">
  						<label for="groceries">Select an existing Product :</label>
  						<select class="form-control" id="groceries" name='existing' required>
  							<option value='' data-img='https://lifediagnostics.com/wp-content/uploads/light-gray-stripes-background.jpg'></option>
<%
	h=d.getGroceries();
	for(String i:h.keySet())
	{
		if(h.get(i)!=null)
		{
			while(h.get(i).next())
			{
				out.print("<option value='"+h.get(i).getString(2)+"' data-catg='"+i+"' data-img='"+h.get(i).getString(1)+"'>"+h.get(i).getString(2)+"</option>");
			}
		}
	}
%>
  						</select>
					</div>
					<input name='shop' style="display:none;">
            		<input name='type' style="display:none;">
            		<input name='catg' style="display:none;">
            		<input class='btn btn-sm btn-info mx-auto d-block mt-n1' type='submit' value='Add Product' style='border-radius:20px;width:150px;'> 
            	</form>
            	<form class='was-validated clothing mt-2' action="addNewProduct" method="post">
					<div class="form-group">
  						<label for="clothing">Select an existing Product :</label>
  						<select class="form-control" id="clothing" name='existing' required>
  							<option value='' data-img='https://lifediagnostics.com/wp-content/uploads/light-gray-stripes-background.jpg'></option>
<%
	h=d.getClothing();
	for(String i:h.keySet())
	{
		if(h.get(i)!=null)
		{
			while(h.get(i).next())
			{
				out.print("<option value='"+h.get(i).getString(2)+"' data-catg='"+i+"' data-img='"+h.get(i).getString(1)+"'>"+h.get(i).getString(2)+"</option>");
			}
		}
	}
%>
  						</select>
					</div>
					<input name='shop' style="display:none;">
            		<input name='type' style="display:none;">
            		<input name='catg' style="display:none;">
            		<input class='btn btn-sm btn-info mx-auto d-block mt-n1' type='submit' value='Add Product' style='border-radius:20px;width:150px;'>
            	</form></div>
            	<h6 class='alert-primary OR' style='text-align:center;margin-top:10px;cursor:pointer;border-radius:10px;' onClick="$('#or2').slideToggle('slow');$('#or1').slideToggle('slow');if($('.OR').text()=='Or Add A Complete New Product')$('.OR').text('Or Add An Existing Product');else $('.OR').text('Or Add A Complete New Product');">Or Add A Complete New Product</h6><div id="or2" style="display:none;">
            	<form class='was-validated mt-n2' action="addNewProduct" method="post">
                		<label for="link">Product Image Link :</label>
    					<input type='text' class='form-control' id='link' name='link' placeholder="Paste Product Image Link" required>
					
                		<label for="name" class='mt-1'>Product Name :</label>
    					<input type='text' class='form-control' id='name' name='name' placeholder="Enter Product Name" required>
					
                		<label for="description" class='mt-1'>Product Description :</label>
    					<textarea class='form-control' id='description' name='description' placeholder="Enter Product Description" required></textarea>
						<div class='row'>
						<div class='w-50 pl-3 pr-1'>
							<label for="category" class='mt-1'>Category :</label>
  							<select class="form-control" id="category" name='category' required>
  								<option></option>
  							</select>
  						</div>
<%
	h=d.getAllCategories();
	for(String i:h.keySet())
	{
		out.print("<div class='option"+i+"' style='display:none;'>");
		if(h.get(i)!=null)
		{
			while(h.get(i).next())
			{
				out.print("<option>"+h.get(i).getString(1)+"</option>");//a browser compatibility bug WAS here AND NOW HAS BEEN SOLVED :)
			}
		}
		out.print("</div>");
	}
%>
  						<div class='w-50 pl-1 pr-3'>
							<label for="price" class='mt-1'>Price :</label>
							<input type='number' class='form-control' id='price' name='price' placeholder="Enter Price" required>
						</div></div>
					
            		<input name='shop' style="display:none;">
            		<input name='type' style="display:none;">
            		<input class='btn btn-sm btn-info mx-auto d-block mt-3' type='submit' value='Add new Product' style='border-radius:20px;width:150px;'>
            	</form></div>
            </div>
        </div>
    </div>
	<div class="row w-100 mx-auto mt-5 bg-dark text-white lastDiv pl-2">
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