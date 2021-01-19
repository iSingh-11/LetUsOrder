<%@page import="java.util.TreeMap"%>
<%@page import="DatabaseConnectivity.Database"%>
<%@page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// Check if this is new comer on your Webpage.
   if(session.isNew())
   {
      session.setAttribute("active",false);
      session.setAttribute("username",null);
      session.setAttribute("activeEmail",null);
      session.setAttribute("cartQuantity",null);
      System.out.println("new");
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
  		background-color:rgb(210,210,210);
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
	    @import "compass/css3";
/* I wanted to go with a mobile first approach, but it actually lead to more verbose CSS in this case, so I've gone web first. Can't always force things... Side note: I know that this style of nesting in SASS doesn't result in the most performance efficient CSS code... but on the OCD/organizational side, I like it. So for CodePen purposes, CSS selector performance be damned. */
/* Global settings */
/* Global "table" column settings */
 .product-image {
	 float: left;
	 width: 20%;
}
 .product-details {
	 float: left;
	 width: 37%;
}
 .product-price {
	 float: left;
	 width: 12%;
}
 .product-quantity {
	 float: left;
	 width: 10%;
}
 .product-removal {
	 float: left;
	 width: 9%;
}
 .product-line-price {
	 float: left;
	 width: 12%;
	 text-align: right;
}
p {
  font-size: 1.2em;
  color: #8a8a8a;
}
/* This is used as the traditional .clearfix class */
 .group:before, .shopping-cart:before, .column-labels:before, .product:before, .totals-item:before, .group:after, .shopping-cart:after, .column-labels:after, .product:after, .totals-item:after {
	 content: '';
	 display: table;
}
 .group:after, .shopping-cart:after, .column-labels:after, .product:after, .totals-item:after {
	 clear: both;
}
 .group, .shopping-cart, .column-labels, .product, .totals-item {
	 zoom: 1;
}
/* Apply clearfix in a few places */
/* Apply dollar signs */
 .product .product-price:before, .product .product-line-price:before, .totals-value:before {
	 content: '₹';
}
/* Body/Header stuff */
 body {
	 padding: 0px 10px 0px 10px;
}
 h1 {
	 font-weight: 100;
}
 .shopping-cart {
	 margin-top: -25px;
}
/* Column headers */
 .column-labels label {
	 padding-bottom: 15px;
	 margin-bottom: 15px;
	 border-bottom: 1px solid #eee;
}
 .column-labels .product-image, .column-labels .product-details, .column-labels .product-removal {
	 text-indent: -9999px;
}
/* Product entries */
 .product {
	 margin-bottom: 20px;
	 padding-bottom: 10px;
	 border-bottom: 1px solid #eee;
}
 .product .product-image {
	 text-align: center;
}
 .product .product-image img {
	 width: 100px;
	 height:130px;
}
 .product .product-details .product-title {
	 margin-right: 20px;
	 font-family: 'HelveticaNeue-Medium', 'Helvetica Neue Medium';
}
 .product .product-details .product-description {
	 margin: 5px 20px 5px 0;
	 line-height: 1.4em;
}
 .product .product-quantity input {
	 width: 40px;
}
 .product .remove-product {
	 border: 0;
	 padding: 4px 8px;
	 background-color: #c66;
	 color: #fff;
	 font-family: 'HelveticaNeue-Medium', 'Helvetica Neue Medium';
	 font-size: 12px;
	 border-radius: 3px;
}
 .product .remove-product:hover {
	 background-color: #a44;
}
/* Totals section */
 .totals .totals-item {
	 float: right;
	 clear: both;
	 width: 100%;
	 margin-bottom: 10px;
}
 .totals .totals-item label {
	 float: left;
	 clear: both;
	 width: 79%;
	 text-align: right;
}
 .totals .totals-item .totals-value {
	 float: right;
	 width: 21%;
	 text-align: right;
}
 .totals .totals-item-total {
	
}
 .checkout {
	 float: right;
	 padding: 6px 25px;
	 font-size: 22px;
	 color:white;
}
a {
  text-decoration: none;
}
.layout-inline > * {
  display: inline-block;
}
.col-qty {
  text-align: center;
  width: 17%;
}
.col-qty > * {
  vertical-align: middle; 
}

button.qty {
  width: 1em;
  line-height: 0.7em;
  border-radius: 1.5em;
  font-size: 1.2em;
  font-weight:bold;
  text-align: center;
  background: #43ace3;  
  color: #fff;
  padding-left:0.1em;
  padding-top:0.0em;
  padding-bottom:0.1em;
}

button.qty:hover {
  background: #3b9ac6;
} 
/* Make adjustments for tablet */
 @media screen and (max-width: 770px) {
 .qty-minus
 {
 position:absolute;
 margin-top:35px;
 margin-left:-33px !important;
 }
 .qty-plus
 {
 position:absolute;
 margin-top:5px;
 margin-left:-10px !important;
 }
 .col-qty {
    width: 22%;
  }
  
	 .shopping-cart {
		 margin: 0;
		 padding-top: 20px;
		 border-top: 1px solid #eee;
	}
	 .column-labels {
		 display: none;
	}
	 .product-image {
		 float: right;
		 width: auto;
	}
	 .product-image img {
		 margin: 0 0 10px 10px;
	}
	 .product-details {
		 float: none;
		 margin-bottom: 10px;
		 width: auto;
	}
	 .product-price {
		 clear: both;
		 width: 70px;
		 margin-top:-20px;
	}
	 .product-quantity {
		 width: 100px;
		 margin-top:-20px;
		 margin-bottom:30px !important;
	}
	 .product-quantity input {
		 margin-left: 20px;
	}
	 .product-removal {
		 width: auto;
		 margin-top:-20px;
	}
	 .product-line-price {
		 float: right;
		 width: 70px;
	}
	.layout-inline > * {
  display: block;
}
.qty
{
margin-left:-22px;}
/* Make more adjustments for phone */
 @media screen and (max-width: 430px) {
	 .product-removal {
		 float: right;
		 margin-top:20px !important;
	}
	 .product-line-price {
		 float: right;
		 clear: left;
		 width: auto;
		 margin-top: 10px;
	}
	.product-price {
		 margin-top:-5px;
	}
	 .product-quantity {
		 margin-top:-5px;
	}
	 .product .product-line-price:before {
		 content: 'Item Total: ₹';
	}
	 .totals .totals-item label {
		 width: 60%;
	}
	 .totals .totals-item .totals-value {
		 width: 40%;
	}
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
            if($(".shopping-cart").find(".product").length==0)
           	{
            	$(".shopping-cart").hide();
            	$(".emptycartdiv").show();
            	$(".lastDiv").addClass("fixed-bottom");
           	}
            else
            {
            	$(".shopping-cart").show();
            	$(".emptycartdiv").hide();
            	$(".lastDiv").removeClass("fixed-bottom");
            }
            //Responiveness            
            $("#username").click(function()
            {
            	$(".navbar-nav li:last div").css("margin-left",$("#username em").css("width").slice(0,-2)-65+"px");
            });
            if($(window).width()<=758)
            {
                $("#collapsibleNavbar").css({"position":"","right":"","margin-right":""});
             	if($(window).width()<337)
             	{
             		$(".emptycat").addClass("ml-n3");
             	}
             	else
             	{
             		$(".emptycat").removeClass("ml-n3");
             	}
            }
            else
            {
                $("#collapsibleNavbar").css({"position":"absolute","right":"0","margin-right":"10px"});
                $(".emptycat").removeClass("ml-n3");
            }
            $(window).resize(function() 
            {
                if($(window).width()<=758)
                {
                    $("#collapsibleNavbar").css({"position":"","right":"","margin-right":""});
                    if($(window).width()<337)
                 	{
                 		$(".emptycat").addClass("ml-n3");
                 	}
                 	else
                 	{
                 		$(".emptycat").removeClass("ml-n3");
                 	}
                }
                else
                {
                    $("#collapsibleNavbar").css({"position":"absolute","right":"0","margin-right":"10px"});
                    $(".emptycat").removeClass("ml-n3");
                }
            });
            //Ends Here
        });
        var taxRate = 0.05;
        var shippingRate = 15.00; 
        var fadeTime = 300;


        /* Assign actions */
        $('.product-quantity input').change( function() {
          updateQuantity(this);
        });

        $('.product-removal button').click( function() {
          removeItem(this);
        });


        /* Recalculate cart */
        function recalculateCart()
        {
          var subtotal = 0;
          
          /* Sum up row totals */
          $('.product').each(function () {
            subtotal += parseFloat($(this).children('.product-line-price').text());
          });
          
          /* Calculate totals */
          var tax = subtotal * taxRate;
          var shipping = (subtotal > 0 ? shippingRate : 0);
          var total = subtotal + tax + shipping;
          
          /* Update totals display */
          $('.totals-value').fadeOut(fadeTime, function() {
            $('#cart-subtotal').html(subtotal.toFixed(2));
            $('#cart-tax').html(tax.toFixed(2));
            $('#cart-shipping').html(shipping.toFixed(2));
            $('#cart-total').html(total.toFixed(2));
            if(total == 0){
              $('.checkout').fadeOut(fadeTime);
            }else{
              $('.checkout').fadeIn(fadeTime);
            }
            $('.totals-value').fadeIn(fadeTime);
          });
        }
        /* Update quantity */
        function updateQuantity(quantityInput)
        {
          /* Calculate line price */
          var productRow = $(quantityInput).parent().parent();
          var price = parseFloat(productRow.children('.product-price').text());
          var quantity = $(quantityInput).val();
          var linePrice = price * quantity;
          
          /* Update line price display and recalc cart totals */
          productRow.children('.product-line-price').each(function () {
            $(this).fadeOut(fadeTime, function() {
              $(this).text(linePrice.toFixed(2));
              recalculateCart();
              $(this).fadeIn(fadeTime);
            });
          });  
        }


        /* Remove item from cart */
        function removeItem(removeButton)
        {
          /* Remove row from DOM and recalc cart total */
          var productRow = $(removeButton).parent().parent();
          productRow.slideUp(fadeTime, function() {
            productRow.remove();
            recalculateCart();
          });
        }
    </script>
</head>

<body id="Home">
<%
	Database d=new Database();
	ResultSet ef = d.getCartItems((String)session.getAttribute("activeEmail"));
%>
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
                            <input type="text" id="page" name="page" value="Template" style="display:none;">
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
		   out.println("<script type='text/javascript'>window.location.href ='/LetUsOrder/Home';</script>");
	   }
	   }
	   catch(Exception p)
	   {
		   session.setAttribute("active",false);
		   session.setAttribute("username",null);
		   session.setAttribute("activeEmail",null);
		   session.setAttribute("cartQuantity",null);
		   System.out.println("new else");
		   out.println("<script type='text/javascript'>window.location.href ='/LetUsOrder/Home';</script>");
	   }
