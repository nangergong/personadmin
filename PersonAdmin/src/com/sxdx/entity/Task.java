package com.sxdx.entity;

import java.io.Serializable;

/**
 * ������
 * 
 * @author Administrator
 * 
 */
@SuppressWarnings("serial")
public class Task implements Serializable {

	private int id;//������id
	private int pid;//�û���Ϣid
	private String dtime;//�������¼����

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
