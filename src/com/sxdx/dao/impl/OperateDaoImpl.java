package com.sxdx.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import util.DBConection;

import com.sxdx.dao.OperateDao;
import com.sxdx.entity.Page;
import com.sxdx.entity.Represent;
import com.sxdx.entity.Task;
import com.sxdx.entity.User;
/**
 * 任务查询
 * @author Administrator
 *
 */
public class OperateDaoImpl implements OperateDao{
	/**
	 * 查询任务信息
	 */
	public List<Represent> findAll() throws Exception{
		List<Represent> reps = new  ArrayList();
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try{
			conn=DBConection.openConnection();
			stat=conn.prepareStatement("select * from tb_represent");
			rs=stat.executeQuery();
			while (rs.next()) {
				Represent rep = new Represent();
				rep.setId(rs.getInt("id"));
				rep.setTid(rs.getInt("tid"));
				rep.setShortname(rs.getString("shortname"));
				rep.setRepresent(rs.getString("represent"));
				reps.add(rep);
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}finally{
			DBConection.closeConnection(conn, stat, rs);
		}
		return reps;
	}
	
	/**
	 * 根据id查询任务信息
	 */
	public List<Represent> findTaskById(Page page) throws Exception{
		List<Represent> reps = new ArrayList<Represent>();
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		
		try{
			conn=DBConection.openConnection();
			page.setCountItem(countReps());
			int index = (page.getCurrentPage()-1)*2;
			stat=conn.prepareStatement("select * from tb_represent  limit ?,?");
			stat.setInt(1, index);
			stat.setInt(2, page.getPageSize());
			rs=stat.executeQuery();
			while(rs.next()){
				Represent rep = new Represent();
				rep.setId(rs.getInt("id"));
				rep.setTid(rs.getInt("tid"));
				rep.setShortname(rs.getString("shortname"));
				rep.setRepresent(rs.getString("represent"));
				
				reps.add(rep);
			
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(conn, stat, rs);
		}
		return reps;
		
	}
	
	/**
	 * 统计
	 */
	public int countReps(){
		int countItem=0;
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn=DBConection.openConnection();
			stat=conn.prepareStatement("select count(*) countItem from tb_represent ");
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
	 * 根据时间查询任务,获取represent对象集合
	 * 
	 */
	public List<Represent> findTaskByTime(String str,Page page,Map<String, Object> session) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Represent> reps = new ArrayList<Represent>();
		try {
			con = DBConection.openConnection();
			
			//这里需要获取tb_task的pid值
			User user = (User)session.get("session_user");
			page.setCountItem(getCountOfTaskByTime(str,session));
			int index = (page.getCurrentPage()-1)*2;
			String sql = "select r.id,r.tid,r.shortname,r.represent from tb_task t,tb_represent r where t.id=r.tid and t.dtime=? and t.pid=? limit ?,?";
			ps = con.prepareStatement(sql);
			ps.setString(1, str);
			ps.setInt(2, user.getId());
			ps.setInt(3, index);
			ps.setInt(4, page.getPageSize());
			rs = ps.executeQuery();
			while(rs.next()){
				Represent rep = new Represent();
				rep.setId(rs.getInt("id"));
				rep.setTid(rs.getInt("tid"));
				rep.setShortname(rs.getString("shortname"));
				rep.setRepresent(rs.getString("represent"));
				reps.add(rep);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(con, ps, rs);
		}
		return reps;
	}

	/**
	 * 根据日期查询任务，获取总条数
	 */
	public int getCountOfTaskByTime(String str,Map<String, Object> session){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int count = 0;
		try {
			con = DBConection.openConnection();
			User user = (User)session.get("session_user");
			String sql = "select count(*) count from tb_task t,tb_represent r where t.id=r.tid and t.dtime=? and t.pid=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, str);
			ps.setInt(2, user.getId());
			rs = ps.executeQuery();
			if(rs.next()){
				count =rs.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(con, ps, rs);
		}
		return count;
	}

	
	/**
	 * 根据任务名称查询任务
	 */
	public List<Represent> findTaskByShortname(Page page, Represent represent,Map<String, Object> session) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Represent> reps = new ArrayList<Represent>();
		try {
			con = DBConection.openConnection();
			
			User user = (User)session.get("session_user");
			page.setCountItem(getCountOfTaskByName(represent.getShortname(),session));
			int index = (page.getCurrentPage()-1)*2;
			String sql = "select r.id,r.tid,r.shortname,r.represent from tb_task t,tb_represent r where t.id=r.tid and r.shortname like ? and t.pid=? limit ?,?";
			ps = con.prepareStatement(sql);
			ps.setString(1, "%"+represent.getShortname()+"%");
			ps.setInt(2, user.getId());
			ps.setInt(3, index);
			ps.setInt(4, page.getPageSize());
			rs = ps.executeQuery();
			while(rs.next()){
				Represent rep = new Represent();
				rep.setId(rs.getInt("id"));
				rep.setTid(rs.getInt("tid"));
				rep.setShortname(rs.getString("shortname"));
				rep.setRepresent(rs.getString("represent"));
				reps.add(rep);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(con, ps, rs);
		}
		return reps;
	}
	
	/**
	 * 根据日期查询任务，获取总条数
	 */
	public int getCountOfTaskByName(String str,Map<String, Object> session){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int count = 0;
		try {
			con = DBConection.openConnection();
			
			User user = (User)session.get("session_user");
			String sql = "select count(*) count from tb_task t,tb_represent r where t.id=r.tid and r.shortname like ? and t.pid=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, "%"+str+"%");
			ps.setInt(2, user.getId());
			rs = ps.executeQuery();
			if(rs.next()){
				count =rs.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(con, ps, rs);
		}
		return count;
	}	

	
	/**
	 *删除represent中的记录 
	 */
	public int deleteRepresent(int id) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = DBConection.openConnection();		
			String sql = "delete from tb_represent where id=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			id = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(con, ps, rs);
		}
		return id;
	}
	

	/**
	 * 根据id查找出需修改的任务
	 */
	public Represent findTaskById(Represent represent) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = DBConection.openConnection();
			
			String sql = "select r.id,r.tid,r.shortname,r.represent from tb_task t,tb_represent r where t.id=r.tid and r.id=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, represent.getId());
			rs = ps.executeQuery();
			while(rs.next()){
				represent = new Represent();
				represent.setId(rs.getInt("id"));
				represent.setTid(rs.getInt("tid"));
				represent.setShortname(rs.getString("shortname"));
				represent.setRepresent(rs.getString("represent"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(con, ps, rs);
		}
		return represent;
	}

	/**
	 * 修改represent数据
	 */
	public int doUpdateTask(Represent represent) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int i = 0;
		try {
			con = DBConection.openConnection();
			
			String sql = "update tb_represent set shortname=?,represent=? where id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, represent.getShortname());
			ps.setString(2, represent.getRepresent());
			ps.setInt(3, represent.getId());
			i = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(con, ps, rs);
		}
		return i;
	}
	
	/**
	 * 删除任务
	 */
	public void deleteRenWu(int id) throws Exception {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
		conn=DBConection.openConnection();
		stat=conn.prepareStatement("delete from tb_represent where id=?;");
		stat.setInt(1, id);
		stat.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(conn, stat, rs);
		}
	}
	
	/**
	 * 修改任务
	 */
	public void modifyRenWu(Represent rep, int id) throws Exception {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn=DBConection.openConnection();
			 stat=conn.prepareStatement("update tb_represent set shortname=?,represent=? where id = ?");
			 stat.setString(1, rep.getShortname());
			 stat.setString(2, rep.getRepresent());
			 stat.setInt(7,id);
			 stat.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(conn, stat, rs);
		}
	}
	
}
