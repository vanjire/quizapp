<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
   <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <div class="container">
       
          <%@ page import="java.util.List" %>

<%@ page import="com.example.demo.Question" %>
<div class="timer">
  <span id="outOff"></span>  ⏳ Time Left: <span id="time"></span>
</div>
<!-- PROGRESS BAR -->
<div class="progress-bar">
    <div  class="progress" id="progress"></div>
</div>
<%

List<Question> questions=(List<Question>)request.getAttribute("questions");
int i=0;
%>
<form id="quizForm" action="/getAnswers" method="post" >


<% 
for(Question q : questions){
	i++;
%>




<div class="question" style="display:none;">

    
	  <h3> <%= q.getQuestion() %> </h3>
   
           <lable class="option">  <input type="radio" value="1" name="answer<%= q.getId() %>"><%= q.getOption1() %></lable>
      		
    
          <lable class="option"> <input type="radio" value="2" name="answer<%= q.getId() %>"> <%= q.getOption2() %><br></lable>
        

    
         <lable class="option"> <input type="radio" value="3" name="answer<%= q.getId() %>"><%= q.getOption3() %></lable>
      

   
         <lable class="option"> <input type="radio" value="4" name="answer<%= q.getId() %>"><%= q.getOption4() %></lable>
       
    <input type="hidden" value="<%=q.getId() %>" name="questionID">
</div>


<%
}
%>



    
       <input type="hidden" value="${qid }" name="quizeID">
       <button type="button" onclick="prev()">Previous</button>
<button type="button" onclick="next()">Next</button>
		
<button type="submit" id="subm" onclick="stopTimer()">Submit</button>
		

    



   </form>    
    </div>
   
  

<style>

body{
    font-family: Arial;
    background: linear-gradient(135deg,#4e73df,#1cc88a);
}

.container{
    width: 60%;
    margin: 50px auto;
    background: white;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.2);
}

/* TIMER */
.timer{
    text-align:right;
    font-weight:bold;
    color:red;
}

/* PROGRESS BAR */
.progress-bar{
    height:8px;
    background:#eee;
    border-radius:20px;
    margin:15px 0;
    overflow:hidden;
}

.progress{
    height:100%;
    width:0%;
    background:linear-gradient(90deg,#4e73df,#1cc88a);
    transition:0.4s;
}

/* QUESTION */
.question{
    margin-top:20px;
}

/* OPTIONS */
.option{
    display:block;
    padding:10px;
    margin:8px 0;
    border:1px solid #ccc;
    border-radius:6px;
    cursor:pointer;
}

.option:hover{
    background:#f2f2f2;
}

/* BUTTON */
button{
    padding:8px 15px;
    border:none;
    border-radius:6px;
    background:#4e73df;
    color:white;
    cursor:pointer;
    margin-top:15px;
}


</style>
<script>
let current = 0;
let questions = document.querySelectorAll(".question");
let total = questions.length;
let prevBtn = document.querySelector("button[onclick='prev()']");
let nextBtn = document.querySelector("button[onclick='next()']");
let submitBtn = document.getElementById("subm");

submitBtn.style.display = "none";

function showQuestion(index){
    questions.forEach(q => q.style.display = "none");
    questions[index].style.display = "block";

    document.getElementById("outOff").textContent = (index+1) + " / " + total;

    // Button control
    prevBtn.disabled = (index === 0);
    nextBtn.disabled = (index === total - 1);

    submitBtn.style.display = (index === total - 1) ? "inline-block" : "none";

    updateProgress();
}

showQuestion(current);

function next(){
    if(current < total - 1){
        current++;
        showQuestion(current);
    }
}

function prev(){
    if(current > 0){
        current--;
        showQuestion(current);
    }
}

function updateProgress(){
    let percent = ((current + 1) / total) * 100;
    document.getElementById("progress").style.width = percent + "%";
}

/* OPTION SELECTION HIGHLIGHT */
document.querySelectorAll(".option input").forEach(input=>{
    input.addEventListener("change", function(){
        let options = this.closest(".question").querySelectorAll(".option");
        options.forEach(opt => opt.style.background = "#fff");
        this.parentElement.style.background = "#dbeafe";
    });
});

/* TIMER */
let quizKey = "quizTimer_${qid}";   // unique per quiz

let rawTime = "${timeq}";
let defaultTime = 60;

if(rawTime && !isNaN(rawTime)){
    defaultTime = Number(rawTime) * 60;
}

// Check if timer already exists in sessionStorage
let time = sessionStorage.getItem(quizKey);

if(time === null){
    time = defaultTime;
    sessionStorage.setItem(quizKey, time);
}else{
    time = parseInt(time);
}

let countdown = setInterval(function(){

    time--;
    sessionStorage.setItem(quizKey, time);

    let minutes = Math.floor(time / 60);
    let seconds = time % 60;

    minutes = minutes < 10 ? "0"+minutes : minutes;
    seconds = seconds < 10 ? "0"+seconds : seconds;

    document.getElementById("time").innerText = minutes + " : " + seconds;

    if(time <= 10){
        document.querySelector(".timer").style.background="darkred";
        document.querySelector(".timer").style.color="white";
        document.querySelector(".timer").style.padding="5px";
        document.querySelector(".timer").style.borderRadius="6px";
    }

    if(time <= 0){
        clearInterval(countdown);
        sessionStorage.removeItem(quizKey);
        document.getElementById("quizForm").submit();
    }

},1000);

function stopTimer(){
    clearInterval(countdown);
    sessionStorage.removeItem(quizKey);
}

</script>
</body>
</html>