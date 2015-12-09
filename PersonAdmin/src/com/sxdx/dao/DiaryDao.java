package com.sxdx.dao;

import java.util.List;

import com.sxdx.entity.Diary;
import com.sxdx.entity.Page;

/**
 * �ռǲ�ѯ
 * @author Administrator
 *
 */
public interface DiaryDao {
	
	//��ѯ�ռ���Ϣ
	public List<Diary> findRiJiById(Page page) throws Exception;
	//��ѯ�ռ���Ϣ(�޷�ҳ)
	public List<Diary> findRiJiById() throws Exception;
	
	//ɾ���ռ�
	public void deleteRiJi(int id) throws Exception;
	

	/**
	 * ͨ��ʱ������ռǲ�ѯ
	 * @param page
	 * @param str
	 * @return
	 */
	Diary findDiaryByTime(Page page, String str);

	/**
	 * ͨ�����߲�ѯ�ռ�
	 * @param diary
	 * @param page
	 * @return
	 */
	List<Diary> findDiaryByName(Diary diary, Page page);

	/**
	 * ͨ��idɾ���ռ�
	 * @param diary
	 * @return
	 */
	int deleteDiaryById(Diary diary);

	/**
	 * ͨ��id���ҵ���Ҫ�޸ĵ��ռ�
	 * @param diary 
	 * @return
	 */
	Diary findDiaryById(Diary diary);

	/**
	 * ͨ��id�����޸�
	 * @param diary
	 * @param  
	 * @return
	 */
	int doUpdate(Diary diary);

	
}
