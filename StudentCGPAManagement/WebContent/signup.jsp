
<%@page import="dao.DAO"%>
<%@page import="java.sql.ResultSet"%>
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
        
<style>
form {
	border: 1px solid #660066;
	width: 70%;
}

input[type=text], input[type=password], select {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 0.8;
}

.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
}

img.avatar {
	width: 20%;
	border-radius: 20%;
}

.container {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
</style>
</head>



<body>
    
    <%!
    DAO dao = new DAO();
    %>
    
    <%
    if(request.getParameter("submit_btn") != null){
        String name = request.getParameter("name");
        String studentId = request.getParameter("studentid");
        String email = request.getParameter("email");
        String number = request.getParameter("number");      
        String password = request.getParameter("password");
        
        String sql = String.format("insert into student_tbl (student_id, student_name, email, number, password) values('%s', '%s','%s', '%s', '%s')", studentId, name, email, number, password);
        
        if(dao.putData(sql) > 0){
        %>
            <script type="text/JavaScript">
                alert("Signup successful!! You can login now...");
                window.location.href="signup.jsp";                    
            </script>
        <%
        }
        else{
            %>
            <script type="text/JavaScript">
                alert("There seems to be an issue, try again! Student ID may already exist..");
                window.location.href="signup.jsp";                    
            </script>
        <%
        }
        
    }
    %>
    
    
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
		
	   
	<script type="text/javascript" src="js/script.js"></script>
	<div class="clear"></div>

		<div class="clear"></div>
</div>
</div>
</div>

<!-- start main -->
<div class="wrap">
	<div class="main">
		<div class="main_text">
			<h2>Signup</h2>
		</div>
                <div align="center">
                    <form method="post">
                        <div class="imgcontainer">
                          <img src="images/img_avatar2.png" alt="Avatar" class="avatar">
                        </div>

                        <div class="container">
                          
                          <input type="text" placeholder="Enter name" name="name" required>
                          
                          <input type="text" placeholder="Student-ID" name="studentid" required>
                          
                          <input type="text" placeholder="Email" name="email" required>
                          
                          <input type="text" placeholder="Number" name="number" required>
                          
                          <input type="password" placeholder="Enter Password" name="password" id="password" required>
                          
                          <input type="password" placeholder="Enter Password again" name="cpassword" id="cpassword" required>

                          <button type="submit" name="submit_btn" onclick="return validate()">Signup</button>
                        </div>
                        Back to <a href="login.jsp">Login</a>
                      </form>
                </div>
	</div>
</div>

<script type="text/javascript">
    
    function validate(){
        var password = document.getElementById("password").value;
        var cpassword = document.getElementById("cpassword").value;
        
        if(password === cpassword)
            return true;
        else{
            alert("Passwords do not match!! try again...");
            return false;
        }
    }
</script>
<!-- start footer -->
<div class="footer_bg">
<div class="wrap">
	<div class="footer">
		<!-- start span_of_4 -->
		<div class="span_of_4">
			
			<div class="clear"></div>
		</div>
	</div>
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

