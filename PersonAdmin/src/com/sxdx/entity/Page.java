package com.sxdx.entity;

/**
 * 用此分页类，必须给出 countItem 总条数 pageSize 每页显示条数 pageNo 当前页数 这三个属性值
 * 
 * @author Administrator
 * 
 */
public class Page {

	public Page(int pageNo, int pageSize) {
		super();
		this.pageNo = pageNo;
		this.pageSize = pageSize;
	}

	public Page() {
		super();
	}

	private int pageNo = 1;// 起始页数

	private int pageSize =2;// 每页条数

	private int currentPage;// 获取当前页数

	private int countItem;// 总条数

	private int countPage;// 总页数

	private int upPage;// 上一页

	private int donwPage;// 下一页

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getCountItem() {
		return countItem;
	}

	public void setCountItem(int countItem) {
		this.countItem = countItem;
	}

	public int getCountPage() {
		this.countPage = countItem%pageSize==0?countItem/pageSize:countItem/pageSize+1;
		return countPage;
	}

	public void setCountPage(int countPage) {
		this.countPage = countPage;
	}

	public int getUpPage() {
		return upPage;
	}

	public void setUpPage(int upPage) {
		this.upPage = upPage;
	}

	public int getDonwPage() {
		return donwPage;
	}

	public void setDonwPage(int donwPage) {
		this.donwPage = donwPage;
	}

}
