package com.bnksys.mybatis;


public interface MemberDAO {
	public MemberModel MemberLogin(MemberModel mem);
	public String findID(int mno);
	public void MemberAccount(MemberModel mem);
	public int idcheck(String id);
	
}
