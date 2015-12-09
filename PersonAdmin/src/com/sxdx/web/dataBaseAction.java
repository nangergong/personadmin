package com.sxdx.web;

import java.io.IOException;

public class dataBaseAction {

	private String path;
	private int result;
	
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	
	public String creatDateBase(){
		System.out.println(path);
		String dataOutput = "mysqldump.exe -uroot -proot db_time > "+path+"db_time.sql";
		System.out.println(dataOutput);
		try {
			java.lang.Runtime.getRuntime().exec("cmd /c "+dataOutput);
		} catch (IOException e) {
			e.printStackTrace();
		}
		setResult(1);
		return "success";
	}
	
	public String recoverDataBase(){
		String recoverData = "mysql -uroot -proot db_time < "+path;
		try {
			java.lang.Runtime.getRuntime().exec("cmd /c"+recoverData);
		} catch (IOException e) {
			e.printStackTrace();
		}
		setResult(1);
		return "success";
	}

}
