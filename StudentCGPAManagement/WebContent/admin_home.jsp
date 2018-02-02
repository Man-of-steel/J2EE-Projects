

<%@page import="model.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<title>CGPA Management</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600' rel='stylesheet' type='text/css'>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/jquery.min.js"></script>
	 	<!---strat-slider---->
	    <link rel="stylesheet" type="text/css" href="css/slider.css" />
		<script type="text/javascript" src="js/modernizr.custom.28468.js"></script>
		<script type="text/javascript" src="js/jquery.cslider.js"></script>
			<script type="text/javascript">
				$(function() {
				
					$('#da-slider').cslider({
						autoplay	: true,
						bgincrement	: 450
					});
				
				});
			</script>
		<!---//strat-slider---->
<!-- start top_js_button -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
   <script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
			});
		});
	</script>
<style type="text/css">

form {
	border: 1px solid #660066;
	width: 70%;
}

button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 40%;
}
</style>
</head>
<body>
<!-- start header -->
<div class="header_bg">
<div class="wrap">
	<div class="header">
		<div class="logo">
			<a href="#"><img src="images/logoo.png" alt=""/> </a>
		</div>
		<div class="clear"></div>
	</div>
</div>
</div>
<!-- start header -->
<div class="header_btm">
<div class="wrap">
	<div class="header_sub">
		<div class="h_menu">
			<ul>
				<li class="active"><a href="admin_home.jsp">Home</a></li>
				<li><a href="admin_home.jsp#upload_div">Upload CSV File</a></li>
				<li><a href="login.jsp">Logout</a></li>
			</ul>
		</div>
	   
	<script type="text/javascript" src="js/script.js"></script>
	<div class="clear"></div>

		<div class="clear"></div>
        </div>
</div>
</div>
<!-- start slider -->
<div class="slider_bg">
<div class="wrap">
	<div class="slider">
				<!---start-da-slider----->
				<div id="da-slider" class="da-slider">
				<div class="da-slide">
					<h2>Student CGPA Management</h2>
					<p></p>
				</div>
				<div class="da-slide">
					<h2>Clean & Flat Design</h2>
					<p></p>
				</div>		
				<nav class="da-arrows">
					<span class="da-arrows-prev"></span>
					<span class="da-arrows-next"></span>
				</nav>
			</div>
 			<!---//End-da-slider----->
 	</div>
</div>
</div>
<!-- start main -->
<div class="wrap">
	<div class="main">
		<div class="main_text">
			<h2>Upload CGPA CSV File</h2>
		</div>
			<div align="center">
				<div>
					<%
						if (request.getParameter("s") != null) {
							String status = request.getParameter("s");

							if (status.equalsIgnoreCase("success")) {
					%>
					<h2 style="color: green;">File Uploaded and Data pushed
						successfully!!</h2>
					<%
						}
							if (status.equalsIgnoreCase("failure")) {
					%>
					<h3 style="color: red;">There seems to be some issue with the
						file data, data NOT pushed properly!!</h3>
					<%
						}
							if (status.equalsIgnoreCase("invalidfile")) {
					%>
					<h3 style="color: red;">Only CSV files can be uploaded, try
						again!!</h3>
					<%
						}
							if (status.equalsIgnoreCase("error")) {
					%>
					<h3 style="color: red;">Server encountered problems while
						uploading file, please try again!!</h3>
					<%
						}

						}
					%>
				</div>
				<br>
				<div id="upload_div">
					<form method="post" action="UploadCSV"
						enctype="multipart/form-data">
						<input type="file" name="upload_file">
						<div>
							<br>
							<button type="submit" name="upload_btn" id="upload_btn">Upload</button>
						</div>
					</form>


				</div>
			</div>
		</div>
</div>


<!-- start footer -->
<div class="footer_bg">
<div class="wrap">
</div>
</div>
<!-- start footer -->
<div class="footer_bg1">
<div class="wrap">
	<div class="footer1">
		<!-- scroll_top_btn -->
	    <script type="text/javascript">
			$(document).ready(function() {
			
				var defaults = {
		  			containerID: 'toTop', // fading element id
					containerHoverID: 'toTopHover', // fading element hover id
					scrollSpeed: 1200,
					easingType: 'linear' 
		 		};
				
				
				$().UItoTop({ easingType: 'easeOutQuart' });
				
			});
		</script>
		 <a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"></span></a>
		<!--end scroll_top_btn -->
		
		<div class="copy">
			<p class="link"><span>&copy; 2017 Webworld-v2. All rights reserved | Template by&nbsp;<a> W3Layouts</a></span></p>
		</div>
		<div class="clear"></div>
	</div>
</div>
</div>
</body>
</html>
