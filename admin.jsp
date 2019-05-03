
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href=".css"  >
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="f_pro.css">

    </head>
    <body>
      <div class="navbar">
  <a >Library Management System</a>
  <a class="active" href="index.html">Home</a>
  
  <a href="f_logout.php" style="float:right">Logout</a>
</div>


    <center>
        
     
        
        <%
               String admin = request.getParameter("user");
               String pass = request.getParameter("pass");
               
               if(pass.equals("h"))
               {
                   out.print("<h1>Welcome "+admin+"</h1>\n");
         %> 
          <br>
          <div class="btn-group btn-group-justified">

          <a href="add.html" class="btn btn-primary" type="button">+ ADD NEW BOOK</a>
           <a href="issue.html" class="btn btn-success" type="button">ISSUE </a>
            <a href="return1.html" class="btn btn-danger" type="button">- RETURN BOOK</a>
           
            </div>
         <%     
              }
                else
               {
                   %><div><%
                   out.print("Hello "+admin+" wrong pasword try again\n");
                    %> <br><a href="index.jsp" type="button" class="btn btn-success">TRY AGAIN</a><%
                   
               }
               
        %>
               </div>

            
    </center>
    <img src="book.jpg">
    </body>
</html>
