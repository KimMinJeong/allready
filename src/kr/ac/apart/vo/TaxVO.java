package kr.ac.apart.vo;

public class TaxVO {
	private String user_id;
	private int year;
	private int month;
	private int basic_tax;
	private int electric_tax;
	private int water_tax;
	private int heating_tax;
	private int internet_tax;
	
	@Override
	public String toString() {
		return "TaxVO [user_id=" + user_id + ", year=" + year + ", month="
				+ month + ", basic_tax=" + basic_tax + ", electric_tax="
				+ electric_tax + ", water_tax=" + water_tax + ", heating_tax="
				+ heating_tax + ", internet_tax=" + internet_tax + "]";
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getBasic_tax() {
		return basic_tax;
	}
	public void setBasic_tax(int basic_tax) {
		this.basic_tax = basic_tax;
	}
	public int getElectric_tax() {
		return electric_tax;
	}
	public void setElectric_tax(int electric_tax) {
		this.electric_tax = electric_tax;
	}
	public int getWater_tax() {
		return water_tax;
	}
	public void setWater_tax(int water_tax) {
		this.water_tax = water_tax;
	}
	public int getHeating_tax() {
		return heating_tax;
	}
	public void setHeating_tax(int heating_tax) {
		this.heating_tax = heating_tax;
	}
	public int getInternet_tax() {
		return internet_tax;
	}
	public void setInternet_tax(int internet_tax) {
		this.internet_tax = internet_tax;
	}
}
