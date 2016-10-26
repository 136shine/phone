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
	return admin;    //��form����ȡ��user���� ���� name="user.userName" 
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
		error="�û��������벻��Ϊ�գ�";
		return ERROR;
	}
	if(StringUtil.isEmpty(imageCode)){
		error="��������֤�룡";
		return ERROR;
	}
	if(!imageCode.equals(session.getAttribute("sRand"))){ //��image.jsp�� ����֤�����session
		error="��֤�벻��ȷ��";
		return ERROR;
	}
	Connection con=null;
	try {
		con =dbUtil.getCon();  //�������ݿ�
		admin currentUser=adminDao.login(con, admin);
		if(currentUser==null){
			error="�û������������";
			return ERROR;
		}else{
			session.setAttribute("currentUser", currentUser);//����ǰ��¼���û�������session
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
	//��ȡsession
	HttpSession session=request.getSession();
	session.removeAttribute("currentUser");
	return "logout";
}
@Override
public void setServletRequest(HttpServletRequest request) {

	this.request=request;
}
}