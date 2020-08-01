<%-- 
    Document   : register
    Created on : May 12, 2019, 3:19:39 PM
    Author     : Prasad Chathuranga
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title> Registration </title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="css/register-style.css" rel="stylesheet">
    </head>

      <%

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        
        //String fname = request.getParameter("username");
        
    

        
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle_rental?useSSL=false", "root", "sliitpc16$97");
        statement = connection.createStatement();
       
        
            
                String sql = "SELECT * FROM users";
              
               

        resultSet = statement.executeQuery(sql);
        if (resultSet.next()) {  
    %> 
    
    
    
    
    <body>

        <section id="lgoin-page-wrap">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-8 m-auto">
                        <div class="login-page-content">
                            <div class="login-form">
                                <h3 class="align">Update Profile </h3><hr>
                                <form action="updateProfile" method="post">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">First Name</label>
                                        <input type="text" class="form-control" id="first_name" name="first_name" value="<%= resultSet.getString("first_name")%>">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Last Name</label>
                                        <input type="text" class="form-control" id="last_name" name="last_name" value="<%= resultSet.getString("last_name")%>" >

                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">User Name</label>
                                        <input type="text" class="form-control" id="user_name" name="user_name" value="<%= resultSet.getString("username")%>">

                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" class="form-control" id="password" name="password" value="<%= resultSet.getString("password")%>">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Re-Enter Password</label>
                                        <input type="password" class="form-control" id="re_password" name="re_password" value="<%= resultSet.getString("re_password")%>">
                                    </div>
                                    
                                    <small id="emailHelp" class="form-text text-muted align">We'll Never Share Your Details with Anyone Else !</small><hr>
                                    <div>
                                        <button type="submit"  name="update" id="update" value="update" class="btn btn-block btn-primary">Update</button><hr>
                                    </div>
                                </form>
                                     <% }%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </body>
</html>
