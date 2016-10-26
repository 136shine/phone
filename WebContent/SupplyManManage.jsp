<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>手机概要信息管理</title>
<script type="text/javascript">

</script>
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
var url;
function deleteSupplyMan(){
	
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要删除的数据！");
			return;
		}
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].pu_id);    //push() 方法可向数组的末尾添加一个或多个元素，并返回新的长度。			
		}		
		var ids=strIds.join(",");     //将一数组按照JOIN的参数连接起来。1,2,3,4
		$.messager.confirm("系统提示","您确认要删掉这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){ //单击了确定按钮
				$.post("supply!delete",{delIds:ids},function(result){
					                 /*jQuery.post(url,data,success(data, textStatus, jqXHR),dataType)
					                   url:必需。规定把请求发送到哪个 URL。
					                   data:可选。映射或字符串值。规定连同请求发送到服务器的数据。
					                   success:可选。请求成功时执行的回调函数。
					                 */
					                
					if(result.success){
						$.messager.alert("系统提示","您已成功删除<font color=red>"+result.delNums+"</font>条数据！");
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert('系统提示',result.errorMsg);
					}
				},"json");
			}
		});              
	}
//搜索	
function searchSupplyMan(){ 
	
    $('#dg').datagrid('load',{ //table id="dg"
    	pu_id:$('#pu_id').val(),
		name:$('#name').val(),
		system:$('#system').val(),
		internet:$('#internet').val()
	});
    alert(pu_id,name,system,internet);
}
//打开添加框
function openSupplyManAddDialog(){ 
	$("#dlg").dialog("open").dialog("setTitle","添加手机概要信息"); //弹出窗口 id=dlg 使用open方法打开对话框 添加标题
	url="supply!save";  //通过struts2 SupplyAction.save()
}
//在弹出窗口点击保存
function saveSupplyMan(){     
	
	$("#fm").form("submit",{       //弹出窗口 <form id="fm">
		url:url,                  //表单提交的地址
	onSubmit:function(){         //  onSubmit 提交之前触发的事件，如果返回false可以防止提交
		return $(this).form("validate");   //表单字段的验证，如果返回true，则说明所有的字段都是合法的
	},
	success:function(result){    //success 表单提交成功的时候触发
		//此处result={"Success":true}实际为字符串，而不是json对象，需要用如下代码处理  
		
		//var result = eval('('+result+')');  
	    var result = jQuery.parseJSON(result);  
		if(result.errorMsg){
			$.messager.alert("系统提示",result.errorMsg);
			return;
		}else{
			$.messager.alert("系统提示","保存成功ok");
			resetValue();
			$("#dlg").dialog("close");
			$("#dg").datagrid("reload");//table id="dg"  重新加载，分页时加载当前页数据
			
		}
	}
	});
}

function openSupplyManAtModifyDialog(){  //打开编辑框
	var selectedRows=$("#dg").datagrid('getSelections');  //table id="dg"  返回所有被选中的行
	if(selectedRows.length!=1){
		$.messager.alert("系统提示","请选择一条要编辑的数据");
		return;
	}
	var row=selectedRows[0];	
	$("#dlg").dialog("open").dialog("setTitle","编辑供应商信息");//弹出窗口  id="dlg"

	//$("#s_pu_id").val(row.pu_id);
	$("#s_brand").val(row.brand);
	
	$("#s_name").val(row.name);
	$("#s_runstore").val(row.runstore);
	$("#s_system").val(row.system);
	
	$("#s_pixel").val(row.pixel);
	$("#s_ratio").val(row.ratio);
	$("#s_internet").val(row.internet);
	
	$("#s_pics").val(row.pics);
	$("#s_type").val(row.type);
	$("#s_size").val(row.size);
	
	$("#s_version").val(row.version);
	$("#s_menu").val(row.menu);
	$("#s_afterSold").val(row.afterSold);
	
	url="supply!save?pu_id="+row.pu_id;
}
function resetValue(){   //重置
	
	//$("#s_pu_id").val("");	
	$("#s_brand").val("");
	
	$("#s_name").val("");
	$("#s_runstore").val("");	
	$("#s_system").val("");
	
	$("#s_pixel").val("");
	$("#s_ratio").val("");
	$("#s_internet").val("");
	
	$("#s_pics").val("");
	$("#s_type").val("");
	$("#s_size").val("");
	
	$("#s_version").val("");
	$("#s_menu").val("");
	$("#s_afterSold").val("");
	
}
function closeSupplyMantDialog(){   //弹出对话框  id="dlg"
	$("#dlg").dialog("close");    //关闭对话框
	resetValue();
}
function exportSupplyMan(){
	$("#export").form("submit",{     //导出 id="export"
		url:"supply!export"         //SupplyAction.export()
	});
}
</script>

