package com.example;

public class sessionBean {
	private long startTime;//경과한 시간
	private long instTime;//처음 시작한 시간
	private long lastAccessTime;//마지막 접근한 뒤 경과한 시간
	
	public sessionBean(){
		startTime = System.currentTimeMillis();
		instTime = startTime;
		lastAccessTime = startTime;
	}
	
	public long getElapsedTime(){
		lastAccessTime = System.currentTimeMillis();
		return (lastAccessTime - startTime)/1000;
	}
	
	public void setRestart(boolean b){
		startTime = System.currentTimeMillis();
		lastAccessTime = System.currentTimeMillis();
	}
	
	public long getElapsedTimeAfterInst(){
		lastAccessTime = System.currentTimeMillis();
		return (lastAccessTime - instTime)/1000;
	}
	
	public long getElapsedTimeAfterLastAccess(){
		long current = System.currentTimeMillis();
		long elapsed = (current-lastAccessTime)/1000;
		
		lastAccessTime = System.currentTimeMillis();
		
		return elapsed;
	}
}