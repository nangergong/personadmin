package com.sxdx.web;

import com.sxdx.dao.TaskManage;
import com.sxdx.dao.impl.TaskManageImpl;
import com.sxdx.entity.Diary;
import com.sxdx.entity.Represent;
import com.sxdx.entity.Task;

public class renwuAction extends BaseAction{
	private TaskManage taskManageImpl = new TaskManageImpl();
	private Represent rep;
	private Task task;
	private Diary diary;
	public TaskManage getTaskManageImplManage() {
		return taskManageImpl;
	}
	public void setTaskManageImplManage(TaskManage taskManageImplManage) {
		this.taskManageImpl = taskManageImplManage;
	}
	public Represent getRep() {
		return rep;
	}
	public void setRep(Represent rep) {
		this.rep = rep;
	}
	public Task getTask() {
		return task;
	}
	public void setTask(Task task) {
		this.task = task;
	}
	public void setDiary(Diary diary) {
		this.diary = diary;
	}
	public Diary getDiary() {
		return diary;
	}
	/**
	 * 添加日程
	 * @return
	 */
	
	public String richeng(){
		try {
			Task t = taskManageImpl.findTaskByDtime(task.getDtime(), session);
			if(t == null){
				int taskId = taskManageImpl.insertTask(task, session);
				int tid = taskManageImpl.findTaskLastId();
				Task task = new Task(); 
				task.setId(tid);
				int repId = taskManageImpl.addRenwu(rep,task);
			}else {
				int repId = taskManageImpl.addRenwu(rep,t);
			//	System.out.println(t.getId()+"............2");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "addrenwu";
	}
	/**
	 * 添加日记
	 * @return
	 */
	public String adddiary(){
		//System.out.println("添加日记");
		try {
			int id =taskManageImpl.addRiji(diary);
		//	System.out.println(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "addriji";
	}
	
	
}
