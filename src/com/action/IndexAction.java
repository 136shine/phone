package com.action;

import java.sql.Connection;
import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;


import com.util.DbUtil;

public class IndexAction extends ActionSupport implements ServletRequestAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static DbUtil dbUtil=new DbUtil();
	//private static GoodsTypeDao goodstypedao=new GoodsTypeDao();

	//private static ArrayList<GoodsType> goodstypelist;
	private HttpServletRequest request;

	@Override
	public String execute() throws Exception {
		Connection con=null;
		HttpSession session=request.getSession();
		con=dbUtil.getCon();
		

		//session.setAttribute("goodstypelist", goodstypelist);
		return "index";
	}
		static{
		Connection con=null;
		try {
		    con=dbUtil.getCon();
		    //goodstypelist=goodstypedao.getGoodsTypeList(con);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				dbUtil.closeCon(con);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
	}

	
}
