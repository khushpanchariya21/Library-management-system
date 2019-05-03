
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <link rel="stylesheet" type="text/css" href="e.css"  >
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="style.css">

        <title>Login</title>    
    </head>
    <body>
        <div class="navbar">
  <a class="active">Library Management System</a>
  <a class="active" href="index.html">Home</a>

 
  <a href="index.jsp" style="float:right">Login</a>
</div>

           
            
                
 <div class="container-fluid">
                    
     <form  action="admin.jsp" method="POST" class="form-4">
         <h1>Login</h1>
                
             <p>
                 <label for="login">USERNAME or EMAIL</label>
                 <input type="text" placeholder="Username" name="user" value="" />
              </p>
             <p>
                 <label for="password">PASSWORD </label>
                    <input type="password" palceholder="Password" name="pass" value="" />
            </p>
                    
            <p>
                <input class="b1" type="submit" value="login" />
            </p>
                </form>
            </div>
        </div>
    </body>
</html>
