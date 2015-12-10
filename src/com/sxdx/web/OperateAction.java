package com.sxdx.web;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.sxdx.dao.OperateDao;
import com.sxdx.dao.impl.OperateDaoImpl;
import com.sxdx.entity.Page;
import com.sxdx.entity.Represent;
import com.sxdx.entity.Task;


@SuppressWarnings("serial")
public class OperateAction extends BaseAction{

	private OperateDao dao = new OperateDaoImpl();//dao������
	
	private List<Represent> reps;//���в�ѯ��������
	
	
	private String year;//��
	
	private String month;//��
	
	private String day;//��
	
	private Page page = new Page();//��ҳʵ��
	
	private int goPage;//��ת����ҳ��ֵ
	
	private Represent represent;
	
	
	private String str;
	
	private int id;
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<Represent> getRep() {
		return reps;
	}

	public void setRep(List<Represent> reps) {
		this.reps = reps;
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

	public List<Represent> getReps() {
		return reps;
	}

	public void setReps(List<Represent> reps) {
		this.reps = reps;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public int getGoPage() {
		return goPage;
	}

	public void setGoPage(int goPage) {
		this.goPage = goPage;
	}

	public Represent getRepresent() {
		return represent;
	}

	public void setRepresent(Represent represent) {
		this.represent = represent;
	}
	
	public String getStr() {
		return str;
	}

	public void setStr(String str) {
		this.str = str;
	}

	/**
	 * ��ת����ѯҳ��
	 */
	public String doFind(){
		return "doFind";
	}
	
	/**
	 * ��ѯ������Ϣ
	 */
	public String findTask(){
		
			try {
				if(goPage==0){
					if(page.getCurrentPage()==0){
						page.setCurrentPage(1);
					}
				reps= dao.findTaskById(page);
			} else{
				page.setCurrentPage(goPage);
				reps= dao.findTaskById(page);
			}
			}catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return "renwuxinxi";
		
	}
	
	/**
	 * ����������Ϣ
	 */
	public String rwxx(){
		try {
			
			if(goPage == 0){
			if(page.getCurrentPage()==0){
				page.setCurrentPage(1);
			}
			reps = dao.findTaskById(page);
		}else {
			page.setCurrentPage(goPage);
			reps = dao.findTaskById(page);
		}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "renwuxinxi";
	}
	
	
	
	
	/**
	 * ����ʱ���ѯ����
	 * @return
	 */
	public String findTaskByTime(){
		String str = year + "-" + month + "-" + day;
		if(goPage == 0){
			reps = dao.findTaskByTime(str,page,session);
			if(reps.size() == 0){
				page.setCurrentPage(0);
			}
			return "success";
		}
		page.setCurrentPage(goPage);
		reps = dao.findTaskByTime(str,page,session);
		return "success";
	}
	
	
	/**
	 * �����������Ʋ�ѯ����
	 */
	public String findTaskByShortname(){
		if(goPage == 0){
			reps = dao.findTaskByShortname(page,represent,session);
			if(reps.size() == 0){
				page.setCurrentPage(0);
			}
			return "findTaskByName";
		}
		page.setCurrentPage(goPage);
		reps = dao.findTaskByShortname(page,represent,session);
		return "findTaskByName";
	}
	
	/**
	 * ����represent����id��pid����ɾ������
	 */
	public String deleteTask(){
		//ɾ��tb_represent�еļ�¼
		int i = dao.deleteRepresent(represent.getId());
		if(i>0){
			//����ʱ���ѯ��¼
			findTaskByTime();
			return "deleteTaskSuccess";
		}
		return "deleteTaskSuccess";
	}
	
	/**
	 * ɾ������
	 */
	public String deleteRenWu(){
		try{
			dao.deleteRenWu(id);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "ok";
	}
	
	
	
	
	/**
	 * ��ת���޸�ҳ��
	 */
	public String toUpdateTask(){
		str = year + "-" + month + "-" + day;
		//����id��ѯ��ĳ�������е�һ��
		represent = dao.findTaskById(represent);
		//��תҳ��
		return "toUpdate";
	}
	
	/**
	 *�����޸Ĳ��� 
	 */
	public String doUpdateTask(){
		//�޸�������
		int i = dao.doUpdateTask(represent);
		//��ѯ����ҳ����
		findTaskByTime();
		return "updateSuccess";
	}
	
	/**
	 * �����޸Ĳ��� ,Ȼ����ת��������ʾҳ��
	 */
	public String doUpdateRenWu(){
		int i = dao.doUpdateTask(represent);
		return "renwuxinxi";
	}
}
