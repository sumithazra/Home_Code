package com.javabrain.test;

public class Customer {

	private int c_id;	
	private String c_name;
	private String c_email;
	private int c_phone;
	
	public Customer(){}
	
	public Customer(String c_name, String c_email, int c_phone) {
		super();
		this.c_name = c_name;
		this.c_email = c_email;
		this.c_phone = c_phone;
	}


	public int getC_id() {
		return c_id;
	}


	public void setC_id(int c_id) {
		this.c_id = c_id;
	}


	public String getC_name() {
		return c_name;
	}


	public void setC_name(String c_name) {
		this.c_name = c_name;
	}


	public String getC_email() {
		return c_email;
	}


	public void setC_email(String c_email) {
		this.c_email = c_email;
	}


	public int getC_phone() {
		return c_phone;
	}


	public void setC_phone(int c_phone) {
		this.c_phone = c_phone;
	}
	
	
	
	
	
	
}
