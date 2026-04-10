<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Quiz</title>
<link rel="stylesheet" href="style/updatequiz.css">
</head>
<body>

<div class="container">

<h2 class="title">Update Quiz</h2>

<form action="docq" method="post" class="quiz-form">

<label>Title</label>
<textarea name="title" required>${title}</textarea>

<label>Description</label>
<textarea name="description" required>${desc}</textarea>

<input type="hidden" name="qid" value="${qid}">

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
width: 45%;
margin: 60px auto;
background: white;
padding: 30px;
border-radius: 12px;
box-shadow: 0 8px 20px rgba(0,0,0,0.08);
}

/* Title */
.title{
text-align: center;
margin-bottom: 25px;
color: #333;
}

/* Form */
.quiz-form{
display: flex;
flex-direction: column;
gap: 10px;
}

/* Labels */
.quiz-form label{
font-weight: bold;
margin-top: 5px;
}

/* Textarea */
.quiz-form textarea{
padding: 12px;
border-radius: 8px;
border: 1px solid #ccc;
font-size: 14px;
resize: vertical;
min-height: 60px;
transition: 0.2s ease;
}

/* Focus Effect */
.quiz-form textarea:focus{
border-color: #007bff;
outline: none;
box-shadow: 0 0 6px rgba(0,123,255,0.3);
}

/* Button */
.btn{
margin-top: 15px;
padding: 10px;
background: #007bff;
color: white;
border: none;
border-radius: 8px;
font-size: 15px;
cursor: pointer;
transition: 0.2s ease;
}

.btn:hover{
opacity: 0.85;
transform: scale(1.03);
}
</style>
</body>
</html>