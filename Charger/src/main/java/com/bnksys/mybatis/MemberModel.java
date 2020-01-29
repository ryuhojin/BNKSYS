package com.bnksys.mybatis;

public class MemberModel {
	int mno;
	String id;
	String pass;
	public MemberModel() {
		mno = 0;
		id= "";
		pass="";
	}
	public MemberModel(int mno, String id, String pass) {
		super();
		this.mno = mno;
		this.id = id;
		this.pass = pass;
	}
	public MemberModel(String id, String pass) {
		this.id = id;
		this.pass = pass;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	@Override
	public String toString() {
		return "Member [mno=" + mno + ", id=" + id + ", pass=" + pass + "]";
	}
}
