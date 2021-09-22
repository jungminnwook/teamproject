package com.example.util;

public class Script {

	
	public static String href(String alertMessage,String locationpath) {
		StringBuilder sb = new StringBuilder();
		sb.append("<script>");
		sb.append("alert('" + alertMessage +"');");
		sb.append("location.href='" + locationpath + "';"); //location : 주소표시줄 ,특정 이동경로로 요청
		sb.append("</script>");
		
		return sb.toString();
	}
	
	public static String back(String alertMessage) {
		StringBuilder sb = new StringBuilder();
		sb.append("<script>");
		sb.append("alert('" + alertMessage +"');");
		sb.append("history.back();"); //브라우저 내장객체 history, 뒤로가기
		sb.append("</script>");
		
		return sb.toString();
	}
}
