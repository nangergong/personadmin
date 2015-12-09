package com.sxdx.dao;

import java.util.List;

import com.sxdx.entity.Diary;
import com.sxdx.entity.Page;

/**
 * 日记查询
 * @author Administrator
 *
 */
public interface DiaryDao {
	
	//查询日记信息
	public List<Diary> findRiJiById(Page page) throws Exception;
	//查询日记信息(无分页)
	public List<Diary> findRiJiById() throws Exception;
	
	//删除日记
	public void deleteRiJi(int id) throws Exception;
	

	/**
	 * 通过时间进行日记查询
	 * @param page
	 * @param str
	 * @return
	 */
	Diary findDiaryByTime(Page page, String str);

	/**
	 * 通过作者查询日记
	 * @param diary
	 * @param page
	 * @return
	 */
	List<Diary> findDiaryByName(Diary diary, Page page);

	/**
	 * 通过id删除日记
	 * @param diary
	 * @return
	 */
	int deleteDiaryById(Diary diary);

	/**
	 * 通过id查找到需要修改的日记
	 * @param diary 
	 * @return
	 */
	Diary findDiaryById(Diary diary);

	/**
	 * 通过id进行修改
	 * @param diary
	 * @param  
	 * @return
	 */
	int doUpdate(Diary diary);

	
}
