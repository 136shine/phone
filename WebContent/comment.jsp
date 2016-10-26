<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*,entity.puIntroduction,entity.pics,entity.deIntroduction,entity.userComment,
dao.impl.puIntroDaoImpl,dao.impl.picsDaoImpl,dao.impl.deIntroDaoImpl,daoo.deIntroDao,dao.impl.commentDaoImpl,
daoo.puIntroductionDao,daoo.picsDao,daoo.commentDao,
daoo.userDao,dao.impl.userDaoImpl,entity.user" 
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<%		
HttpSession session3 = request.getSession();
String pu_id=session3.getAttribute("pu_id").toString() ;
				 int nowPage = request.getParameter("page") == null ?1:Integer.parseInt(request.getParameter("page"));
				 int pageSize = 3;
				 
				 String sql2="select count(*) as total from usercomment where usercomments pu_id="+pu_id;
				 commentDao dao5=new commentDaoImpl();
				 int totalNum= dao5.Count(sql2) ;
				 					
				 int totalPageCount=totalNum/pageSize; 
				 if(totalPageCount==0)
				 		totalPageCount=1;
				 int PreviousPage=(nowPage-1<=0)?1:nowPage-1;
				 int nextPage=(nowPage+1>=totalPageCount)?totalPageCount:(nowPage+1);
				 int offset=(nowPage-1)*pageSize; 
				 
				 String sql="select * from usercomment where pu_id="+pu_id+"limit "+offset+","+pageSize;
				 
				 String url_one="comment.jsp?page=1";
				 String url_two="comment.jsp?page="+PreviousPage;
				 String url_three="comment.jsp?page="+nextPage;
				 String url_four="comment.jsp?page="+totalPageCount; 
				 
				 
				    List<userComment>list3=null;
				    commentDao dao4=new commentDaoImpl();
				    dao4.getPageCom(sql);
				    String show_two="";
					StringBuffer sh = new StringBuffer(show_two);
					
				    for(userComment c:list3){					
					sh.append("<div class='ms_mode'>"+
						"<img src='images/imgs/cat_ph.jpg'>"+
						"<div class='right'>"+
							"<p>"+c.getUsername()+"</p>"+
							"<div class='con_left'>"+c.getCommentDate()+"<a href='#'>赞</a></div>"+
							"<p>"+c.getComment()+"</p>"+
						"</div>"+
					"</div>");					
					
				    }
					sh.append("<ul class='pagination pagination-sm'>"+	
				    "<li><a href=javascript:page('show_two','"+url_one+"')>首页</a></li>"+				
					"<li><a href=javascript:page('show_two','"+url_two+"'); >上一页</a></li>"+
					"<li>当前第"+nowPage+"/"+totalPageCount+"页</li>"+							
					"<li><a href=javascript:page('show_two','"+url_three+"');>下一页</a></li>"+
					"<li><a href=javascript:page('show_two','"+url_four+"');>末页</a></li>"+							
				"</ul>");
					
					
				   /* sh.append("<p id='commentLogin' style='text-align:center;padding:20px 0 ;display:none'>请<a href=''#' onClick='login()' style='color:#ff6400' >点击登录</a>后发表评论，我们喜欢真实的你！</p>"+             
					  "<form id='comment' name='comment' method='post'>"+
					    "<span>评论：</span>"+
						"<input name='saytext' id='saytext' class='com_tx' type='text'  size='100' />"+						
						"<input class='com_btn' type='button' onClick='checkfourm('show_two')' value='提交' />"+
						"<p id='check' style='float:left;display:none'><font color=red>您还没填写评论内容！</font></p>"+
			         "</form>"+						
				"</div>");
				    */
				    
				    
				    
				%>

<body>
<%=sh %>
</body>
</html>