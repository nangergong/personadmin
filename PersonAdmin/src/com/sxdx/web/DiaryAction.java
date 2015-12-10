package com.sxdx.web;

import java.util.List;

import com.sxdx.dao.DiaryDao;
import com.sxdx.dao.impl.DiaryDaoImpl;
import com.sxdx.entity.Diary;
import com.sxdx.entity.Page;

@SuppressWarnings("serial")
public class DiaryAction extends BaseAction{

	private DiaryDao dao = new DiaryDaoImpl();
	
	private Page page = new Page();//��ҳʵ����
	
	private List<Diary> diarys;
		
	private Diary diary;//�ռ�ʵ��
	
	private String year;//��
	
	private String month;//��
	
	private String day;//��
	
	private int goPage;
	
	private int id;
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public Diary getDiary() {
		return diary;
	}

	public void setDiary(Diary diary) {
		this.diary = diary;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public List<Diary> getDiarys() {
		return diarys;
	}

	public void setDiarys(List<Diary> diarys) {
		this.diarys = diarys;
	}

	public int getGoPage() {
		return goPage;
	}

	public void setGoPage(int goPage) {
		this.goPage = goPage;
	}

	/**
	 * ��ת��chaxun2.jspҳ��
	 * @return
	 */
	public String toChaxun2(){
		return "success";
	}
	
	
	/**
	 * ����ʱ���ѯ�ռ�
	 */
	public String findDiaryByTime(){
		String str = year+"-"+month+"-"+day;
		diary = dao.findDiaryByTime(page,str);
		if(diary == null){
			page.setCurrentPage(0);
		}
		return "findDiaryByTime";
	}
	
	/**
	 * �������߲�ѯ�ռ�
	 */
	public String findDiaryByName(){
		System.out.println(123213123);
		if(goPage == 0){
			diarys = dao.findDiaryByName(diary,page);
			if(diarys.size() == 0){
				page.setCurrentPage(0);
			}
		}else {
			page.setCurrentPage(goPage);
			diarys = dao.findDiaryByName(diary,page);
			if(diarys.size() == 0){
				page.setCurrentPage(0);
			}
		}
		
		return "findDiaryByName";
	}
	
	/**
	 * ����idɾ���ռ�
	 */
	public String deleteDiaryById(){
		int i = dao.deleteDiaryById(diary);
		page.setCurrentPage(1);
		findDiaryByName();
		return "deleteDiaryById";
	}
	
	/**
	 * ��ת���޸�ҳ��
	 */
	public String toUpdate(){
		diary = dao.findDiaryById(diary);
		return "toupdate";
	}
	
	/**
	 * ���޸Ĳ���
	 */
	public String doUpdate(){
		int i = dao.doUpdate(diary);
		findDiaryByName();
		return "doUpdate";
	}
	
	/**
	 * ��ѯ�ռ���Ϣ
	 */
	public String findRiJi(){
		try {
			if(goPage==0){
				if(page.getCurrentPage()==0){
					page.setCurrentPage(1);
				}
				diarys= dao.findRiJiById(page);
		} else{
			page.setCurrentPage(goPage);
			diarys= dao.findRiJiById(page);
		}
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "rijixinxi";
	}
	
	/**
	 * ����ʾ�б���ɾ���ռ���Ϣ
	 */
	public String deleteRiJi(){
		try{
			dao.deleteRiJi(id);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "ok";
	}
	
	/**
	 * �����޸Ĳ��� ,Ȼ����ת��������ʾҳ��
	 */
	public String doUpdateRiJi(){
		int i = dao.doUpdate(diary);
		return "rijixinxi";
	}
	
}
