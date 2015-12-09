package com.sxdx.dao;

import java.util.Map;

import com.sxdx.entity.Diary;
import com.sxdx.entity.Represent;
import com.sxdx.entity.Task;

/**
 * 任务管理模块
 * @author Administrator
 *
 */
public interface TaskManage {

	//日程安排
	/**
	 * 存入tb_represent
	 * @param t 
	 */
	int addRenwu(Represent represent, Task t)throws Exception;
	
	/**
	 * 存入tb_task
	 */
	int insertTask(Task task,Map<String, Object> session)throws Exception;
	
	/**
	 * 查询输入日期是否存在
	 */
	Task findTaskByDtime(String dtime, Map<String, Object> session); 
	
	//电子日记
	int addRiji(Diary diary)throws Exception;

	int findTaskLastId();
}
