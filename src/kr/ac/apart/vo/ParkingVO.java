package kr.ac.apart.vo;

public class ParkingVO {
	private int parking_no;
	private String floor;
	private String section;
	private String parking_lot;
	private boolean isfull;
	@Override
	public String toString() {
		return "ParkingVO [parking_no=" + parking_no + ", floor=" + floor
				+ ", section=" + section + ", parking_lot=" + parking_lot
				+ ", isfull=" + isfull + "]";
	}
	public int getParking_no() {
		return parking_no;
	}
	public void setParking_no(int parking_no) {
		this.parking_no = parking_no;
	}
	public String getFloor() {
		return floor;
	}
	public void setFloor(String floor) {
		this.floor = floor;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public String getParking_lot() {
		return parking_lot;
	}
	public void setParking_lot(String parking_lot) {
		this.parking_lot = parking_lot;
	}
	public boolean isIsfull() {
		return isfull;
	}
	public void setIsfull(boolean isfull) {
		this.isfull = isfull;
	}
	
}
