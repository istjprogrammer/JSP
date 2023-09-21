package com.example;

public class requestBean {
	
	private String header;
	private String footer;
	//변수 위주로 코드를 짜는 방식을 디자인패턴에서는 DTO 패턴이라고 한다.
	//DTO: Data Transfer Object(데이터를 주고받기 편하게 객체로 잘 묶어둔 것)
	//VO: 값을 잘 묶어놨다는 뜻
	//DO: 데이터를 잘 묶어놨다는 뜻
	
	public String getHeader() {
		return header;
	}
	public void setHeader(String header) {
		this.header = header;
	}
	public String getFooter() {
		return footer;
	}
	public void setFooter(String footer) {
		this.footer = footer;
	}
}
