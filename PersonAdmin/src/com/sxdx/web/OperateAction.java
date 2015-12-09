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

	private OperateDao dao = new OperateDaoImpl();//dao层属性
	
	private List<Represent> reps;//所有查询出的任务
	
	
	private String year;//年
	
	private String month;//月
	
	private String day;//日
	
	private Page page = new Page();//分页实体
	
	private int goPage;//跳转到的页面值
	
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
	 * 跳转到查询页面
	 */
	public String doFind(){
		return "doFind";
	}
	
	/**
	 * 查询任务信息
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
	 * 查找任务信息
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
	 * 根据时间查询任务
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
	 * 根据任务名称查询任务
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
	 * 根据represent类中id与pid进行删除任务
	 */
	public String deleteTask(){
		//删除tb_represent中的记录
		int i = dao.deleteRepresent(represent.getId());
		if(i>0){
			//根据时间查询记录
			findTaskByTime();
			return "deleteTaskSuccess";
		}
		return "deleteTaskSuccess";
	}
	
	/**
	 * 删除任务
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
	 * 跳转到修改页面
	 */
	public String toUpdateTask(){
		str = year + "-" + month + "-" + day;
		//根据id查询出某天任务中的一条
		represent = dao.findTaskById(represent);
		//跳转页面
		return "toUpdate";
	}
	
	/**
	 *进行修改操作 
	 */
	public String doUpdateTask(){
		//修改任务项
		int i = dao.doUpdateTask(represent);
		//查询返回页面中
		findTaskByTime();
		return "updateSuccess";
	}
	
	/**
	 * 进行修改操作 ,然后跳转到任务显示页面
	 */
	public String doUpdateRenWu(){
		int i = dao.doUpdateTask(represent);
		return "renwuxinxi";
	}
}