%>

<h1>Shopping Cart</h1>

<div class="shopping-cart">

  <div class="column-labels">
    <label class="product-image">Image</label>
    <label class="product-details">Product</label>
    <label class="product-price">Price</label>
    <label class="product-quantity">Quantity</label>
    <label class="product-removal">Remove</label>
    <label class="product-line-price">Total</label>
  </div>
<%
if((String)session.getAttribute("activeEmail")!=null)
{
double sub=0;
int scount=0;
String userLoc=d.getUserLocation((String)session.getAttribute("activeEmail")).trim();
while(ef.next()){ %>
  <div class="product p-3 container" style="border-radius:20px;background-color:rgb(240,240,240);">
    <div class="product-image">
      <img src="<%=ef.getString(1) %>">
    </div>
    <div class="product-details">
      <div class="product-title">
      	<h6 style='font-weight:bold;font-family:arial'><%= ef.getString(2) %></h6>
      	<p style='font-size:15px;'><select class='py-1' style='width:150px; !important;'>
<%
	String[] shops=d.getShopsForItem(ef.getString(2).trim(),ef.getString(3));
	if(shops==null) continue;
	int cs=0; double bestShopDistance=0; String bestShop="";
	TreeMap<Double,String> t=new TreeMap<Double,String>();
	for(String i:shops)
	{
		i=i.trim();
		String loc=d.getShopLocation(i).trim();
		double distance=d.getDistance(userLoc,loc);
		t.put(distance,"<option data-distance="+distance+">"+i+"</option>");
		if(cs==0 || distance<bestShopDistance)
		{
			bestShopDistance=distance; 
			bestShop=i;
		}
		cs++;
	}
	for(Double i:t.keySet())
	{
		out.println(t.get(i));
	}
%>
			</select>
<%
	session.setAttribute("shop"+scount,bestShop);
	out.println("<br><em style='color:black;'><span class='badge badge-pill badge-dark'>LetUsOrder Choice</span> <br>\""+bestShop+"\" is closest to you</em>");
%>
      	</p>
      </div>
    </div>
    <div class="product-price"><em><%= ef.getInt(4) %></em></div>
    <div class="product-quantity col-qty layout-inline">
    <form method="post" action="CartChanges"><button type="submit" class="qty qty-minus">-</button>
           <% out.println("<input type='text' name='num1' style='display:none;' value='"+ef.getString(2)+"'>"); 
              out.println("<input type='text' name='op1' style='display:none;' value='-'>"); 
           %></form>
            <input type="number" id="quantity" value="<%=ef.getInt(5) %>" disabled/>
             <form method="post" action="CartChanges"><button type="submit" class="qty qty-plus">+</button>
           <% out.println("<input type='text' name='num1' style='display:none;' value='"+ef.getString(2)+"'>"); 
              out.println("<input type='text' name='op1' style='display:none;' value='+'>"); 
           %>
           </form>
    </div>
    <div class="product-removal">
    <form action="CartChanges" method="post"><button class="remove-product"> Remove </button>
            <% out.println("<input type='text' name='num1' style='display:none;' value='"+ef.getString(2)+"'>"); 
              out.println("<input type='text' name='op1' style='display:none;' value='*'>"); 
           %></form>
    </div>
<%
    int p=ef.getInt(4);
    int q=ef.getInt(5);
    int s=p*q;
    sub=sub+s;
    session.setAttribute("itemtotal"+scount,s);
	scount++;
%>
    <div class="product-line-price" id="answer"><em style='font-weight:bold;'><%= s %></em></div>
  </div>
  <% } 
 double ship=0.0;
 double total=0;
 double value;
 double tax=0.02*sub;
 long factor = (long) Math.pow(10, 2);
 value = tax * factor;
 long tmp = Math.round(value);
 tax= (double) tmp / factor;
  if(sub<5000 && sub>0)
  {
	  ship=200;
	  }
  total=ship+sub+tax;
  %>
  <form action="CheckOut" method="post">
  <div class="totals container">
    <div class="totals-item">
      <label>Subtotal</label>
      <div class="totals-value" id="cart-subtotal" style='font-weight:bold;'><%= sub %></div>
    </div>
    <div class="totals-item">
      <label>Tax (2%)</label>
      <div class="totals-value" id="cart-tax" style='font-weight:bold;'><%= tax %></div>
    </div>
    <div class="totals-item">
      <label>Shipping</label>
      <div class="totals-value" id="cart-shipping" style='font-weight:bold;'><%= ship %></div>
    </div>
    <div class="totals-item totals-item-total">
      <label>Grand Total</label>
      <div class="totals-value" id="cart-total" style='font-weight:bold;'><%= total %></div>
    </div>
    <div>
<%
	ef = d.getCartItems((String)session.getAttribute("activeEmail"));
	int pcount=0;
	while(ef.next())
	{
		out.println("<input style='display:none;' type='text' name='item"+pcount+"' value='"+ef.getString(2).trim()+"'>");
		out.println("<input style='display:none;' type='text' name='qty"+pcount+"' value='"+ef.getString(5).trim()+"'>");
		out.println("<input style='display:none;' type='text' name='type"+pcount+"' value='"+ef.getString(3).trim()+"'>");
		pcount++;
	}
	out.println("<input style='display:none;' type='text' name='subtotal' value='"+sub+"'>");
	out.println("<input style='display:none;' type='text' name='taxes' value='"+tax+"'>");
	out.println("<input style='display:none;' type='text' name='shipping' value='"+ship+"'>");
	out.println("<input style='display:none;' type='text' name='total' value='"+total+"'>");
%>
    </div>
    <button type="submit" class="checkout btn btn-info" style='border-radius:15px;'>Checkout</button>
  </div>
  </form>
</div>
<% } %>
	<div class="container emptycartdiv">
		<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 p-4 mt-5" style="background-color:rgb(240,240,240);border-radius:20px;text-align:center;">
			<h3>Nothing to show in Cart :(<br>
			<small>Explore Categories and add items to your Cart</small></h3>
			<div class="text-center row mx-auto mt-2" style="height:100px;width:263px;">
        		<div onclick="window.location='Clothing'" class="text-center emptycat" style="border-radius:0px 0px 13px 13px;width:45px;height:90px;background-image:url('https://raw.githubusercontent.com/iSingh-11/github-git/master/Shopping-Bag-brown.png-removebg-preview%20(1).png');background-position:center;background-size:cover;">
        			<i data-toggle="tooltip" title="Clothing" data-placement="top" class='fas fa-tshirt' style='margin-top:50px;font-size:24px;color:white;'></i>
        		</div>
        		<div onclick="window.location='Electronics'" class="text-center" style="border-radius:0px 0px 13px 13px;margin-left:7px;width:45px;height:90px;background-image:url('https://raw.githubusercontent.com/iSingh-11/github-git/master/Shopping-Bag-brown.png-removebg-preview%20(1).png');background-position:center;background-size:cover;">
        			<i data-toggle="tooltip" title="Electronics" data-placement="top" class='fas fa-tv' style='margin-top:50px;font-size:24px;color:white;'></i>
        		</div>
        		<div onclick="window.location='Groceries'" class="text-center" style="border-radius:0px 0px 13px 13px;margin-left:7px;width:45px;height:90px;background-image:url('https://raw.githubusercontent.com/iSingh-11/github-git/master/Shopping-Bag-brown.png-removebg-preview%20(1).png');background-position:center;background-size:cover;">
        			<i data-toggle="tooltip" title="Groceries" data-placement="top" class='fas fa-carrot' style='margin-top:50px;font-size:24px;color:white;'></i>
        		</div>
        		<div onclick="window.location='GadgetsAndAccessories'" class="text-center" style="border-radius:0px 0px 13px 13px;margin-left:7px;width:45px;height:90px;background-image:url('https://raw.githubusercontent.com/iSingh-11/github-git/master/Shopping-Bag-brown.png-removebg-preview%20(1).png');background-position:center;background-size:cover;">
        			<i data-toggle="tooltip" title="Gadgets & Accessories" data-placement="top" class='fas fa-headphones' style='margin-top:50px;font-size:24px;color:white;'></i>
        		</div>
        		<div onclick="window.location='HomeAndDecors'" class="text-center" style="border-radius:0px 0px 13px 13px;margin-left:7px;width:45px;height:90px;background-image:url('https://raw.githubusercontent.com/iSingh-11/github-git/master/Shopping-Bag-brown.png-removebg-preview%20(1).png');background-position:center;background-size:cover;">
        			<i data-toggle="tooltip" title="Home & Decors" data-placement="top" class='fas fa-house-user' style='margin-top:50px;font-size:24px;color:white;'></i>
        		</div>
        	</div>
        </div>
	</div>
	<div class="modal fade" id="checkout">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
            	<form class='was-validated p-3' action="PlaceOrder">
            		<div class="form-group">
            			<label for="add">Delivering to :</label>
            			<select class="form-control" id="add" name="add" required>
            				<option><% out.println(d.getUserAddress((String)session.getAttribute("activeEmail"))); %></option>
            			</select>
            		</div>
            		<div class="form-group">
            			<label>Payment Method :<br>
            				<input type="radio" value="Cash On Delivery" name="pay" checked required>&nbsp; Cash On Delivery&nbsp;
            				<input type="radio" value="Paypal" name="pay">&nbsp; Paypal&nbsp;<br>
            				<input type="radio" value="eCash" name="pay">&nbsp; eCash&nbsp;
            				<input type="radio" value="Credit/Debit Card" name="pay">&nbsp; Credit/Debit Card&nbsp;
            			</label>
            		</div>
            		<div class="d-flex justify-content-center mt-3">
                    	<button type="submit" class="btn bg-info text-white font-weight-bold" style="border-radius:10px;width:150px;">Place Order</button>
                    </div>
            	</form>
            </div>
        </div>
    </div>
<%
	   try
	   {
	   	   if(session.getAttribute("total")==null)
	   	   {
	   		   //nothing to do
	       }
	   	   else
	   	   {
	   		   out.println("<script type='text/javascript'>$('#checkout').modal('show');</script>");
	   	   }
	   }
	   catch(Exception e)
	   {
		   session.setAttribute("total",null);
	   }
%>
	<!-- hereeeeeeeeeeeeeeee -->
	<div class="row w-100 mx-auto mt-n2 bg-dark text-white lastDiv pl-2" style='margin-top:70px !important;'>
        Copyright ©️ 2020 LetUsOrder. All rights reserved.&nbsp;
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