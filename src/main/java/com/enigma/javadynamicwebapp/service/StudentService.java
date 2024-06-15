package com.enigma.javadynamicwebapp.service;

import com.enigma.javadynamicwebapp.entity.Student;

import java.util.List;

public interface StudentService {
    void initStudent();
    List<Student> getAllStudents();
    String getStudentName(String id);
}
