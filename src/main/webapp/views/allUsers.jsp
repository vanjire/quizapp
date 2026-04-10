<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
   
</head>
<body>
    <div class="container">
       <div class="result-table-container">

<table class="result-table">

<thead>
<tr>
    <th>Id</th>
    <th>Email</th>
    
</tr>
</thead>

<tbody>
          <%@ page import="java.util.List" %>

<%@ page import="com.example.demo.Otp" %>

<%
List<Otp> userss= (List<Otp>) request.getAttribute("usersall");


for(Otp ot:userss){
		
%>

<tr>
   
    <td><%= ot.getId() %></td>
    <td><%= ot.getEmail() %></td>
   
  
</tr>

<%
}
%>
       </tbody>

</table>

</div>
    </div>
    <style>
   /* Table Container */
.result-table-container {
    width: 90%;
    margin: 40px auto;
    overflow-x: auto;
}

/* Table */
.result-table {
    width: 100%;
    border-collapse: collapse;
    background: #ffffff;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
}

/* Table Header */
.result-table thead {
    background: #4CAF50;
    color: white;
}

.result-table th,
.result-table td {
    padding: 12px;
    text-align: center;
    border: 1px solid #eee;
}

/* Row hover effect */
.result-table tbody tr:hover {
    background: #f1f8e9;
}

/* Correct Answer */
.correct {
    color: green;
    font-weight: bold;
}

/* Wrong Answer */
.wrong {
    color: red;
    font-weight: bold;
}
    </style>
</body>
</html>>