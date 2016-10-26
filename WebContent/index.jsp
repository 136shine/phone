<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*,entity.pics,dao.impl.picsDaoImpl,daoo.picsDao,entity.puIntroduction,dao.impl.puIntroDaoImpl,daoo.puIntroductionDao"
    pageEncoding="utf-8"%>
    
	<%--taglib directive --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-select.css">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
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
<link href="css/header.css">
</head>
<body onload="_load()">
	<div class="header">
		<c:import url="header.jsp"></c:import>
	</div>
	<div class="main-banner banner text-center">
	  <div class="container">    
			<h1>热门   <span class="segment-heading">    手机的 </span> 世界</h1>
			<p>热门手机随心挑</p>			
			<!--<a href="post-ad.html">Post Free Ad</a>  -->
	  </div>
	</div>
	
	<!-- content-starts-here -->
	<div class="content">
			<div class="categories">
				<div class="container">
	<%
	List<pics>list=null;
	picsDao dao=new picsDaoImpl();
	list=dao.getPicByPuid(0);
	if(list==null||list.size()<1)
    {
  	  out.print("<tr><td>无信息hh！</td></tr>");
    }
    else{
    	
    for( pics pt:list){ 
	int i=1;
	
	%>	
					<div class="col-md-2 focus-grid">
						<a href="all-classifieds.jsp?type=<%=pt.getType() %> ">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image"><img src="images/imgs/<%=pt.getPics() %>"></div><%=pt.getType() %>
									<!-- <h4 class="clrchg">Mobiles</h4> -->
								</div>
							</div>
						</a>
					</div>					
					
					<% 
	              }	
                }    
					%>
					
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="trending-ads">
				<div class="container">
				<!-- slider -->
				<div class="trend-ads">
					<h2>Trending Ads</h2>
							<ul id="flexiselDemo3">
								<li>
								<%
						         List<puIntroduction>list2=null;
						         puIntroductionDao dao2=new puIntroDaoImpl();
						         list2= dao2.getSomePuIntro(0, 4);						        						        
								for(puIntroduction pu:list2){
								%>
								
									<div class="col-md-3 biseller-column">
										<a href="single.jsp?pu_id=<%=pu.getPu_id() %>">
											<img src="images/imgs/<%=pu.getPics() %>"/>											
										</a> 
										<div class="ad-info">
											<h5><%=pu.getName() %></h5>											
										</div>
									</div>
								<%} %>
									
								</li>
								
								<li>
								<%
						         List<puIntroduction>list3=null;
						         puIntroductionDao dao3=new puIntroDaoImpl();
						         list3= dao3.getSomePuIntro(4, 4);						        						        
								 for(puIntroduction pu2:list3){
								%>
									<div class="col-md-3 biseller-column">
										<a href="single.jsp?pu_id=<%=pu2.getPu_id() %>">
											<img src="images/imgs/<%=pu2.getPics() %>"/>											
										</a> 
										<div class="ad-info">
											<h5><%=pu2.getName() %></h5>											
										</div>
									</div>
								<%} %>
									
								</li>
								
													
						</ul>
					
					</div>   
			</div>
			<!-- //slider -->				
			</div>
			<div class="mobile-app">
				<div class="container">
					<div class="col-md-5 app-left">
						<a href="mobileapp.html"><img src="images/app.png" alt=""></a>
					</div>
					<div class="col-md-7 app-right">
						<h3>热门手机信息</h3>
						<p>热门手机销售，为您提供多款热门手机价格配置等信息，找到属于你的那一款手机</p>
						<div class="app-buttons">
							<div class="app-button">
								<a href="#"><img src="images/1.png" alt=""></a>
							</div>
							<div class="app-button">
								<a href="#"><img src="images/2.png" alt=""></a>
							</div>
							<div class="clearfix"> </div>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
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
<!-- js -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<!-- js -->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
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
<!-- Source -->
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


<script type="text/javascript">
						 $(window).load(function() {
							$("#flexiselDemo3").flexisel({
								visibleItems:1,
								animationSpeed: 1000,
								autoPlay: true,
								autoPlaySpeed: 5000,    		
								pauseOnHover: true,
								enableResponsiveBreakpoints: true,
								responsiveBreakpoints: { 
									portrait: { 
										changePoint:480,
										visibleItems:1
									}, 
									landscape: { 
										changePoint:640,
										visibleItems:1
									},
									tablet: { 
										changePoint:768,
										visibleItems:1
									}
								}
							});
							
						});
					   </script>
					   <script type="text/javascript" src="js/jquery.flexisel.js"></script>
</body>
</html>