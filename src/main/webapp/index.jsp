<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Page</title>
    <%--  import jquery  --%>
    <script src="js/jquery-3.7.1.min.js" type="text/javascript"></script>
    <%--  js validation  --%>
    <script type="text/javascript">
        $(document).ready(function () {
            const userId = $("#user_id");
            const password = $("#password");
            const loginButton = $("#login_button");
            loginButton.attr("disabled", true)

            const invalidFeedbackUserId = $("#invalid_feedback_user_id");
            const invalidFeedbackPassword = $("#invalid_feedback_password");

            function checkUserId() {
                if (userId.val() === null) {
                    userId.addClass("is-invalid")
                    invalidFeedbackUserId.html("Please input user id at least 4 characters")
                    return false
                } else if (userId.val().length < 4) {
                    userId.addClass("is-invalid")
                    invalidFeedbackUserId.html("Please input your user id")
                    return false
                }
                userId.removeClass("is-invalid")
                return true
            }

            function checkPassword() {
                if (userId.val() === null) {
                    password.addClass("is-invalid")
                    invalidFeedbackPassword.html("Please input password at least 4 characters")
                    return false
                } else if (password.val().length < 4) {
                    password.addClass("is-invalid")
                    invalidFeedbackPassword.html("Please input your password")
                    return false
                }
                password.removeClass("is-invalid")
                return true
            }

            userId.change(function () {
                if (checkUserId() && checkPassword()) {
                    loginButton.removeAttr("disabled")
                }
            })

            userId.blur(function (){
                if (checkUserId() && checkPassword()) {
                    loginButton.removeAttr("disabled")
                }
            })

            password.change(function () {
                if (checkUserId() && checkPassword()) {
                    loginButton.removeAttr("disabled")
                }
            })

            password.blur(function (){
                if (checkUserId() && checkPassword()) {
                    loginButton.removeAttr("disabled")
                }
            })
        });
    </script>
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
    <form action="${pageContext.request.contextPath}/login" method="post" novalidate>
        <div class="mb-3">
            <label for="user_id" class="form-label">User ID</label>
            <input type="text" class="form-control" name="user_id" id="user_id">
            <div class="invalid-feedback" id="invalid_feedback_user_id"></div>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Example textarea</label>
            <input type="password" class="form-control" name="password" id="password"/>
            <div class="invalid-feedback" id="invalid_feedback_password"></div>
        </div>
        <div class="mb-3">
            <button class="btn btn-primary" type="submit" id="login_button">Login</button>
        </div>
    </form>
</div>
</body>
</html>