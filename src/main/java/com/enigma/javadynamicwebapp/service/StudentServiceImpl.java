package com.enigma.javadynamicwebapp.service;

import com.enigma.javadynamicwebapp.entity.Student;

import java.util.ArrayList;
import java.util.List;

public class StudentServiceImpl implements StudentService {
    private final List<Student> students = new ArrayList<>();

    @Override
    public void initStudent() {
        students.add(new Student("S1", "Student Name 1", "Dep 1", 35));
        students.add(new Student("S2", "Student Name 2", "Dep 1", 70));
        students.add(new Student("S3", "Student Name 3", "Dep 1", 60));
        students.add(new Student("S4", "Student Name 4", "Dep 1", 90));
        students.add(new Student("S5", "Student Name 5", "Dep 2", 30));
        students.add(new Student("S6", "Student Name 6", "Dep 3", 32));
        students.add(new Student("S7", "Student Name 7", "Dep 3", 70));
        students.add(new Student("S8", "Student Name 8", "Dep 3", 20));
    }

    @Override
    public List<Student> getAllStudents() {
        return students;
    }
}
