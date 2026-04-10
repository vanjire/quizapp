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
        <table class="result-table">
            <tr>
                <td>Id</td>
                <td>question</td>
                <td>option1</td>
                <td>option2</td>
                <td>option3</td>
                <td>option4</td>
                
                <td>correct</td>
                <td>action</td>
            </tr>
          <%@ page import="java.util.List" %>
<%@ page import="com.example.demo.Question" %>

<%
List<Question> questions = (List<Question>) request.getAttribute("questions");

for(Question q : questions){
%>

<tr>
    <td><%= q.getId() %></td>
    <td><%= q.getQuestion() %></td>
    <td><%= q.getOption1() %></td>
    <td><%= q.getOption2() %></td>
    <td><%= q.getOption3() %></td>
    <td><%= q.getOption4() %></td>
    <td><%= q.getCorrectOption() %></td>
    <td>
     <form action="${pageContext.request.contextPath}/deleteQuestion" method="get" 
      onsubmit="return confirm('Are you sure you want to delete this question?');">
      <input type="hidden" value="<%= q.getId() %>" name="id">
      <input type="hidden" value="<%=q.getQuiz().getId() %>" name="quizid">
    <button type="submit">Delete</button>
</form>

<form action="${pageContext.request.contextPath}/updateQ" method="post" 
     >
      <input type="hidden" value="<%= q.getId() %>" name="id">
      <input type="hidden" value="<%= q.getQuiz().getId()  %>" name="quizid">
    <button type="submit">Update</button>
</form>
    </td>
</tr>

<%
}
%>
        </table>
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
</html>