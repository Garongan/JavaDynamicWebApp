<%@ page import="com.enigma.javadynamicwebapp.entity.Student" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%--
Created by IntelliJ IDEA.
  User: alvindo
  Date: 15/06/24
  Time: 12.26
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome - Page</title>
    <%--  import jquery  --%>
    <script src="js/jquery-3.7.1.min.js" type="text/javascript"></script>
    <%--  js open and close modal  --%>
    <script>
        $(document).ready(function () {
            $("#student-modal").hide()
        })
        function openModal(name) {
            $("#student-name").html(name)
            $("#student-modal").show()
        }
        function closeModal() {
            $("#student-modal").hide()
        }
    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body class="container d-flex justify-content-center align-items-center" style="min-height: 100vh">
<div class="d-flex w-100 flex-column">
    <%
        String userId = (String) request.getSession().getAttribute("user_id");
        if (userId != null) {
    %>
    <h3 class="h3 mb-3">Welcome <%= userId%>
    </h3>
    <%}%>

    <div class="table-responsive">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th scope="col">Department</th>
                <th scope="col">Student ID</th>
                <th scope="col">Marks</th>
                <th scope="col">Pass %</th>
            </tr>
            </thead>
            <tbody>
            <%
                Map<String, List<Student>> groupStudents = (Map<String, List<Student>>) request.getAttribute("students");
                for (Map.Entry<String, List<Student>> entry : groupStudents.entrySet()) {
                    String department = entry.getKey();
                    int rowSpanLength = entry.getValue().size();
                    int subTotalPass = entry.getValue().stream()
                            .map(Student::getMark)
                            .filter(mark -> mark > 40)
                            .toList().size();
                    float totalPass = ((float) subTotalPass / rowSpanLength) * 100;
                    List<Student> students = entry.getValue();
                    boolean isCalledOnce = true;
            %>
            <tr>
                <td rowspan=<%= rowSpanLength%>>
                    <%= department%>
                </td>

                <%
                    for (Student student : students) {
                %>
                <td onclick="openModal('<%= student.getStudentName()%>')" style="cursor: pointer">
                    <%= student.getStudentID()%>
                </td>
                <td>
                    <%= student.getMark()%>
                </td>
                <% if (isCalledOnce) { %>
                <td rowspan=<%= rowSpanLength%>>
                    <%= new DecimalFormat("##.##").format(totalPass)%>
                </td>
                <%
                        isCalledOnce = false;
                    }
                %>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<%-- modal dialog --%>
<div class="modal" id="student-modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Student Name</h5>
                <button type="button" class="btn btn-close" onclick="closeModal()">X</button>
            </div>
            <div class="modal-body">
                <p id="student-name"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" onclick="closeModal()">Close</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
