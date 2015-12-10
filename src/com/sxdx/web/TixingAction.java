package com.sxdx.web;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.sxdx.dao.DiaryDao;
import com.sxdx.dao.RiliDiaryDao;
import com.sxdx.dao.impl.DiaryDaoImpl;
import com.sxdx.dao.impl.RiliDiaryDaoImpl;
import com.sxdx.entity.Diary;
import com.sxdx.entity.RiliDiary;

public class TixingAction extends ActionSupport {
	/**
	 * 属性注入
	 */
	//所有查询出的日历任务
	private List<RiliDiary> rilis;
	//所有查询出的日记任务
	private List<Diary> diarys;

	//对象
	private RiliDiary sdiary;
	private Diary diary;
	
	//数据层
	private RiliDiaryDao dao = new RiliDiaryDaoImpl();
	private DiaryDao ddao = new DiaryDaoImpl();

	public List<RiliDiary> getRilis() {
		return rilis;
	}

	public void setRilis(List<RiliDiary> rilis) {
		this.rilis = rilis;
	}

	public RiliDiary getSdiary() {
		return sdiary;
	}

	public void setSdiary(RiliDiary sdiary) {
		this.sdiary = sdiary;
	}
	
	public List<Diary> getDiarys() {
		return diarys;
	}

	public void setDiarys(List<Diary> diarys) {
		this.diarys = diarys;
	}

	public Diary getDiary() {
		return diary;
	}

	public void setDiary(Diary diary) {
		this.diary = diary;
	}

	public String findTiRiLi(){
		try {
			rilis = dao.findRiliById();
			diarys = ddao.findRiJiById();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "tixing";
	}
	
}
