package com.model;

public class SupplyMan {
	private String pu_id;
	private String name;
	private String pixel;
	private String ratio;
	private String pics;
	private String system;
	private String brand;
	private String type;
	private String internet;
	private String size;
	private String menu;
	private String afterSold;
	private String version;
	private String runstore;



public SupplyMan(String pu_id, String name, String system, String internet) {
	super();
	this.pu_id=pu_id;
	this.name=name;
	this.system=system;
	this.internet=internet;
	
}
public SupplyMan() {
	super();
	// TODO Auto-generated constructor stub
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
public String getSystem() {
	return system;
}
public void setSystem(String system) {
	this.system = system;
}
public String getBrand() {
	return brand;
}
public void setBrand(String brand) {
	this.brand = brand;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public String getInternet() {
	return internet;
}
public void setInternet(String internet) {
	this.internet = internet;
}
public String getSize() {
	return size;
}
public void setSize(String size) {
	this.size = size;
}
public String getMenu() {
	return menu;
}
public void setMenu(String menu) {
	this.menu = menu;
}
public String getVersion() {
	return version;
}
public void setVersion(String version) {
	this.version = version;
}
public String getAfterSold() {
	return afterSold;
}
public void setAfterSold(String afterSold) {
	this.afterSold = afterSold;
}
public String getRunstore() {
	return runstore;
}
public void setRunstore(String runstore) {
	this.runstore = runstore;
}


}
