package com.example;

import java.util.Date;

public class CarDto {
	
	private String plateNumber;
	private long parkingTime;
	
	public CarDto() {}
	public CarDto(String plateNumber, long parkingTime) {
		this.plateNumber = plateNumber;
		this.parkingTime = parkingTime;
		
	}
	public String getplateNumber(){
		return plateNumber;
		}
	public Date getparkingTime() {
		return new Date(parkingTime);
	}
}