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
        <table>
            <tr>
                <td>Id</td>
                <td>question</td>
                <td>Option1</td>
                <td>Option2</td>
                 <td>Option3</td>
                  <td>Option4</td>
                   <td>Correct Option</td>
                    <td>Selected Option</td>
            </tr>
          <%@ page import="java.util.List" %>
<%@ page import="com.example.demo.StudentAnswer" %>
<%@ page import="com.example.demo.Question" %>

<%
List<StudentAnswer> answers = (List<StudentAnswer>) request.getAttribute("answers");
List<Question> quns = (List<Question>) request.getAttribute("questions");

for(int i=0;i<quns.size();i++){
		
%>

<tr>
   
    <td><%= quns.get(i).getQuestion() %></td>
    <td><%= quns.get(i).getOption1() %></td>
    <td><%= quns.get(i).getOption2() %></td>
    <td><%= quns.get(i).getOption3()%></td>
    <td><%=quns.get(i).getOption4() %></td>
    <td><%= quns.get(i).getCorrectOption() %></td>
    <td><%= answers.get(i).getSelectedOption() %></td>
  
</tr>

<%
}
%>
        </table>
    </div>
    <styel>
    @charset "UTF-8";
@charset "UTF-8";
.container{
    width: 90%;
    margin: auto;
}
table{
    width: 100%;
    
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
   
}
tr,table{
    border-top: 1px solid lightgray;
    border-bottom: 1px solid lightgray;
    border-collapse: collapse;
    
}
td{
    text-align: center;
    padding: 10px;
}

    
    </styel>
</body>
</html>