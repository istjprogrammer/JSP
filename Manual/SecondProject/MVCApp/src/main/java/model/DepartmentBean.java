package model;

import java.util.ArrayList;

public class DepartmentBean {
	public ArrayList getAdvice(String depart) {
		ArrayList list = new ArrayList();
		
		if(depart.equals("kor")) {
			list.add("1. 국어를 잘해야 한다.");
			list.add("2. 국어를 사랑해야 한다.");
		}
		else if(depart.equals("eng")) {
			list.add("1. 영어를 잘해야 한다.");
			list.add("2. 영어를 사랑해야 한다.");
		}
		else if(depart.equals("com")) {
			list.add("1. 컴퓨터를 잘해야 한다.");
			list.add("2. 컴퓨터를 사랑해야 한다.");
		}
		else if(depart.equals("bus")) {
			list.add("1. 경영을 잘해야 한다.");
			list.add("2. 경영을 사랑해야 한다.");
		}
		
		return list;
	}
}
