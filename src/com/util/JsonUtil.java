package com.util;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.Date;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class JsonUtil {

	public static JSONArray formatRsToJsonArray(ResultSet rs)throws Exception{
		//从元数据中获得列数 
		ResultSetMetaData md=rs.getMetaData();
		int num=md.getColumnCount();  //在使用 ResultSet 之前，必须查询它包含多少个列。此信息存储在 ResultSetMetaData 对象中。 
		JSONArray array=new JSONArray();
		while(rs.next()){
			JSONObject mapOfColValues=new JSONObject();
			for(int i=1;i<=num;i++){
				Object o=rs.getObject(i);
    				if(o instanceof Date){
					mapOfColValues.put(md.getColumnName(i), DateUtil.formatDate((Date)o, "yyyy-MM-dd"));
				}else{
					mapOfColValues.put(md.getColumnName(i), rs.getObject(i));					
				}}
			
			array.add(mapOfColValues);
		}
		return array;
	}
}
