<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*,entity.puIntroduction,entity.pics,entity.deIntroduction,entity.userComment,
dao.impl.puIntroDaoImpl,dao.impl.picsDaoImpl,dao.impl.deIntroDaoImpl,daoo.deIntroDao,dao.impl.commentDaoImpl,
daoo.puIntroductionDao,daoo.picsDao,daoo.commentDao,
daoo.userDao,dao.impl.userDaoImpl,entity.user" 
    pageEncoding="utf-8"%>
    
<%--taglib directive --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%
int pu_id = Integer.parseInt(request.getParameter("pu_id"));
user user = null;
String username = "";
int uid;
HttpSession session3 = request.getSession();
if(null != session3.getAttribute("user")){
    user = (user)session3.getAttribute("user");
    username = user.getUsername() ;
    uid=user.getUid();
}
session3.setAttribute("pu_id", pu_id);

%>
<title>Single</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-select.css">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" href="css/tee.css">

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

<link rel="stylesheet" href="css/flexslider.css" media="screen" />

<script>
var http_request=false;
   function send_request(url){//初始化，指定处理函数，发送请求的函数
      http_request=false;
     //开始初始化XMLHttpRequest对象
      if(window.XMLHttpRequest){//Mozilla浏览器
         http_request=new XMLHttpRequest();
         if(http_request.overrideMimeType){//设置MIME类别
            http_request.overrideMimeType("text/xml");
        }
      }
      else if(window.ActiveXObject){//IE浏览器
        try{
            http_request=new ActiveXObject("Msxml2.XMLHttp");
        }catch(e){
          try{
            http_request=new ActiveXobject("Microsoft.XMLHttp");
          }catch(e){}
        }
     }
     if(!http_request){//异常，创建对象实例失败
       window.alert("创建XMLHttp对象失败！");
       return false;
     }
     http_request.onreadystatechange=processrequest;
    //确定发送请求方式，URL，及是否同步执行下段代码
     http_request.open("GET",url,true);
     http_request.send(null);
   }
   //处理返回信息的函数
    function processrequest(){
         if(http_request.readyState==4){
            if(http_request.status==200){
				document.getElementById(reobj).innerHTML=http_request.responseText;
            }
            else{
                alert("您所请求的页面不正常！");
            }
         }
    }

    function checkfourm(obj){
    	 
    	   var user= <%=username%>;
    	   if(user==''){ 	  
    	   document.getElementById("commentLogin").style.display="block";
           document.getElementById("comment").style.display="none";                 		   
        }
        else{	  
    	  document.getElementById("commentLogin").style.display="none"; 
          document.getElementById("comment").style.display="block";			
          var c=document.comment;
          var saytext=c.saytext.value;      
          if(saytext==""){
    		   document.getElementById("check").style.display="block";          
            return false;
          }
          else{
    		  document.getElementById("check").style.display="none";      
           send_request('comment.jsp?saytext='+saytext);
    		  c.saytext.value='';
           reobj=obj;
          }
        }
      }
function test(){	
	 var username= <%=username%>;	 
	   if(username==''){ 	  
		   alert("您还没有登陆请先登录！");
	   }
	   else{
		   alert("加入购物车成功！");
		   window.location.href="doCart.jsp?Uid="+uid+"&pu_id="+pu_id;			  
	   }	
}
    </script>  
   

