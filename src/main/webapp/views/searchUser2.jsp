<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Search Users</title>

<style>
body{
    font-family:Arial;
    background:#f4f6ff;
    padding:30px;
}

.container{
    max-width:700px;
    margin:auto;
}

input{
    width:100%;
    padding:12px;
    border-radius:10px;
    border:1px solid #ccc;
    font-size:16px;
}

.card{
    display:flex;
    justify-content:space-between;
    align-items:center;
    background:white;
    padding:15px;
    margin-top:10px;
    border-radius:10px;
    box-shadow:0 5px 15px rgba(0,0,0,0.05);
    cursor:pointer;
    text-decoration:none;
    color:black;
}

.card:hover{
    transform:scale(1.02);
    transition:0.2s;
}

.user-left{
    display:flex;
    align-items:center;
    gap:10px;
}

img{
    width:45px;
    height:45px;
    border-radius:50%;
    object-fit:cover;
}
.back-btn{
    display:inline-block;
    margin-bottom:15px;
    text-decoration:none;
    background:#007bff;
    color:white;
    padding:6px 12px;
    border-radius:8px;
    font-size:14px;
    font-weight:bold;
    transition:0.3s;
}

.back-btn:hover{
    background:#0056b3;
    transform:scale(1.05);
}
</style>

</head>

<body>

<div class="container">
<a href="javascript:history.back()" class="back-btn">⬅ Back</a>
<h2>🔍 Search Users</h2>

<input type="text" id="searchBox" placeholder="Search by name or email..." onkeyup="searchUsers()">

<div id="results"></div>

</div>

<script>

function searchUsers(){
let qid=${qid};
    let query = document.getElementById("searchBox").value;

    fetch("/api/searchUsers2?query=" + query)
    .then(res => res.json())
    .then(data => {

        let html = "";

        if(data.length === 0){
            html = "<p>No users found</p>";
        }

        data.forEach(user => {

            html += `
            <a href="/userInfo2?uId=\${user.userEmail}&qid=\${qid}" class="card">

                <div class="user-left">
                    <img src="/upload/\${user.profilePhoto || 'default.png'}">
                    <div>
                        <b>\${user.name}</b><br>
                        <small>\${user.userEmail}</small>
                    </div>
                </div>

                <div>⭐ \${user.score}</div>

            </a>
            `;
        });

        document.getElementById("results").innerHTML = html;
    });
}
</script>

</body>
</html>
