

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@page import = "java.lang.*" %>
<%%>
<!DOCTYPE html>
<html>
    <head>
       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Issue Page</title>
              <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="f_pro.css">

    </head>
    <body>
          <div class="navbar">
  <a class="active" >Library Management System</a>
  
  <a  href="add.html">+Add Book</a>
  <a  class="active" href="issue.html">Issue Book</a>
  <a  href="return1.html">-Return Book</a>
  <a href="index.jsp" style="float:right">Logout</a>
    <center>
        
        <div>
        <% 
            String roll = request.getParameter("roll");
            int id = Integer.parseInt(request.getParameter("book_id"));
           
            String contact = request.getParameter("contact");
           
            %><br><br><br>
                <br><div class="container"><%
            out.print("<h1>Thank you!! Book Issued Successfully by Roll: "+roll+" and  BOOK ID : "+id+"\n</h1>");
            
            Connection conn=null;
            Statement st = null;
            ResultSet rs=null;
            
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                conn=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/new","root","");
                st=conn.createStatement();
                
                String qry="SELECT * FROM book_info WHERE b_id = '"+id+"'";
                rs = st.executeQuery(qry);
                rs.last();
                int total = rs.getRow();
                rs.beforeFirst();
                
                qry="SELECT * FROM student WHERE roll = '"+roll+"'";
                rs = st.executeQuery(qry);
                rs.last();
                int issued = rs.getRow();
                rs.beforeFirst();
                
                
                if(total < 1)
                {
                    out.print("\n <h1>SORRY !! BOOK IS NOT AVAILABLE IN THE LIBRARY</h1>\n");
                }
                else
                {
                    if(issued >= 2)
                    {
                        out.print("Limit Exceed\nPlease first return a book to issue another\n");
                        %><a href="return1.html" type="button" class="btn btn-success">Return book</a><%
                    }
                    else
                    {
                        qry = "INSERT INTO student(roll,b_id,contact) values('"+roll+"','"+id+"','"+contact+"')";
                        st.executeUpdate(qry);
                        qry = "DELETE FROM book_info WHERE b_id = '"+id+"'";
                        st.executeUpdate(qry);
                        out.print(" ISSUED to "+roll+"\n");
                    }

                } 
            }
            catch(Exception ex)
            {
                out.print(ex.getMessage());
            }  
            conn.close();
            st.close();
            rs.close();
            %></div><%
        %>
        </div>
    </center>                 
                        
    </body>
</html>
