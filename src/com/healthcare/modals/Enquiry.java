package com.healthcare.modals;

public class Enquiry {

    private int ID;
    private String Name;
    private String Email;
    private String Subject;
    private String Message;
    private String DateTime;
    private int Seen;

    /**
     * Initializing with null values
     */
    public Enquiry() {
        ID = 0;
        Name = null;
        Email = null;
        Subject = null;
        Message = null;
        DateTime = null;
        Seen = 0;
    }

    /**
     * 
     * @param iD
     * @param name
     * @param email
     * @param subject
     * @param message
     * @param dateTime
     * @param seen
     */
    public Enquiry(int iD, String name, String email, String subject, String message, String dateTime, int seen) {
        ID = iD;
        Name = name;
        Email = email;
        Subject = subject;
        Message = message;
        DateTime = dateTime;
        Seen = seen;
    }

    /**
     * 
     * @return ID
     */
    public int getID() {
        return ID;
    }

    /**
     * Set values
     * 
     * @param iD
     */
    public void setID(int iD) {
        ID = iD;
    }

    /**
     * 
     * @return Name
     */
    public String getName() {
        return Name;
    }

    /**
     * Set values
     * 
     * @param name
     */
    public void setName(String name) {
        Name = name;
    }

    /**
     * 
     * @return Email
     */
    public String getEmail() {
        return Email;
    }

    /**
     * 
     * @param email
     */
    public void setEmail(String email) {
        Email = email;
    }

    /**
     * 
     * @return Subject
     */
    public String getSubject() {
        return Subject;
    }

    /**
     * Set values
     * 
     * @param subject
     */
    public void setSubject(String subject) {
        Subject = subject;
    }

    /**
     * 
     * @return Message
     */
    public String getMessage() {
        return Message;
    }

    /**
     * Set values
     * 
     * @param message
     */
    public void setMessage(String message) {
        Message = message;
    }

    /**
     * 
     * @return DateTime
     */
    public String getDateTime() {
        return DateTime;
    }

    /**
     * Set values
     * 
     * @param dateTime
     */
    public void setDateTime(String dateTime) {
        DateTime = dateTime;
    }

    /**
     * 
     * @return Seen
     */
    public int getSeen() {
        return Seen;
    }

    /**
     * Set values
     * 
     * @param seen
     */
    public void setSeen(int seen) {
        Seen = seen;
    }

}
