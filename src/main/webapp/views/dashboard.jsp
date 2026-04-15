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
justify-content:space-start;
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
display:flex;
justify-content:space-between;
align-items:center;
gap:20px;
margin-bottom:20px;
background:#f9fafc;
padding:15px 20px;
border-radius:15px;
}
.notification-dropdown{
    display:none;
    position:absolute;
    bottom:45px;
    right:0;
    width:280px;
    background:white;
    border-radius:15px;
    box-shadow:0 10px 30px rgba(0,0,0,0.15);
    overflow:hidden;
    z-index:3000;
}
/* Add heading */
.top-section h3{
margin:0 0 10px 0;
font-size:16px;
color:#555;
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
.solve-btn{
    display:inline-block;
    padding:14px 28px;
    background:#27ae60;
    color:white;
    border-radius:30px;
    text-decoration:none;
    font-weight:bold;
    font-size:16px;
    box-shadow:0 6px 18px rgba(0,0,0,0.2);
    transition:all 0.3s ease;
}

/* Hover effect */
.solve-btn:hover{
    background:#219150;
    transform:scale(1.05);
}
.user-stats-box{
background:#ffffff;
padding:15px 20px;
border-radius:15px;
box-shadow:0 5px 15px rgba(0,0,0,0.05);
margin-bottom:20px;
}

.user-stats-box h3{
margin:0 0 10px 0;
font-size:16px;
color:#555;
}
.notification-wrapper{
position:relative;
z-index:1000;
}

.notification-dropdown{

z-index:2000;
}
.solve-wrapper{
display:flex;
justify-content:flex-end;
margin-bottom:15px;
}

.header-right{
display:flex;
align-items:center;
gap:20px;
}
.solve-btn{
display:inline-block;
padding:5px 10px;
background:#27ae60;
color:white;
border-radius:30px;
text-decoration:none;
font-weight:bold;
font-size:16px;
box-shadow:0 8px 20px rgba(0,0,0,0.2);
transition:all 0.3s ease;
}

.solve-btn:hover{
background:#219150;
transform:scale(1.08);
}
.solve-hop{
position:fixed;
bottom:20px;
left:50%;
transform:translateX(-50%);
z-index:1500;
}
.bottom-bar{
position:fixed;
bottom:15px;
left:50%;
transform:translateX(-50%);
display:flex;
align-items:center;
justify-content:space-between;
gap:40px;
background:white;
padding:10px 20px;
border-radius:40px;
box-shadow:0 8px 25px rgba(0,0,0,0.15);
z-index:2000;
}
.solve-btn{
display:inline-block;
padding:10px 18px;
background:#27ae60;
color:white;
border-radius:25px;
text-decoration:none;
font-weight:600;
font-size:14px;
white-space:nowrap; /* prevents text break */
transition:0.3s;
}

.solve-btn:hover{
background:#219150;
transform:scale(1.05);
}
.profile-img{
width:40px;
height:40px;
border-radius:50%;
border:2px solid #0077b5;
}
.notification-wrapper{
font-size:20px;
position:relative;
cursor:pointer;
}
.search-btn{
display:inline-block;
padding:7px 10px;
border-radius:20px;
background:white;
border:1px solid #ddd;
font-size:13px;
text-decoration:none;
color:#333;
transition:0.2s;
}

.search-btn:hover{
background:#f5f5f5;
}
.notification-dropdown{
    display:none;
    position:absolute;

    bottom:45px;   
    right:0;

    width:280px;
    background:white;
    border-radius:15px;
    box-shadow:0 10px 30px rgba(0,0,0,0.15);
    overflow:hidden;

    z-index:3000;
}
.profile-menu{
    display:none;
    position:absolute;
    bottom:55px;
    right:0;
    background:white;
    width:180px;
    border-radius:10px;
    box-shadow:0 5px 15px rgba(0,0,0,0.2);
    padding:10px;
    z-index:3000;
}

.pagination{
display:flex;
justify-content:center;
align-items:center;
gap:15px;
margin-top:30px;
}

/* Common button */
.page-btn{
padding:10px 18px;
border-radius:25px;
border:1px solid #ddd;
background:white;
color:#333;
font-weight:600;
cursor:pointer;
transition:all 0.3s ease;
}

/* Hover */
.page-btn:hover{
background:#f5f7fa;
transform:translateY(-2px);
box-shadow:0 5px 12px rgba(0,0,0,0.1);
}

/* Next button highlight */
.page-btn.primary{
background:#3498db;
color:white;
border:none;
}

.page-btn.primary:hover{
background:#217dbb;
}

/* Disabled */
.page-btn:disabled{
background:#eee;
color:#aaa;
cursor:not-allowed;
box-shadow:none;
transform:none;
}

/* Page info */
.page-info{
font-weight:600;
color:#555;
}
.notification-wrapper{
    position: relative;
}

.notification-dropdown {
    display: none;
    position: absolute;

    bottom: calc(100% + 10px);
    left: 0;

    width: 280px;
    max-height: 320px;
    overflow-y: auto;

    background: white;
    border-radius: 12px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.2);

    z-index: 3000;
}
.profile-container{
    position: relative;
}

