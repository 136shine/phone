<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*,entity.puIntroduction,entity.pics,entity.deIntroduction,entity.userComment,
dao.impl.puIntroDaoImpl,dao.impl.carDaoImpl,dao.impl.deIntroDaoImpl,daoo.deIntroDao,dao.impl.commentDaoImpl,
daoo.puIntroductionDao,daoo.carDao,daoo.commentDao,
daoo.userDao,dao.impl.userDaoImpl,entity.user" 
    pageEncoding="utf-8"%>

<%

int Uid=1;
int pu_id=1;
 Uid =request.getParameter("uid") == null ?1:Integer.parseInt(request.getParameter("uid"));
 pu_id =request.getParameter("pu_id") == null ?1:Integer.parseInt(request.getParameter("pu_id"));

System.out.println(Uid+pu_id);
carDao dao=new carDaoImpl();

Boolean f=dao.InsertCar(Uid, pu_id);
String path="single.jsp?pu_id="+pu_id;
if(f){
	System.out.println("加入购物车成功!");
	
	response.sendRedirect(path);
}else{
	System.out.println("加入购物车失败!");
	response.sendRedirect(path);
}

%>