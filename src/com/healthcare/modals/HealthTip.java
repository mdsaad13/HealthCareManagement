package com.healthcare.modals;

public class HealthTip {
    private int ID;
    private String Title;
    private String Description;
    private String DateTime;
    private int Visibility;

    public HealthTip() {
        ID = 0;
        Title = null;
        Description = null;
        DateTime = null;
        Visibility = 0;
    }

    /**
     * 
     * @param iD
     * @param title
     * @param description
     * @param dateTime
     * @param visibility
     */
    public HealthTip(int iD, String title, String description, String dateTime, int visibility) {
        ID = iD;
        Title = title;
        Description = description;
        DateTime = dateTime;
        Visibility = visibility;
    }

    public int getID() {
        return ID;
    }

    public void setID(int iD) {
        ID = iD;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String title) {
        Title = title;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public String getDateTime() {
        return DateTime;
    }

    public void setDateTime(String dateTime) {
        DateTime = dateTime;
    }

    public int getVisibility() {
        return Visibility;
    }

    public void setVisibility(int visibility) {
        Visibility = visibility;
    }

}