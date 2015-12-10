package com.sxdx.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Map;

import util.DBConection;

import com.sxdx.dao.TaskManage;
import com.sxdx.entity.Diary;
import com.sxdx.entity.Represent;
import com.sxdx.entity.Task;
import com.sxdx.entity.User;

public class TaskManageImpl implements TaskManage {

	/**
	 * 存represent
	 */
	@SuppressWarnings("finally")
	public int addRenwu(Represent represent,Task t) throws Exception {
		int id = 0;
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn=DBConection.openConnection();
			//System.out.println(tid+"....................23");
			stat=conn.prepareStatement("insert into tb_represent(tid,shortname,represent) values(?,?,?)",Statement.RETURN_GENERATED_KEYS);
			stat.setInt(1, t.getId());
			stat.setString(2,represent.getShortname());
			stat.setString(3,represent.getRepresent());
			
			id = stat.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(conn, stat, rs);
		
		return id;
	}	
	

	}

	

	/**
	 * 插入tb_task表数据
	 * @param task
	 * @param session
	 */
	@SuppressWarnings("unused")
	public int insertTask(Task task,Map<String, Object> session) {
		int id = 0;
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn=DBConection.openConnection();
			stat=conn.prepareStatement("insert into tb_task(dtime,pid) values(?,?)",Statement.RETURN_GENERATED_KEYS);
			User user = (User)session.get("session_user");
			stat.setString(1, task.getDtime());
			stat.setInt(2, user.getId());
			stat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(conn, stat, rs);
		}
		return id;
	}

	/**
	 * 查询本日是否存在
	 */
	public Task findTaskByDtime(String dtime, Map<String, Object> session) {
		
		Task task = null;
		
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn=DBConection.openConnection();
			stat=conn.prepareStatement("select * from tb_task where dtime=? and pid=?",Statement.RETURN_GENERATED_KEYS);
			User user = (User)session.get("session_user");
			stat.setString(1, dtime);
			stat.setInt(2, user.getId());
			rs = stat.executeQuery();
			if(rs.next()){
				task = new Task();
				task.setId(rs.getInt("id"));
				task.setPid(rs.getInt("pid"));
				task.setDtime("dtime");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(conn, stat, rs);
		}
		return task;
	}
	/**
	 * 插入日记
	 */
	public int addRiji(Diary diary) throws Exception {
		int id = 0;
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn=DBConection.openConnection();
			stat=conn.prepareStatement("insert into tb_diary(dtime,weekday,weather,represent,author) values(?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
			stat.setString(1,diary.getDtime());
			stat.setString(2,diary.getWeekday());
			stat.setString(3,diary.getWeather());
			stat.setString(4, diary.getRepresent());
			stat.setString(5,diary.getAuthor());
			
			
			int result = stat.executeUpdate();
			
			if(result>0){
				rs=stat.getGeneratedKeys();
				if(rs.next()){
					id=rs.getInt(1);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(conn, stat, rs);
		}
		return id;
	}



	public int findTaskLastId() {
		int id = 0;
		
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn=DBConection.openConnection();
			stat=conn.prepareStatement("select count(*) count from tb_task",Statement.RETURN_GENERATED_KEYS);
			rs = stat.executeQuery();
			if(rs.next()){
				id=rs.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(conn, stat, rs);
		}
		return id;
	}
	
	

}
