<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*,daoo.commentDao,dao.impl.commentDaoImpl"
    pageEncoding="utf-8"%>

<%
request.setCharacterEncoding("utf-8");
int pu_id = Integer.parseInt(request.getParameter("pu_id"));
String username = request.getParameter("username");
String comment = request.getParameter("comment");
commentDao dao=new commentDaoImpl();
System.out.println("这里是ms.jsp");
boolean f = dao.InsertComment(pu_id, username, comment);

if(f){ //插入成功	   
	 System.out.println("插入成功!");
     response.sendRedirect("single.jsp?pu_id="+pu_id);
}
else{ //插入失败
	   System.out.println("插入失败!");
}

%>