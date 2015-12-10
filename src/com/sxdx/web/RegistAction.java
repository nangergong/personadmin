package com.sxdx.web;


import com.sxdx.dao.UserManage;
import com.sxdx.dao.impl.UserManageImpl;
import com.sxdx.entity.User;

public class RegistAction {
	public UserManage userManageImpl= new UserManageImpl();
	public User user;
	public UserManage getUserManageImpl() {
		return userManageImpl;
	}
	public void setUserManageImpl(UserManage userManageImpl) {
		this.userManageImpl = userManageImpl;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	/**
	 * зЂВс
	 * @return
	 */
	public String add(){
		try {
		//	System.out.println(user.getRegisttime());
			userManageImpl.addUser(user);
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "registyonghu";
	}

}
