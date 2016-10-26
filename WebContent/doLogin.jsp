<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*,daoo.userDao,dao.impl.userDaoImpl,entity.user"
    pageEncoding="utf-8"%>
<%
String username = request.getParameter("username");
String Upassword = request.getParameter("Upassword");


userDao ud = new userDaoImpl();
user user = ud.isLogin(username, Upassword);
if (user != null) { // 登录成功
	HttpSession session2 = request.getSession();
	session.setAttribute("user", user);
	response.sendRedirect("index.jsp");
	System.out.println("登录成功!");
} else {// 登录失败
	response.sendRedirect("login.jsp");
	System.out.println("登录失败!");
}


%>