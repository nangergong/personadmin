package com.sxdx.web;

import java.io.IOException;
import java.io.PrintWriter;

import org.apache.struts2.ServletActionContext;

import com.sxdx.dao.UserManage;
import com.sxdx.dao.impl.UserManageImpl;
import com.sxdx.entity.User;

public class ModifypwdAction extends BaseAction{
	private User user;
	private String newpwd;
	private UserManage userManageImpl = new UserManageImpl();
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public void setNewpwd(String newpwd) {
		this.newpwd = newpwd;
	}
	public String getNewpwd() {
		return newpwd;
	}
	public void setUserManageImplManage(UserManage userManageImplManage) {
		this.userManageImpl = userManageImplManage;
	}
	public UserManage getUserManageImplManage() {
		return userManageImpl;
	}
	public String ymm(){
		User u=(User)super.getSession().get("session_user");
		
		PrintWriter out = null;
		
		try {
			out = ServletActionContext.getResponse().getWriter();
			if(user.getPassword().equalsIgnoreCase(u.getPassword())){
				out.print("error");
			}else{
				out.print("success");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(out!=null){
				out.flush();
				out.close();
			}
		}
		return "ok";

	}
	public String modifyPwd(){
		System.out.println("修改口令进来了");
		User u1 =(User)super.getSession().get("session_user");
		System.out.println("u1"+u1.getEmail());
		System.out.println(u1.getId());
		
		userManageImpl.Modifypassword(newpwd, u1.getId());
		return "exit";
		
	}
	
	
	
}
