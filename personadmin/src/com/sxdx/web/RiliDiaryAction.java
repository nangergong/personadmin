package com.sxdx.web;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.sxdx.dao.RiliDiaryDao;
import com.sxdx.dao.impl.RiliDiaryDaoImpl;
import com.sxdx.entity.Page;
import com.sxdx.entity.Represent;
import com.sxdx.entity.RiliDiary;

public class RiliDiaryAction extends ActionSupport{

	private RiliDiary sdiary;
	
	//跳转到的页面值
	private int goPage;
	
	//分页实体
	private Page page = new Page();
	
	//所有查询出的日历任务
	private List<RiliDiary> rilis;
	
	private int id;
	
	private RiliDiaryDao dao = new RiliDiaryDaoImpl();

	public RiliDiary getSdiary() {
		return sdiary;
	}

	public void setSdiary(RiliDiary sdiary) {
		this.sdiary = sdiary;
	}
	
	public int getGoPage() {
		return goPage;
	}

	public void setGoPage(int goPage) {
		this.goPage = goPage;
	}
	
	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}
	
	public List<RiliDiary> getRilis() {
		return rilis;
	}

	public void setRilis(List<RiliDiary> rilis) {
		this.rilis = rilis;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	/**
	 * 添加日历信息
	 * @return
	 */
	public String addTaskByRili(){
		int i = dao.addTaskByRili(sdiary);
		return "addTaskByRili";
	}
	
	/**
	 * 查询日历信息
	 */
	public String findRili(){
		
		try {
			if(goPage==0){
				if(page.getCurrentPage()==0){
					page.setCurrentPage(1);
				}
			rilis= dao.findRiliById(page);
		} else{
			page.setCurrentPage(goPage);
			rilis= dao.findRiliById(page);
		}
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return "rilixinxi";
}
	
	/**
	 * 删除日历信息
	 */
	public String deleteRiLi(){
		try{
			dao.deleteRiLi(id);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "ok";
	}
	
	/**
	 * 跳转到修改页面
	 */
	public String toUpdateRiLi(){
		
		try {
			sdiary = dao.findRiLiById(sdiary);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "toUpdateRiLi";
	}
	
	/**
	 * 修改页面
	 */
	public String doUpdateRiLi(){
		//修改任务项
		int i = dao.doUpdateRiLi(sdiary);
		return "updateSuccess";
	}
}
