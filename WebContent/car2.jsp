<%@ page language="java" import="java.util.*,entity.puIntroduction,dao.impl.puIntroDaoImpl,daoo.puIntroductionDao" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

	<%--taglib directive --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    
<!DOCTYPE html>
<html>
<head>
<title>Checkout</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Classic Style Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />

<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style_c.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />

<!-- //animation-effect -->
<link href='http://fonts.useso.com/css?family=Cabin:400,500,600,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Lato:400,100,300,700,900' rel='stylesheet' type='text/css'></head>
	
<body>
<!-- header -->
	<div class="header">
		<c:import url="header.jsp"></c:import>
	</div>
<!-- //header -->
<!--banner-->

<!-- contact -->
<div class="check-out">	 
<div class="container">	
 <table class="table animated wow fadeInLeft" data-wow-delay=".5s">
		  <tr style="font-size:22px;font-weight:200px;color:#000;">
			<th class="t-head head-it ">Item</th>
			<th class="t-head">Price</th>
			<th class="t-head">Quantity</th>
			<th class="t-head">Total</th>
		  </tr>
		  
		  <%
		List<puIntroduction>list=null;						
		puIntroductionDao dao=new puIntroDaoImpl();
		
		String sql="select * FROM pu_instroduction WHERE  pu_id IN(  select distinct(pu_id) from car where Uid=1)";
		list=dao.getPageIntro(sql);
		if(list==null||list.size()<1)
	      {
	    	  out.print("<tr><td>无信息hh！</td></tr>");
	      }
	      else{
		      for(puIntroduction p:list){
			%>
			
			 <tr class="cross">
			 <td class="ring-in t-data">
				 <a href="single.jsp?pu_id=<%=p.getPu_id() %>" class="at-in"><img src="images/imgs/<%=p.getPics() %>" class="img-

responsive" alt=""></a>				
			     <div class="sed"><h5><%=p.getBrand() %></h5></div>				
				 <div class="clearfix"> </div>
				 <div class="close1"> </div>
			  </td>
			 <td class="t-data"><%=p.getPrice() %></td>
			
			 <td class="t-data"><div class="quantity"> 
								<div class="quantity-select">            
									<div class="entry value-minus">&nbsp;</div>
										<div class="entry value"><span class="span-1">1</span></div>			

						
									<div class="entry value-plus active">&nbsp;</div>
								</div>
							</div>			
			 </td>
			 <td class="t-data"><%=p.getPrice() %></td>			
		  </tr>
			
			
		<%
		}
	      }	%>					 						
	
				
		 
		  
	</table>
				<div class=" cart-total">
			
			 <h5 class="continue" >Cart Total</h5>
			<!--  <div class="price-details">
				 <h3>Price Details</h3>
				 <span>Total</span>
				 <span class="total1">6200.00</span>
				 <span>Discount</span>
				 <span class="total1">---</span>
				 <span>Delivery Charges</span>
				 <span class="total1">150.00</span>
				 <div class="clearfix"></div>				 
			 </div>	 -->
			 <ul class="total_price">
			   <li class="last_price"> <h4>TOTAL</h4></li>	
			   <li class="last_price"><span style="color:red;font-weight:bold;">6350.00</span></li>
			   <div class="clearfix"> </div>
			 </ul>
			
			 <a href="single.jsp">Produced By Cart</a>
			 
			</div>
			
		
		 </div>
		 </div>
		 				
			


<!-- footer -->
	<footer style="margin-top:20px;">
			<%-- <div class="footer-top">
				<div class="container">
					<c:import url="footer_index.jsp"></c:import>
											
				</div>	
			</div>	 --%>
			<div class="footer-bottom text-center">
			  <c:import url="footer_bottom.jsp"></c:import>
		</div>
		</footer>
<!-- //footer -->
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- js -->
<script src="js/jquery.min.js"></script>
<!-- //js -->
<!-- cart -->
<script src="js/simpleCart.min.js"></script>
<!-- cart -->
<!-- for bootstrap working -->
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //for bootstrap working -->
<!-- animation-effect -->
<link href="css/animate.min.css" rel="stylesheet"> 
<script src="js/wow.min.js"></script>
<script>
 new WOW().init();
</script>

<script>$(document).ready(function(c) {
					$('.close1').on('click', function(c){
						$('.cross').fadeOut('slow', function(c){
							$('.cross').remove();
						});
						});	  
					});
			   </script>
			<script>$(document).ready(function(c) {
					$('.close2').on('click', function(c){
						$('.cross1').fadeOut('slow', function(c){
							$('.cross1').remove();
						});
						});	  
					});
			   </script>	
			   <script>$(document).ready(function(c) {
					$('.close3').on('click', function(c){
						$('.cross2').fadeOut('slow', function(c){
							$('.cross2').remove();
						});
						});	  
					});
			   </script>	
			   <!--quantity-->
			<script>
			$('.value-plus').on('click', function(){
				var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)+1;
				divUpd.text(newVal);
			});

			$('.value-minus').on('click', function(){
				var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)-1;
				if(newVal>=1) divUpd.text(newVal);
			});
			</script>
			<!--quantity-->
</body>
</html>
