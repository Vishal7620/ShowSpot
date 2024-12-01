<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background-color: #f4f4f9;
            font-family: Arial, sans-serif;
        }
        .login-card {
            width: 300px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .login-card h2 {
            margin-bottom: 20px;
            color: #333;
        }
        .login-card input[type="email"],
        .login-card input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .login-card .register-link {
            display: block;
            margin: 15px 0;
            color: #007bff;
            text-decoration: none;
        }
        .login-card .register-link:hover {
            text-decoration: underline;
        }
        .login-card button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .login-card button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="login-card">
    <h2>Login</h2>
    <form action="/login" method="POST">
        <input type="email" placeholder="Email ID" required name="email">
        <input type="password" placeholder="Password" required name="password">
        <a href="#" class="register-link">Register</a>
        <button type="submit">Login</button>
    </form>
</div>

</body>
</html>