</head>
<body>
<div class="header">
		<c:import url="header.jsp"></c:import>
		
	</div>
	<!-- <div class="banner text-center">
	  <div class="container">    
			<h1>Sell or Advertise   <span class="segment-heading">    anything online </span> with Resale</h1>
			<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>
			<a href="post-ad.html">Post Free Ad</a>
	  </div>
	</div> -->
	<!--single-page-->
	<div class="single-page main-grid-border">
		<div class="container">
			<ol class="breadcrumb" style="margin-bottom: 5px;">
				<li><a href="index.jsp">Home</a></li>
				<li><a href="all-classifieds.jsp">Mobile Phone</a></li>

			</ol>
			<div class="product-desc">
				<div class="col-md-7 product-view">
				<%
				
				puIntroduction pd=null;
				puIntroductionDao dao3=new puIntroDaoImpl();
				pd=dao3.getPuIntroById(pu_id);					
				if(pd==null)
					System.out.println("这里是single.jsp中puid值为："+pu_id);
				  
				%>
					<h2><%=pd.getName() %></h2>					
					<div class="flexslider">
						<ul class="slides">
						<%						 						
						List<pics>list=null;						
						picsDao dao=new picsDaoImpl();
						list=dao.getPicByPuid(pu_id);
						for(pics p:list){
						
						%>						
							<li data-thumb="images/imgs/<%=p.getPics() %>">
								<img src="images/imgs/<%=p.getPics() %>"/>
							</li>
							<%
							}
							%>
							
						</ul>
					</div>
					<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
					
				</div>
				<div class="col-md-5 product-details-grid">				
				
					<%					
				    List<deIntroduction>list2=null;
				    deIntroDao dao2=new deIntroDaoImpl();
				    list2=dao2.getDeIntroByPuid(pu_id);				 					
					%>					
					
					 <div class="item-price">
						<div class="mode">
							<span class="version">版本</span>
							<p><%=pd.getVersion() %></p>
							<div class="clearfix"></div>
						</div>
						
						<div class="mode">
							<span class="run_store">运行内存</span>
							<p><%=pd.getRunstore() %></p>
							<div class="clearfix"></div>
						</div>
						<div class="mode">
						   <span class="store">机身内存</span><p>
						<%
						  for(deIntroduction de:list2){
						%>							
							<%=de.getStroe() %>							
						<%
						  }
						%></p>							
							<div class="clearfix"></div>
						</div>
						<div class="mode">
							<span class="color">颜色</span><p>
						<%
						  for(deIntroduction de:list2){
						%>
							<%=de.getColor() %>
						<%
						  }
						%></p>
							<div class="clearfix"></div>
						</div>
						<div class="mode">						
							<span class="prices">价格</span><p>
							<% for(deIntroduction de:list2){
						%>
							$<%=de.getPrice() %>
							<%
						  }
						%></p>
							<div class="clearfix"></div>
						</div>
					
					</div>
					<!-- <div class="interested text-center">
						<h4>Interested in this Ad?<small> Contact the Seller!</small></h4>
						<p><i class="glyphicon glyphicon-earphone"></i>00-85-9875462655</p>
					</div> -->
						<!-- <div class="tips">
						<div class="form">
						<form action="" method="post" >
							<label autosize="true">用户名：</label><li>
							<input class="user" type="text" name="username" size="30"></li>							
							<label>留言内容:</label>
							<textarea rows="3" cols="35" name="comment"></textarea>
							<li><input class="btn" type="submit" value="提交评论" ></li>
						</form>
						</div>
						</div>  -->
						<div class="checkout">
							<a href="doCart.jsp?username=<%=username%>&pu_id=<%=pu_id%>"><input  class="car" type="button" onclick="test()" value="加入购物车" /></a>
							<a href=""><input type="button" value="立即购买" onClick="" /></a> 
						</div>
						
				</div>
			<div class="clearfix"></div>

			<div id="tab">
				<div class="wrap">
					<li class="parameter"><a href="#">规格参数</a></li>
					<li class="service"><a href="#">售后服务</a></li>
					<li class="comment"><a href="#">用户评论</a></li>
				</div>
				<div class="num">
					<table>
						<tbody>
							<tr><td>品牌</td><td><%=pd.getBrand() %></td></tr>
							<tr><td>型号</td><td><%=pd.getVersion() %></td></tr>
							<tr><td>系统</td><td><%=pd.getSystem() %></td></tr>
							<tr><td>像素</td><td><%=pd.getPixel()%></td></tr>
							<tr><td>屏幕大小</td><td><%=pd.getSize() %></td></tr>
							<tr><td>网络</td><td><%=pd.getInternet() %></td></tr>
																					
						</tbody>
					</table>
				</div>
				<div class="clearfix"></div>
				 <div class="num">
				 	<p><%=pd.getAfterSold() %></p>
				 </br>	包装清单</br>
				    <p><%=pd.getMenu() %></p>
				 </div>
				 
				 
				 <%		
				 int nowPage = request.getParameter("page") == null ?1:Integer.parseInt(request.getParameter("page"));
				 int pageSize = 2;
				 
				 String sql2="select count(*) as total from usercomment where usercomments pu_id="+pu_id;
				 commentDao dao5=new commentDaoImpl();
				 int totalNum= dao5.Count(sql2) ;
				 					
				 int totalPageCount=totalNum/pageSize; 
				 if(totalPageCount==0)
				 		totalPageCount=1;
				 int PreviousPage=(nowPage-1<=0)?1:nowPage-1;
				 int nextPage=(nowPage+1>=totalPageCount)?totalPageCount:(nowPage+1);
				 int offset=(nowPage-1)*pageSize; 
				 
				 String sql="select * from usercomment where pu_id="+pu_id+" order  by Cid desc limit "+offset+","+pageSize;
				 
				 String url_one="comment.jsp?page=1";
				 String url_two="comment.jsp?page="+PreviousPage;
				 String url_three="comment.jsp?page="+nextPage;
				 String url_four="comment.jsp?page="+totalPageCount; 
				 
				 
				    List<userComment>list3=null;
				    commentDao dao4=new commentDaoImpl();
				    list3=dao4.getPageCom(sql);
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
					
				   /*sh.append("<p id='commentLogin' style='text-align:center;padding:20px 0 ;display:none'>请<a href=''#' onClick='login()' style='color:#ff6400' >点击登录</a>后发表评论，我们喜欢真实的你！</p>"+             
					  "<form id='comment' name='comment' method='post'>"+
					    "<span>评论：</span>"+
						"<input name='saytext' id='saytext' class='com_tx' type='text'  size='100' />"+						
						"<input class='com_btn' type='button' onClick='checkfourm('show_two')' value='提交' />"+
						"<p id='check' style='float:left;display:none'><font color=red>您还没填写评论内容！</font></p>"+
			         "</form>"+						
				"</div>");*/
				    
				    
				%>
				
				
				<div  class="num">
				 <p id="commentLogin" style="text-align:center;padding:20px 0 ;display:none">请<a href='#' onClick='login()' style='color:#ff6400' >点击登录</a>后发表评论，我们喜欢真实的你！</p>             
					 <form id="comment"  name="comment" action="docomment.jsp?username=<%=username %>&pu_id=<%=pu_id %>" method="post">
					    <span>评论：</span>
						<input name="saytext" id="saytext" class="com_tx" type="text"  size="100" />												
						<input class="com_btn" type="submit" onclick=""  value="提交" />	
									
						<!-- <p id="check" style="float:left;display:none"><font color=red>您还没填写评论内容！</font></p> --> 
			       </form>
				   <div id="show_two" >
				       <%=sh %>
			       </div>
							       					
				</div>  
				</div>
				
			    <div class="clearfix"></div>
			
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
	<!--//single-page-->
	<!--footer section start-->		
		<footer style="margin-top:30px;">
			<div class="footer-top">
				<div class="container">
					<c:import url="footer_index.jsp"></c:import>					
				</div>	
			</div>	
			<div class="footer-bottom text-center">
			<c:import url="footer_bottom.jsp"></c:import>
		</div>
		</footer>
        <!--footer section end-->
