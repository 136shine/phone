
<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*,entity.puIntroduction,dao.impl.puIntroDaoImpl,daoo.puIntroductionDao,com.util.StringUtil"
    pageEncoding="utf-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>doPhonePage.jsp</title>
</head>
<%

int pageSize = 3;
String sql="select * from pu_instroduction";
String sql2="select count(*) as total from pu_instroduction";
StringBuffer sb = new StringBuffer(sql);
StringBuffer sb2 = new StringBuffer(sql2);

int nowPage = request.getParameter("page") == null ?1:Integer.parseInt(request.getParameter("page"));

if (StringUtil.isNotEmpty(request.getParameter("type") )) {
					    								    	  
	 sb.append("  and pu_instroduction.type like '%" +request.getParameter("type") + "%'");
	 sb2.append(" and pu_instroduction.type like '%" +request.getParameter("type") + "%'");
	 
}
if (StringUtil.isNotEmpty(request.getParameter("system") )) {
	sb.append(" and pu_instroduction.pu_id system '%" +request.getParameter("system") + "%'");
	sb2.append(" and pu_instroduction.pu_id system '%" +request.getParameter("system") + "%'");
    }
    if (StringUtil.isNotEmpty(request.getParameter("brand"))) {
	sb.append(" and pu_instroduction.brand like '%" + request.getParameter("brand") + "%'");
	sb2.append(" and pu_instroduction.brand like '%" + request.getParameter("brand") + "%'");
    }
    if (StringUtil.isNotEmpty(request.getParameter("name"))) {
	sb.append("and pu_instroduction.name like '%" + request.getParameter("name") + "%'");
	sb2.append("and pu_instroduction.name like '%" + request.getParameter("name") + "%'");
    }

String str2=sb2.toString().replaceFirst("and", "where");

puIntroductionDao dao2=new puIntroDaoImpl();
int totalNum= dao2.Count(str2) ;					
int totalPageCount=totalNum/pageSize; 
if(totalPageCount==0)
		totalPageCount=1;
int PreviousPage=(nowPage-1<=0)?1:nowPage-1;
int nextPage=(nowPage+1>=totalPageCount)?totalPageCount:(nowPage+1);
int offset=(nowPage-1)*pageSize;  

sb.append(" limit "+offset+","+pageSize);
String str=sb.toString().replaceFirst("and", "where");


String url_one="doPhonePage.jsp?page=1";
String url_two="doPhonePage.jsp?page="+PreviousPage;
String url_three="doPhonePage.jsp?page="+nextPage;
String url_four="doPhonePage.jsp?page="+totalPageCount; 

StringBuffer url_ones = new StringBuffer(url_one);
StringBuffer url_twos = new StringBuffer(url_two);
StringBuffer url_threes = new StringBuffer(url_three);
StringBuffer url_fours = new StringBuffer(url_four);

if (StringUtil.isNotEmpty(request.getParameter("type") )) {
	  
	url_ones.append(" &type=" +request.getParameter("type"));
	url_twos.append(" &type=" +request.getParameter("type"));
	url_threes.append(" &type=" +request.getParameter("type"));
	url_fours.append(" &type=" +request.getParameter("type"));
	 
}
String url_onest=url_ones.toString();
String url_twost=url_twos.toString();
String url_threest=url_threes.toString();
String url_fourst=url_fours.toString();

String show="";

StringBuffer sh = new StringBuffer(show);
sh.append("<div class='wrapper'>"+					
		    "<div class='bs-example bs-example-tabs' role='tabpanel' data-example-id='togglable-tabs'>"+					     
		      "<div id='myTabContent' class='tab-content'>"+						
			    "<div id='container'>"+
             	   "<ul class='list'>");							 
List<puIntroduction>list=null;
puIntroductionDao dao=new puIntroDaoImpl();
String sql3=sb.toString();
list=dao.getPageIntro(sql3);


 if(list==null||list.size()<1)
 {
	  sh.append("相关商品还没有上架哦~ ");
 }
 
 for( puIntroduction pt:list){ 						  
	    
	  sh.append(" <a href='single.jsp?pu_id="+pt.getPu_id()+"'><li>"+                									
	   " <img src='images/imgs/"+pt.getPics()+"alt='shouji'/>"+
		"<section class='list-left'>"+
		"<h5 class='title'>"+pt.getName()+"</h5>"+
		"<span class='adprice'>$290</span>"+
		"<p class='catpath'>"+pt.getBrand()+"</p></section>"+									
		"<section class='list-right'>"+
		   "<span class='date'>上架时间, 17:55</span>"+									
		"</section>"+
		"<div class='clearfi'></div></li>"+									
 "</a>");                                                   
       }
 sh.append("</ul>"+
			"</div>"+
	  	  "</div>"+					 
		"</div>"+						
		"</div>"+
		"<ul class='pagination pagination-sm'>"+	
	    "<li><a href=javascript:page('show','"+url_onest+"')>首页</a></li>"+				
		"<li><a href=javascript:page('show','"+url_twost+"'); >上一页</a></li>"+
		"<li>当前第"+nowPage+"/"+totalPageCount+"页</li>"+							
		"<li><a href=javascript:page('show','"+url_threest+"');>下一页</a></li>"+
		"<li><a href=javascript:page('show','"+url_fourst+"');>末页</a></li>"+							
	"</ul>"+					 					
	  "</div>"+
	"</div>"+				
"</div>");  
 	
 
 %>
<body>

<%=sh %>

</body>
</html>