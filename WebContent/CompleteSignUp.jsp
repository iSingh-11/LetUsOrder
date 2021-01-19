<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
try
{
	if(session.getAttribute("newEmail")==null || (boolean)session.getAttribute("OTPVerified")==false)
	{
		out.println("<script type='text/javascript'>window.location.href ='/LetUsOrder/Home';</script>");
	}
}
catch(Exception e)
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
        input[type=number]::-webkit-inner-spin-button, 
		input[type=number]::-webkit-outer-spin-button 
		{ 
    		-webkit-appearance: none;
    		-moz-appearance: none;
    		appearance: none;
    		margin: 0; 
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
    </style>
    <script>
        $(document).ready(function()
		{
            //Responiveness
            if($(window).width()<=758)
            {
                $("#collapsibleNavbar").css({"position":"","right":"","margin-right":""});
                if($(window).width()<510)
                {
                	$(".insideCt").removeClass("px-4");
                }
                else
                {
                	$(".insideCt").addClass("px-4");
                }
            }
            else
            {
                $("#collapsibleNavbar").css({"position":"absolute","right":"0","margin-right":"10px"});
                $(".insideCt").addClass("px-4");
            }
            $(window).resize(function() 
            {
                if($(window).width()<=758)
                {
                    $("#collapsibleNavbar").css({"position":"","right":"","margin-right":""});
                    if($(window).width()<510)
                    {
                    	$(".insideCt").removeClass("px-4");
                    }
                    else
                    {
                    	$(".insideCt").addClass("px-4");
                    }
                }
                else
                {
                    $("#collapsibleNavbar").css({"position":"absolute","right":"0","margin-right":"10px"});
                    $(".insideCt").addClass("px-4");
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
         
    <div style="padding-top: 95px;" class="container">
        <div class="col-12 col-sm-12 col-md-10 col-lg-8 col-xl-6 mx-auto">
    		<form class="was-validated" action='createNewAccount' method="post">
    			<div class="container pt-2 pb-3 insideCt mx-0" style="border:0.15rem solid #fca118;border-radius:20px;background-color:rgb(240,240,240);">
        			<h5 class='mt-1' style='text-align:center;'>Email has been verified successfully!<br>
        			<small>Please fill up remaining details.</small></h5>
        			<label for="name" class='mt-1'>Name</label>
    				<input type="text" class="form-control" id="name" name="name" placeholder="Enter name" required>

   					<label for="contact" class='mt-1'>Contact</label>
       				<input type="number" class="form-control" id="contact" name="contact" placeholder="Enter contact no." required>
  					
    				<label for="address" class='mt-1'>Address</label>
    				<input type="text" class="form-control" id="address" name="address" placeholder="Enter home address" required>
  					
    				<label for="city" class='mt-1'>City</label>
    				<input list="cityy" class="form-control" id="city" name="city" placeholder="Enter city" required>
  					<datalist id="cityy">
    					<option value="Ambala">
    					<option value="Chandigarh">
    					<option value="Mohali">
    					<option value="Zirakpur">
   						<option value="Patiala">
    					<option value="Rajpura">
    					<option value="Delhi">
    					<option value="Kurshetra">
  					</datalist>
  					
  					<label for="lat-long" class='mt-1'>Latitude-Longitude</label>
  					<input type="text" class="form-control" id="lat-long" name="lat-long" placeholder="Example: 27.745773,74.435896" required>
        			Visit <a href="https://www.latlong.net/" target="_blank">latlong.net</a> to get the Lat-Long. This will help us to find closest seller for you while buying products.
        			
        			<div class="d-flex justify-content-center mt-3 mb-1">
                    	<button type="submit" class="btn bg-info text-white font-weight-bold" style="border-radius:10px;width:200px;">Create an Account</button>
                    </div>
                    By creating account, you are agreeing to our <a href="FAQs.html" target="_blank">Terms & Conditions</a>
    			</div>
    		</form>
    	</div>
    </div> 
	<div class="row w-100 mx-auto bg-dark text-white lastDiv pl-2" style="margin-top:45px;">
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