</head>
<body style="margin:5px">
<table id="dg" title="供应商信息" class="easyui-datagrid" fitColumns="true"
	 pagination="true" rownumbers="true" url="supply" fit="true" toolbar="#tb">  
	                                   <!--url="supply"通过struts提交给SupplyAction并直接调用execute()方法   toolbar添加工具栏  -->
		<thead><!-- 表头 -->
			<tr>
				<th field="cb" checkbox="true"></th>				
				<th field="pu_id" width="100" align="center">编码</th>
				<th field="brand" width="250" align="center">品牌</th>
				
				<th field="name" width="100" align="center" >手机名称</th>
				<th field="runstore" width="250" align="center">运行内存</th>
				<th field="system" width="250" align="center">系统</th>
				
				<th field="pixel" width="100"  align="center">像素</th>				
				<th field="ratio" width="100" align="center">分辨率</th>		
				<th field="internet" width="250" align="center">网络</th>	
					
				<th field="pics" width="250" align="center">图片</th>
				<th field="type" width="250" align="center">类型</th>
				<th field="size" width="250" align="center">屏幕大小</th>
				
				<th field="version" width="250" align="center">版本</th>
				<th field="menu" width="250" align="center">包装清单</th>
				<th field="afterSold" width="250" align="center">售后服务</th>
				
			</tr>
		</thead>
</table>
	<div id="tb">
		<div>
			<a href="javascript:openSupplyManAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openSupplyManAtModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteSupplyMan()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
			<a href="javascript:exportSupplyMan()" class="easyui-linkbutton" iconCls="icon-export" plain="true">导出Execl</a>
			   <!-- plain="true" 窗体主体部分背景颜色透明 -->
			   <!--iconCls:图标 通过css实现   -->
			   <!-- class="easyui-linkbutton" 创建一个超链接按钮 它可以同时显示一个图标和文本,或只有图标或文字。-->
		</div>
		
		<div>
			<form id="export" method="post">						
		    &nbsp;编码：&nbsp;<input  id="pu_id" name="sm.pu_id" size="10"/>   
			&nbsp;手机名称：&nbsp;<input  id="name" name="sm.name" size="10" />   					
			&nbsp;系统：&nbsp;<input  id="system" name="sm.system" size="10" />		
			&nbsp;网络：&nbsp;<input  id="internet" name="sm.internet" size="10" />			
			<a href="javascript:searchSupplyMan()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
			</form>
		</div>
	</div>
	
	<!-- 弹出窗口 -->	
	<div id="dlg" class="easyui-dialog" style="width: 570px;height: 340px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="5px;">
				<tr>							
					<td>品牌：</td>
					<td><input type="text" name="sm.brand" id="s_brand" class="easyui-validatebox" data-options="required:true"/></td>					
				</tr>				
				<tr>	
			    	<td>名称</td>
					<td><input class="easyui-validatebox" name="sm.name" id="s_name" required="true"  /></td>
					<td valign="top">运行内存</td>
					<td><input type="text"  name="sm.runstore" id="s_runstore"class="easyui-validatebox" data-options="required:true"/></td>									
					
									
				</tr>
				<tr>	
			     	<td>系统：</td>
					<td><input type="text" name="sm.system" id="s_system" class="easyui-validatebox" data-options="required:true"/></td>					
					<td>像素</td>
					<td><input class="easyui-validatebox" name="sm.pixel" id="s_pixel" required="true"  /></td>
				</tr>
				<tr>
					<td>分辨率</td>
					<td><input class="easyui-validatebox" name="sm.ratio" id="s_ratio" required="true"  /></td>	
					<td>网络：</td>
					<td><input type="text" name="sm.internet" id="s_internet" class="easyui-validatebox" data-options="required:true"/></td>	
								
				</tr>
				<tr>
				    <td valign="top">图片</td>
					<td><input type="text"  name="sm.pics" id="s_pics"class="easyui-validatebox" data-options="required:true"/></td>	
					<td valign="top">类型</td>
					<td><input type="text"  name="sm.type" id="s_type"class="easyui-validatebox" data-options="required:true"/></td>						
				</tr>
				<tr>	
					<td valign="top">屏幕大小</td>
					<td><input type="text"  name="sm.size" id="s_size"class="easyui-validatebox" data-options="required:true"/></td>			
					<td>版本：</td>
					<td><input type="text" name="sm.version" id="s_version" class="easyui-validatebox" data-options="required:true"/></td>	
		        <tr>			
					<td>包装清单：</td>
					<td><input type="text" name="sm.menu" id="s_menu" class="easyui-validatebox" data-options="required:true"/></td>
					<td>售后保障：</td>
					<td><input type="text" name="sm.afterSold" id="s_afterSold" class="easyui-validatebox" data-options="required:true"/></td>					
				</tr>
			</table>
		</form>
	</div>
	<!-- 弹出窗口的保存和关闭按钮 -->
	<div id="dlg-buttons">
		<a href="javascript:saveSupplyMan()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeSupplyMantDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>