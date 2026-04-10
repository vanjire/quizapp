<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>

   
  <div class="quiz-list-page">

<h2>Available Quizzes</h2>
<div class="top-bar">
    <input type="text" id="searchQuiz" placeholder="Search quiz by title..." />
    <p>Total Quizzes: <span id="quizCount"></span></p>
</div>
<div class="quiz-grid" id="quizGrid">
  
  


 
</div>
<div class="pagination" id="pagination">
      

</div>

<style>
.quiz-list-page {
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg,#e3f2fd,#f4f6f9);
    padding: 40px;
    min-height: 100vh;
}

h2{
    text-align:center;
    margin-bottom:20px;
    font-size:28px;
    color:#333;
}

/* Top Bar */
.top-bar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:25px;
    flex-wrap:wrap;
    gap:10px;
}

#searchQuiz{
    padding:10px;
    width:250px;
    border-radius:6px;
    border:1px solid #ccc;
}

/* Quiz Grid */
.quiz-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 20px;
}

/* Quiz Card */
.quiz-card {
    background: white;
    padding: 25px;
    border-radius: 14px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    transition: 0.3s;
    position:relative;
    overflow:hidden;
}

.quiz-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 12px 25px rgba(0,123,255,0.3);
}

/* Animated Border */
.quiz-card::before{
    content:"";
    position:absolute;
    width:100%;
    height:4px;
    background:linear-gradient(90deg,#007bff,#00c6ff);
    top:0;
    left:0;
}

/* Quiz Title */
.quiz-title {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 10px;
    color:#007bff;
}

/* Start Button */
.start-btn {
    display: inline-block;
    padding: 8px 15px;
    background: linear-gradient(45deg,#28a745,#4CAF50);
    color: white;
    text-decoration: none;
    border-radius: 6px;
    margin-top: 10px;
    transition: 0.3s;
}

.start-btn:hover {
    transform: scale(1.08);
    opacity:0.9;
}

/* Empty message */
.empty-msg{
    text-align:center;
    font-size:18px;
    color:#777;
}
.pagination{
text-align:center;
margin-top:30px;
}

.pagination button{
padding:8px 14px;
margin:5px;
border:none;
border-radius:6px;
background:#eee;
cursor:pointer;
}

.pagination button:hover{
background:#007bff;
color:white;
}

.active-page{
background:#007bff;
color:white;
}
</style>
<script>
let timer;
loadQuizzes(0);
document.getElementById("searchQuiz")
.addEventListener("keyup", function(){

clearTimeout(timer);

timer = setTimeout(function(){
loadQuizzes(0);
},400);

});
// Search Filter
let searchInput = document.getElementById("searchQuiz");



// Attempt Confirmation

// Empty State

let currentPage = 0;
let totalPages=0;
function loadQuizzes(page){

    let search = document.getElementById("searchQuiz").value;

    fetch("/api/quizPage?page=" + page + "&search=" + search)

    .then(res => res.json())

    .then(data => {

        currentPage = data.number;
        totalPages = data.totalPages;

        let grid = document.getElementById("quizGrid");
        grid.innerHTML = "";
        if(data.content.length === 0){
            grid.innerHTML = "<p class='empty-msg'>No quizzes found</p>";
        }
        data.content.forEach(q => {

            grid.innerHTML += `
            <div class="quiz-card">

            <div class="quiz-title">
            \${q.quiz.title} 
            </div>

            <p>Questions: \${q.quiz.numOfQuestion}</p>

            <a href="/startQuiz?qid=\${q.quiz.id}" class="start-btn">
            Attempt Quiz
            </a>

            </div>
            `;
        });

        document.getElementById("quizCount").innerText = data.totalElements;
        document.querySelectorAll(".start-btn").forEach(btn=>{
            btn.addEventListener("click", function(e){
                let confirmStart = confirm("Start this quiz now? Timer will begin.");
                if(!confirmStart){
                    e.preventDefault();
                }
            });
        });
        createPagination();

    });
}
function createPagination(){

    let container = document.getElementById("pagination");
    container.innerHTML = "";

    let prevDisabled = currentPage === 0 ? "disabled" : "";
    let nextDisabled = currentPage === totalPages - 1 ? "disabled" : "";

    container.innerHTML = `
        <button onclick="loadQuizzes(\${currentPage-1})" \${prevDisabled}>
            ⬅ Previous
        </button>

        <button onclick="loadQuizzes(\${currentPage+1})" \${nextDisabled}>
            Next ➡
        </button>
    `;
}

</script>
</body>
</html>