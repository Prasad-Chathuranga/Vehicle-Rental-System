<%-- 
    Document   : AddPayment
    Created on : May 6, 2019, 2:00:37 PM
    Author     : Prasad Chathuranga
--%>

<%@page import="java.lang.Exception"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="css/add-vehicle-style.css">
    <title>View Vehicles </title>
  </head>
  <body>
 
      <hr>
      
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<%
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%><br>
<h2 align="center"><font><strong>All Vehicle Details</strong></font></h2><br>
<table id="table-view" align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="lightblue">
<th><b>Vehicle ID</b></th>
<th><b>Model</b></th>
<th><b>Sub Model</b></th>
<th><b>Color</b></th>
<th><b>Number</b></th>




</tr>
<%
try{
    Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle_rental?useSSL=false","root","sliitpc16$97");
statement=connection.createStatement();
String sql ="SELECT * FROM vehicles";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getString("vid") %></td>
<td><%=resultSet.getString("model") %></td>
<td><%=resultSet.getString("submodel") %></td>
<td><%=resultSet.getString("color") %></td>
<td><%=resultSet.getString("number") %></td>



</tr>

<% 
}

} catch (Exception e) {
out.println(e);
}
%>
</table>
<br>
                                 <div class="col-sm-offset-2 col-sm-5">
                            
                            
                            <a style="text-decoration: none" href="Admin_Portal.html"><button type="submit" class="btn  btn-outline-danger">Back to Portal</button></a>
                        </div>
      

      
   

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>

