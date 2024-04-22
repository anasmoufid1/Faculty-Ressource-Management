<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <div class="row justify-content-center signup-container">
        <div class="col-md-6">
            <div class="signup-form">
                <div class="signup-logo">
                    <img src="img/logo.png" alt="Logo" width="150">
                </div>
                <h2 class="text-center mb-4">Login</h2>

                <% if (request.getParameter("success") != null && request.getParameter("success").equals("true")) { %>
                <div class="alert alert-success" role="alert">
                    You have successfully signed up!
                </div>
                <% } %>
                <% if (request.getParameter("success") != null && request.getParameter("success").equals("false")) { %>
                <div class="alert alert-danger" role="alert">
                    Username or Password incorrect!
                </div>
                <% } %>

                <form action="/login" method="post">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username" name="username" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="rememberMe" name="rememberMe">
                        <label class="form-check-label" for="rememberMe">Remember me</label>
                    </div>
                    <button type="submit" class="btn btn-secondary btn-block">Login</button>
                </form>

                <div class="text-center mt-3">
                    don't have an account? <a href="register">Register</a>
                </div>
            </div>
        </div>
    </div>
</div>



</body>
</html>
