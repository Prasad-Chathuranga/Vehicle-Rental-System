<%-- 
    Document   : profile_update_form
    Created on : May 16, 2019, 4:47:21 PM
    Author     : Prasad Chathuranga
--%>

<%@page import="model.user"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

      <%
            Connection connection = null;
           Statement statement = null;
            ResultSet resultSet = null;
        %>
        
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Profile</title>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
        <link href="css/customer-profile-style.css" rel="stylesheet">
        <link href="css/index-style.css" rel="stylesheet">
        <link href="css/profile-style.css" rel="stylesheet">
    </head>
    <body>
        
        
        
        
        
        <div class="preloader bg-dark text-light" >
            <div class="preloader-spinner" >


                <div id="header-top" class="d-none d-xl-block">
                    <div class="container">
                        <div class="row">

                            <div class="loader-content">
                                <!--<img src="assets/img/preloader.gif">-->
                                <p id="txt"></p>

                            </div>

                            <div class="col-lg-3 text-left ">
                                <i class="fas fa-map-marker-alt"></i> &nbsp; 802/2 Malabe, Sri Lanka
                            </div>&nbsp;&nbsp;&nbsp;&nbsp;

                            <div class="col-lg-3 text-center">
                                <i class="fas fa-phone-volume"></i> +011 2 354 354
                            </div>&nbsp;&nbsp;&nbsp;&nbsp;

                            <div class="col-lg-3 text-center">
                                <i class="far fa-clock"></i> Mon-Fri 09.00 - 17.00
                            </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


                            <div class="header-social-icons text-right">
                                <a href="#"><i class="fab fa-twitter"></i></a>&nbsp;
                                <a href="#"><i class="fab fa-instagram"></i></a>&nbsp;
                                <a href="#"><i class="fab fa-facebook"></i></a>&nbsp;
                                <a href="#"><i class="fab fa-youtube"></i></a>&nbsp;
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="bs-example">
            <nav class="navbar navbar-expand-md navbar-light fixed">
                <a href="#" class="navbar-brand">
                    <!--                    <h5 class="text-warning text-right"> Eazy Drive</h5>
                                        <img src="images/favicon.ico" width="40" >-->
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ml-auto">
                        <a href="customer_login.jsp" class="nav-item nav-link text-warning">HOME</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="customer_register.jsp" class="nav-item nav-link text-warning">SERVICES</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="customer_register.jsp" class="nav-item nav-link text-warning">ABOUT US</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="customer_register.jsp" class="nav-item nav-link text-warning">CONTACT US</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="customer_register.jsp" class="nav-item nav-link text-warning">BOOK A CAR NOW</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                    


<!--                    <div class="navbar-nav ml-auto">
                        <a href="customer_login.jsp" class="nav-item nav-link"><button class="btn btn-outline-warning">Log Out</button></a>
                        <a href="customer_register.jsp" class="nav-item nav-link"><button class="btn btn-outline-warning">Sign Up</button></a>
                    </div>-->
                </div>
            </nav>
            
        </div>

        
       
                        <%
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle_rental?useSSL=false", "root", "sliitpc16$97");
                                statement = connection.createStatement();

                                String uid = request.getParameter("uid");

                                String sql = ("SELECT * from users WHERE uid=" + uid );

                                resultSet = statement.executeQuery(sql);
                                while (resultSet.next()) {
                        %>
        
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="view">

                        <h2 class="text-left mt-3 col-sm-5 mb-3">Update Profile Details</h2>

                        <div class="container">
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="leftside">
                                        <form class="form-horizontal" method="post" action="updateProfile">
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-3 control-label">User ID</label>
                                                <div class="col-sm-5">
                                                    <input type="text" class="form-control" id="inputFirstName" placeholder="User ID" value="<%= resultSet.getInt("uid")%>" name="uid" id="uid" readonly>
                                                <small class="form-text text-muted text-center align">User ID Cannot be Updated !</small>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-3 control-label">First Name</label>
                                                <div class="col-sm-5">
                                                    <input type="text" class="form-control" id="first_name" name="first_name" value="<%= resultSet.getString("first_name")%>" placeholder="Enter First Name" >
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-5 control-label">Last Name</label>
                                                <div class="col-sm-5">
                                                    <input type="text" class="form-control" id="last_name" name="last_name" value="<%= resultSet.getString("last_name")%>" placeholder="Enter Last Name">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-5 control-label">User Name</label>
                                                <div class="col-sm-5">
                                                    <input type="text" class="form-control" id="last_name" name="username" value="<%= resultSet.getString("username")%>" placeholder="Enter Last Name" readonly=>
                                                <small class="form-text text-muted text-center align">User Name Cannot be Updated !</small>
                                                </div>
                                            </div>
                                                
                                                <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-5 control-label">Password</label>
                                                <div class="col-sm-5">
                                                    <input type="password" class="form-control" id="password" name="password" value="<%= resultSet.getString("password")%>" placeholder="Enter Last Name">
                                                </div>
                                            </div>
                                                
                                                
                                                <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-5 control-label">Re-Enter Password</label>
                                                <div class="col-sm-5">
                                                    <input type="password" class="form-control" id="password" name="password" value="<%= resultSet.getString("re_password")%>" placeholder="Enter Last Name">
                                                </div>
                                            </div>


                                            <div class="form-group">
                                                <div class="col-sm-offset-2 col-sm-5">
                                                    <button id="up" name="up" type="submit" class="btn btn-block btn-success">Update Profile</button>
                                                </div>
                                            </div>
                                        </form>
                                        <%
                                                }

                                            } catch (Exception e) {
                                                out.println(e);
                                            }%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
    
    
    
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    
    
    </body>
</html>
