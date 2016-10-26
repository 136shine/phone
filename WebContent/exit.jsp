<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% 
session.invalidate();
String path=request.getContextPath();
response.sendRedirect("index.jsp");
System.out.println("这里是exit.jsp!");
%> 