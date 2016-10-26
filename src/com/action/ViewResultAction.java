package com.action;



import java.awt.Font;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;


import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.category.DefaultCategoryDataset;

import com.opensymphony.xwork2.ActionSupport;

import com.util.DbUtil;



public class ViewResultAction extends ActionSupport implements ServletRequestAware{

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

private JFreeChart chart;

private String idgoods;
	
	public String getIdgoods() {
	return idgoods;
}
public void setIdgoods(String idgoods) {
	this.idgoods = idgoods;
}
	public JFreeChart getChart() {
	return chart;
}
public void setChart(JFreeChart chart) {
	this.chart = chart;
}


public HttpServletRequest getRequest() {
	return request;
}
public void setRequest(HttpServletRequest request) {
	this.request = request;
}
	DbUtil dbUtil=new DbUtil();

	HttpServletRequest request;

	@Override
    public String execute() throws Exception {

		DefaultCategoryDataset dataset = new DefaultCategoryDataset(); 
		Connection con=null;
	
		HttpSession session=request.getSession();
		/*if(outgoods==null){
			outgoods=new OutGoods();		
		}
*/
	
		try{
		con=dbUtil.getCon();
		
		int i=1;
		//while(rs.next()){
				//dataset.addValue((Number) rs.getObject(1), i++, (Comparable) rs.getObject(2));
		//}	   
    	  
    	chart = ChartFactory.createBarChart3D(   
    	                                    "",    
    	                                    "",   
    	                                    "", 
    	                                    dataset, 
    	                                    PlotOrientation.VERTICAL ,
    	                                    false,    
    	                                    false,   
    	                                    false 
    	                            );   
    	          
    	 
    	chart.setTitle(new TextTitle("", new Font("", Font.ITALIC , 22)));   
    	CategoryPlot plot=(CategoryPlot)chart.getPlot();
        
    	  
        ValueAxis rangeAxis = plot.getRangeAxis();  
        rangeAxis.setUpperMargin(0.25);
        rangeAxis.setLowerMargin(0.15);
        
    	
        CategoryAxis categoryAxis = plot.getDomainAxis();   
      
        categoryAxis.setLabelFont(new Font("" , Font.BOLD , 16));   
     
        categoryAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_45);   
        categoryAxis.setTickLabelFont(new Font("" , Font.BOLD , 14));   
      
        NumberAxis numberAxis = (NumberAxis)plot.getRangeAxis();   
        
        numberAxis.setLabelFont(new Font("" , Font.BOLD , 18));   
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				dbUtil.closeCon(con);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		request.setAttribute(SUCCESS, "true");
		return SUCCESS;
 
    }
	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request=request;
	}

    
}