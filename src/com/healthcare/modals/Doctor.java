package com.healthcare.modals;

public class Doctor {
	private int ID;
	private String Name;
	private String Email;
	private String Password;
	private String Phone;
	private int Age;
	private String Address;
	private int DeptID;
	private String Qualification;
	private String ImgUrl;

	public Doctor() {
		ID = 0;
		Name = null;
		Email = null;
		Password = null;
		Phone = null;
		Age = 0;
		Address = null;
		DeptID = 0;
		Qualification = null;
		ImgUrl = null;
	}

	/**
	 * 
	 * @param iD
	 * @param name
	 * @param email
	 * @param password
	 * @param phone
	 * @param age
	 * @param address
	 * @param deptID
	 * @param qualification
	 * @param imgUrl
	 */
	public Doctor(int iD, String name, String email, String password, String phone, int age, String address, int deptID,
			String qualification, String imgUrl) {
		ID = iD;
		Name = name;
		Email = email;
		Password = password;
		Phone = phone;
		Age = age;
		Address = address;
		DeptID = deptID;
		Qualification = qualification;
		ImgUrl = imgUrl;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
	}

	public int getAge() {
		return Age;
	}

	public void setAge(int age) {
		Age = age;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public int getDeptID() {
		return DeptID;
	}

	public void setDeptID(int deptID) {
		DeptID = deptID;
	}

	public String getQualification() {
		return Qualification;
	}

	public void setQualification(String qualification) {
		Qualification = qualification;
	}

	public String getImgUrl() {
		return ImgUrl;
	}

	public void setImgUrl(String imgUrl) {
		ImgUrl = imgUrl;
	}

}
