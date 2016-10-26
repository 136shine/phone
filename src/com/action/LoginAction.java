package com.action;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import com.dao.AdminDao;

import com.model.admin;
import com.util.DbUtil;
import com.util.StringUtil;

public class LoginAction extends ActionSupport implements ServletRequestAware{
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
private admin admin;
private String error;
private String imageCode;

public admin  getAdmin() {
	return admin;    //从form表单获取到user对象 就是 name="user.userName" 
}

public void setAdmin(admin admin) {
	this.admin = admin;
}

public String getError() {
	return error;
}

public void setError(String error) {
	this.error = error;
}


public String getImageCode() {
	return imageCode;
}

public void setImageCode(String imageCode) {
	this.imageCode = imageCode;
}
DbUtil dbUtil=new DbUtil();
AdminDao adminDao=new  AdminDao();
HttpServletRequest request;
public String execute(){
	HttpSession session=request.getSession();
	
	if(StringUtil.isEmpty(admin.getAdminName())||StringUtil.isEmpty(admin.getApassword())){
		error="用户名和密码不能为空！";
		return ERROR;
	}
	if(StringUtil.isEmpty(imageCode)){
		error="请输入验证码！";
		return ERROR;
	}
	if(!imageCode.equals(session.getAttribute("sRand"))){ //在image.jsp中 将验证码存入session
		error="验证码不正确！";
		return ERROR;
	}
	Connection con=null;
	try {
		con =dbUtil.getCon();  //连接数据库
		admin currentUser=adminDao.login(con, admin);
		if(currentUser==null){
			error="用户名或密码错误！";
			return ERROR;
		}else{
			session.setAttribute("currentUser", currentUser);//将当前登录的用户名存入session
			return SUCCESS;
		}
	} catch (Exception e) {

		e.printStackTrace();
	}finally{
		try {
			dbUtil.closeCon(con);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	return SUCCESS;


}
public String logout() throws Exception {
	//获取session
	HttpSession session=request.getSession();
	session.removeAttribute("currentUser");
	return "logout";
}
@Override
public void setServletRequest(HttpServletRequest request) {

	this.request=request;
}
}