<!-- js -->
<!-- FlexSlider -->
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap-select.js"></script>
<script>
  $(document).ready(function () {
    var mySelect = $('#first-disabled2');

    $('#special').on('click', function () {
      mySelect.find('option:selected').prop('disabled', true);
      mySelect.selectpicker('refresh');
    });

    $('#special2').on('click', function () {
      mySelect.find('option:disabled').prop('disabled', false);
      mySelect.selectpicker('refresh');
    });

    $('#basic2').selectpicker({
      liveSearch: true,
      maxOptions: 1
    });
  });
</script>
<script type="text/javascript" src="js/jquery.leanModal.min.js"></script>
<script src="js/jquery.uls.data.js"></script>
<script src="js/jquery.uls.data.utils.js"></script>
<script src="js/jquery.uls.lcd.js"></script>
<script src="js/jquery.uls.languagefilter.js"></script>
<script src="js/jquery.uls.regionfilter.js"></script>
<script src="js/jquery.uls.core.js"></script>
<script>
			$( document ).ready( function() {
				$( '.uls-trigger' ).uls( {
					onSelect : function( language ) {
						var languageName = $.uls.data.getAutonym( language );
						$( '.uls-trigger' ).text( languageName );
					},
					quickList: ['en', 'hi', 'he', 'ml', 'ta', 'fr'] //FIXME
				} );
			} );
			$(document).ready(function(){
				$('#tab').find('.num').eq(0).css('display','block');
				$('#tab .wrap').find('a').eq(0).css('color','#67C1B2');
				$('#tab .wrap').find('li').click(function(){
					var $index=$(this).index();
					$('#tab .wrap').find('a').css('color','#000').eq($index).css('color','#67C1B2');
					$('#tab').find('.num').css('display','none').eq($index).css('display','block');
				})
			});
		</script>
<script>
				$('#myModal').modal('');
				</script>
 <script defer src="js/jquery.flexslider.js"></script>
<script>
					// Can also be used with $(document).ready()
					$(window).load(function() {
					  $('.flexslider').flexslider({
						animation: "slide",
						controlNav: "thumbnails"
					  });
					});
					</script>

					
</body>
</html>