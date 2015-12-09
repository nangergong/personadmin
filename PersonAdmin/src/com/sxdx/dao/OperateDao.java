package com.sxdx.dao;

import java.util.List;
import java.util.Map;

import com.sxdx.entity.Page;
import com.sxdx.entity.Represent;
import com.sxdx.entity.Task;
import com.sxdx.entity.User;

/**
 * 任务的查询，修改，删除操作接口
 * @author Administrator
 *
 */
public interface OperateDao {
	
	//查询所有任务记录
	public List<Represent> findTaskById(Page page)  throws Exception;
	public List<Represent> findAll()  throws Exception;
	
	
	//删除用户
	public void deleteRenWu(int id) throws Exception ;

	/**
	 * 根据时间查询任务
	 * @param str
	 * @param session 
	 * @param pageBean 
	 * @return
	 */
	List<Represent> findTaskByTime(String str, Page page, Map<String, Object> session);

	/**
	 * 根据任务名称查询任务
	 * @param page
	 * @param represent
	 * @param session 
	 * @return
	 */
	List<Represent> findTaskByShortname(Page page, Represent represent, Map<String, Object> session);

	/**
	 * 根据id删除任务
	 * @param id
	 * @return
	 */
	int deleteRepresent(int id);
	

	/**
	 * 根据id查找出需要修改的任务
	 * @param represent
	 * @return
	 */
	Represent findTaskById(Represent represent);

	int doUpdateTask(Represent represent);

}
