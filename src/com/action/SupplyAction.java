package com.action;

import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.poi.ss.usermodel.Workbook;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import com.dao.SupplyManDao;
import com.model.PageBean;
import com.model.SupplyMan;
import com.util.DbUtil;
import com.util.ExcelUtil;
import com.util.JsonUtil;
import com.util.ResponseUtil;
import com.util.StringUtil;

public class SupplyAction extends ActionSupport implements ServletRequestAware {
	private static final long serialVersionUID = 1L;

	private SupplyMan sm;
	private String error;

	private String page;
	private String rows;
	private String delIds;
	// 查询条件的变量
	private String pu_id;
	private String brand;
	
	private String name;
	private String runstore;
	private String system;
	
	private String pixel;
	private String ratio;
	private String internet;

	private String pics;
	private String type;
	private String size;
	
	private String version;
	private String menu;
	private String afterSold;
	
	public SupplyMan getSm() {
		return sm;
	}
	public void setSm(SupplyMan sm) {
		this.sm = sm;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getRows() {
		return rows;
	}
	public void setRows(String rows) {
		this.rows = rows;
	}
	public String getDelIds() {
		return delIds;
	}
	public void setDelIds(String delIds) {
		this.delIds = delIds;
	}	
	public String getPu_id() {
		return pu_id;
	}
	public void setPu_id(String pu_id) {
		this.pu_id = pu_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSystem() {
		return system;
	}
	public void setSystem(String system) {
		this.system = system;
	}		
	public String getInternet() {
		return internet;
	}
	public void setInternet(String internet) {
		this.internet = internet;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getRunstore() {
		return runstore;
	}
	public void setRunstore(String runstore) {
		this.runstore = runstore;
	}
	public String getPixel() {
		return pixel;
	}
	public void setPixel(String pixel) {
		this.pixel = pixel;
	}
	public String getRatio() {
		return ratio;
	}
	public void setRatio(String ratio) {
		this.ratio = ratio;
	}
	public String getPics() {
		return pics;
	}
	public void setPics(String pics) {
		this.pics = pics;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public String getAfterSold() {
		return afterSold;
	}
	public void setAfterSold(String afterSold) {
		this.afterSold = afterSold;
	}		
	DbUtil dbutil = new DbUtil();
	HttpServletRequest request;
	SupplyManDao smd = new SupplyManDao();

	public String execute() throws Exception {

		PageBean pageBean = new PageBean(Integer.parseInt(page),
				Integer.parseInt(rows));// 分页pageBean
		Connection con = null;

		try {
			if (sm == null) {
				sm = new SupplyMan();
			}
			sm.setPu_id(pu_id);           //code：SupplyManManage.jsp传来的  code:$('#code').val(),或者为空
			sm.setName(name);
			sm.setSystem(system); 
			sm.setInternet(internet); 
            
			con = dbutil.getCon();
			JSONObject result = new JSONObject();
			JSONArray jsonArray = JsonUtil.formatRsToJsonArray(smd.list(con,
					pageBean, sm));
			int total = smd.Count(con, sm);
			result.put("rows", jsonArray);
			result.put("total", total);
			ResponseUtil.write(ServletActionContext.getResponse(), result);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				dbutil.closeCon(con);
			} catch (Exception e) {

				e.printStackTrace();
			}
		}
		return null;
	}
SupplyManDao dao=new SupplyManDao();

	public String delete() throws Exception {
		Connection con = null;
		try {
			con = dbutil.getCon();
			JSONObject result = new JSONObject();
			String str[]=delIds.split(",");
			/*for(int i=0; i<str.length;i++){
				
				boolean f=dao.getSupplyById(con, str[i]);
				if(f){
					result.put("errorIndex", i);
					result.put("errorMsg","供应商供应货物，不能删除");
					ResponseUtil.write(ServletActionContext.getResponse(), result);
					return null;
				}
			}
			*/
			int delNums = smd.delete(con, delIds);
			if (delNums > 0) {
				result.put("success", "true");
				result.put("delNums", delNums);
			} else {
				result.put("errorMsg", "删除失败");
			}
			ResponseUtil.write(ServletActionContext.getResponse(), result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				dbutil.closeCon(con);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}

	public String save() throws Exception {
		if (StringUtil.isNotEmpty(pu_id)) {  //如果是编辑的话会传一个参数id，插入则没有		
			sm.setPu_id(pu_id);  //SupplyMan sm;
			
		}
		Connection con = null;
		try {
			con = dbutil.getCon();
			int saveNums = 0;
			JSONObject result = new JSONObject();
			if (StringUtil.isNotEmpty(pu_id)) {													
				saveNums = smd.modify(con, sm); //更新
			} else {						
				saveNums = smd.add(con, sm); //插入		
			}
			if (saveNums > 0) {
				result.put("success", "true");//保存成功
			} else {
				result.put("success", "true");
				result.put("errorMsg", "保存失败");
			}
			ResponseUtil.write(ServletActionContext.getResponse(), result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				dbutil.closeCon(con);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
public String supplyComboList(){/////////////////////?????????????????
	Connection con=null;
	try{
		con=dbutil.getCon();
		JSONArray jsonArray =new JSONArray();
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("id", "");
		jsonObject.put("name","请选择...");
		jsonArray.add(jsonObject);
		jsonArray.addAll(JsonUtil.formatRsToJsonArray(smd.list(con, null,null)));
		ResponseUtil.write(ServletActionContext.getResponse(), jsonArray);
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try {
			dbutil.closeCon(con);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	return null;
}

	

	public String export() throws Exception {
		Connection con = null;
//		if (sm == null) {
//			sm = new SupplyMan();
//		}
		/*
		 * if(StringUtil.isNotEmpty(code)){ sm.setCode(code); }
		 * if(StringUtil.isNotEmpty(name)){ sm.setCode(name); }
		 * if(StringUtil.isNotEmpty(linkman)){ sm.setCode(linkman); }
		 * if(StringUtil.isNotEmpty(phone)){ sm.setCode(phone); }
		 */
		try {
			con = dbutil.getCon();
			ResultSet rs = smd.list(con, null, sm);
			Workbook wb = ExcelUtil.fillExcelDataWithTemplate(rs,
					"supplyExporTemplate.xls");
			ResponseUtil.export(ServletActionContext.getResponse(), wb,
					"利用模版导出excel.xls");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				dbutil.closeCon(con);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;

	}

}
