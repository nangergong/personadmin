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
	
	//��ת����ҳ��ֵ
	private int goPage;
	
	//��ҳʵ��
	private Page page = new Page();
	
	//���в�ѯ������������
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
	 * ���������Ϣ
	 * @return
	 */
	public String addTaskByRili(){
		int i = dao.addTaskByRili(sdiary);
		return "addTaskByRili";
	}
	
	/**
	 * ��ѯ������Ϣ
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
	 * ɾ��������Ϣ
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
	 * ��ת���޸�ҳ��
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
	 * �޸�ҳ��
	 */
	public String doUpdateRiLi(){
		//�޸�������
		int i = dao.doUpdateRiLi(sdiary);
		return "updateSuccess";
	}
}
