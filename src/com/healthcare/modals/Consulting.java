package com.healthcare.modals;

public class Consulting {
    private int ID;
    private int DocID;
    private int UserID;
    private String Subject;
    private String Description;
    private int Seen;
    private int Status;
    private String DateTime;
    private String Response;

    public Consulting() {
        ID = 0;
        DocID = 0;
        UserID = 0;
        Subject = null;
        Description = null;
        Seen = 0;
        Status = 0;
        DateTime = null;
        Response = null;
    }

    /**
     * 
     * @param iD
     * @param docID
     * @param userID
     * @param subject
     * @param description
     * @param seen
     * @param status
     * @param dateTime
     * @param response
     */
    public Consulting(int iD, int docID, int userID, String subject, String description, int seen, int status,
            String dateTime, String response) {
        ID = iD;
        DocID = docID;
        UserID = userID;
        Subject = subject;
        Description = description;
        Seen = seen;
        Status = status;
        DateTime = dateTime;
        Response = response;
    }

    /**
     * 
     * @param iD
     * @param status
     * @param response
     */
    public Consulting(int iD, int status, String response) {
        ID = iD;
        Status = status;
        Response = response;
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

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int userID) {
        UserID = userID;
    }

    public String getSubject() {
        return Subject;
    }

    public void setSubject(String subject) {
        Subject = subject;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public int getSeen() {
        return Seen;
    }

    public void setSeen(int seen) {
        Seen = seen;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int status) {
        Status = status;
    }

    public String getDateTime() {
        return DateTime;
    }

    public void setDateTime(String dateTime) {
        DateTime = dateTime;
    }

    public String getResponse() {
        return Response;
    }

    public void setResponse(String response) {
        Response = response;
    }

}