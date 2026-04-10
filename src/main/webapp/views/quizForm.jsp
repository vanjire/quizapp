<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Quiz Create</title>

<link rel="stylesheet" href="style/quiz.css">

</head>
<body>

<div class="container">

<form id="questions" action="saveQuize" method="post">

<div id="frm">

<div>
<input type="text" name="title" placeholder="Title" required>
<input type="text" name="description" placeholder="Description">
<input type="number" name="timeq" placeholder="Time in minutes">
</div>

</div>

<input type="submit" value="Save Quiz">

</form>

<div id="numberq">
<input type="number" id="count" placeholder="Number of Questions">
<button type="button" onclick="create()">Create</button>
</div>

</div>

<script>

function create(){

let form = document.getElementById('frm');
let co = document.getElementById('count').value;

document.getElementById('numberq').style.display = "none";

for(let i=0;i<co;i++){

let ro = document.createElement('div');
ro.className = "zx";

let label = document.createElement('div');
label.className = "px";
label.innerHTML = "Question " + (i+1);
ro.appendChild(label);

/* ✅ Question Textarea */
let q = document.createElement('textarea');
q.name = "question";
q.placeholder = "Enter question";
ro.appendChild(q);

/* ✅ Options Textarea */
for(let j=1;j<=4;j++){

let opt = document.createElement('textarea');
opt.name = "option"+j;
opt.placeholder = "Enter option "+j;
ro.appendChild(opt);

}

/* ✅ Correct Option */
let correct = document.createElement('input');
correct.type = "number";
correct.name = "correctOption";
correct.placeholder = "Enter correct option (1-4)";
ro.appendChild(correct);

form.appendChild(ro);

}

}

</script>

</body>
<style>
body{
font-family: Arial, sans-serif;
background-color: #f4f6f9;
}

.container{
width: 70%;
margin: auto;
background: white;
padding: 20px;
border-radius: 10px;
box-shadow: 0 4px 10px rgba(0,0,0,0.1);
}

input, textarea{
width: 100%;
padding: 10px;
margin: 8px 0;
border-radius: 6px;
border: 1px solid #ccc;
font-size: 14px;
resize: vertical;
}

textarea{
min-height: 60px;
}

input[type="submit"], button{
background: #007bff;
color: white;
border: none;
padding: 10px 15px;
border-radius: 6px;
cursor: pointer;
width: auto;
}

button{
background: green;
}

input[type="submit"]:hover,
button:hover{
opacity: 0.8;
}

.zx{
background: #f9f9f9;
padding: 15px;
margin-top: 15px;
border-radius: 8px;
border: 1px solid #ddd;
}

.px{
font-weight: bold;
margin-bottom: 8px;
font-size: 16px;
}
</style>
</html>