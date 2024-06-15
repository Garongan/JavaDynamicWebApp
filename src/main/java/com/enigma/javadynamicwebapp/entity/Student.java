package com.enigma.javadynamicwebapp.entity;

public class Student {
    private String studentID;
    private String studentName;
    private String department;
    private Integer mark;

    public Student() {
    }

    public Student(String studentID, String studentName, String department, Integer mark) {
        this.studentID = studentID;
        this.studentName = studentName;
        this.department = department;
        this.mark = mark;
    }

    public String getStudentID() {
        return studentID;
    }

    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public Integer getMark() {
        return mark;
    }

    public void setMark(Integer mark) {
        this.mark = mark;
    }
}
