<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Chat</title>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>

<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #ece5dd;
}

/* Header */
.header {
    background-color: #075e54;
    color: white;
    padding: 15px;
    font-size: 18px;
}

/* Chat container */
.chat-container {
    display: flex;
    flex-direction: column;
    height: 90vh;
}

/* Messages area */
#chatMessages {
    flex: 1;
    padding: 15px;
    overflow-y: auto;
}

/* Message bubbles */
.message {
    max-width: 60%;
    padding: 10px;
    margin: 5px 0;
    border-radius: 10px;
    clear: both;
}

/* Sent message */
.sent {
    background-color: #dcf8c6;
    float: right;
    text-align: right;
}

/* Received message */
.received {
    background-color: white;
    float: left;
}

/* Input area */
.input-area {
    display: flex;
    padding: 10px;
    background: #f0f0f0;
}

.input-area input {
    flex: 1;
    padding: 10px;
    border-radius: 20px;
    border: none;
    outline: none;
}

.input-area button {
    margin-left: 10px;
    padding: 10px 15px;
    border: none;
    border-radius: 50%;
    background-color: #075e54;
    color: white;
    cursor: pointer;
}
</style>

</head>

<body>

<div class="header">
    Chat App 💬
</div>

<div class="chat-container">
    
    <div id="chatMessages"></div>

    <div class="input-area">
        <input type="text" id="msg" placeholder="Type a message">
        <button onclick="send()">➤</button>
    </div>

</div>

<script>
let socket = new SockJS('/chat');
let stompClient = Stomp.over(socket);

var sender = "${sender}";
var receiver = "${receiver}";

stompClient.connect({}, function () {

    stompClient.subscribe('/user/queue/messages', function(message){
        let data = JSON.parse(message.body);
        showMessage(data);
    });

});

function showMessage(data) {
    let isSender = data.sender === sender;

    let messageDiv = document.createElement("div");
    messageDiv.classList.add("message");
    messageDiv.classList.add(isSender ? "sent" : "received");

    messageDiv.innerHTML = "<b>" + data.sender + ":</b><br>" + data.content;

    document.getElementById("chatMessages").appendChild(messageDiv);

    // Auto scroll
    document.getElementById("chatMessages").scrollTop = 
        document.getElementById("chatMessages").scrollHeight;
}

function send() {
    let text = document.getElementById("msg").value;

    if(text.trim() === "") return;

    let message = {
        sender: sender,
        receiver: receiver,
        content: text,
        
    };

    stompClient.send("/app/private", {}, JSON.stringify(message));

    showMessage(message); // show instantly

    document.getElementById("msg").value = "";
}
</script>

</body>
</html>