<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*,daoo.userDao,dao.impl.userDaoImpl,entity.user,entity.puIntroduction"
    pageEncoding="utf-8"%>
<%
user user = null;
String username = "";
HttpSession session2 = request.getSession();
if(null != session2.getAttribute("user")){
    user = (user)session.getAttribute("user");
    username = user.getUsername() ;
}else
{
	response.sendRedirect("login.jsp");
	System.out.println("user为空!");
}
%>
<script language="javascript">
  window.onload=function(){	  
	  
	  var  un= <%=username%>;
	  var oLogin=document.getElementById("login");
	  var oLogout=document.getElementById("logout");
       if(un !=""){ //当登录成功         
    	   oLogin.style.display="none"; //隐藏登录用户div
    	   oLogout.style.display="block";//显示一个空div，这个div用来显示一句话        
    	         
       }else{
    	   
    	   oLogin.style.display="block"; //
    	   oLogout.style.display="none";//     
       }     
  }    
 
</script>
<link href="css/header.css">
<div class="container">
			<div class="logo">
				<a href="index.jsp"><span>手机</span>商城</a>
			</div>
			<div id="login" class="header-right">
			  <a class="account" href="login.jsp">登录 </a>
			  <a class="account" href="register.jsp"> 注册</a>
			   <a class="account" href="adminLogin2.jsp">后台管理 </a>
			</div>
			<div id="logout" class="header-right" style="position:relative;display:none;width:200px;
	height:50px;">
			  <span class="welcome" style="position:absolute;top:25px;right:110px;"> 欢迎 <strong><%=username %></strong> !</span>
			  <a class="account" style="display:inline-block;position:absolute;right:-100px;" href="car2.jsp">购物车 </a>
			  <a class="account" href="exit.jsp" style="display:inline-block;position:absolute;right:-10px;"> 退出登录</a>
			 			
			</div>
			<span class="welcome" > <a  href="all-classifieds.jsp" style="display:inline-block; position:absolute; right:20px;top:25px;"> 更多商品</a></span>
</div>