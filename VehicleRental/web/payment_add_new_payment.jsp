<%-- 
    Document   : AddPayment
    Created on : May 6, 2019, 2:00:37 PM
    Author     : Prasad Chathuranga
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="model.payment"%>
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
    <link rel="stylesheet" href="css/add-payment-style.css">
    <title>Add Payments </title>
  </head>
  <body>
      
      <hr>
      
      <h2 class="text-center mt-3 col-sm-5 mb-3">Add Payment</h2>
      
        <div class="container">
    <div class="row">
            <div class="col-md-8">
                <div class="leftside">
                <form class="form-horizontal" method="post" action="insertPayment">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-3 control-label">First Name</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="first_name" name="first_name" placeholder="Enter First Name">
                        </div>
                    </div>

                     <div class="form-group">
                        <label for="inputEmail3" class="col-sm-5 control-label">Last Name</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="last_name" name="last_name" placeholder="Enter Last Name">
                        </div>
                    </div>
                    
                      <div class="form-group">
                        <label for="inputEmail3" class="col-sm-5 control-label">User Name</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="last_name" name="username" placeholder="Enter Last Name">
                        </div>
                    </div>

                     <div class="form-group">
                        <label for="inputEmail3" class="col-sm-5 control-label">Payment Type</label>
                        <div class="col-sm-5">
                       
                            <select class="form-control" name="payment_type">
                                <option>Credit Card </option>
                                <option>Cash</option>
                            </select>
                        </div>
                    </div>   

                    
                      <div class="form-group">
                        <label for="inputEmail3" class="col-sm-5 control-label">Amount</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="amount" name="amount" placeholder="Enter Amount">
                        </div>
                    </div>
                        
                    

                     <div class="form-group">
                        <label for="inputEmail3" class="col-sm-5 control-label">Discount(%)</label>
                        <div class="col-sm-5">
                            <select class="form-control" name="discount">
                                    <option>10 </option>
                                    <option>15</option>
                                    <option>20 </option>
                                    <option>25</option>
                                </select>
                       </div>
                    </div>    
                   

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-5">
                            <button id="add" value="add" name="add" type="submit" class="btn btn-block btn-success">Add Payment</button>
                            
                            
                        </div>
                        <br>
                        <div class="col-sm-offset-2 col-sm-5">
                            
                            
                            <a style="text-decoration: none" href="Admin_Portal.html"><button type="submit" class="btn btn-block btn-outline-danger">Back to Portal</button></a>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
    </div>
            
      
           
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<%
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%><br>

 <div class="container">
    <div class="row">
            <div class="col-md-12">
<div class="rightside">
    <table id="table" align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="lightgreen">
<th><b>User ID</b></th>
<th><b>First Name</b></th>
<th><b>Last Name</b></th>
<th><b>User Name</b></th>
<th><b>Payment Type</b></th>
<th><b>Amount</b></th>
<th><b>Discount(%)</b></th>


</tr>
<%
try{
    Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle_rental?useSSL=false","root","sliitpc16$97");
statement=connection.createStatement();
String sql ="SELECT * FROM payments";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getString("uid") %></td>
<td><%=resultSet.getString("first_name") %></td>
<td><%=resultSet.getString("last_name") %></td>
<td><%=resultSet.getString("username") %></td>
<td><%=resultSet.getString("payment_type") %></td>
<td><%=resultSet.getString("amount") %></td>
<td><%=resultSet.getString("discount") %></td>


</tr>

<% 
}

} catch (Exception e) {
out.println(e);
}
%>
</table>
</div>
            </div>
    </div>
 </div>
      
             
      
          
  
      

      
   

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>
