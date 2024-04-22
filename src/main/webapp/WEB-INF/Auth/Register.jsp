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
                <h2 class="text-center mb-4">Sign Up</h2>
                <form action="/register" method="post">
                    <div class="form-group">
                        <label for="companyName">Company Name</label>
                        <input type="text" class="form-control" id="companyName" name="companyName" required>
                    </div>
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username" name="username" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <div class="form-group">
                        <label for="verifyPassword">Verify Password</label>
                        <input type="password" class="form-control" id="verifyPassword" name="verifyPassword" required>
                    </div>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="acceptPolicy" required>
                        <label class="form-check-label" for="acceptPolicy">Accept policy of <strong><a href="#" class="link-dark"> terms and services</a></strong></label>
                    </div>
                    <button type="submit" class="btn btn-secondary btn-block">Register</button>
                </form>

                <div class="text-center mt-3">
                    Already have an account? <a href="login">Login</a>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
