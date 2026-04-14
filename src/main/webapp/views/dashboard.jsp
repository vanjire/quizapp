<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Quizora</title>

<style>

/* ===== PAGE ===== */
body{
margin:0;
font-family:Arial;
background:linear-gradient(135deg,#eef2f7,#dfe9f3);
padding:40px;
}

.container{
background:white;
padding:40px;
border-radius:25px;
box-shadow:0 15px 40px rgba(0,0,0,0.08);
animation:fadeIn 0.6s ease-in-out;
}

/* Animation */
@keyframes fadeIn{
from{opacity:0; transform:translateY(20px);}
to{opacity:1; transform:translateY(0);}
}

/* ===== TOP SECTION ===== */
.top-section{
display:flex;
justify-content:space-between;
align-items:flex-start;
gap:40px;
margin-bottom:30px;
background:#f9fafc;
padding:25px;
border-radius:20px;
transition:0.3s;
}

.top-section:hover{
transform:scale(1.01);
}

/* Column Layout */
.platform-column{
display:flex;
flex-direction:column;
gap:20px;
}

/* User Stats ROW */
.user-stats{
display:flex;
flex-direction:row;
gap:30px;
font-weight:bold;
font-size:16px;
flex-wrap:wrap;
}

/* Stats */
.stat-line{
color:#333;
}

/* Leaderboard */
.leaderboard{
display:flex;
flex-direction:column;
gap:20px;
row-gap:15px;

}


.card{
background:white;
border-radius:20px;
padding:22px;
display:flex;
justify-content:space-between;
align-items:center;
box-shadow:0 5px 15px rgba(0,0,0,0.04);
transition:0.3s;

}

.card:hover{
transform:translateY(-6px);
box-shadow:0 12px 25px rgba(0,0,0,0.1);
}

/* Rank */
.rank{
font-size:22px;
font-weight:bold;
display:flex;
align-items:center;
gap:6px;
}

/* Rank + Name */
.rank-section{
display:flex;
flex-direction:column;


}

.name{
font-size:16px;
font-weight:bold;
color:#222;
}

/* Middle Stats */
.middle-stats{
display:flex;
gap:15px;
font-size:14px;
}

.middle-stats div{
background:#f1f1f1;
padding:6px 12px;
border-radius:10px;
}

/* Tier */
.tier{
padding:6px 18px;
border-radius:25px;
font-size:13px;
color:white;
font-weight:bold;
text-transform:uppercase;
}

.diamond{background:#00c3ff;}
.platinum{background:#8e44ad;}
.gold{background:#f1c40f;color:black;}
.silver{background:#95a5a6;}
.bronze{background:#d35400;}
.rookie{background:#2c3e50;}

/* Button */
.solve-btn{
padding:7px 10px;
background:#27ae60;
color:white;
border-radius:15px;
text-decoration:none;
font-weight:bold;
transition:0.3s;
}

.solve-btn:hover{
background:#219150;
transform:scale(1.05);
box-shadow:0 8px 18px rgba(0,0,0,0.2);
}

/* Pagination */
.pagination{
margin-top:30px;
text-align:center;
}

.pagination button{
padding:10px 18px;
border:none;
border-radius:10px;
background:#3498db;
color:white;
cursor:pointer;
margin:0 5px;
transition:0.3s;
}

.pagination button:hover{
background:#217dbb;
transform:scale(1.1);
}

.pagination button:disabled{
background:gray;
cursor:not-allowed;
}

.active-page{
background:#27ae60 !important;
}

/* Platform Overview */
.platform-overview{
display:flex;
flex-direction:column;
gap:12px;
font-size:15px;
}

/* Icon Style */
.stat-icon{
margin-right:8px;
color:#3498db;
}

/* Margin Between Blocks */
.user-stats{
margin-top:30px;
margin-bottom:30px;
display:flex;
flex-wrap:wrap;
gap:20px;
font-weight:bold;
font-size:16px;
}

/* Medal Icons */
.medal{
font-size:18px;
margin-right:6px;
}

/* ===== INDICATOR ===== */

.indicator{
    display:inline-flex;
    align-items:center;
    padding:3px 7px;
    border-radius:14px;
    font-size:8px;
    font-weight:bold;
    margin-left:5px;
    animation: pop 0.4s ease;
}

.indicator.up{
    background:#d4f8e8;
    color:#0f8a4f;
}

.indicator.down{
    background:#fde2e2;
    color:#c0392b;
}

.indicator.new{
    background:#e3f2fd;
    color:#1565c0;
}

/* ===== CARD HIGHLIGHT ===== */

.card-up{
    border:2px solid #27ae60;
    animation: glowUp 1.5s ease;
}

.card-down{
    border:2px solid #e74c3c;
    animation: glowDown 1.5s ease;
}

@keyframes glowUp{
    0%{box-shadow:0 0 5px #27ae60;}
    50%{box-shadow:0 0 20px #27ae60;}
    100%{box-shadow:none;}
}

@keyframes glowDown{
    0%{box-shadow:0 0 5px #e74c3c;}
    50%{box-shadow:0 0 20px #e74c3c;}
    100%{box-shadow:none;}
}

/* Pop animation */
@keyframes pop{
    0%{
        transform:scale(0.5);
        opacity:0;
    }
    100%{
        transform:scale(1);
        opacity:1;
    }
}
.status{
   font-size:13px;
   margin-top:4px;
   font-weight:bold;
}

.online{
   color:#2ecc71;
}

.offline{
   color:#95a5a6;
}
/* ===== NOTIFICATION ===== */

.notification-wrapper{
    position:relative;
    cursor:pointer;
    font-size:22px;
}

/* Dropdown box */
.notification-dropdown{
    display:none;
    position:absolute;
    right:0;
    top:35px;
    width:300px;
    background:white;
    border-radius:15px;
    box-shadow:0 10px 30px rgba(0,0,0,0.15);
    overflow:hidden;
    animation:fadeIn 0.3s ease;
}

/* Header */
.notification-header{
    background:#3498db;
    color:white;
    padding:12px 15px;
    font-weight:bold;
    font-size:14px;
}

/* Notification list */
.notification-list{
    max-height:300px;
    overflow-y:auto;
}

/* Each notification */
.notification-item{
    padding:12px 15px;
    border-bottom:1px solid #eee;
    transition:0.2s;
}

.notification-item:hover{
    background:#f7f9fc;
}

/* Message */
.notification-message{
    font-size:14px;
    color:#333;
}

/* Time */
.notification-time{
    font-size:12px;
    color:#888;
    margin-top:4px;
}

/* Empty state */
.empty-notification{
    padding:20px;
    text-align:center;
    color:#999;
    font-size:14px;
}
/* ===== HEADER BAR ===== */

.header-bar{
display:flex;
justify-content:space-between;
align-items:center;
background:white;
padding:15px 25px;
border-radius:15px;
box-shadow:0 5px 20px rgba(0,0,0,0.08);
margin-bottom:25px;
}

/* Logo */
.logo{
font-size:20px;
font-weight:bold;
}

/* Right Side */
.header-right{
display:flex;
align-items:center;
gap:25px;
}

/* User */
.user-profile{
font-weight:bold;
color:#333;
}

/* Notification Badge */

.badge{
position:absolute;
top:-8px;
right:-8px;
background:red;
color:white;
border-radius:50%;
padding:2px 6px;
font-size:12px;
}

/* Sticky Solve Button */

.solve-hop{
position:fixed;
bottom:20px;
left:50%;
transform:translateX(-50%);
z-index:1000;
}

.solve-btn{
padding:10px 15px;
background:#27ae60;
color:white;
border-radius:30px;
text-decoration:none;
font-weight:bold;
box-shadow:0 10px 25px rgba(0,0,0,0.2);
transition:0.3s;
padding:18px 40px;
font-size:18px;
}

.solve-btn:hover{
background:#219150;
transform:scale(1.08);
}

profile-icon{
display:inline-block;
cursor:pointer;
}

.profile-img{
width:45px;
height:45px;
border-radius:50%;
object-fit:cover;
border:2px solid #ddd;
transition:0.2s;
}

.profile-img:hover{
transform:scale(1.1);
}
.profile-container{
    position:relative;
    display:inline-block;
}

.profile-img{
    width:45px;
    height:45px;
    border-radius:50%;
    cursor:pointer;
    border:2px solid #0077b5;
}

/* Dropdown Box */
.profile-menu{
    display:none;
    position:absolute;
    right:0;
    top:60px;
    background:white;
    width:180px;
    border-radius:10px;
    box-shadow:0 5px 15px rgba(0,0,0,0.2);
    padding:10px;
}

.profile-menu a{
    display:block;
    padding:8px;
    text-decoration:none;
    color:black;
    border-radius:6px;
}

.profile-menu a:hover{
    background:#f0f0f0;
}

.logout{
    color:red;
}
/* Online Dot on Image */
/* Online green dot */
/* Image wrapper */
.image-wrapper{


	display:flex;
    align-items:center;
    position:relative;
    gap:12px;
}

/* Profile image */
.image-wrapper img{

    width:50px;
    height:50px;
    min-width:50px;
    border-radius:50%;
    object-fit:cover;
    border:2px solid #ddd;
}

/* Simple green online dot */
.online-dot{
    position:absolute;
    top:0;
    left:0;
    width:10px;
    height:10px;
    background:#2ecc71;
    border-radius:50%;
    border:2px solid white;
}
#leaderboard a{
text-decoration:none;
margin-bottom:15px;
}
.rank span{
    display:inline-flex;
    align-items:center;
}


@media (max-width: 1024px){
    .top-section{
        flex-direction:column;
        gap:20px;
    }

    .solve-wrapper{
        width:100%;
        display:flex;
        justify-content:flex-end;
    }
}

/* MOBILE */
@media (max-width: 768px){

    body{
        padding:15px;
    }

    .container{
        padding:20px;
    }

    .top-section{
        flex-direction:column;
        gap:15px;
    }

    .user-stats{
        flex-direction:column;
        gap:10px;
    }

    .card{
        flex-direction:column;
        align-items:flex-start;
        gap:12px;
    }

    .middle-stats{
        flex-wrap:wrap;
    }

    .header-right{
        width:100%;
        justify-content:space-between;
    }

    .notification-dropdown{
        width:100%;
        left:0;
        right:auto;
    }
}

/* SMALL MOBILE */
@media (max-width: 480px){
    .rank{
        font-size:18px;
    }

    .name{
        font-size:14px;
    }

    .middle-stats div{
        font-size:12px;
        padding:5px 8px;
    }

    .tier{
        font-size:11px;
        padding:5px 12px;
    }
}
</style>
</head>
<body>

<div class="container">

<!-- BRAND NAME -->
<div style="text-align:left; margin-bottom:20px;">
    <h1 style="color:#0077b5; margin:0; font-size:28px;">
         Quizora
    </h1>
</div>

<!-- YOUR STATS -->
 <div class="user-stats">
        <div class="stat-line">📊 Rank:<span id="uRank"></span></div>
        <div class="stat-line">⭐ Total: ${totalScore}</div>
        <div class="stat-line">📈 Avg: ${averageScore}</div>
        <div class="stat-line">📝 Solved: ${solvedQuizzes}</div>
        <div class="stat-line">🔥 Highest: ${highestScore}</div>
    </div>


    <!-- LEFT: USER STATS -->
   

    <!-- RIGHT: SOLVE BUTTON -->
    <div class="solve-wrapper">
    	 <div class="header-right">

        <!-- Notification -->
        <div class="notification-wrapper">
            🔔
            <span id="badge" class="badge">0</span>

            <div id="notificationDropdown" class="notification-dropdown">

                <div class="notification-header">
                    🔔 Notifications
                </div>

                <div id="notificationList" class="notification-list">
                    <div class="empty-notification">No notifications</div>
                </div>

            </div>
        </div>

        <!-- User -->
        <div class="user-profile">
       <div class="profile-container">
    
    <!-- Profile Image -->
   <img src="${(profileImage != null && profileImage != '') 
    ? '/upload/'.concat(profileImage) 
    : '/upload/default.png'}"
     class="profile-img"
     onclick="toggleMenu()">

    <!-- Dropdown Box -->
    <div id="profileMenu" class="profile-menu">
        <a href="/viewProfile">👤 View Profile</a>
        <a href="/UserProfile">✏ Edit Profile</a>
       
        <hr>
        <a href="/logout" class="logout">🚪 Logout</a>
    </div>

</div>
</div>
        </div>

    </div>
       
    </div>

</div>
<div class="top-section">
<div class="platform-overview">
<div class="stat-line">
<span class="stat-icon">👥</span>
 Users: <span id="totalUsers"></span>
</div>

<div class="stat-line">
<span class="stat-icon">🔥</span>
Participants: <span id="participants"></span>
</div>

<div class="stat-line">
<span class="stat-icon">📚</span>
Quizzes: <span id="totalQuizzes"></span>
</div>

<div class="stat-line">
<span class="stat-icon">🏆</span>
Top Score: <span id="topScore"></span>
</div>
</div>

<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.R4s" %>
<!-- LEADERBOARD TITLE -->
<div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:20px;">

    <!-- LEFT: TITLE -->
    <h1 style="margin:0;font-size:22px;color:#333;">
        🏆 Quizora Leaderboard
    </h1>

    <!-- RIGHT: SEARCH -->
    <a href="/searchUsers" style="text-decoration:none;">
        <div style="
            display:flex;
            align-items:center;
            gap:8px;
            padding:11px 14px;
            border-radius:25px;
            background:white;
            border:1px solid #ddd;
            box-shadow:0 2px 6px rgba(0,0,0,0.05);
            color:#888;
            font-size:14px;
            white-space:nowrap;
        ">
            <span>Search users</span>
            <span>🔍</span>
        </div>
    </a>

</div>
<div id="leaderboard">
 
</div>

<div class="pagination">

<button onclick="prevPage()" id="prevBtn">⬅ Previous</button>

<span id="pageInfo" style="font-weight:bold;"></span>

<button onclick="nextPage()" id="nextBtn">Next ➡</button>

</div>
<div style="text-align:right; font-size:14px; margin-top:10px;">
   ⏱ Refreshed: <span id="refreshStatus">Never</span>
</div>
</div>
<div class="solve-hop">
    <a href="/toStarts" class="solve-btn">
        🚀  Solve Questions
    </a>
</div>
<script>
let currentPage = 0;
let totalPages = 0;
let liveInterval = null;
let rank;
let previousRanks={};
loadLeaderboard(0);
loadQuizStatus();
function startLive(){
    if(liveInterval) clearInterval(liveInterval);

    liveInterval = setInterval(function(){
        loadLeaderboard(currentPage);
    }, 10000); // 10 sec refresh
}

function stopLive(){
    if(liveInterval){
        clearInterval(liveInterval);
        liveInterval = null;
    }
}

function loadLeaderboard(page){

    currentPage = page;

   

    fetch("/api/leaders?page=" + page)
    .then(res => res.json())
    .then(data => {

        totalPages = data.totalPages;

        document.getElementById("pageInfo")
            .innerText = "Page " + (page+1) + " of " + totalPages;

        document.getElementById("prevBtn").disabled = page === 0;
        document.getElementById("nextBtn").disabled = page >= totalPages - 1;

        let leaders = data.content;
        let html = "";
        let prevScore = null;
        let prevRank = 0;

        leaders.forEach(function(leader, index) {

            rank = leader.rank;
			
            let status = "";

            let now = Date.now();

           
            
            let medal = "";
            if(rank === 1) medal = "🥇";
            else if(rank === 2) medal = "🥈";
            else if(rank === 3) medal = "🥉";

            let tier = "";
            if(rank <= 3) tier = "Diamond";
            else if(rank <= 10) tier = "Platinum";
            else if(rank <= 30) tier = "Gold";
            else if(rank <= 100) tier = "Silver";
            else if(rank <= 150) tier = "Bronze";
            else tier = "Rookie";
			//indicators
            
          

            let prevData = previousRanks[leader.userEmail] || null;

            let indicatorHTML = "";
            let cardHighlightClass = "";

            if(prevData){

                if(rank < prevData.rank){
                    indicatorHTML =
                    `<span class="indicator up">▲ ${prevData.rank - rank}</span>`;
                    cardHighlightClass = "card-up";
                }
                else if(rank > prevData.rank){
                    indicatorHTML =
                    `<span class="indicator down">▼ ${rank - prevData.rank}</span>`;
                    cardHighlightClass = "card-down";
                }
            }
            else{
                indicatorHTML =
                `<span class="indicator new">New</span>`;
            }

           
            previousRanks[leader.userEmail] = {
                rank: rank,
                time: Date.now()
            };
           
            let tierClass = tier.toLowerCase();
			
            html +=
            	"<a href='/userInfo?uId=" + leader.userEmail + "' class='card " + cardHighlightClass + "'>" +

            	    "<div class='image-wrapper'>" +

            	        "<div>" +
            	            "<img src='" + 
            	            (leader.profilePhoto
            	                ? "/upload/" + leader.profilePhoto
            	                : "/upload/default.png") +
            	            "'>" +

            	            ((leader.lastActive && (Date.now() - leader.lastActive) < 5000)
            	                ? "<span class='online-dot'></span>"
            	                : ""
            	            ) +
            	        "</div>" +

            	        "<div class='rank-section'>" +
            	            "<div class='rank'>" +
            	                "<span>" + medal + "</span>" +
            	                "<span>" + rank + "</span>" +
            	                indicatorHTML +
            	            "</div>" +
            	            "<div class='name'>" + leader.name + "</div>" +
            	        "</div>" +

            	    "</div>" +

            	    "<div class='middle-stats'>" +
            	        "<div>⭐ " + leader.score + "</div>" +
            	        "<div>📈 " + leader.AverageScore + "</div>" +
            	        "<div>📝 " + leader.QuizzesSolved + "</div>" +
            	    "</div>" +

            	    "<div class='tier " + tierClass + "'>" + tier + "</div>" +

            	"</a>";
		
		
        });
	
        document.getElementById("leaderboard").innerHTML = html;
      
        lastUpdateTimestamp = Date.now();

        updateRefreshTime();
        startLive(); // 
    });
}

function nextPage(){
    if(currentPage < totalPages - 1){
        stopLive();
    
        loadLeaderboard(currentPage + 1);
    }
}

function prevPage(){
    if(currentPage > 0){
        stopLive();
        
        loadLeaderboard(currentPage - 1);
    }
}


function updateRefreshTime(){

    if(!lastUpdateTimestamp) return;

    let seconds = Math.floor((Date.now() - lastUpdateTimestamp) / 1000);

    let text = "";

    if(seconds < 5){
        text = "Just now";
    }
    else{
        text = seconds + " seconds ago";
    }

    document.getElementById("refreshStatus").innerText = text;
}
setInterval(function (){
	fetch("/api/NotificationsCount")
	.then(res => res.json())
	.then(data=>{
		document.getElementById("badge").innerText=data;
	});
},200000);

document.querySelector(".notification-wrapper").addEventListener("click", function() {
    let dropdown = document.getElementById("notificationDropdown");
    if(dropdown.style.display === "none") {
        dropdown.style.display = "block";
        
        // Fetch latest notifications
        fetch("/api/NotificationsList")
        .then(res => res.json())
        .then(data => {

            let html = "";

            if(data.length === 0){
                html = "<div class='empty-notification'>No notifications</div>";
            }

            data.forEach(function(n){
			
                html +=
                "<div class='notification-item'>" +
                    "<div class='notification-message'>" + n.massage + "</div>" +
                    "<div class='notification-time'>" +
                        new Date(n.createdAt).toLocaleTimeString() +
                    "</div>" +
                "</div>";

            });

            document.getElementById("notificationList").innerHTML = html;
            fetch("/api/NotificationsMarkRead", { method: "POST" })
            	.then(() => document.getElementById("badge").innerText = "0");
        });
    } else {
        dropdown.style.display = "none";
    }
});

function toggleMenu(){
    var menu = document.getElementById("profileMenu");

    if(menu.style.display === "block"){
        menu.style.display = "none";
    } else {
        menu.style.display = "block";
    }
}

/* Close if click outside */
document.addEventListener("click", function(event){
    var menu = document.getElementById("profileMenu");
    var img = document.querySelector(".profile-img");

    if(!menu.contains(event.target) && event.target !== img){
        menu.style.display = "none";
    }
});
function loadQuizStatus(){
	fetch('/api/getqStatus')
		.then(response=>response.json())
		.then(data=>{
			let totalU=document.getElementById("totalUsers");
			let parti=document.getElementById("participants");
			let totalQ=document.getElementById("totalQuizzes");
			let topScore=document.getElementById("topScore");
			let urank=document.getElementById("uRank");
			totalU.innerText=data.totaluser;
			parti.innerText=data.participants;
			totalQ.innerText=data.totalquizzes;
			topScore.innerText=data.topscore;
			urank.innerText=data.rank;
		});
}
setInterval(loadQuizStatus,10000);
</script>
</body>
</html>
