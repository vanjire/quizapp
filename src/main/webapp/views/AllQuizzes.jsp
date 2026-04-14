<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.Quiz" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>All Quizzes</title>
<link rel="stylesheet" href="style/showall.css">
</head>
<body>

<div class="container">

<h2 class="title">All Quizzes</h2>
<input type="text" id="searchInput" placeholder="Search quiz by title..." class="search-box">
<p class="count-text">Total Quizzes: <span id="quizCount"></span></p>
<table class="result-table">
<thead>
<tr>
<th>ID</th>
<th>Title</th>
<th>Description</th>
<th>Actions</th>
</tr>
</thead>

<tbody>

<%
List<Quiz> quizzes = (List<Quiz>) request.getAttribute("quizzes");

if(quizzes != null){
for(Quiz q : quizzes){
%>

<tr>
<td><%= q.getId() %></td>
<td><%= q.getTitle() %></td>
<td><%= q.getDescription() %></td>

<td class="actions">

<form action="deleteQuiz" method="post"
onsubmit="return confirm('Delete this quiz?');">
<input type="hidden" name="qid" value="<%= q.getId() %>">
<button class="btn delete">Delete</button>
</form>

<form action="questions" method="get">
<input type="hidden" name="qid" value="<%= q.getId() %>">
<button class="btn view">View Questions</button>
</form>

<form action="submittedstu" method="get">
<input type="hidden" name="qid" value="<%= q.getId() %>">
<button class="btn view">Submitted Students</button>
</form>

<a class="btn update" href="/updateQuiz?qid=<%= q.getId() %>">
Update
</a>

</td>
</tr>

<%
}
}
%>

</tbody>
</table>

</div>
<style>


body{
font-family: Arial, sans-serif;
background: linear-gradient(135deg,#e3f2fd,#f4f6f9);
margin: 0;
padding: 0;
}

/* Container */
.container{
width: 90%;
margin: 40px auto;
animation: fadeIn 0.5s ease;
}

@keyframes fadeIn{
from{opacity:0; transform: translateY(15px);}
to{opacity:1; transform: translateY(0);}
}

/* Title */
.title{
text-align: center;
margin-bottom: 10px;
color: #333;
}

/* Search */
.search-box{
display:block;
margin: 15px auto;
padding: 10px;
width: 300px;
border-radius: 6px;
border: 1px solid #ccc;
}

.count-text{
text-align:center;
font-size:14px;
color:#666;
margin-bottom:15px;
}

/* Table */
.result-table{
width: 100%;
border-collapse: collapse;
background: white;
border-radius: 10px;
overflow: hidden;
box-shadow: 0 8px 20px rgba(0,0,0,0.1);
}

.result-table th{
background: linear-gradient(45deg,#007bff,#00c6ff);
color: white;
padding: 12px;
text-align: left;
position: sticky;
top: 0;
}

.result-table td{
padding: 12px;
border-bottom: 1px solid #eee;
transition: 0.2s;
}

/* Row hover */
.result-table tbody tr:hover{
background: #e3f2fd;
transform: scale(1.01);
}

/* Actions column */
.actions{
display: flex;
flex-wrap: wrap;
gap: 8px;
}

/* Buttons */
.btn{
text-decoration: none;
padding: 6px 12px;
border-radius: 6px;
font-size: 13px;
border: none;
cursor: pointer;
color: white;
transition: 0.3s;
}

/* Colors */
.delete{ background: #dc3545; }
.view{ background: #17a2b8; }
.update{ background: #28a745; display: inline-block; }

/* Hover */
.btn:hover{
transform: scale(1.08);
opacity: 0.9;
}
</style>
<script>

// Live Search Filter
let searchInput = document.getElementById("searchInput");
let rows = document.querySelectorAll(".result-table tbody tr");
let countText = document.getElementById("quizCount");

countText.innerText = rows.length;

searchInput.addEventListener("keyup", function(){
    let value = this.value.toLowerCase();
    let visibleCount = 0;

    rows.forEach(row=>{
        let title = row.children[1].innerText.toLowerCase();

        if(title.includes(value)){
            row.style.display = "";
            visibleCount++;
        }else{
            row.style.display = "none";
        }
    });

    countText.innerText = visibleCount;
});

// Better Delete Confirmation

</script>
</body>
</html>
