<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADD BOOK</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="f_pro.css">

    </head>
    <body>
                 <div class="navbar">
  <a class="active">Library Management System</a>
  <a class="active" href="add.html">+Add Book</a>

  <a  href="issue.html">Issue Book</a>
  <a  href="return1.html">Return Book</a>
  <a href="index.jsp" style="float:right">Logout</a>
 
    
    <center>
       
         <%
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("title");
            String aur = request.getParameter("author");
            String pub = request.getParameter("publi");
            
            Connection conn=null;
            Statement st = null;
            
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                conn=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/new","root","");
                st=conn.createStatement();
                
                
                String qry="INSERT INTO `book_info`(`b_id`, `b_name`, `author`, `publication`) VALUES('"+id+"','"+name+"','"+aur+"','"+pub+"')";
                st.executeUpdate(qry);
                %><br><br><br>
                <br><div class="container"><%
                out.print("<h1>Book Added Succesfully</h1>");
                %><br><a href="add.html" type="button" class="btn btn-success">ADD ANOTHER BOOK</a><%
                %></div><%
            }
            catch(Exception ex)
            {
                out.print(ex.getMessage());
            }
            conn.close();
            st.close();
        %>
        
    </center>
</div>
    </body>
</html>
