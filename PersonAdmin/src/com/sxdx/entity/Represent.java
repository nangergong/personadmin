package com.sxdx.entity;

import java.io.Serializable;
/**
 * ����������
 * @author Administrator
 *
 */

@SuppressWarnings("serial")
public class Represent implements Serializable{

	private int id;//����������id
	private int tid;//������id
	private String shortname;//��������
	private String represent;//����������
	
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
