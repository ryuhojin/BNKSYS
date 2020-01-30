package com.bnksys.mybatis;

public class ChargerModel {
	int cno;
	//충전소명
	String cname;
	//충전소위치상세
	String locdetail;
	//이용가능시작시간
	String starttime;
	//이용가능종료시간
	String endtime;
	//완속충전기대수
	int fullnum;
	//급속충전기대수
	int fastnum;
	//도로명주소
	String locst;
	//주차료부과여부
	String parking;
	//위도
	double lat;
	//경도
	double lng;
	//지역구
	String district;
	
	
	public ChargerModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChargerModel(int cno, String cname, String locdetail, String starttime, String endtime, int fullnum,
			int fastnum, String locst, String parking, double lat, double lng, String district) {
		super();
		this.cno = cno;
		this.cname = cname;
		this.locdetail = locdetail;
		this.starttime = starttime;
		this.endtime = endtime;
		this.fullnum = fullnum;
		this.fastnum = fastnum;
		this.locst = locst;
		this.parking = parking;
		this.lat = lat;
		this.lng = lng;
		this.district = district;
	}
	@Override
	public String toString() {
		return "ChargerModel [cno=" + cno + ", cname=" + cname + ", locdetail=" + locdetail + ", starttime=" + starttime
				+ ", endtime=" + endtime + ", fullnum=" + fullnum + ", fastnum=" + fastnum + ", locst=" + locst
				+ ", parking=" + parking + ", lat=" + lat + ", lng=" + lng + ", district=" + district + "]";
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getLocdetail() {
		return locdetail;
	}
	public void setLocdetail(String locdetail) {
		this.locdetail = locdetail;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public int getFullnum() {
		return fullnum;
	}
	public void setFullnum(int fullnum) {
		this.fullnum = fullnum;
	}
	public int getFastnum() {
		return fastnum;
	}
	public void setFastnum(int fastnum) {
		this.fastnum = fastnum;
	}
	public String getLocst() {
		return locst;
	}
	public void setLocst(String locst) {
		this.locst = locst;
	}
	public String getParking() {
		return parking;
	}
	public void setParking(String parking) {
		this.parking = parking;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	
}