.profile-menu {
    display: none;
    position: absolute;

    bottom: calc(100% + 10px);
    right: 0;

    width: 170px;
    background: white;
    border-radius: 12px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.2);
    padding: 10px;

    z-index: 3000;
}
.notification-dropdown::after {
    content: "";
    position: absolute;
    bottom: -8px;
    left: 15px;  /* aligns with bell */

    border-width: 8px 8px 0 8px;
    border-style: solid;
    border-color: white transparent transparent transparent;
}

.profile-menu::after {
    content: "";
    position: absolute;
    bottom: -8px;
    right: 15px; /* aligns with profile */

    border-width: 8px 8px 0 8px;
    border-style: solid;
    border-color: white transparent transparent transparent;
}
.show {
    display: block !important;
}

.notification-dropdown {
    display: none;
    position: absolute;
    bottom: calc(100% + 10px);
    left: 0;

    width: 280px;
    max-height: 320px;
    overflow-y: auto;

    background: white;
    border-radius: 12px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.2);

    z-index: 9999;
}


.profile-container{
    position: relative;
}



.profile-container{
    position: relative;
    display: inline-block;
}

/* Profile Image */
.profile-img{
    width: 45px;
    height: 45px;
    border-radius: 50%;
    cursor: pointer;
    border: 2px solid #0077b5;
    object-fit: cover;
    transition: 0.2s;
}

.profile-img:hover{
    transform: scale(1.05);
}

/* Dropdown Menu */
.profile-menu{
    display: none;
    position: absolute;


    bottom: calc(100% + 10px);
    right: 0;

    width: 180px;
    background: #fff;
    border-radius: 12px;
    box-shadow: 0 12px 30px rgba(0,0,0,0.2);
    padding: 10px;

    z-index: 9999;
    animation: slideUp 0.25s ease;
}

/* Menu Items */
.profile-menu a{
    display: block;
    padding: 10px;
    text-decoration: none;
    color: #333;
    border-radius: 8px;
    font-size: 14px;
    transition: 0.2s;
}

.profile-menu a:hover{
    background: #f5f7fa;
}

.profile-menu .logout{
    color: red;
}

/* Arrow */
.profile-menu::after{
    content: "";
    position: absolute;
    bottom: -8px;
    right: 18px;

    border-width: 8px 8px 0 8px;
    border-style: solid;
    border-color: white transparent transparent transparent;
}

/* Show class */
.show{
    display: block !important;
}

/* Animation */
@keyframes slideUp{
    from{
        opacity: 0;
        transform: translateY(10px);
    }
    to{
        opacity: 1;
        transform: translateY(0);
    }
}


.bottom-bar{
    overflow: visible !important;
}
.bottom-bar{
    overflow:visible;
}


.profile-container{
    position: relative;
    display: inline-block;
    z-index: 9999;
}

/* FORCE menu position ABOVE */
.profile-menu{
    position: absolute !important;

    top: auto !important;
    bottom: calc(100% + 12px) !important;

    right: 0 !important;
    left: auto !important;

    display: none;

    width: 180px;
    background: #fff;
    border-radius: 12px;
    box-shadow: 0 12px 30px rgba(0,0,0,0.25);
    padding: 10px;

    z-index: 99999;
}

/* SHOW */
.profile-menu.show{
    display: block !important;
}

/* Arrow DOWN (pointing to image) */
.profile-menu::after{
    content: "";
    position: absolute;

    top: 100%;
    right: 18px;

    border-width: 8px 8px 0 8px;
    border-style: solid;
    border-color: white transparent transparent transparent;
}

