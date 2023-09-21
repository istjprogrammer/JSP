package com.example;

import java.util.Random;

public class DiceBean {
	private Random randomNumber = new Random();
	private int min, max;
	
	public int getMin() {
		return min;
	}
	public void setMin(int min) {
		this.min = min;
	}
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	public int getRandomNumber() {
		return randomNumber.nextInt(max-min+1)+1;
	}

}
