<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Friend Profile</title>
    <style>
        .profile-card{
            width:400px;
            margin:50px auto;
            padding:20px;
            border-radius:10px;
            box-shadow:0 4px 10px rgba(0,0,0,0.2);
            text-align:center;
            font-family:Arial;
        }
        .profile-img{
            width:120px;
            height:120px;
            border-radius:50%;
        }
    </style>
</head>
<body>

<div class="profile-card">

    <img src="${empty profileImage ? '/upload/default.png' : '/upload/' + profileImage}"
         class="profile-img"
         onerror="this.src='/images/default-user.png'">

    <h2>${name}</h2>

    <p>Full Name: ${fullname}</p>

    

    <p>Bio: ${bio}</p>
	 <p>Location: ${location}</p>
	 <p>Joined Date: ${joinedDate}</p>
	 <p>
	 <a href="/chat?id=${userId}">message</a>
	 </p>
</div>

</body>
</html>