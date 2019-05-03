

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="f_pro.css">
    </head>
    <body>
 <div class="navbar">
  <a class="active">Library Management System</a>
  
  <a  href="add.html">+ADD Book</a>
    <a  href="issue.html">Issue Book</a>
  <a class="active" href="return1.html">-Return</a>
  <a href="index.jsp" style="float:right">Logout</a>
</div>
    
    <center>
       
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            
            String title = request.getParameter("title"); 
                 
            Connection conn=null;
            Statement st = null;
            ResultSet rs = null;
                
            try
            {
               Class.forName("com.mysql.jdbc.Driver");
                conn  = (Connection)DriverManager.getConnection("jdbc:mysql://localhost/new","root","");
                st = conn.createStatement();
                  
                String qry = "SELECT * FROM student WHERE b_id = '"+id+"'";
                rs= st.executeQuery(qry);
                   
                rs.last();
                int issued = rs.getRow();
                rs.beforeFirst();
                
                if(issued>0)
                {
                    qry = "DELETE FROM student WHERE b_id = '"+id+"'";
                    int i=st.executeUpdate(qry);
                    
                   
                         qry = "INSERT INTO book_info(b_id,b_name) values('"+id+"','"+title+"')";
                    st.executeUpdate(qry);
                    %><div class="container"><%
                    out.print("<h1>BOOK ID: "+id+" has been returned to Libray\n</h1>");
                    %><br><a href="return1.html " type="button" class="btn btn-success">Return Another Book</a><%
                   
                   
                }
                else
                {
                    out.print("<h1>Book not found in Issued Record\n</h1>");
                    %><br><a href="issue.html" type="button" class="btn btn-success">Issue Book</a><%
                } 
                %></div><%
                    
            }
            catch(Exception ex)
            {
                out.print(ex.getMessage());
                out.print(ex);
                
            }
           conn.close();
            st.close();
               
        %>
        </div>
    </center>
    </body>
</html>
