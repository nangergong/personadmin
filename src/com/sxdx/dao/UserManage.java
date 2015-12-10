package com.sxdx.dao;

import java.util.List;

import com.sxdx.entity.Page;
import com.sxdx.entity.User;


/**
 * 用户管理
 * 登陆与注册接口
 * @author Administrator
 *
 */
public interface UserManage{

	//查询用户
	
	User findUserByNicknameAndPassword(String nickname,String password);
	public List findUserInfoById(int id) throws Exception ;
	
	//用户注册
	
	int addUser(User user) throws Exception;
	
	//修改密码
	void Modifypassword (String password,int id);
	
	
	
	//查询所有用户
	public List<User> findUsersById(Page page) throws Exception;
	public List<User> findAll() throws Exception;
	
	//修改用户信息
	void modifyUser(User user,int id)throws Exception;
	//删除用户
	void deleteUser (int id) throws Exception;
	User findUserById(int id)throws Exception;
	
	
}
