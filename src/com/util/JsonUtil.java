package com.util;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.Date;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class JsonUtil {

	public static JSONArray formatRsToJsonArray(ResultSet rs)throws Exception{
		//��Ԫ�����л������ 
		ResultSetMetaData md=rs.getMetaData();
		int num=md.getColumnCount();  //��ʹ�� ResultSet ֮ǰ�������ѯ���������ٸ��С�����Ϣ�洢�� ResultSetMetaData �����С� 
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
