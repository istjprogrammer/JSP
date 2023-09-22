package com.example;

import java.util.Vector;

public class parkingBean {
	private Vector<CarDto> carList = new Vector<CarDto>();

	public void setEnter(String plateNumber) {
		carList.add(new CarDto(plateNumber, System.currentTimeMillis()));
	}

	public void setExit(String plateNumber) {
		CarDto car = null;
		for(int i=0; i<carList.size(); i++) {
			car = (CarDto)carList.get(i);
			if(plateNumber.equals(car.getplateNumber())) {
				carList.remove(i);
				break;
			}
		}
	}

	public int getTotal() {return carList.size();
	// 저장된 데이터의 개수를 리턴
	}

	public CarDto getCar() {
		return null;
	}

	public CarDto[] getCarList() {
		CarDto[] cars = new CarDto[carList.size()];
		for(int i=0; i<cars.length; i++) {
			cars[i] = (CarDto)carList.get(i);
		}
		return cars;
	}
}