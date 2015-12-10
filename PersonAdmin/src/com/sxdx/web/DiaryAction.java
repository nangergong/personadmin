package com.sxdx.web;

import java.util.List;

import com.sxdx.dao.DiaryDao;
import com.sxdx.dao.impl.DiaryDaoImpl;
import com.sxdx.entity.Diary;
import com.sxdx.entity.Page;

@SuppressWarnings("serial")
public class DiaryAction extends BaseAction{

	private DiaryDao dao = new DiaryDaoImpl();
	
	private Page page = new Page();//分页实体类
	
	private List<Diary> diarys;
		
	private Diary diary;//日记实体
	
	private String year;//年
	
	private String month;//月
	
	private String day;//日
	
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
	 * 跳转到chaxun2.jsp页面
	 * @return
	 */
	public String toChaxun2(){
		return "success";
	}
	
	
	/**
	 * 根据时间查询日记
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
	 * 根据作者查询日记
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
	 * 根据id删除日记
	 */
	public String deleteDiaryById(){
		int i = dao.deleteDiaryById(diary);
		page.setCurrentPage(1);
		findDiaryByName();
		return "deleteDiaryById";
	}
	
	/**
	 * 跳转到修改页面
	 */
	public String toUpdate(){
		diary = dao.findDiaryById(diary);
		return "toupdate";
	}
	
	/**
	 * 做修改操作
	 */
	public String doUpdate(){
		int i = dao.doUpdate(diary);
		findDiaryByName();
		return "doUpdate";
	}
	
	/**
	 * 查询日记信息
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
	 * 在显示列表中删除日记信息
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
	 * 进行修改操作 ,然后跳转到任务显示页面
	 */
	public String doUpdateRiJi(){
		int i = dao.doUpdate(diary);
		return "rijixinxi";
	}
	
}
