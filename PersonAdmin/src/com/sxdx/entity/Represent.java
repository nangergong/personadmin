package com.sxdx.entity;

import java.io.Serializable;
/**
 * 日任务描述
 * @author Administrator
 *
 */

@SuppressWarnings("serial")
public class Represent implements Serializable{

	private int id;//日任务描述id
	private int tid;//日任务id
	private String shortname;//日任务简称
	private String represent;//日任务描述
	
	public Represent() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public String getShortname() {
		return shortname;
	}

	public void setShortname(String shortname) {
		this.shortname = shortname;
	}

	public String getRepresent() {
		return represent;
	}

	public void setRepresent(String represent) {
		this.represent = represent;
	}
	
}
