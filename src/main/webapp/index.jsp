<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Page</title>
    <%--  import jquery  --%>
    <script src="js/jquery-3.7.1.min.js" type="text/javascript"></script>
    <%--  import js validation  --%>
    <script src="js/app-ajax.js" type="text/javascript"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body class="container d-flex justify-content-center align-items-center" style="min-height: 100vh">
<div class="d-flex flex-column w-auto">
    <%
        String error = request.getParameter("error");
        if (error != null && error.equals("invalid-credentials")) {
    %>
    <div class="alert alert-danger" role="alert">
        Invalid User ID or Password
    </div>
    <% } %>
    <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="mb-3">
            <label for="user_id" class="form-label">User ID</label>
            <input type="text" class="form-control is-invalid" name="user_id" id="user_id">
            <div class="invalid-feedback">
                You must agree before submitting.
            </div>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Example textarea</label>
            <input type="password" class="form-control is-invalid" name="password" id="password"/>
            <div class="invalid-feedback">
                You must agree before submitting.
            </div>
        </div>
        <div class="mb-3">
            <button class="btn btn-primary" type="submit">Login</button>
        </div>
    </form>
</div>
</body>
</html>