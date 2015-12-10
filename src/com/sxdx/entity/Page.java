package com.sxdx.entity;

/**
 * �ô˷�ҳ�࣬������� countItem ������ pageSize ÿҳ��ʾ���� pageNo ��ǰҳ�� ����������ֵ
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

	private int pageNo = 1;// ��ʼҳ��

	private int pageSize =2;// ÿҳ����

	private int currentPage;// ��ȡ��ǰҳ��

	private int countItem;// ������

	private int countPage;// ��ҳ��

	private int upPage;// ��һҳ

	private int donwPage;// ��һҳ

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
