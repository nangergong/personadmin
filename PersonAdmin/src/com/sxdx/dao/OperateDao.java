package com.sxdx.dao;

import java.util.List;
import java.util.Map;

import com.sxdx.entity.Page;
import com.sxdx.entity.Represent;
import com.sxdx.entity.Task;
import com.sxdx.entity.User;

/**
 * ����Ĳ�ѯ���޸ģ�ɾ�������ӿ�
 * @author Administrator
 *
 */
public interface OperateDao {
	
	//��ѯ���������¼
	public List<Represent> findTaskById(Page page)  throws Exception;
	public List<Represent> findAll()  throws Exception;
	
	
	//ɾ���û�
	public void deleteRenWu(int id) throws Exception ;

	/**
	 * ����ʱ���ѯ����
	 * @param str
	 * @param session 
	 * @param pageBean 
	 * @return
	 */
	List<Represent> findTaskByTime(String str, Page page, Map<String, Object> session);

	/**
	 * �����������Ʋ�ѯ����
	 * @param page
	 * @param represent
	 * @param session 
	 * @return
	 */
	List<Represent> findTaskByShortname(Page page, Represent represent, Map<String, Object> session);

	/**
	 * ����idɾ������
	 * @param id
	 * @return
	 */
	int deleteRepresent(int id);
	

	/**
	 * ����id���ҳ���Ҫ�޸ĵ�����
	 * @param represent
	 * @return
	 */
	Represent findTaskById(Represent represent);

	int doUpdateTask(Represent represent);

}
