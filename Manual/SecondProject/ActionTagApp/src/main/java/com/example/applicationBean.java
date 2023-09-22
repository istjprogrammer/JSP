package com.example;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.PrintWriter;
import java.net.URL;

public class applicationBean {
	private int visitCount;
	private String path;
	
	public applicationBean() {
		BufferedReader br = null;
		try{
			URL url = getClass().getResource("/");
			System.out.println(url.getPath());
			path = url.getPath().substring(1) + "counter.txt";
			//counter.txt에 방문자 수를 기록하는 코드
			
			br = new BufferedReader(new FileReader(path));
			String strCounter = br.readLine();
			visitCount = Integer.parseInt(strCounter);
		}
		catch(Exception err){
			err.printStackTrace();
		}
		finally{
			if(br != null){
				try{
					br.close();
				}
				catch(Exception err){}
			}
		}
	}
	
	@Override
	protected void finalize() throws Throwable {
		setFile();
	}

	public void setFile(){
		PrintWriter pw = null;
		
		try{
			pw = new PrintWriter(path);
			pw.println(visitCount);
		}
		catch(Exception err){
			err.printStackTrace();
		}
		finally{
			if(pw != null){
				try{
					pw.close();
				}
				catch(Exception err){}
			}
		}
	}
	
	public void setCounter(int num) {
		visitCount++;	
		setFile();
	}
	
	public int getCounter() {
		return visitCount;
	}
	
}