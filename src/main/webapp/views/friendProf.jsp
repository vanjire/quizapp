<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quizora User Profile</title>
    <style>
    body{
        margin:0;
        padding:0;
        font-family: 'Segoe UI', Arial, sans-serif;
        background: linear-gradient(135deg, #e0eafc, #cfdef3);
        height:100vh;
        display:flex;
        align-items:center;
        justify-content:center;
    }

    .profile-card{
        width:380px;
        background:#fff;
        padding:25px 20px;
        border-radius:18px;
        box-shadow:0 10px 25px rgba(0,0,0,0.15);
        text-align:center;
        transition:0.3s ease;
        position:relative;
        overflow:hidden;
    }

    .profile-card:hover{
        transform:translateY(-5px);
        box-shadow:0 15px 35px rgba(0,0,0,0.2);
    }

    /* top gradient bar */
    .profile-card::before{
        content:"";
        position:absolute;
        top:0;
        left:0;
        width:100%;
        height:90px;
        background:linear-gradient(90deg,#4facfe,#00f2fe);
        border-top-left-radius:18px;
        border-top-right-radius:18px;
    }

    .profile-img{
        width:120px;
        height:120px;
        border-radius:50%;
        object-fit:cover;
        border:5px solid white;
        margin-top:25px;
        position:relative;
        z-index:1;
        box-shadow:0 5px 15px rgba(0,0,0,0.2);
        background:#fff;
    }

    h2{
        margin:15px 0 5px;
        font-size:22px;
        color:#222;
    }

    .fullname{
        color:#666;
        font-size:14px;
        margin-bottom:10px;
    }

    .info{
        text-align:left;
        margin-top:15px;
        padding:0 10px;
    }

    .info p{
        margin:8px 0;
        padding:10px;
        background:#f7f9fc;
        border-radius:10px;
        font-size:14px;
        color:#333;
    }

    .badge{
        display:inline-block;
        padding:4px 10px;
        background:#4facfe;
        color:white;
        border-radius:20px;
        font-size:12px;
        margin-top:5px;
    }
    .back-btn{
    position:absolute;
    top:12px;
    left:12px;
    text-decoration:none;
    background:rgba(255,255,255,0.8);
    padding:6px 12px;
    border-radius:20px;
    font-size:14px;
    color:#333;
    font-weight:bold;
    transition:0.3s;
}

.back-btn:hover{
    background:#fff;
    transform:scale(1.05);
}
</style>
</head>
<body>

<div class="profile-card">
<a href="javascript:history.back()" class="back-btn">⬅ Back</a>
    <img src="${(profileImage != null && profileImage != '') 
        ? '/upload/'.concat(profileImage) 
        : '/upload/default.png'}"
        class="profile-img">

    <h2>${name}</h2>

    <div class="fullname">${fullname}</div>

    <span class="badge">Rank: ${rank}</span>

    <div class="info">
        <p>🏆 Score: ${score}</p>
        <p>📍 Location: ${location}</p>
        <p>📝 Bio: ${bio}</p>
    </div>

</div>

</body>
</html>