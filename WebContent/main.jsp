<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>库存管理系统主界面</title>
<%
	// 权限验证
	if(session.getAttribute("currentUser")==null){
		response.sendRedirect(".jsp");
		return;
	}
%>
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	$(function(){
		// 数据
		var treeData=[{
			text:"手机商城管理系统",
			iconCls:"icon-menu",//指定图标，需要关联css样式
			children:[{
				text:"手机概要信息管理",
				iconCls:"icon-girl",
				attributes:{
					url:"SupplyManManage.jsp"
				}
			},{
				text:"手机详细信息管理",
				iconCls:"icon-type",
				attributes:{
					url:"GoodsTypeManage.jsp"
				}
			},{
				text:"用户管理",
				iconCls:"icon-goods",
				attributes:{
					url:"admin.jsp"
				}
			},{
				text:"管理员管理",
				iconCls:"icon-supply",
				attributes:{
					url:"SaveGoods.jsp"
				}
			},{
				text:"用户评论管理",
				iconCls:"icon-in",
				attributes:{
					url:"InGoods.jsp"
				}
			
			}]
		}];
		
		// 实例化树菜单
		$("#tree").tree({
			data:treeData,
			lines:true,
			onClick:function(node){
				if(node.attributes){
					openTab(node.text,node.attributes.url);
				}
			}
		});
		
		// 新增Tab
		function openTab(text,url){
			if($("#tabs").tabs('exists',text))//通过'exists'判断是否存在tab,否则通过'add'添加tab
			{        
				$("#tabs").tabs('select',text);
			}else{
				var content="<iframe frameborder='0' scrolling='auto' style='width:100%;height:100%' src="+url+"></iframe>";
				$("#tabs").tabs('add',{
					title:text,
					closable:true, //可关闭的
					content:content
				});
			}
		}
	});
</script>
</head>
<body class="easyui-layout">

          <!-- layout是一个容器,它有5个区域:north,south,east,west,center(必选),所有周边区域的panel可以改变大小通过拖动边框,他们也可以折叠(collapse)通过点击触发折叠事件,布局可以嵌套,因此用户可以创建你想要的复杂布局;-->
          <!--在这里   north显示当前用户和退出登录 ,west创建一个树形菜单（tree）,center创建一个 tabs 容器 。-->
          
	<div region="north" style="height: 85px;background-color: #E0EDFF">
		<div align="left" style="float: left; height:80px"></div>
		<div style="padding-top: 50px;padding-right: 20px; float:right">当前用户：&nbsp;<font color="red" >${currentUser.adminName}</font><a href="login!logout" style="margin-left:20px;text-decoration:none">注销登录</a></div>		
	</div>
	
	<div region="west" style="width: 150px;" title="导航菜单" split="true">
		<ul id="tree"></ul>
	</div>
	
	<div region="center">
		<div class="easyui-tabs" fit="true" border="false" id="tabs">
			<div title="首页" >
				<div align="center" style="padding-top: 100px;"><font color="red" size="10">欢迎您使用本系统</font></div>
			</div>
		</div>
	</div>
	
	
</body>
</html>