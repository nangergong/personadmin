package com.sxdx.entity;

import java.io.Serializable;
/**
 * 电子日记
 * @author Administrator
 *
 */
@SuppressWarnings("serial")
public class Diary implements Serializable {

	private int id;//电子日记id
	private String dtime;//日记日期
	private String weekday;//星期
	private String weather;//天气情况
	private String author;
	private String represent;//日记内容

	public Diary() {
	}

	public String getDtime() {
		return dtime;
	}

	public void setDtime(String dtime) {
		this.dtime = dtime;
	}

	public String getWeekday() {
		return weekday;
	}

	public void setWeekday(String weekday) {
		this.weekday = weekday;
	}

	public String getWeather() {
		return weather;
	}

	public void setWeather(String weather) {
		this.weather = weather;
	}

	public String getRepresent() {
		return represent;
	}

	public void setRepresent(String represent) {
		this.represent = represent;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}
	
	

}
