<%@ page language="java" import="java.util.*,entity.puIntroduction,dao.impl.puIntroDaoImpl,daoo.puIntroductionDao" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	<%--taglib directive --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<title>All Classifieds</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-select.css">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" href="css/jquery-ui1.css">
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

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

<link href="css/jquery.uls.css" rel="stylesheet"/>
<link href="css/jquery.uls.grid.css" rel="stylesheet"/>
<link href="css/jquery.uls.lcd.css" rel="stylesheet"/>
<!-- Source -->
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
    function page(num,url){	    
  	  send_request(url);
  	  reobj=num;
    }	
  
</script>
</head>
<body>
<div class="header">
		<c:import url="header.jsp"></c:import>
	</div>
	<div class="banner text-center">
	  <div class="container">    
			<h1>热门   <span class="segment-heading">    手机的 </span> 世界</h1>
			<p>热门手机随心挑</p>
			<a href="post-ad.html">Post Free Ad</a>
	  </div>
	</div>
	<!-- Products -->
	<div class="total-ads main-grid-border">
		<div class="container">
			<div class="select-box">
				<div class="select-city-for-local-ads ads-list">
					<label>品牌选择</label>
						<select>
										<optgroup label="热门品牌">													
													<option>华为</option>
													<option>小米</option>
													<option>Apple</option>
													<option>魅族（MEIZU）</option>
													<option>三星（SAMSUNG）</option>
													<option>乐视（letv）</option>													
										</optgroup>											
			            </select>
				</div>
				<div class="browse-category ads-list">
					<label>操作系统</label>
					<select class="selectpicker show-tick" data-live-search="true">
							  <option>安卓（Android）</option>
							  <option >苹果（IOS）</option>							
							  <option >Flyme os</option>							
					</select>
				</div>
				<div class="search-product ads-list">
					<label></label>商品搜索
					<div class="search">
						<div id="custom-search-input">
						<div class="input-group">
							<input type="text" class="form-control input-lg" placeholder="请输入..." />
							<span class="input-group-btn">
								<button class="btn btn-info btn-lg" type="button">
									<i class="glyphicon glyphicon-search"></i>
								</button>
							</span>
						</div>
					</div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="all-categories">
				<h3> 商品筛选</h3>
				<ul class="all-cat-list">
					<li><a href='all-classifieds.jsp?type=1'>华为<span class="num-of-ads">(5,78,076)</span></a></li>
					<li><a href="all-classifieds.jsp?type=2">小米 <span class="num-of-ads">(3,66,495)</span></a></li>
					<li><a href="all-classifieds.jsp?type=3">Apple<span class="num-of-ads">(45,450)</span></a></li>
					<li><a href="all-classifieds.jsp?type=4">魅族（MEIZU）<span class="num-of-ads">(1,77,145)</span></a></li>
					<li><a href="all-classifieds.jsp?type=5">三星（SAMSUNG）<span class="num-of-ads">(1,81,250)</span></a></li>
					<li><a href="all-classifieds.jsp?type=6">乐视（letv）<span class="num-of-ads">(1,81,250)</span></a></li>
				</ul>
				
				<ul class="all-cat-list">								
				    <li><a href="all-classifieds.jsp?">移动4G/联通4G/电信4G </a></li>
					<li><a href="all-classifieds.jsp?">移动4G </a></li>
					<li><a href="all-classifieds.jsp?">联通4G </a></li>
					<li><a href="all-classifieds.jsp?">电信4G</a></li>
					<li><a href="all-classifieds.jsp?">双卡单4G </a></li>
					<li><a href="all-classifieds.jsp?">双卡双4G</a></li>
					<li><a href="all-classifieds.jsp?">其他</a></li>
				</ul>
				 
				<ul class="all-cat-list">	
				    <li><a href="all-classifieds.jsp?">屏幕尺寸：</a></li>							
				    <li><a href="all-classifieds.jsp?">5.6英寸及以上 </a></li>
					<li><a href="all-classifieds.jsp?">5.5-5.1英寸</a></li>
					<li><a href="all-classifieds.jsp?">5.0-4.6英寸 </a></li>
					<li><a href="all-classifieds.jsp?">4.5-3.1英寸</a></li>
					<li><a href="all-classifieds.jsp?">3.0英寸及以下 </a></li>									
				</ul>
			</div>
			<ol class="breadcrumb" style="margin-bottom: 5px;">
			  <li><a href="index.jsp">Home</a></li>
			  <li class="active">All Ads</li>
			</ol>
			<div class="ads-grid">
				<div class="side-bar col-md-3">
					<div class="search-hotel">
					<h3 class="sear-head">Name contains</h3>
					<form>
						<input type="text" value="Product name..." onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Product name...';}" required="">
						<input type="submit" value=" ">
					</form>
				</div>
				
				<div class="range">
					<h3 class="sear-head">Price range</h3>
							<ul class="dropdown-menu6">
								<li>             
									<div id="slider-range"></div>							
									<input type="text" id="amount" style="border: 0; color: #ffffff; font-weight: normal;" />
							   </li>			
							</ul>
							
							
				</div>
				<div class="featured-ads">
					<h2 class="sear-head fer">Featured Ads</h2>
					<div class="featured-ad">
						<a href="single.jsp">
							<div class="featured-ad-left">
								<img src="images/f1.jpg" title="ad image" alt="" />
							</div>
							<div class="featured-ad-right">
								<h4>Lorem Ipsum is simply dummy text of the printing industry</h4>
								<p>$ 450</p>
							</div>
							<div class="clearfix"></div>
						</a>
					</div>
					<div class="featured-ad">
						<a href="single.jsp">
							<div class="featured-ad-left">
								<img src="images/f2.jpg" title="ad image" alt="" />
							</div>
							<div class="featured-ad-right">
								<h4>Lorem Ipsum is simply dummy text of the printing industry</h4>
								<p>$ 380</p>
							</div>
							<div class="clearfix"></div>
						</a>
					</div>
					<div class="featured-ad">
						<a href="single.jsp">
							<div class="featured-ad-left">
								<img src="images/f3.jpg" title="ad image" alt="" />
							</div>
							<div class="featured-ad-right">
								<h4>Lorem Ipsum is simply dummy text of the printing industry</h4>
								<p>$ 560</p>
							</div>
							<div class="clearfix"></div>
						</a>
					</div>
					<div class="clearfix"></div>
				</div>
				</div>
				<div class="ads-display col-md-9">
					<div class="wrapper">					
					<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
					  <ul id="myTab" class="nav nav-tabs nav-tabs-responsive" role="tablist">
						<li role="presentation" class="active">
						  <a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">
							<span class="text">All Ads</span>
						  </a>
						</li>
						
					  </ul>
					  <div id="myTabContent" class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
						   <div>
							<div id="container">
								<div class="view-controls-list" id="viewcontrols">
									<label>view :</label>
									<a class="gridview"><i class="glyphicon glyphicon-th"></i></a>
									<a class="listview active"><i class="glyphicon glyphicon-th-list"></i></a>
								</div>
								
								<div class="clearfix"></div>
							<ul class="list">
							
					
							   
						  <%
						     List<puIntroduction>list=null;
						     String type = request.getParameter("type");
						     String cpage=request.getParameter("cPage");    
						     System.out.print("cPage="+cpage);
						     System.out.print("type="+type);
						     puIntroductionDao dao=new puIntroDaoImpl();
						    
						     String Type="";
						     int cPage=0;				     
						      if((type==null||type=="")&&(cpage==null)){
						    		  cPage=1;
						    	  list = dao.getAllPuIntro(1, 3);	
						    	  }   
						     else if((type==null||type=="")&&(cpage!=null)){
						    	      Type="";
						    		  cPage= Integer.parseInt(cpage);
						    		  list=(List)request.getAttribute("list");
						    		  System.out.println("1cPage的值为："+cPage); 
						    	  }
						      else if(type!=null&&cpage==null){
						    	  cPage=1;
						    	  Type=type;						    	  
						    	  list=dao.getPuIntroByType(Type);
						    	  System.out.println("2type的值为："+Type);
						      }
						      else if(type!=null&&cpage!=null){
						    	  cPage= Integer.parseInt(cpage.toString());
						    	  //Type=type;
						    	  list = (List)request.getAttribute("list");
						    	  System.out.println("3type的值为："+type);
						      }
						      if(list==null||list.size()<1)
						      {
						    	  out.print("<tr><td>无信息hh！</td></tr>");
						      }
						      else{
						      for( puIntroduction pt:list){ 
						  
						  %>   
						     <a href='single.jsp?pu_id=<%=pt.getPu_id() %>'>                    
									<li>
								   <img src="images/imgs/<%=pt.getPics() %>" title="" alt="shouji" />
									<section class="list-left">
									<h5 class="title"><%=pt.getName() %></h5>
									<span class="adprice">$290</span>
									<p class="catpath"><%=pt.getBrand() %></p>
									</section>
									<section class="list-right">
									<span class="date">上架时间, 17:55</span>
									<span class="cityname">City name</span>
									</section>
									<div class="clearfix"></div>
									</li> 
					</a>
                    
                               <% 
                                    }
						         }
						        %>
								
								
							</ul>
						</div>
							</div>
						</div>
						
						</div>
						 <form id="form1" action="doPhonePage.jsp" method="post">
						<ul class="pagination pagination-sm">
						
							<li><input type="submit" name="page" value="" > <a href='doPhonePage.jsp?page=<%=cPage-1%>&type=<%=type%>'>上一页</a></li>
							<li><a href="#">当前页数:[<%=cPage %>]</a></li>							
							<li><a href='doPhonePage.jsp?page=<%=cPage+1%>&type=<%=type%>'>下一页</a></li>
							<!--<a href='<%=request.getContextPath() %>/servlet/phonePageServlet?page=<%=cPage-1%>&type=<%=type%>'>  -->
						</ul>
						</form>						 
						
					  </div>
					</div>
				</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>	
	</div>
	<!-- // Products -->
	<!--footer section start-->		
		<footer>
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
		</script>
    <script src="js/tabs.js"></script>
	
