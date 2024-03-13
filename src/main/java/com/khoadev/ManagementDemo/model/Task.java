package com.khoadev.ManagementDemo.model;

import java.util.Date;

public class Task {
    private int taskID;
    private String taskName;
    private String taskType;
    private Date createdDate;
    private Date endedDate;
    private String taskDescription;
    private User userID;
    private int taskParentID;

    public Task() {
    }

    public Task(int taskID, String taskName, String taskType, Date createdDate, Date endedDate, String taskDescription, User userID, int taskParentID) {
        this.taskID = taskID;
        this.taskName = taskName;
        this.taskType = taskType;
        this.createdDate = createdDate;
        this.endedDate = endedDate;
        this.taskDescription = taskDescription;
        this.userID = userID;
        this.taskParentID = taskParentID;
    }

    public int getTaskID() {
        return taskID;
    }

    public void setTaskID(int taskID) {
        this.taskID = taskID;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getTaskType() {
        return taskType;
    }

    public void setTaskType(String taskType) {
        this.taskType = taskType;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getEndedDate() {
        return endedDate;
    }

    public void setEndedDate(Date endedDate) {
        this.endedDate = endedDate;
    }

    public String getTaskDescription() {
        return taskDescription;
    }

    public void setTaskDescription(String taskDescription) {
        this.taskDescription = taskDescription;
    }

    public User getUserID() {
        return userID;
    }

    public void setUserID(User userID) {
        this.userID = userID;
    }

    public int getTaskParentID() {
        return taskParentID;
    }

    public void setTaskParentID(int taskParentID) {
        this.taskParentID = taskParentID;
    }
}
