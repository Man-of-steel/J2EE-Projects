

<%@page import="dao.DAO"%>
<%@page import="model.CSVData"%>
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
#data_table {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 50%;
}

#data_table td, #data_table th {
    border: 1px solid #ddd;
    padding: 8px;
}

#data_table tr:nth-child(even){background-color: #f2f2f2;}

#data_table tr:hover {background-color: #ddd;}

#data_table th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #660000;
    color: white;
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
				<li class="active"><a href="student_home.jsp">Home</a></li>
				<li><a href="student_home.jsp#viewmarks">View CGPA</a></li>
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

<%
	Student student = null;
	
	if(session.getAttribute("student") != null){
		student = (Student) session.getAttribute("student");
	}
	
	if(student == null){
		response.sendRedirect("login.jsp");
		return;
	}
	
	CSVData data = CSVData.getData(student.getId());
	
%>

<!-- start main -->
<div class="wrap">
	<div class="main">
		<div class="main_text">
			<h2>CGPA Data</h2>
		</div>
			<div align="center" id=viewmarks>
				<%
				if(data != null){
					%>
					<table id="data_table">
					<tr>
					<th>Student ID</th><th>Student Name</th><th>Marks</th><th>CGPA</th>
					</tr>
					<tr>
					<td><%= data.getStudentId() %> </td>
					<td><%= data.getStudentName() %> </td>
					<td><%= data.getMarks() %> </td>
					<td><%= data.getCgpa() %> </td>
					</tr>
					</table>
					<%
				}else{
					%>
					<h2 style="color: red">Problem loading data, try after some time</h2>
					<%
				}
				%>
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