<script type="text/javascript">
$(document).ready(function () {    
var elem=$('#container ul');      
	$('#viewcontrols a').on('click',function(e) {
		if ($(this).hasClass('gridview')) {
			elem.fadeOut(1000, function () {
				$('#container ul').removeClass('list').addClass('grid');
				$('#viewcontrols').removeClass('view-controls-list').addClass('view-controls-grid');
				$('#viewcontrols .gridview').addClass('active');
				$('#viewcontrols .listview').removeClass('active');
				elem.fadeIn(1000);
			});						
		}
		else if($(this).hasClass('listview')) {
			elem.fadeOut(1000, function () {
				$('#container ul').removeClass('grid').addClass('list');
				$('#viewcontrols').removeClass('view-controls-grid').addClass('view-controls-list');
				$('#viewcontrols .gridview').removeClass('active');
				$('#viewcontrols .listview').addClass('active');
				elem.fadeIn(1000);
			});									
		}
	});
});
</script>
<script>
				$('#myModal').modal('');
				</script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
							<script type='text/javascript'>//<![CDATA[ 
							$(window).load(function(){
							 $( "#slider-range" ).slider({
										range: true,
										min: 0,
										max: 9000,
										values: [ 50, 6000 ],
										slide: function( event, ui ) {  $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
										}
							 });
							$( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) + " - $" + $( "#slider-range" ).slider( "values", 1 ) );

							});//]]>  

</script>
        
</body>
</html>