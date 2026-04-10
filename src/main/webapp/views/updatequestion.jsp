<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Question</title>
<link rel="stylesheet" href="style/update.css">
</head>
<body>

<div class="container">

<h2 class="title">Update Question</h2>

<form action="/doChangeQue" method="post" class="update-form">

<label>Question</label>
<textarea name="question" required>${question}</textarea>

<label>Option 1</label>
<textarea name="option1" required>${option1}</textarea>

<label>Option 2</label>
<textarea name="option2" required>${option2}</textarea>

<label>Option 3</label>
<textarea name="option3">${option3}</textarea>

<label>Option 4</label>
<textarea name="option4">${option4}</textarea>

<label>Correct Option (1-4)</label>
<input type="number" name="correct" value="${correct}" min="1" max="4" required>

<input type="hidden" name="id" value="${queid}">
<input type="hidden" name="quizid" value="${quizid}">

<button type="submit" class="btn">Update</button>

</form>

</div>
<style>
body{
margin:0;
font-family: Arial, sans-serif;
background: #f4f6f9;
}

/* Container */
.container{
width: 50%;
margin: 40px auto;
background: white;
padding: 30px;
border-radius: 12px;
box-shadow: 0 6px 18px rgba(0,0,0,0.08);
}

/* Title */
.title{
text-align: center;
margin-bottom: 20px;
color: #333;
}

/* Form */
.update-form{
display: flex;
flex-direction: column;
gap: 10px;
}

/* Labels */
.update-form label{
font-weight: bold;
margin-top: 5px;
}

/* Textarea + Input */
.update-form textarea,
.update-form input[type="number"]{
padding: 10px;
border-radius: 6px;
border: 1px solid #ccc;
font-size: 14px;
width: 100%;
resize: vertical;
transition: 0.2s ease;
}

/* Focus effect */
.update-form textarea:focus,
.update-form input:focus{
border-color: #007bff;
outline: none;
box-shadow: 0 0 5px rgba(0,123,255,0.3);
}

/* Button */
.btn{
margin-top: 15px;
padding: 10px;
background: #28a745;
color: white;
border: none;
border-radius: 6px;
font-size: 16px;
cursor: pointer;
transition: 0.2s;
}

.btn:hover{
opacity: 0.8;
transform: scale(1.03);
}
</style>
</body>
</html>