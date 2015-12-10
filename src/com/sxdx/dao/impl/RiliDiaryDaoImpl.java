package com.sxdx.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.DBConection;

import com.sxdx.dao.RiliDiaryDao;
import com.sxdx.entity.Diary;
import com.sxdx.entity.Page;
import com.sxdx.entity.Represent;
import com.sxdx.entity.RiliDiary;

public class RiliDiaryDaoImpl implements RiliDiaryDao{

	/**
	 * 通过日历添加任务
	 */
	public int addTaskByRili(RiliDiary sdiary) {
		int id = 0;
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn=DBConection.openConnection();
			//System.out.println(tid+"....................23");
			stat=conn.prepareStatement("insert into tb_s_diary(person,dtime,shortname,represent) values(?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
			stat.setString(1,sdiary.getPerson());
			stat.setString(2,sdiary.getDtime());
			stat.setString(3,sdiary.getShortname());
			stat.setString(4,sdiary.getRepresent());
			id = stat.executeUpdate();		
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(conn, stat, rs);
		}
		
		return id;
	}

	/**
	 * 查找日历添加进去的重要任务信息
	 */
	public List<RiliDiary> findRiliById(Page page) throws Exception{
		List<RiliDiary> rilis = new ArrayList<RiliDiary>();
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		
		try{
			conn=DBConection.openConnection();
			page.setCountItem(countRili());
			int index = (page.getCurrentPage()-1)*2;
			stat=conn.prepareStatement("select * from tb_s_diary limit ?,?");
			stat.setInt(1, index);
			stat.setInt(2, page.getPageSize());
			rs=stat.executeQuery();
			while(rs.next()){
				RiliDiary rili= new RiliDiary();
				rili.setId(rs.getInt("id"));
				rili.setDtime(rs.getString("dtime"));
				rili.setPerson(rs.getString("person"));
				rili.setShortname(rs.getString("shortname"));
				rili.setRepresent(rs.getString("represent"));
				
				rilis.add(rili);
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(conn, stat, rs);
		}
		return rilis;
		
	}
	
	/**
	 * 统计
	 */
	public int countRili(){
		int countItem=0;
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn=DBConection.openConnection();
			stat=conn.prepareStatement("select count(*) countItem from tb_s_diary ");
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
	 * 查找所有日历信息(无分页)
	 */
	public List<RiliDiary> findRiliById() throws Exception{
		List<RiliDiary> rilis = new ArrayList<RiliDiary>();
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn=DBConection.openConnection();
			stat=conn.prepareStatement("select * from tb_s_diary ");
			rs=stat.executeQuery();
			while(rs.next()){
				RiliDiary rili= new RiliDiary();
				rili.setId(rs.getInt("id"));
				rili.setDtime(rs.getString("dtime"));
				rili.setPerson(rs.getString("person"));
				rili.setShortname(rs.getString("shortname"));
				rili.setRepresent(rs.getString("represent"));
				rilis.add(rili);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(conn, stat, rs);
		}
		return rilis;
	}	
	
	/**
	 * 删除日历任务
	 */
	public void deleteRiLi(int id) throws Exception {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
		conn=DBConection.openConnection();
		stat=conn.prepareStatement("delete from tb_s_diary where id=?;");
		stat.setInt(1, id);
		stat.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(conn, stat, rs);
		}
	}
	
	/**
	 * 通过id查找到日历任务
	 */
	public RiliDiary findRiLiById(RiliDiary rd)  throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = DBConection.openConnection();
			
			String sql = "select * from tb_s_diary where id=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, rd.getId());
			rs = ps.executeQuery();
			if(rs.next()){
				rd = new RiliDiary();
				rd.setId(rs.getInt("id"));
				rd.setDtime(rs.getString("dtime"));
				rd.setPerson(rs.getString("person"));
				rd.setRepresent(rs.getString("represent"));
				rd.setShortname(rs.getString("shortname"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(con, ps, rs);
		}
		return rd;
	}
	
	/**
	 * 通过id进行日历信息的修改
	 */
	public int doUpdateRiLi(RiliDiary rd) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int i = 0;
		try {
			con = DBConection.openConnection();
			String sql = "update tb_s_diary set dtime =?,shortname=?,represent=?  where id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, rd.getDtime());
			ps.setString(2, rd.getShortname());
			ps.setString(3, rd.getRepresent());
			ps.setInt(4, rd.getId());
			i = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConection.closeConnection(con, ps, rs);
		}
		return i;
	}
	
}
