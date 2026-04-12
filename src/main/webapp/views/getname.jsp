<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quizora</title>

<style>

body {
    margin: 0;
    font-family: 'Segoe UI', Arial, sans-serif;
    background: linear-gradient(135deg, #dfe9f3, #ffffff);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

/* CARD */
.box {
    width: 90%;
    max-width: 360px;
    background: white;
    padding: 30px 25px;
    border-radius: 18px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.15);
    text-align: center;
    animation: fadeIn 0.5s ease;
}

/* TITLE */
.title {
    font-size: 22px;
    margin-bottom: 5px;
    font-weight: 600;
    color: #2c3e50;
}

.subtitle {
    font-size: 13px;
    color: #7f8c8d;
    margin-bottom: 20px;
}

/* INPUT */
input {
    width: 100%;
    padding: 13px;
    border: 1px solid #ddd;
    border-radius: 10px;
    outline: none;
    font-size: 14px;
    transition: 0.3s;
}

input:focus {
    border-color: #0088cc;
    box-shadow: 0 0 0 3px rgba(0,136,204,0.1);
}

/* BUTTON */
button {
    margin-top: 18px;
    width: 100%;
    padding: 13px;
    background: linear-gradient(135deg, #0088cc, #0070aa);
    color: white;
    border: none;
    border-radius: 10px;
    font-size: 15px;
    font-weight: 500;
    cursor: pointer;
    transition: 0.3s;
}

button:hover {
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(0,136,204,0.3);
}

/* ERROR */
.error {
    color: red;
    font-size: 12px;
    margin-top: 10px;
}

/* ANIMATION */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(15px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

</style>
</head>

<body>

<div class="box">

    <div class="title">Welcome to Quizora 👋</div>
    <div class="subtitle">Enter your name to get started</div>

    <form action="saveName" method="post">
        <input type="text" name="name" placeholder="Your name" required />
        <button type="submit">Continue</button>

        <div class="error">${msg}</div>
    </form>

</div>

</body>
</html>