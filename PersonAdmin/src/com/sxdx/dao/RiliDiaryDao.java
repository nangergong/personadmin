package com.sxdx.dao;

import java.util.List;

import com.sxdx.entity.Page;
import com.sxdx.entity.RiliDiary;

public interface RiliDiaryDao {

	//���������Ϣ
	int addTaskByRili(RiliDiary sdiary);
	
	//��ѯ������Ϣ
	public List<RiliDiary> findRiliById(Page page) throws Exception;
	//��ѯ������Ϣ(�޷�ҳ)
	public List<RiliDiary> findRiliById() throws Exception;
	
	public RiliDiary findRiLiById(RiliDiary rd)  throws Exception;
	
	//ɾ��������Ϣ
	public void deleteRiLi(int id) throws Exception;
	
	//�޸�������Ϣ
	public int doUpdateRiLi(RiliDiary rd);
}
