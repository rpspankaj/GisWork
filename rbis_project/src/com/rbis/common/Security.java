package com.rbis.common;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class Security {
	private static String user_name;
	private static String  email;
	private static HttpSession session;
	private static String  ip_address;
	private static HttpServletRequest request;
	private static String id;
	private static String phone;
	private static String gender;
	public static String getGender() {
		return gender;
	}
	public static void setGender(String gender) {
		Security.gender = gender;
	}
	private static Timestamp modified_date;
	private static int user_id;
	public static int getUser_id() {
		return user_id;
	}
	public static void setUser_id(int user_id) {
		Security.user_id = user_id;
	}
	public static Timestamp getModified_date() {
		return modified_date;
	}
	public static void setModified_date(Timestamp modified_date) {
		Security.modified_date = modified_date;
	}
	public static String getPhone() {
		return phone;
	}
	public static void setPhone(String string) {
		Security.phone = string;
	}
	private static String password;
	public static String getPassword() {
		return password;
	}
	public static void setPassword(String password) {
		Security.password = password;
	}
	public static int getRole_id() {
		return role_id;
	}
	public static void setRole_id(int role_id) {
		Security.role_id = role_id;
	}
	public static Timestamp getDob() {
		return dob;
	}
	public static void setDob(Timestamp dob) {
		Security.dob = dob;
	}
	public static String getFname() {
		return fname;
	}
	public static void setFname(String fname) {
		Security.fname = fname;
	}
	public static String getLname() {
		return lname;
	}
	public static void setLname(String lname) {
		Security.lname = lname;
	}
	private static int role_id;
	private static Timestamp dob;
	private static String fname;
	private static String lname;
	
	public static String getId() {
		return id;
	}
	public static void setId(String id) {
		Security.id = id;
	}
	public static String getUser_name() {
		return user_name;
	}
	public static void setUser_name(String user_name) {
		Security.user_name = user_name;
	}
	public static String getEmail() {
		return email;
	}
	public static void setEmail(String email) {
		Security.email = email;
	}
	public static HttpSession getSession() {
		return session;
	}
	public static void setSession(HttpSession session) {
		Security.session = session;
	}
	public static String getIp_address() {
		return ip_address;
	}
	public static void setIp_address(String ip_address) {
		Security.ip_address = ip_address;
	}
	public static HttpServletRequest getRequest() {
		return request;
	}
	public static void setRequest(HttpServletRequest request) {
		Security.request = request;
	}
	
}
