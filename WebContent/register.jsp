<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
	<%--taglib directive --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>Register</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-select.css">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Resale Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />

<!-- //for-mobile-apps -->
<!--fonts-->
<link href='http://fonts.useso.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<!--//fonts-->	

<link href="css/jquery.uls.css" rel="stylesheet"/>
<link href="css/jquery.uls.grid.css" rel="stylesheet"/>
<link href="css/jquery.uls.lcd.css" rel="stylesheet"/>

<style>
#commentForm{
  width:900px;
   margin:0 atuo;
}
	em { display:inline-block; width:30%; float:right;font-weight: bold; vertical-align: center; line-height:73px;}
	em.error {
	  width:41%;
	  background:url("images/login/error.png") no-repeat 0px center ;
	  padding-left: 16px;
	}
	em.success {
	height:73px;
	  width:41%;
	  background:url("images/login/right.png") no-repeat 0px center ;
	  padding-left: 16px;
	}
	.sign-up1{
		width:15%;
	}
	
	.sign-up2{
		width:75%;
		float:left;
	}
	.sign-up2 input[type="text"],.sign-up2 input[type="password"]{
		width:58%;
	}
	
</style>


</head>
<body>
<div class="header">
		<c:import url="header.jsp"></c:import>
	</div>
	 <section>
			<div id="page-wrapper" class="sign-in-wrapper">
				<div class="graphs">
					<div class="sign-up">
						<h1>Create an account</h1>
						<p class="creating">Having hands on experience in creating innovative designs,I do offer design 
							solutions which harness.</p>
						<h2>用户注册</h2>
						<form id="commentForm" name="registerForm" action="doRegister.jsp" method="post">
						<div class="sign-u">
							<div class="sign-up1">
								<h4>用户名 :</h4>
							</div>
							<div class="sign-up2">
								<input type="text" name="username" placeholder=" " required=" "/>								
							</div>
							
							<div class="clearfix"> </div>
						</div>
						<div class="sign-u">
							<div class="sign-up1">
								<h4>邮箱 :</h4>
							</div>
							<div class="sign-up2">
								<input type="text" name="email" placeholder=" " required=" "/>								
							</div>
							
							<div class="clearfix"> </div>
						</div>
						<div class="sign-u">
							<div class="sign-up1">
								<h4>请输入密码 :</h4>
							</div>
							<div class="sign-up2">
								<input type="password" id="psw" name="password" placeholder=" " required=" "/>								
							</div>
						
							<div class="clearfix"> </div>
						</div>
						<div class="sign-u">
							<div class="sign-up1">
								<h4>确认密码 :</h4>
							</div>
							<div class="sign-up2">
								<input type="password" name="cPassword" placeholder=" " required=" "/>							
							</div>
							
							<div class="clearfix"> </div>
						</div>
						<div class="sub_home">
							<div class="sub_home_left">
								<input type="submit" value="Create">
							</div>
							<div class="sub_home_right">
								<p>Go Back to <a href="index.jsp">Home</a></p>
							</div>
							<div class="clearfix"> </div>
							</form>
						</div>
					</div>
				</div>
			</div>
		<!--footer section start-->
			<footer class="diff">
			   <c:import url="footer_register.jsp"></c:import>
			</footer>
        <!--footer section end-->
	</section>

<script src="js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="js/jquery.validate.js" type="text/javascript"></script>
<script src="js/jquery.validate.message.js" type="text/javascript"></script>
 <script type="text/javascript">
  $(document).ready(function(){

	$("#commentForm").validate({
		rules: {
			username: {
				required: true,
				minlength: 2
			},
			email: {
				required: true,
				email: true
			},
			password:{
				required: true,
				minlength: 6,
				maxlength:20
			},
			cPassword: {
				required: true,
				equalTo: "#psw"
			}
		},
		
		messages: {
			username: {
				required: '请输入姓名',
				minlength: '请至少输入两个字符'
			},
			email: {
				required: '请输入电子邮件',
				email: '请检查电子邮件的格式'
			},
			password: {
				required: '请输入密码',
				minlength: "至少6个字符",
				
			},
			cPassword: {
				required: '请再次输入密码',
				minlength: "至少6个字符",
				equalTo: "请再次输入相同的值"
			}
		},	
		
		errorElement: "em", //可以用其他标签，记住把样式也对应修改
		success: function(label) {
			//label指向上面那个错误提示信息标签em
			label.text(" ")				//清空错误提示消息
				.addClass("success");	//加上自定义的success类
		}

	  });

  });
  </script>	
</body>
</html>