/* IMPORTANT: prevent clipping */
.bottom-bar{
    overflow: visible !important;
}
/* ===== FINAL NOTIFICATION FIX ===== */

.notification-wrapper{
    position: relative;
    z-index: 9999;
}

/* Dropdown */
.notification-dropdown{
    position: absolute !important;

    bottom: calc(100% + 12px) !important; /* opens UP */
    right: 0 !important;
    left: auto !important;

    width: 300px;
    max-height: 350px;

    background: #fff;
    border-radius: 14px;
    box-shadow: 0 12px 30px rgba(0,0,0,0.25);

    display: none;
    flex-direction: column;

    overflow: hidden; /* IMPORTANT */
    z-index: 99999;
}

/* SHOW */
.notification-dropdown.show{
    display: flex !important;
}

/* Header */
.notification-header{
    padding: 12px 15px;
    background: #3498db;
    color: white;
    font-weight: bold;
    font-size: 14px;
    border-top-left-radius: 14px;
    border-top-right-radius: 14px;
}

/* LIST SCROLL AREA */
.notification-list{
    max-height: 280px;
    overflow-y: auto;
    padding: 5px 0;
}

/* Scrollbar nice */
.notification-list::-webkit-scrollbar{
    width: 6px;
}
.notification-list::-webkit-scrollbar-thumb{
    background: #ccc;
    border-radius: 10px;
}

/* ITEM */
.notification-item{
    padding: 10px 15px;
    border-bottom: 1px solid #eee;
    transition: 0.2s;
}

.notification-item:hover{
    background: #f5f7fa;
}

/* TEXT */
.notification-message{
    font-size: 13px;
    color: #333;
}

.notification-time{
    font-size: 11px;
    color: #888;
    margin-top: 3px;
}

/* EMPTY */
.empty-notification{
    padding: 20px;
    text-align: center;
    color: #999;
}

/* ARROW */
.notification-dropdown::after{
    content: "";
    position: absolute;
    top: 100%;
    right: 20px;

    border-width: 8px 8px 0 8px;
    border-style: solid;
    border-color: white transparent transparent transparent;
}


.bottom-bar{
    overflow: visible !important;
}
/* ===== NOTIFICATION POSITION FIX (RIGHT SIDE SAFE) ===== */

.notification-wrapper{
    position: relative;
}

/* FORCE correct position */
.notification-dropdown{
    position: absolute !important;

    bottom: calc(100% + 12px) !important;

    right: 0 !important;     /* stick to right */
    left: auto !important;   /* cancel left */

    transform: none !important;

    width: 300px;
    max-width: 90vw;  /* mobile safety */

    max-height: 350px;
    display: none;

    background: #fff;
    border-radius: 14px;
    box-shadow: 0 12px 30px rgba(0,0,0,0.25);

    overflow: hidden;
    z-index: 99999;
}

/* SHOW */
.notification-dropdown.show{
    display: block !important;
}

/* Scroll area */
.notification-list{
    max-height: 280px;
    overflow-y: auto;
}

/* ARROW aligned right */
.notification-dropdown::after{
    content: "";
    position: absolute;

    top: 100%;
    right: 20px; /* stays under bell */

    border-width: 8px 8px}
/* ===== FINAL NOTIFICATION FIX (CENTERED ABOVE BELL) ===== */

.notification-wrapper{
    position: relative;
}

/* DROPDOWN */
.notification-dropdown{
    position: absolute !important;

    bottom: calc(100% + 12px) !important;

    left: 50% !important;
    right: auto !important;

    transform: translateX(-50%) !important; /* CENTER ALIGN */

    width: 300px;
    max-width: 90vw;

    max-height: 350px;

    background: #fff;
    border-radius: 14px;
    box-shadow: 0 12px 30px rgba(0,0,0,0.25);

    display: none;
    overflow: hidden;

    z-index: 99999;
}



.notification-wrapper{
    position: relative;
}

/* DROPDOWN */
.notification-dropdown{
    position: fixed !important;

    bottom: calc(100% + 12px) !important;

    right: 20px !important;
    left: auto !important;

    transform: none !important;

    width: 300px;
    max-width: calc(100vw - 20px); /* 👈 PREVENT CUT */

    max-height: 400px;

    background: #fff;
    border-radius: 14px;
    box-shadow: 0 12px 30px rgba(0,0,0,0.25);

    display: none;
    overflow: hidden;

    z-index: 99999;
}

