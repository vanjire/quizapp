<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
    <title>Mahesh Daily Quiz</title>
   
</head>
<body>
<%@ page import="java.util.List" %>

<%@ page import="com.example.demo.takeQUiz" %>
<%

takeQUiz questions=(takeQUiz)request.getAttribute("quiz");
if(questions!=null){
%>
    <div class="container">
        <h1 class="title">🚀 Mahesh Daily Quiz</h1>

        <div class="quiz-card">
            <h2>🔥 <%=questions.getQuiz().getTitle() %> #<%=questions.getQuiz().getId()%> minutes</h2>
            <p><%=questions.getQuiz().getNumOfQuestion()%> Questions | <%=questions.getQuiz().getTimeOfq() %></p>
            <a href="/startQuiz?qid=<%= questions.getQuiz().getId() %>" class="start-btn">Take Today's Challenge</a>
        </div>

        <div class="past-section">
            <a href="/toStarts">📚 View Past Quizzes</a>
        </div>
    </div>
    <%} %>
<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: linear-gradient(-45deg, #667eea, #764ba2, #6a11cb, #2575fc);
    background-size: 400% 400%;
    animation: gradientMove 12s ease infinite;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

/* Animated Background */
@keyframes gradientMove {
    0% {background-position: 0% 50%;}
    50% {background-position: 100% 50%;}
    100% {background-position: 0% 50%;}
}

.container {
    text-align: center;
    animation: fadeIn 1s ease-in-out;
}

/* Fade Animation */
@keyframes fadeIn {
    from {opacity: 0; transform: translateY(20px);}
    to {opacity: 1; transform: translateY(0);}
}

.title {
    color: white;
    margin-bottom: 30px;
    font-size: 28px;
    letter-spacing: 1px;
}

/* Quiz Card */
.quiz-card {
    background: white;
    padding: 35px;
    width: 350px;
    border-radius: 20px;
    box-shadow: 0 15px 35px rgba(0,0,0,0.3);
    transition: 0.4s ease;
    position: relative;
}

/* Card Hover */
.quiz-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 20px 45px rgba(0,0,0,0.35);
}

/* Animated Badge */
.quiz-card h2 {
    margin-bottom: 10px;
    animation: pulse 2s infinite;
}

@keyframes pulse {
    0% {transform: scale(1);}
    50% {transform: scale(1.05);}
    100% {transform: scale(1);}
}

.quiz-card p {
    color: gray;
    margin-bottom: 25px;
}

/* Start Button */
.start-btn {
    display: inline-block;
    padding: 14px 22px;
    background: linear-gradient(45deg, #4CAF50, #2ecc71);
    color: white;
    border-radius: 10px;
    text-decoration: none;
    font-size: 16px;
    font-weight: bold;
    transition: 0.3s ease;
    box-shadow: 0 5px 15px rgba(0,0,0,0.2);
}

/* Glow Hover Effect */
.start-btn:hover {
    transform: scale(1.08);
    box-shadow: 0 8px 25px rgba(0,0,0,0.35);
}

/* Past Section */
.past-section {
    margin-top: 25px;
}

.past-section a {
    color: white;
    text-decoration: none;
    font-weight: bold;
    position: relative;
    transition: 0.3s;
}

.past-section a::after {
    content: "";
    position: absolute;
    width: 0%;
    height: 2px;
    left: 0;
    bottom: -3px;
    background: white;
    transition: 0.3s;
}

.past-section a:hover::after {
    width: 100%;
}

.past-section a:hover {
    opacity: 0.8;
}


</style>
</body>
</html>