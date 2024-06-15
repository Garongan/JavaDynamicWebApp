package com.enigma.javadynamicwebapp.servlet;

import java.io.*;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.stream.Collectors;

import com.enigma.javadynamicwebapp.entity.Student;
import com.enigma.javadynamicwebapp.service.StudentService;
import com.enigma.javadynamicwebapp.service.StudentServiceImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "WelcomeServlet", value = "/welcome-page")
public class WelcomeServlet extends HttpServlet {
    private final StudentService service = new StudentServiceImpl();

    public void init() {
        service.initStudent();
    }

    // return view welcome jsp
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String userId = (String) request.getSession().getAttribute("user_id");
        RequestDispatcher dispatcher = request.getRequestDispatcher("welcome.jsp");

        // session expired or no logged user
        if (userId == null || userId.isEmpty()) {
            response.sendRedirect("login");
            return;
        }

        List<Student> students = service.getAllStudents();
        Map<String, List<Student>> groupStudents = students.stream().collect(Collectors.groupingBy(Student::getDepartment));
        TreeMap<String, List<Student>> treeMap = new TreeMap<>(groupStudents);
        request.setAttribute("students", treeMap);
        dispatcher.forward(request, response);

    }

}