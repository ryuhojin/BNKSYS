package com.bnksys.mybatis;

public class MemberModel {
	int mno;
	String mid;
	String mpass;
	public MemberModel() {
		mno = 0;
		mid= "";
		mpass="";
	}
	public MemberModel(int mno, String mid, String mpass) {
		this.mno = mno;
		this.mid = mid;
		this.mpass = mpass;
	}
	public MemberModel(String mid, String mpass) {
		this.mid = mid;
		this.mpass = mpass;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpass() {
		return mpass;
	}
	public void setMpass(String mpass) {
		this.mpass = mpass;
	}
	
}