/* SHOW */
.notification-dropdown.show{
    display: flex !important;
}

/* SCROLL */
.notification-list{
flex:1;
    max-height: 280px;
    overflow-y: auto;
}

/* FIX: if near left edge, auto adjust */
@media (max-width: 500px){
    .notification-dropdown{
        right: -20px !important; /* push inside screen */
    }
}

/* ARROW RIGHT SIDE */
.notification-dropdown::after{
    content: "";
    position: absolute;

    top: 100%;
    right: 20px;

    border-width: 8px 8px 0 8px;
    border-style: solid;
    border-color: white transparent transparent transparent;
}

/* IMPORTANT */
.bottom-bar{
    overflow: visible !important;
}

/* IMPORTANT */
.bottom-bar{
    overflow: visible !important;
}
.top-section{
justify-content:flex-start;
align-items:flex-start;
}
.search-btn{
padding:5px 10px !important;
height:40px;

}
</style>
</head>
<!-- SAME HEAD + CSS (NO CHANGE) -->

<body>

<div class="container">

<!-- BRAND NAME -->
<div style="text-align:left; margin-bottom:20px;">
    <h1 style="color:#0077b5; margin:0; font-size:28px;">
         Quizora
    </h1>
</div>

<!-- YOUR STATS -->
<div class="user-stats-box">
    <h3>👤 Your Status</h3>

    <div class="user-stats">
        <div class="stat-line">📊 Rank: <span id="uRank"></span></div>
        <div class="stat-line">⭐ Total: ${totalScore}</div>
        <div class="stat-line">📈 Avg: ${averageScore}</div>
        <div class="stat-line">📝 Solved: ${solvedQuizzes}</div>
        <div class="stat-line">🔥 Highest: ${highestScore}</div>
    </div>
</div>

<!-- HEADER RIGHT -->


<!-- ✅ FIXED: TOP SECTION NOW INSIDE CONTAINER -->
<div class="top-section">
    <div class="platform-overview">
        <h3>📊 Quizora Status</h3>

        <div class="stat-line">👥 Users: <span id="totalUsers"></span></div>
        <div class="stat-line">🔥 Participants: <span id="participants"></span></div>
        <div class="stat-line">📚 Quizzes: <span id="totalQuizzes"></span></div>
        <div class="stat-line">🏆 Top Score: <span id="topScore"></span></div>
    </div>
</div>

<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.R4s" %>

<!-- LEADERBOARD TITLE -->
<div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:20px;">
    <h1 style="margin:0;font-size:22px;color:#333;">
        🏆 Quizora Leaderboard
    </h1>

    <a href="/searchUsers" style="text-decoration:none;">
        <div style="display:flex;align-items:center;gap:8px;padding:5px 7px;border-radius:25px;background:white;border:1px solid #ddd;">
            <span>Search users</span>
            <span>🔍</span>
        </div>
    </a>
</div>

<div id="leaderboard"></div>

<div class="pagination">
    <button onclick="prevPage()" id="prevBtn" class="page-btn">Previous</button>

    <span id="pageInfo" class="page-info"></span>

    <button onclick="nextPage()" id="nextBtn" class="page-btn primary">Next</button>
</div>

<div style="text-align:right; font-size:14px; margin-top:10px;">
   ⏱ Refreshed: <span id="refreshStatus">Never</span>
</div>

</div> 

<!-- FLOAT BUTTON -->
<div class="bottom-bar">

    <!-- Notification -->
    <div class="notification-wrapper">
        🔔
        <span id="badge" class="badge">0</span>

        <div id="notificationDropdown" class="notification-dropdown">
            <div class="notification-header">🔔 Notifications</div>
            <div id="notificationList" class="notification-list">
                <div class="empty-notification">No notifications</div>
            </div>
        </div>
    </div>

    <!-- Solve Button -->
    <a href="/toStarts" class="solve-btn">🚀 Solve</a>

    <!-- Profile -->
    <div class="profile-container">
        <img src="${(profileImage != null && profileImage != '') 
        ? '/upload/'.concat(profileImage) 
        : '/upload/default.png'}"
        class="profile-img"
        onclick="toggleMenu()">

        <div id="profileMenu" class="profile-menu">
            <a href="/viewProfile">👤 View Profile</a>
            <a href="/UserProfile">✏ Edit Profile</a>
            <hr>
            <a href="/logout" class="logout">🚪 Logout</a>
        </div>
    </div>

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
