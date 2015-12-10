package com.sxdx.web;

import com.sxdx.dao.UserManage;
import com.sxdx.dao.impl.UserManageImpl;
import com.sxdx.entity.User;



/**
 * 用户登录
 * @author Administrator
 *
 */

public class LoginAction extends BaseAction{
	private UserManage userManageImpl=new UserManageImpl();
	private String nickname;
	private String password;
	private int result=0;
	
	private int b;
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public int getB() {
		return b;
	}
	public void setB(int b) {
		this.b = b;
	}
	/**
	 * 跳转到登录页面
	 */
	public String login()throws Exception{
		setB(0);
		return "login"; 
	}
	/**
	 * 登陆到主页面
	 */
	public String doLogin()throws Exception{
		
		User user=userManageImpl.findUserByNicknameAndPassword(nickname, password);
		if(user!=null){
			if(user.getNickname().equals(nickname) && user.getPassword().equals(password)){
				this.session.put("session_user", user);
				User u=	(User)session.get("session_user");	
				return "index";
			}
		}
			setResult(9);
			return "login";
	}
	
	public UserManage getUserManageImpl() {
		return userManageImpl;
	}
	public void setUserManageImpl(UserManage userManageImpl) {
		this.userManageImpl = userManageImpl;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public int getResult() {
		return result;
	}
}
