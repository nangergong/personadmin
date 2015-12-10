package com.sxdx.dao;

import java.util.List;

import com.sxdx.entity.Page;
import com.sxdx.entity.RiliDiary;

public interface RiliDiaryDao {

	//添加日历信息
	int addTaskByRili(RiliDiary sdiary);
	
	//查询日历信息
	public List<RiliDiary> findRiliById(Page page) throws Exception;
	//查询日历信息(无分页)
	public List<RiliDiary> findRiliById() throws Exception;
	
	public RiliDiary findRiLiById(RiliDiary rd)  throws Exception;
	
	//删除日历信息
	public void deleteRiLi(int id) throws Exception;
	
	//修改日历信息
	public int doUpdateRiLi(RiliDiary rd);
}
