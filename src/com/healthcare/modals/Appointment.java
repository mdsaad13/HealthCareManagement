package com.healthcare.modals;

public class Appointment {
	private int ID;
	private int DocID;
	private int UserID;
	private String Name;
	private String Email;
	private String Phone;
	private int Age;
	private String Date;
	private String Time;
	private int Seen;
	private int Status;

	public Appointment() {
		ID = 0;
		DocID = 0;
		UserID = 0;
		Name = null;
		Email = null;
		Phone = null;
		Age = 0;
		Date = null;
		Time = null;
		Seen = 0;
		Status = 0;
	}

	/**
	 * 
	 * @param iD
	 * @param docID
	 * @param userID
	 * @param name
	 * @param email
	 * @param phone
	 * @param age
	 * @param date
	 * @param time
	 * @param seen
	 * @param status
	 */
	public Appointment(int iD, int docID, int userID, String name, String email, String phone, int age, String date,
			String time, int seen, int status) {
		ID = iD;
		DocID = docID;
		UserID = userID;
		Name = name;
		Email = email;
		Phone = phone;
		Age = age;
		Date = date;
		Time = time;
		Seen = seen;
		Status = status;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public int getDocID() {
		return DocID;
	}

	public void setDocID(int docID) {
		DocID = docID;
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

	public String getDate() {
		return Date;
	}

	public void setDate(String date) {
		Date = date;
	}

	public String getTime() {
		return Time;
	}

	public void setTime(String time) {
		Time = time;
	}

	public int getSeen() {
		return Seen;
	}

	public void setSeen(int seen) {
		Seen = seen;
	}

	public int getUserID() {
		return UserID;
	}

	public void setUserID(int userID) {
		UserID = userID;
	}

	public int getStatus() {
		return Status;
	}

	public void setStatus(int status) {
		Status = status;
	}

}