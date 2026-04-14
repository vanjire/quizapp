<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Profile</title>

<style>
body {
    font-family: Arial, sans-serif;
    background: #eef2f7;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 800px;
    margin: 50px auto;
    background: white;
    border-radius: 10px;
    padding: 30px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

.profile-header {
    display: flex;
    align-items: center;
    gap: 20px;
}

.profile-header img {
    width: 120px;
    height: 120px;
    border-radius: 50%;
    border: 3px solid #0077b5;
}

.profile-header .info {
    display: flex;
    flex-direction: column;
}

.profile-header .info h2 {
    margin: 0;
    font-size: 28px;
    color: #0077b5;
}

.profile-header .info p {
    margin: 5px 0;
    color: #555;
}

.section {
    margin-top: 30px;
}

.section h3 {
    margin-bottom: 10px;
    color: #0077b5;
}

.section p {
    color: #333;
    line-height: 1.6;
}

.button-group {
    margin-top: 20px;
}

.button-group a {
    text-decoration: none;
    background: #0077b5;
    color: white;
    padding: 10px 20px;
    border-radius: 8px;
    margin-right: 10px;
}

.button-group a:hover {
    background: #005983;
}
</style>
</head>

<body>
<div class="container">

    <!-- Profile Header -->
    <div class="profile-header">
       <img src="${(profileImage != null && profileImage != '') 
    ? '/upload/'.concat(profileImage) 
    : '/upload/default.png'}"
     class="profile-img">
        <div class="info">
            <h2>${fullname}</h2>
            <p>Email: ${useremail}</p>
            <p>Username: ${username}</p>
        </div>
    </div>
	
    <!-- About Section -->
    <div class="section">
        <h3>About Me</h3>
        <p>${userbio != null ? userbio : "This user hasn't added a bio yet."}</p>
    </div>

    <!-- Other Details -->
    <div class="section">
        <h3>Details</h3>
       
        <p>Location: ${userlocation != null ? userlocation : "Not specified"}</p>
    </div>

    <!-- Buttons -->
    <div class="button-group">
        <a href="/UserProfile?id=${userid}">Edit Profile</a>
        <a href="/dashboard">Back to Dashboard</a>
    </div>

</div>
</body>
</html>
