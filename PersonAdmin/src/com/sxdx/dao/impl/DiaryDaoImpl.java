package com.sxdx.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DBConection;

import com.sxdx.dao.DiaryDao;
import com.sxdx.entity.Diary;
import com.sxdx.entity.Page;
import com.sxdx.entity.Represent;

/**
 * 日记 查询
 * @author Administrator
 *
 */
public class DiaryDaoImpl implements DiaryDao{

	/**
	 * 通过时间进行日记查询
	 */
	public Diary findDiaryByTime(Page page, String str) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Diary diary = null;
		try {
			con = DBConection.openConnection();
			
			page.setCountItem(getCountOfTaskByTime(str));
			int index = (page.getCurrentPage()-1)*2;
			String sql = "select * from tb_diary where dtime=? limit ?,?";
			ps = con.prepareStatement(sql);
			ps.setString(1, str);
			ps.setInt(2, index);
			ps.setInt(3, page.getPageSize());
			rs = ps.executeQuery();
			if(rs.next()){
				diary = new Diary();
				diary.setId(rs.getInt("id"));
				diary.setDtime(rs.getString("dtime"));
				diary.setWeather(rs.getString("weather"));
				diary.setWeekday(rs.getString("weekday"));
				diary.setAuthor(rs.getString("author"));
				diary.setRepresent(rs.getString("represent"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(con, ps, rs);
		}
		return diary;
	}
	
	/**
	 * 根据日期查询日记任务，获取总条数
	 */
	public int getCountOfTaskByTime(String str){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int count = 0;
		try {
			con = DBConection.openConnection();
			String sql = "select count(*) count from tb_diary where dtime=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, str);
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
	

	public List<Diary> findDiaryByName(Diary diary, Page page) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Diary> diarys = new ArrayList<Diary>();
		try {
			con = DBConection.openConnection();
			page.setCountItem(getCountOfTaskByName(diary));
			int index = (page.getCurrentPage()-1)*2;
			String sql = "select * from tb_diary where author=? limit ?,?";
			ps = con.prepareStatement(sql);
			ps.setString(1, diary.getAuthor());
			ps.setInt(2, index);
			ps.setInt(3, page.getPageSize());
			rs = ps.executeQuery();
			while(rs.next()){
				Diary diary1 = new Diary();
				diary1.setId(rs.getInt("id"));
				diary1.setDtime(rs.getString("dtime"));
				diary1.setWeather(rs.getString("weather"));
				diary1.setWeekday(rs.getString("weekday"));
				diary1.setAuthor(rs.getString("author"));
				diary1.setRepresent(rs.getString("represent"));
				diarys.add(diary1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(con, ps, rs);
		}
		return diarys;
	}
	
	/**
	 * 根据作者查询日记任务，获取总条数
	 */
	public int getCountOfTaskByName(Diary diary){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int count = 0;
		try {
			con = DBConection.openConnection();
			String sql = "select count(*) count from tb_diary where author=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, diary.getAuthor());
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
	 * 根据id删除日记
	 */
	public int deleteDiaryById(Diary diary) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int i = 0;
		try {
			con = DBConection.openConnection();
			String sql = "delete from tb_diary where id=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, diary.getId());
			i = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(con, ps, rs);
		}
		return i;
	}
	
	/**
	 * 通过id查找到日记
	 */
	public Diary findDiaryById(Diary diary) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = DBConection.openConnection();
			
			String sql = "select * from tb_diary where id=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, diary.getId());
			rs = ps.executeQuery();
			if(rs.next()){
				diary = new Diary();
				diary.setId(rs.getInt("id"));
				diary.setDtime(rs.getString("dtime"));
				diary.setWeather(rs.getString("weather"));
				diary.setWeekday(rs.getString("weekday"));
				diary.setAuthor(rs.getString("author"));
				diary.setRepresent(rs.getString("represent"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(con, ps, rs);
		}
		return diary;
	}

	

	/**
	 * 通过id进行修改
	 */
	public int doUpdate(Diary diary) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int i = 0;
		try {
			con = DBConection.openConnection();
			String sql = "update tb_diary set represent=? where id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, diary.getRepresent());
			ps.setInt(2, diary.getId());
			i = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(con, ps, rs);
		}
		return i;
	}
	
	
	/**
	 *根据id查询日记信息 
	 */
	public List<Diary> findRiJiById(Page page) throws Exception{
		List<Diary> dis = new ArrayList<Diary>();
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		
		try{
			conn=DBConection.openConnection();
			page.setCountItem(countDis());
			int index = (page.getCurrentPage()-1)*2;
			stat=conn.prepareStatement("select * from tb_diary limit ?,?");
			stat.setInt(1, index);
			stat.setInt(2, page.getPageSize());
			rs=stat.executeQuery();
			while(rs.next()){
				Diary di = new Diary();
				di.setId(rs.getInt("id"));
				di.setDtime(rs.getString("dtime"));
				di.setAuthor(rs.getString("author"));
				di.setRepresent(rs.getString("represent"));
				di.setWeather(rs.getString("weather"));
				di.setWeekday(rs.getString("weekday"));
				dis.add(di);
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(conn, stat, rs);
		}
		return dis;
	}
	
	/**
	 * 统计
	 */
	public int countDis(){
		int countItem=0;
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn=DBConection.openConnection();
			stat=conn.prepareStatement("select count(*) countItem from tb_diary ");
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
	 * 查询日记(无分页)
	 */
	public List<Diary> findRiJiById() throws Exception{
		List<Diary> dis = new ArrayList<Diary>();
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn=DBConection.openConnection();
			stat=conn.prepareStatement("select * from tb_diary ");
			rs=stat.executeQuery();
			while(rs.next()){
				Diary di = new Diary();
				di.setId(rs.getInt("id"));
				di.setDtime(rs.getString("dtime"));
				di.setAuthor(rs.getString("author"));
				di.setRepresent(rs.getString("represent"));
				di.setWeather(rs.getString("weather"));
				di.setWeekday(rs.getString("weekday"));
				dis.add(di);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(conn, stat, rs);
		}
		return dis;
		
	}
	
	
	/**
	 * 删除日记
	 */
	public void deleteRiJi(int id) throws Exception {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
		conn=DBConection.openConnection();
		stat=conn.prepareStatement("delete from tb_diary where id=?;");
		stat.setInt(1, id);
		stat.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(conn, stat, rs);
		}
	}
	
	/**
	 * 修改日记
	 */
	public void modifyRiJi(Diary di, int id) throws Exception {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn=DBConection.openConnection();
			 stat=conn.prepareStatement("update tb_represent set dtime=?,weekday=?,weather=?,author=?,represent=?  where id = ?");
			 stat.setString(1, di.getDtime());
			 stat.setString(2,di.getWeekday());
			 stat.setString(3, di.getWeather());
			 stat.setString(4, di.getAuthor());
			 stat.setString(5, di.getRepresent());
			 stat.setInt(6,id);
			 stat.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(conn, stat, rs);
		}
	
	}



}
