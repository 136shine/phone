<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*,entity.puIntroduction,entity.pics,entity.deIntroduction,entity.userComment,
dao.impl.puIntroDaoImpl,dao.impl.picsDaoImpl,dao.impl.deIntroDaoImpl,daoo.deIntroDao,dao.impl.commentDaoImpl,
daoo.puIntroductionDao,daoo.picsDao,daoo.commentDao,
daoo.userDao,dao.impl.userDaoImpl,entity.user" 
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String username = request.getParameter("username");

int pu_id =request.getParameter("pu_id") == null ?1:Integer.parseInt(request.getParameter("pu_id"));

String comment = request.getParameter("saytext");
commentDao dao=new commentDaoImpl();
Boolean f=dao.InsertComment(pu_id, username, comment);
if(f){
	System.out.println("评论成功!");
	String path="single.jsp?pu_id="+pu_id;
	response.sendRedirect(path);
}else{
	System.out.println("评论失败!");
}


%>