package com.sxdx.entity;

import java.io.Serializable;

/**
 * 日任务
 * 
 * @author Administrator
 * 
 */
@SuppressWarnings("serial")
public class Task implements Serializable {

	private int id;//日任务id
	private int pid;//用户信息id
	private String dtime;//日任务记录日期

	public Task() {
	}

	public int getId() {
		return id;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getDtime() {
		return dtime;
	}

	public void setDtime(String dtime) {
		this.dtime = dtime;
	}

	public void setId(int id) {
		this.id = id;
	}

}
