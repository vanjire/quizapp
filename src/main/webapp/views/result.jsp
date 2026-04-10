<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.submittedUsers" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result & Leaderboard</title>

<style>
/* ================= BODY ================= */

body{
    margin:0;
    font-family: 'Segoe UI', Arial, sans-serif;
    background:linear-gradient(-45deg,#667eea,#764ba2,#6a11cb,#2575fc);
    background-size:400% 400%;
    animation:gradientMove 12s ease infinite;
}

/* Background animation */

@keyframes gradientMove{
0%{background-position:0% 50%;}
50%{background-position:100% 50%;}
100%{background-position:0% 50%;}
}

/* ================= PAGE LAYOUT ================= */

.page-container{
    display:flex;
    flex-direction:column;
    align-items:center;
    gap:40px;
    padding:40px 20px;
}

/* ================= QUIZ STATS ================= */

.quiz-stats{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(160px,1fr));
    gap:20px;
    width:90%;
    max-width:900px;
}

.stat-box{
    background:white;
    padding:18px;
    border-radius:12px;
    text-align:center;
    font-weight:bold;
    box-shadow:0 6px 18px rgba(0,0,0,0.15);
}

/* ================= RESULT CARD ================= */

.result-card{
    background:white;
    padding:35px;
    width:360px;
    border-radius:18px;
    text-align:center;
    box-shadow:0 20px 40px rgba(0,0,0,0.25);
}

.score-number{
    font-size:36px;
    font-weight:bold;
    margin:20px 0;
}

/* Progress bar */

.progress-container{
    background:#eee;
    height:18px;
    border-radius:12px;
    overflow:hidden;
}

.progress-bar{
    height:100%;
    width:0%;
    transition:width 1.5s ease;
}

/* Buttons */

