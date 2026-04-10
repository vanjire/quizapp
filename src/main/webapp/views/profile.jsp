<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>

<style>

body{
font-family:Arial;
background:#eef2f7;
padding:40px;
}

.profile-form{
background:white;
padding:40px;
max-width:500px;
margin:auto;
border-radius:20px;
box-shadow:0 10px 30px rgba(0,0,0,0.1);
}

.profile-form h2{
text-align:center;
margin-bottom:25px;
}

.form-group{
margin-bottom:20px;
}

label{
display:block;
font-weight:bold;
margin-bottom:6px;
}

input, textarea{
width:100%;
padding:10px;
border-radius:8px;
border:1px solid #ccc;
}

textarea{
resize:none;
height:80px;
}

button{
width:100%;
padding:12px;
background:#27ae60;
border:none;
color:white;
font-size:16px;
border-radius:10px;
cursor:pointer;
}

button:hover{
background:#219150;
}

</style>
</head>

<body>

<div class="profile-form">

<h2>👤 Edit Profile</h2>

<form action="/saveProfile" method="post" enctype="multipart/form-data">

<div class="form-group">
<label>Name</label>
<input type="text" name="name" value="${username }" placeholder="add name" required>
</div>


<div class="form-group">
<label>Full Name</label>
<input type="text" name="fullName" value="${fullname }" placeholder="add fullname" required>
</div>

<div class="form-group">
<label>Bio</label>
<textarea name="bio" placeholder="add bio">${userbio }</textarea>
</div>

<div class="form-group">
<label>Country</label>
<input type="text" name="country" value="${userlocation }" placeholder="add country">
</div>



<div class="form-group">
<label>Profile Photo</label>
<input type="file" name="file">
</div>

<button type="submit">Save Profile</button>

</form>

</div>

</body>
</html>