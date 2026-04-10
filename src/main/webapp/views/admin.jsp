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
        <nav>
            <div class="link">
                <a href="/createQuiz">Add quiz</a>
                <a href="/viewQuiz">View quiz</a>
                <a href="/allUsers">View users</a>

            </div>
            
        </nav>
        <section>
            <div class="take">
                <a href="/getQuiz">take quiz</a>
            </div>
            <div class="view"></div>
        </section>
        <footer></footer>
    </div>

    <style>
        .container{
            width: 100%;
            min-height: 80vh;
            box-sizing: border-box;
            display: grid;
            grid-template-columns: 1fr;
            grid-template-rows: 60px auto;
        }
        nav{
            display: flex;
            column-gap: 10px;
            justify-content: space-between;
        }
        .link{
            display: flex;
            column-gap: 10px;
        }
        .link a{
            padding: 10px;
        }
        .search input{
            padding: 10px;
            width:300px;
            border-top-left-radius: 13px;
            border-bottom-left-radius:13px ;
        }
        .search button{
            padding: 10px;
        }
        section{
          display: grid;
          grid-template-columns: 25% 1fr;
          grid-template-rows: 1fr;
        }
        section .take {
               display: flex;
               justify-content: center;
               align-items: center;
        }
        section .take a{
            padding: 20px;
            border: 1px solid lightblue;
        }
    </style>
</body>
</html>