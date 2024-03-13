package com.khoadev.ManagementDemo.helpers;

public class Helpers {
    public static String getCurrentDir() {
        String current = System.getProperty("path.dir") + "/";
        return current;
    }
}
