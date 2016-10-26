package com.util;


	public class StringToInt
	{

	        public static int StringToInt(String number) {
			String s = new String(number); 
			String a[] = s.split("\\.");
			int c=Integer.parseInt(a[0]);
		return c;
		}
	
	   
	}


