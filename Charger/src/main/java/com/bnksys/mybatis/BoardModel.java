package com.bnksys.mybatis;

public class BoardModel {
	int bno;
	String btitle;
	String bcontent;
	String bdate;
	int mno;
	public BoardModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardModel(int bno, String btitle, String bcontent, String bdate, int mno) {
		super();
		this.bno = bno;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bdate = bdate;
		this.mno = mno;
	}
	
	public BoardModel (String btitle, String bcontent, String bdate, int mno) {
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bdate = bdate;
		this.mno = mno;
	}
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	@Override
	public String toString() {
		return "BoardModel [bno=" + bno + ", btitle=" + btitle + ", bcontent=" + bcontent + ", bdate=" + bdate
				+ ", mno=" + mno + "]";
	}
	
	
}
