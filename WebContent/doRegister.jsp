<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*,daoo.userDao,dao.impl.userDaoImpl,entity.user"
    pageEncoding="utf-8"%>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");
String email=request.getParameter("email");
userDao dao=new userDaoImpl();
Boolean f=dao.InsertUser(username, password, email);
if(f){
	System.out.println("注册成功!");
	response.sendRedirect("index.jsp");
}else{
	System.out.println("注册失败!");
}



%>
