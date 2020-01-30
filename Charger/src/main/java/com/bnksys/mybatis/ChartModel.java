package com.bnksys.mybatis;

public class ChartModel {
	String district;
	//지역구별 충전소 갯수
	int disPerNum;
	//지역구별 완충갯수
	int disPerFull;
	//지역구별 급속갯수
	int disPerFast;
	//전체 완충갯수
	int fullSum;
	//전체 급속갯수
	int fastSum;
	public ChartModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChartModel(String district, int disPerNum, int disPerFull, int disPerFast, int fullSum, int fastSum) {
		this.district = district;
		this.disPerNum = disPerNum;
		this.disPerFull = disPerFull;
		this.disPerFast = disPerFast;
		this.fullSum = fullSum;
		this.fastSum = fastSum;
	}
	
	public ChartModel(String district, int disPerNum) {
		this.district = district;
		this.disPerNum = disPerNum;
	}
	
	public ChartModel(String district, int disPerFull, int disPerFast) {
		this.district = district;
		this.disPerFull = disPerFull;
		this.disPerFast = disPerFast;
	}
	
	public ChartModel(int fullSum, int fastSum) {
		this.fullSum = fullSum;
		this.fastSum = fastSum;
	}
	
	@Override
	public String toString() {
		return "ChartModel [district=" + district + ", disPerNum=" + disPerNum + ", disPerFull=" + disPerFull
				+ ", disPerFast=" + disPerFast + ", fullSum=" + fullSum + ", fastSum=" + fastSum + "]";
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public int getDisPerNum() {
		return disPerNum;
	}
	public void setDisPerNum(int disPerNum) {
		this.disPerNum = disPerNum;
	}
	public int getDisPerFull() {
		return disPerFull;
	}
	public void setDisPerFull(int disPerFull) {
		this.disPerFull = disPerFull;
	}
	public int getDisPerFast() {
		return disPerFast;
	}
	public void setDisPerFast(int disPerFast) {
		this.disPerFast = disPerFast;
	}
	public int getFullSum() {
		return fullSum;
	}
	public void setFullSum(int fullSum) {
		this.fullSum = fullSum;
	}
	public int getFastSum() {
		return fastSum;
	}
	public void setFastSum(int fastSum) {
		this.fastSum = fastSum;
	}
}
