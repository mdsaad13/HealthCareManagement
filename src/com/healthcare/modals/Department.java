package com.healthcare.modals;

public class Department {
	private int ID;
	private String Name;

	public Department() {
		ID = 0;
		Name = null;
	}

	/**
	 * 
	 * @param iD
	 * @param name
	 */
	public Department(int iD, String name) {
		ID = iD;
		Name = name;
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

}