button{
    padding:12px 22px;
    border:none;
    border-radius:8px;
    background:linear-gradient(45deg,#4CAF50,#2ecc71);
    color:white;
    font-weight:bold;
    cursor:pointer;
    margin-top:15px;
    transition:0.3s;
}

button:hover{
    transform:scale(1.08);
}

/* Details link */

.details-link{
    display:inline-block;
    margin-top:15px;
    font-weight:bold;
    text-decoration:none;
    color:#3498db;
}

/* ================= LEADERBOARD ================= */

.quiz-leaders{
    background:white;
    padding:25px;
    border-radius:18px;
    width:90%;
    max-width:900px;
    box-shadow:0 15px 35px rgba(0,0,0,0.2);
}

/* Table */

.quiz-leaders table{
    width:100%;
    border-collapse:collapse;
}

.quiz-leaders th{
    background:#667eea;
    color:white;
}

.quiz-leaders th,
.quiz-leaders td{
    padding:14px;
    text-align:center;
}

.quiz-leaders tr{
    border-bottom:1px solid #eee;
}

.quiz-leaders tr:hover{
    background:#f4f6ff;
}

/* ================= PAGINATION ================= */

.pagination{
    margin-top:20px;
    text-align:center;
}

.pagination a{
    padding:8px 16px;
    background:#667eea;
    color:white;
    border-radius:6px;
    text-decoration:none;
    margin:0 8px;
}

.pagination a:hover{
    opacity:0.8;
}
.quiz-leaders img{
width:40px;
height:40px;
border-radius:50%;
object-fit:cover;
border:2px solid #667eea;
}

</style>
</head>
<body>

<div class="page-container">

<!-- ================= RESULT CARD ================= -->
<div class="quiz-stats">

<div class="stat-box">
Participants<br><span id="participants">${participants}</span>
</div>

<div class="stat-box">
Top Score<br><spn id="topscore">${topscore}</spn>
</div>

<div class="stat-box">
Average Score<br><span id="averagescore">${averagescore}</span>
</div>

<div class="stat-box">
Total Questions<br><span id="qnum">${qnum}</span>
</div>

<div class="stat-box">
Your Rank<br><span class="urank">${urank}</span>
</div>

</div>
<div class="result-card">

    <h2>🎉 Your Score</h2>

    <div class="score-number">
        <span id="correct">${marks}</span>
        /
        <span id="totm">${qnum}</span>
        
    </div>
     <h2> Your Rank<br><span class="urank">${urank}</span> </h2>
    <div class="progress-container">
        <div class="progress-bar" id="progressBar"></div>
    </div>

    <h3 id="message"></h3>

    <button onclick="goHome()">Back to Home</button>

    <br><br>

    <a href="/viewDetail?qid=${qid}" class="details-link">
        🔍 View Details
    </a>

</div>

<!-- ================= LEADERBOARD ================= -->

<div class="quiz-leaders">


</div>

</div>

<!-- ================= SCRIPT ================= -->

<script>

window.onload = function(){

let correct = parseInt(document.getElementById("correct").innerText);
let total = parseInt(document.getElementById("totm").innerText);

let percentage = (correct/total)*100;
let progressBar = document.getElementById("progressBar");

/* Animated counter */

let count = 0;

let counter = setInterval(()=>{
    if(count >= correct){
        clearInterval(counter);
    }else{
        count++;
        document.getElementById("correct").innerText = count;
    }
},80);

/* Progress color */

if(percentage==100){
    progressBar.style.background =
    "linear-gradient(45deg,#f7971e,#ffd200)";
}
else if(percentage>=70){
    progressBar.style.background =
    "linear-gradient(45deg,#4CAF50,#2ecc71)";
}
else if(percentage>=40){
    progressBar.style.background =
    "linear-gradient(45deg,#ff9800,#ffc107)";
}
else{
    progressBar.style.background =
    "linear-gradient(45deg,#f44336,#e57373)";
}

/* Animate bar */

setTimeout(()=>{
    progressBar.style.width = percentage + "%";
},300);

/* Message */

let message="";

if(percentage==100){
    message="🔥 Perfect Score!";
}
else if(percentage>=70){
    message="👏 Great Job!";
}
else if(percentage>=40){
    message="🙂 Good Attempt!";
}
else{
    message="📚 Keep Practicing!";
}

document.getElementById("message").innerText = message;

};

function goHome(){
    window.location.href="/dashboard";
}
let page = 0;
let currentPage = 0;
let qid = ${qid}; // ✅ define once globally

function loadPage(pageNo = 0){

    page = pageNo;
    currentPage = page;

    fetch("/api/leadersquiz?qid=" + qid + "&page=" + page)
    .then(res => res.json())
    .then(data => {

        let container = document.querySelector(".quiz-leaders");

        let html = `
        <h2>🏆 Leaderboard</h2>
        <table>
            
        `;

       let prevScore = null;
let rank = 0;
let actualIndex = page * data.size; // global position

data.content.forEach((user, index) => {

    actualIndex++;

    if(prevScore === null){
        rank = actualIndex;
    }
    else if(user.score < prevScore){
        rank = actualIndex;  // jump rank properly
    }
    // if same score → keep same rank

    prevScore = user.score;
			let uid=user.userEmail;
            let rankDisplay = "#" + rank;

            if(rank === 1) rankDisplay = "🥇 " + rank;
            else if(rank === 2) rankDisplay = "🥈 " + rank;
            else if(rank === 3) rankDisplay = "🥉 " + rank;

            let profileImg = user.profilePhoto
                ? user.profilePhoto
                : "default.png";

            html += `
            	
            <tr onclick="window.location.href='/userInfo?uId=\${uid}'" style="cursor:pointer;">
            	
                <td>\${rankDisplay} <img src="/upload/\${profileImg}" /></td>
               
                <td>\${user.name}</td>
                <td>⭐ \${user.score}</td>
              
            </tr>
           
            `;
        });

        html += `</table>`;

        html += `<div class="pagination">`;

        if(!data.first){
            html += `<a href="#" onclick="loadPage(\${page-1})">⬅ Prev</a>`;
        }

        html += `<span> Page \${page+1} </span>`;

        if(!data.last){
            html += `<a href="#" onclick="loadPage(\${page+1})">Next ➡</a>`;
        }

        html += `</div>`;

        container.innerHTML = html;

    })
    .catch(err => console.error(err));
}

// ✅ First load
loadPage(0);

// 🔁 Auto refresh leaderboard every 5 seconds
function loadQuizStatus(){
	fetch('/api/statusquiz?qid=${qid}')
		.then(response=>response.json())
		.then(data=>{
			let topscore=document.getElementById("topscore");
			let parti=document.getElementById("participants");
			let avg=document.getElementById("averagescore");
			let urank=document.querySelectorAll(".urank");
			let qnum=document.getElementById("qnum");
			topscore.innerText=data.topscore;
			parti.innerText=data.participants;
			avg.innerText=data.averagescore;
			qnum.innerText=data.qnum;
			urank[0].innerText=data.urank;
			urank[1].innerText=data.urank;
		});
}
setInterval(() => {
    loadPage(currentPage);
    loadQuizStatus();
}, 6000);
</script>

</body>
</html>