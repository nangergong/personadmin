package com.sxdx.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.DBConection;

import com.sxdx.dao.UserManage;
import com.sxdx.entity.Page;
import com.sxdx.entity.User;




public class UserManageImpl implements UserManage {

	@SuppressWarnings("finally")
	public int addUser(User user) throws Exception{
			int id = 0;
			Connection conn = null;
			PreparedStatement stat = null;
			ResultSet rs = null;
			try {
				conn=DBConection.openConnection();
				stat=conn.prepareStatement("insert into tb_user(name,nickname,birthday,sex,mobile,landline,email,password,address,registtime) values(?,?,?,?,?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
				stat.setString(1,user.getName());
				stat.setString(2,user.getNickname());
				stat.setDate(3,user.getBirthday());
				stat.setString(4, user.getSex());
				stat.setString(5,user.getMobile());
				stat.setString(6, user.getLandline());
				stat.setString(7, user.getEmail());
				stat.setString(8, user.getPassword());
				stat.setString(9, user.getAddress());
				stat.setString(10, user.getRegisttime());
				//stat.setInt(11, user.getId());
				
				int result = stat.executeUpdate();
				System.out.println(result);
				if(result>0){
					rs=stat.getGeneratedKeys();
					if(rs.next()){
						id=rs.getInt(1);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				DBConection.closeConnection(conn, stat, rs);
			
			return id;
		}	
		
	}

	

	public User findUserByNicknameAndPassword(String nickname, String password) {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		User u = null; 
		try {
			conn=DBConection.openConnection();
			String sqlString = "select * from tb_user where nickname = '"+nickname+"' and password = '"+password+"'" ;
			stat=conn.prepareStatement(sqlString);
//			stat.setString(1, nickname);
//			stat.setString(2, password);
			
			rs=stat.executeQuery();
			if(rs.next()){	
				u=new User();
				u.setAddress(rs.getString("address"));
				u.setEmail(rs.getString("email"));
				u.setPassword(rs.getString("password"));
				u.setBirthday(rs.getDate("birthday"));
				u.setLandline(rs.getString("landline"));
				u.setMobile(rs.getString("mobile"));
				u.setName(rs.getString("name"));
				u.setNickname(rs.getString("nickname"));
				u.setSex(rs.getString("sex"));
				u.setRegisttime(rs.getString("registtime"));
				u.setId(rs.getInt("id"));
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(conn, stat, rs);
		}
		return u;
		
		
	}



	public void Modifypassword(String password, int id) {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		
		
		try {
			conn=DBConection.openConnection();
			 stat=conn.prepareStatement("update tb_user set password = ? where id = ?");
			 stat.setString(1, password);
			 stat.setInt(2, id);
			 stat.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(conn, stat, rs);
		}
		
	}



	public List<User> findAll() throws Exception {
		List<User> users = new ArrayList<User>();
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		
		try {
			conn=DBConection.openConnection();
			stat=conn.prepareStatement("select * from tb_user");
			
			rs=stat.executeQuery();
			while(rs.next()){
				User user=new User();
				user.setId(rs.getInt("id"));
				user.setAddress(rs.getString("address"));
				user.setBirthday(rs.getDate("birthday"));
				user.setEmail(rs.getString("email"));
				user.setLandline(rs.getString("landline"));
				user.setMobile(rs.getString("mobile"));
				user.setName(rs.getString("name"));
				user.setNickname(rs.getString("nickname"));
				user.setRegisttime(rs.getString("registtime"));
				user.setSex(rs.getString("sex"));
				user.setPassword(rs.getString("password"));
				
				users.add(user);
				
			}
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(conn, stat, rs);
			
		}
		return users;
	}



	public void modifyUser(User user, int id) throws Exception {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		
		
		try {
			conn=DBConection.openConnection();
			 stat=conn.prepareStatement("update tb_user set name=?,nickname=?,mobile=?,email=?,landline=?,address=? where id = ?");
			 stat.setString(1, user.getName());
			 stat.setString(2, user.getNickname());
			 stat.setString(3, user.getMobile());
			 stat.setString(4, user.getEmail());
			 stat.setString(5, user.getLandline());
			 stat.setString(6, user.getAddress());
			 stat.setInt(7,id);
			 stat.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(conn, stat, rs);
		}
		
		
	}



	public void deleteUser(int id) throws Exception {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
		conn=DBConection.openConnection();
		stat=conn.prepareStatement("delete from tb_user where id=?;");
		stat.setInt(1, id);
		stat.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(conn, stat, rs);
		}
	}



	public List<User> findUsersById( Page page) throws Exception {
		
		List<User> users = new ArrayList<User>();
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		
		try {
			conn=DBConection.openConnection();
			page.setCountItem(countUsers());
			int index = (page.getCurrentPage()-1)*2;
			stat=conn.prepareStatement("select * from tb_user limit ?,?");
			stat.setInt(1, index);
			stat.setInt(2, page.getPageSize());
			rs=stat.executeQuery();
			while(rs.next()){
				User u = new User();
				u.setId(rs.getInt("id"));
				u.setAddress(rs.getString("address"));
				u.setBirthday(rs.getDate("birthday"));
				u.setEmail(rs.getString("email"));
				u.setMobile(rs.getString("mobile"));
				u.setName(rs.getString("name"));
				u.setNickname(rs.getString("nickname"));
				u.setSex(rs.getString("sex"));
				users.add(u);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(conn, stat, rs);
			
		}
		return users;
	}
	public int countUsers(){
		int countItem=0;
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn=DBConection.openConnection();
			stat=conn.prepareStatement("select count(*) countItem from tb_user ");
			
			rs=stat.executeQuery();
			if(rs.next()){
				countItem=rs.getInt("countItem");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return countItem;
	}


	
	/**
	 * 根据id查找用户信息
	 */
	public User findUserById(int id) throws Exception {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		User user=null;
		try {
			conn=DBConection.openConnection();
			stat=conn.prepareStatement("select * from tb_user where id=?");
			stat.setInt(1, id);
			rs=stat.executeQuery();
			while(rs.next()){
				user=new User();
				user.setId(rs.getInt("id"));
				user.setAddress(rs.getString("address"));
				user.setBirthday(rs.getDate("birthday"));
				user.setEmail(rs.getString("email"));
				user.setLandline(rs.getString("landline"));
				user.setMobile(rs.getString("mobile"));
				user.setName(rs.getString("name"));
				user.setNickname(rs.getString("nickname"));
				user.setRegisttime(rs.getString("registtime"));
				user.setSex(rs.getString("sex"));
				user.setPassword(rs.getString("password"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(conn, stat, rs);
			
		}
		return user;
		
	}
	
	/**
	 *根据id查找用户信息，返回集合 
	 */
	public List<User> findUserInfoById(int id) throws Exception {
		List<User> users = new ArrayList<User>();
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		User user=null;
		try {
			conn=DBConection.openConnection();
			stat=conn.prepareStatement("select * from tb_user where id=?");
			stat.setInt(1, id);
			rs=stat.executeQuery();
			while(rs.next()){
				user=new User();
				user.setId(rs.getInt("id"));
				user.setAddress(rs.getString("address"));
				user.setBirthday(rs.getDate("birthday"));
				user.setEmail(rs.getString("email"));
				user.setLandline(rs.getString("landline"));
				user.setMobile(rs.getString("mobile"));
				user.setName(rs.getString("name"));
				user.setNickname(rs.getString("nickname"));
				user.setRegisttime(rs.getString("registtime"));
				user.setSex(rs.getString("sex"));
				user.setPassword(rs.getString("password"));
				users.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(conn, stat, rs);
			
		}
		return users;
		
	}
	
	
	

}
