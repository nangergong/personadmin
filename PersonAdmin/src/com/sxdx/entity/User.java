package com.sxdx.entity;

import java.io.Serializable;
import java.sql.Date;

/**
 * �û���Ϣ
 * 
 * @author Administrator
 * 
 */
@SuppressWarnings("serial")
public class User implements Serializable {

	private int id;//�û�id
	private String name;//�û�����
	private String nickname;//�û��ǳ�
	private Date birthday;//�û�����
	private String sex;//�û��Ա�
	private String mobile;//�û��ֻ�
	private String landline;//�û��̻�
	private String email;//�û������ʼ�
	private String password;//�û�����
	private String address;//��ͥסַ
	private String registtime;
	public User() {
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getLandline() {
		return landline;
	}

	public void setLandline(String landline) {
		this.landline = landline;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRegisttime() {
		return registtime;
	}

	public void setRegisttime(String registtime) {
		this.registtime = registtime;
	}

	public void setId(int id) {
		this.id = id;
	}
	
}
