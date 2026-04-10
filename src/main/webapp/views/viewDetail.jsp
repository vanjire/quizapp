<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
   
</head>
<body>
    <div class="container">
       <div class="result-table-container">
<div class="result-summary">
    <h2>Quiz Result</h2>
    <p>Total Questions: <span id="totalQ"></span></p>
    <p>Correct Answers: <span id="correctCount"></span></p>
    <p>Wrong Answers: <span id="wrongCount"></span></p>
    <p>Percentage: <span id="percentage"></span>%</p>

    <button onclick="filterWrong()" class="filter-btn">Show Only Wrong</button>
    <button onclick="resetFilter()" class="filter-btn">Show All</button>
    <button onclick="window.print()" class="filter-btn download">Download / Print</button>
</div>
<table class="result-table">

<thead>
<tr>
    <th>Question</th>
    <th>Option 1</th>
    <th>Option 2</th>
    <th>Option 3</th>
    <th>Option 4</th>
    <th>Correct Option</th>
    <th>Your Answer</th>
</tr>
</thead>

<tbody>
          <%@ page import="java.util.List" %>
<%@ page import="com.example.demo.StudentAnswer" %>
<%@ page import="com.example.demo.Question" %>

<%
List<StudentAnswer> answers = (List<StudentAnswer>) request.getAttribute("answers");
List<Question> quns = (List<Question>) request.getAttribute("questions");

for(int i=0;i<quns.size();i++){
		
%>

<tr>
   
    <td><%= quns.get(i).getQuestion() %></td>
    <td><%= quns.get(i).getOption1() %></td>
    <td><%= quns.get(i).getOption2() %></td>
    <td><%= quns.get(i).getOption3()%></td>
    <td><%=quns.get(i).getOption4() %></td>
    <td><%= quns.get(i).getCorrectOption() %></td>
    <td><%= answers.get(i).getSelectedOption() %></td>
  
</tr>

<%
}
%>
       </tbody>

</table>

</div>
    </div>
    <style>
   body{
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg,#4e73df,#1cc88a);
    margin:0;
    padding:0;
}

/* Main Container */
.container{
    width: 95%;
    margin: 40px auto;
}

/* Table Wrapper */
.result-table-container{
    background: white;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.15);
    overflow-x: auto;
}

/* Table */
.result-table{
    width: 100%;
    border-collapse: collapse;
    min-width: 900px;
}

/* Header */
.result-table thead{
    background: linear-gradient(90deg,#4e73df,#1cc88a);
    color: white;
}

.result-table th{
    padding: 14px;
    font-size: 14px;
    letter-spacing: 0.5px;
}

/* Table Cells */
.result-table td{
    padding: 12px;
    text-align: center;
    font-size: 14px;
    border-bottom: 1px solid #eee;
}

/* Alternate Row Color */
.result-table tbody tr:nth-child(even){
    background-color: #f9f9f9;
}

/* Hover Effect */
.result-table tbody tr:hover{
    background-color: #e3f2fd;
    transition: 0.3s;
}

/* Correct Answer */
.correct{
    color: #1cc88a;
    font-weight: bold;
}

/* Wrong Answer */
.wrong{
    color: #e74a3b;
    font-weight: bold;
}

/* Responsive Scroll */
@media(max-width:768px){
    .result-table th,
    .result-table td{
        font-size: 12px;
        padding: 8px;
    }
}
/* Result Summary */
.result-summary{
    margin-bottom:20px;
    padding:15px;
    background:#f8f9fc;
    border-radius:10px;
    display:flex;
    flex-wrap:wrap;
    gap:15px;
    align-items:center;
    justify-content:space-between;
}

.result-summary h2{
    width:100%;
    margin-bottom:10px;
}

.filter-btn{
    padding:6px 12px;
    border:none;
    border-radius:6px;
    cursor:pointer;
    background:#4e73df;
    color:white;
    transition:0.3s;
}

.filter-btn:hover{
    transform:scale(1.05);
}

.download{
    background:#1cc88a;
}
    </style>
    <script>

// Get rows
let rows = document.querySelectorAll(".result-table tbody tr");

let correct = 0;
let wrong = 0;

rows.forEach(row=>{
    let correctOption = row.children[5].innerText.trim();
    let userAnswer = row.children[6].innerText.trim();

    if(correctOption === userAnswer){
        row.children[6].classList.add("correct");
        correct++;
    }else{
        row.children[6].classList.add("wrong");
        wrong++;
    }
});

// Update summary
document.getElementById("totalQ").innerText = rows.length;
document.getElementById("correctCount").innerText = correct;
document.getElementById("wrongCount").innerText = wrong;

let percent = rows.length > 0 ? ((correct/rows.length)*100).toFixed(2) : 0;
document.getElementById("percentage").innerText = percent;


// Filter wrong answers
function filterWrong(){
    rows.forEach(row=>{
        let correctOption = row.children[5].innerText.trim();
        let userAnswer = row.children[6].innerText.trim();

        if(correctOption === userAnswer){
            row.style.display = "none";
        }else{
            row.style.display = "";
        }
    });
}

function resetFilter(){
    rows.forEach(row=>{
        row.style.display = "";
    });
}

</script>
</body>
</html>>