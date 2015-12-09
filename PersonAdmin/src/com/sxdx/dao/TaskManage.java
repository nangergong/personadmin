package com.sxdx.dao;

import java.util.Map;

import com.sxdx.entity.Diary;
import com.sxdx.entity.Represent;
import com.sxdx.entity.Task;

/**
 * �������ģ��
 * @author Administrator
 *
 */
public interface TaskManage {

	//�ճ̰���
	/**
	 * ����tb_represent
	 * @param t 
	 */
	int addRenwu(Represent represent, Task t)throws Exception;
	
	/**
	 * ����tb_task
	 */
	int insertTask(Task task,Map<String, Object> session)throws Exception;
	
	/**
	 * ��ѯ���������Ƿ����
	 */
	Task findTaskByDtime(String dtime, Map<String, Object> session); 
	
	//�����ռ�
	int addRiji(Diary diary)throws Exception;

	int findTaskLastId();
}
