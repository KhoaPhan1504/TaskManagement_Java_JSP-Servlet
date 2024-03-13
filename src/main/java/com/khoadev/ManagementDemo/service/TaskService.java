package com.khoadev.ManagementDemo.service;

import com.khoadev.ManagementDemo.dao.TaskDAO;
import com.khoadev.ManagementDemo.model.Task;

import java.util.List;

public class TaskService {
    private TaskDAO taskDAO;
    public void TaskServie(TaskDAO taskDAO) {
        this.taskDAO = taskDAO;
    }

    public List<Task> getAllTasks() {
        return taskDAO.getAllTasks();
    }

    public void createTask(Task task) {
        taskDAO.createTask(task);
    }
     public void readTask(Task task) {
        taskDAO.readTask(task);
    }
     public void updateTask(Task task) {
        taskDAO.updateTask(task);
    }
     public void deleteTask(Task task) {
        taskDAO.deleteTask(task);
    }

}
