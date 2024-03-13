package com.khoadev.ManagementDemo.controller;

import com.khoadev.ManagementDemo.service.TaskService;

import javax.servlet.http.HttpServlet;

public class TaskManagementServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private TaskService taskService;

    public void init() {
//        taskService = new TaskService();
    }
}
