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



<div class="login-container">
    <div class="login-title">Login with Email</div>

	<form action="/loginEmail" method="post" target="_self" onsubmit="return validateEmailForm()" novalidate>
 <div class="input-group">
 	<input type="text" name="name" placeholder="Enter your name" value="${name}">
        <label>Email</label>
       <input type="email" id="email" maxlength="100" name="email" placeholder="Enter your email" value="${ email}">
       
    </div>
	<h5 id="emailError"></h5>
   <button type="submit"  class="btn send-btn" id="sendBtn">Send Verification Code</button>
</form>
   
<div id="verifySection"
     style="<%= request.getAttribute("showVerify") != null ? "" : "display:none;" %>">

<form action="/verify" method="post" onsubmit="return validateCodeForm()">

  <div class="input-group">
        <label>Verification Code</label>
        <input type="text" id="code" name="vcode" placeholder="Enter Code" maxlength="6">
    </div>

    <h5 id="codeError"></h5>

    <button type="submit" class="btn login-btn" id="verifyBtn">Submit</button>

    <input type="hidden" name="email" value="${email}">
    <input type="hidden" name="name" value="${name}">
    <h5 style="margin-top:15px;">${msg}</h5>

</form>

</div>
</div>
<style>
/* Page background */
body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg, #4CAF50, #2e7d32);
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Login card */
.login-container {
    width: 350px;
    padding: 30px;
    background: #ffffff;
    border-radius: 12px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
}

/* Title */
.login-title {
    text-align: center;
    font-size: 22px;
    font-weight: bold;
    margin-bottom: 25px;
    color: #333;
}

/* Input fields */
.input-group {
    margin-bottom: 18px;
}

.input-group label {
    font-size: 14px;
    display: block;
    margin-bottom: 6px;
    color: #555;
}

.input-group input {
    width: 100%;
    padding: 10px;
    border-radius: 6px;
    border: 1px solid #ccc;
    outline: none;
    transition: 0.3s;
}

/* Input focus effect */
.input-group input:focus {
    border-color: #4CAF50;
    box-shadow: 0 0 8px rgba(76, 175, 80, 0.3);
}

/* Buttons */
.btn {
    width: 100%;
    padding: 10px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-size: 14px;
    transition: 0.3s;
}

/* Send Code Button */
.send-btn {
    background: #2196F3;
    color: white;
    margin-bottom: 10px;
}

.send-btn:hover {
    background: #1976D2;
}

/* Login Button */
.login-btn {
    background: #4CAF50;
    color: white;
}

.login-btn:hover {
    background: #388E3C;
}

/* Error message */
h5{
    color:red;
    font-size:13px;
    margin-top:-10px;
    margin-bottom:10px;
}

/* Fade animation */
#verifySection{
    animation: fadeIn 0.5s ease;
}

@keyframes fadeIn{
    from{opacity:0; transform:translateY(10px);}
    to{opacity:1; transform:translateY(0);}
}

/* Disabled button */
button:disabled{
    background:#ccc !important;
    cursor:not-allowed;
}

/* Loading effect */
.loading{
    opacity:0.7;
    pointer-events:none;
}
</style>
<script>

document.addEventListener("DOMContentLoaded", function(){

let emailInput = document.getElementById("email");
let codeInput = document.getElementById("code");
let verifyBtn = document.getElementById("verifyBtn");
let verifySection = document.getElementById("verifySection");
let sendBtn = document.getElementById("sendBtn");

// Email validation
window.validateEmailForm = function(){

    let email = emailInput.value.trim();
    let errorMsg = document.getElementById("emailError");
    errorMsg.innerText = "";

    let emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,}$/;

    if(email === ""){
        errorMsg.innerText = "Email is required.";
        emailInput.focus();
        return false;
    }

    if(!emailPattern.test(email)){
        errorMsg.innerText = "Enter valid email address.";
        emailInput.focus();
        return false;
    }

    sendBtn.innerText = "Sending...";
    sendBtn.classList.add("loading");

    return true;  // allow backend submit
};


// Code validation
window.validateCodeForm = function(){

    let code = codeInput.value.trim();
    let errorMsg = document.getElementById("codeError");
    errorMsg.innerText = "";

    let numberPattern = /^[0-9]{6}$/;

    if(!numberPattern.test(code)){
        errorMsg.innerText = "Enter valid 6-digit code.";
        codeInput.focus();
        return false;
    }

    verifyBtn.innerText = "Verifying...";
    verifyBtn.classList.add("loading");

    return true;
};

});

</script>
</body>
</html>