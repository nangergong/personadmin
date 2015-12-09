package com.sxdx.dao;

import java.util.List;

import com.sxdx.entity.Page;
import com.sxdx.entity.User;


/**
 * �û�����
 * ��½��ע��ӿ�
 * @author Administrator
 *
 */
public interface UserManage{

	//��ѯ�û�
	
	User findUserByNicknameAndPassword(String nickname,String password);
	public List findUserInfoById(int id) throws Exception ;
	
	//�û�ע��
	
	int addUser(User user) throws Exception;
	
	//�޸�����
	void Modifypassword (String password,int id);
	
	
	
	//��ѯ�����û�
	public List<User> findUsersById(Page page) throws Exception;
	public List<User> findAll() throws Exception;
	
	//�޸��û���Ϣ
	void modifyUser(User user,int id)throws Exception;
	//ɾ���û�
	void deleteUser (int id) throws Exception;
	User findUserById(int id)throws Exception;
	
	
}
