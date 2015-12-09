package com.sxdx.web;

import java.util.List;

import com.sxdx.dao.UserManage;
import com.sxdx.dao.impl.UserManageImpl;
import com.sxdx.entity.Page;
import com.sxdx.entity.User;

public class UserMessageAction extends BaseAction {
	private UserManage usermanageImpl=new UserManageImpl();
	private List<User> us;
	private User u;
	private int id;
	private int b;
	public int getB() {
		return b;
	}

	public void setB(int b) {
		this.b = b;
	}
	private Page page=new Page();
	
	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getU() {
		return u;
	}

	public void setU(User u) {
		this.u = u;
	}

	public void setUsermanageImpl(UserManage usermanageImpl) {
		this.usermanageImpl = usermanageImpl;
	}

	public UserManage getUsermanageImpl() {
		return usermanageImpl;
	}

	public void setUs(List<User> us) {
		this.us = us;
	}

	public List<User> getUs() {
		return us;
	}
	/**
	 * 查找用户信息
	 * @return
	 */
	public String yhxx(){
		
		try {		
//			if(b == 0){
//				if(page.getCurrentPage()==0){
//					page.setCurrentPage(1);
//				}
//				us=usermanageImpl.findUsersById(page);
//			}else {
//				page.setCurrentPage(b);
//				us=usermanageImpl.findUsersById(page);
//			}
		User user=(User)session.get("session_user");
		
		
		  us	= usermanageImpl.findUserInfoById(user.getId());
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "yonghuxinxi";
	}

	
	/**
	 * 修改用户
	 * @return
	 */
	public String modifyyhxx(){
		 try {
			u=usermanageImpl.findUserById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "modifyyonghu";
	}
	
	public String updateUser(){
		
		try {
			usermanageImpl.modifyUser(u,u.getId());
			yhxx();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "yonghuxinxi";
	}
	/**
	 *添加用户 
	 * @return
	 */
	public String addyonghu(){
		try {
			b = usermanageImpl.addUser(u);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "yhxx";
	}
	/**
	 * 删除用户
	 */
	public String deleteyh(){
		
		try {
			usermanageImpl.deleteUser(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "ok";
	}

}
