<%-- 
    Document   : customer_update
    Created on : May 13, 2019, 10:48:02 AM
    Author     : Prasad Chathuranga
--%>


<%@page import="model.orders"%>
<%@page import="model.payment"%>
<%@page import="model.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title> Customer Profile </title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
        <link href="css/customer-profile-style.css" rel="stylesheet">
        <link href="css/index-style.css" rel="stylesheet">
        <link href="css/profile-style.css" rel="stylesheet">

        <style>
            .profile-card a{
                text-decoration: none;
            }
        </style>
    </head>

    <body onload="startTime()">

        <!--- Clock Display ------> 
        <script>
            function startTime() {
                var today = new Date();
                var h = today.getHours();
                var m = today.getMinutes();
                var s = today.getSeconds();
                m = checkTime(m);
                s = checkTime(s);
                document.getElementById('txt').innerHTML =
                        h + ":" + m + ":" + s;
                var t = setTimeout(startTime, 500);
            }
            function checkTime(i) {
                if (i < 10) {
                    i = "0" + i
                }
                ;  // add zero in front of numbers < 10
                return i;
            }
        </script>


        <%
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
        %>

        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle_rental?useSSL=false", "root", "sliitpc16$97");
                statement = connection.createStatement();

                String name = request.getParameter("uname");
                user u = new user();
                u.setUser_name(name);

                String sql = ("SELECT * from users WHERE username='" + name + "'");

                resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
        %>


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
<!--                        <a href="customer_login.jsp" class="nav-item nav-link text-warning">HOME</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="customer_register.jsp" class="nav-item nav-link text-warning">SERVICES</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="customer_register.jsp" class="nav-item nav-link text-warning">ABOUT US</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="customer_register.jsp" class="nav-item nav-link text-warning">CONTACT US</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->
                        <a href="order_add_order.jsp" class="nav-item nav-link text-warning">BOOK A CAR NOW</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                    <div class="navbar-nav ml-auto">
                        <!--<label for="inputEmail3" class="col-sm-5 control-label" + username</label>-->
                        <input type="text" style="background-color:#1e2228; border: none; font-size: 20px;" class="form-control text-center text-warning" id="last_name" value="Hello , <%= resultSet.getString("username")%> !"   name="username"  placeholder="Enter Last Name" readonly>
                    </div>


                    <div class="navbar-nav ml-auto">
                        <a href="index.html" class="nav-item nav-link"><button class="btn btn-outline-warning">Log Out</button></a>
                        <!--<a href="customer_register.jsp" class="nav-item nav-link"><button class="btn btn-outline-warning">Sign Up</button></a>-->
                    </div>
                </div>
            </nav>
            <%
                    }

                } catch (Exception e) {
                    out.println(e);
                }%>
        </div>


<!--                <section id="slider-area" style="margin-top: -45px;">
                    == slide Item One ==
                    <div class="single-slide-item overlay">
                        <div class="container mt-5" >
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="border-class">
        
                                    <form class="mt-2" method="post" action="addOrder" >
        
                                        <div class="form-group">
                                            <div class="col-md-5">
                                                <hr> <h5 class="text-left"><b>&nbsp;&nbsp; BOOK A CAR TODAY ! </b></h5><hr>
                                                <label for="date" ><b>Pickup Date</b></label>&nbsp;&nbsp;&nbsp;&nbsp;<br>
                                                <input style="background:transparent;" type="date" class="form-control"  name="pickdate">
                                            </div>
                                        </div>
        
                                        <div class="form-group">
                                            <div class="col-md-5">
                                                <label for="date" ><b>Return Date</b></label>&nbsp;&nbsp;&nbsp;&nbsp;<br>
                                                <input style="background:transparent;"  type="date" class="form-control" name="returndate">
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <div class="col-md-5">
                                                <label for="date" ><b>User Name</b></label>&nbsp;&nbsp;&nbsp;&nbsp;<br>
                                                <input style="background:transparent;"  type="text" class="form-control" placeholder="Enter Your Name" name="username">
                                            </div>
                                        </div>
        
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-5 control-label"><b>Vehicle Model</b></label>
                                            <div class="col-md-5">
                                                <select  class="form-control" name="model">
                                                    <option>Suzuki</option>
                                                    <option>Toyota</option>
                                                    <option>Mitsubishi</option>
                                                    <option>Tata</option>
                                                </select>
                                            </div>
                                        </div> 
        
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-5 control-label"><b>Sub Model</b></label>
                                            <div class="col-sm-5">
                                                <select class="form-control" name="submodel">
                                                    <option>Suzuki Alto</option>
                                                    <option>Suzuki Wagon R</option>
                                                    <option>Toyota Hybrid Aqua</option>
                                                    <option>Toyota Hybrid CHR</option>
                                                    <option>Mitsubishi Lancer</option>
                                                    <option>Tata Nano</option>
                                                </select>
                                            </div>
                                        </div>  
        
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-5 control-label"><b>Vehicle Color</b></label>
                                            <div class="col-sm-5">
                                                <select class="form-control" name="color">
                                                    <option>White</option>
                                                    <option>Black</option>
                                                    <option>Blue</option>
                                                    <option>Gray</option>
                                                    <option>Green</option>
                                                    <option>Red</option>
                                                </select>
                                            </div>
                                        </div> 
        
                                        <div class="form-group">
                                            <div class="col-sm-5">
                                                <a style="text-decoration: none;"><button type="submit" name="addorder" id="addorder" value="addorder" class="btn btn-block btn-warning"><b>Book Now</b></button></a>
                                                <hr class="bg-light">
                                            </div>
        
                                        </div>
                                        </div>
                                    </form>
        
        
                                </div>
        
                            </div>
        
                        </div>
        
                    </div>
        
        
        
        
        
                </section>-->














        <!-------------------------------------gfdgfdfbhdbhb---------------------DDDDD-------------------------->

        <%@page import="java.sql.DriverManager"%>
        <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.Connection"%>


        <br>

        <!----------------------- Profile Details ilili-----------------------DDD---------------------->

        <div class="container">
            <div class="row" style="padding-left: 500px;">
                <div class="col-md-12">
                    <div class="view">
                        <table id="table" align="center" cellpadding="5" cellspacing="5" border="1">
                            <tr>

                            </tr>
                            <tr bgcolor="lightgreen">
                            <h4 class="text-center"> Your Orders </h4>
                            <th><b>Order ID</b></th>
                            <th><b> PickUp Date</b></th>
                            <th><b>Return Date</b></th>
                            <th><b>User Name</b></th>
                            <th><b>Model</b></th>
                            <th><b>Sub Model</b></th>
                            <th><b>Color</b></th>
                            


                            </tr>
                            <%
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle_rental?useSSL=false", "root", "sliitpc16$97");
                                    statement = connection.createStatement();

                                    String name = request.getParameter("uname");
                                    orders o = new orders();
                                    o.setUsername(name);

                                    String sql = ("SELECT * from orders WHERE username='" + name + "'");

                                    resultSet = statement.executeQuery(sql);
                                    while (resultSet.next()) {
                            %>

                            <tr bgcolor="#DEB887">

                                <td><%=resultSet.getString("oid")%></td>
                                <td><%=resultSet.getString("pickdate")%></td>
                                <td><%=resultSet.getString("returndate")%></td>
                                <td><%=resultSet.getString("username")%></td>
                                <td><%=resultSet.getString("model")%></td>
                                <td><%=resultSet.getString("submodel")%></td>
                                <td><%=resultSet.getString("color")%></td>
                                


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





        <!------------------------------------------------------------------------------------>




        <br>







        <br>

        <!----------------------- Profile Details ilili-----------------------DDD---------------------->

        <div class="container">
            <div class="row" style="padding-left: 500px; padding-top: -50px;">
                <div class="col-md-12">
                    <div class="view">
                        <table id="table" align="center" cellpadding="5" cellspacing="5" border="1">
                            <tr>

                            </tr>
                            <tr bgcolor="lightgreen">
                            <h4 class="text-center"> Your Payments </h4>
                            <th><b>Payment ID</b></th>
                            <th><b> First Name</b></th>
                            <th><b>Last Name</b></th>
                            <th><b>User Name</b></th>
                            <th><b>Payment Type</b></th>
                            <th><b>Amount</b></th>
                            <th><b>Discount</b></th>
                            <th><b>Discounted Price</b></th>


                            </tr>
                            <%
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle_rental?useSSL=false", "root", "sliitpc16$97");
                                    statement = connection.createStatement();

                                    String name = request.getParameter("uname");
                                    payment p = new payment();
                                    p.setUsername(name);

                                    String sql = ("SELECT * from payments WHERE username='" + name + "'");

                                    resultSet = statement.executeQuery(sql);
                                    while (resultSet.next()) {

                            %>
                            <tr bgcolor="#DEB887">

                                <td><%=resultSet.getString("uid")%></td>
                                <td><%=resultSet.getString("first_name")%></td>
                                <td><%=resultSet.getString("last_name")%></td>
                                <td><%=resultSet.getString("username")%></td>
                                <td><%=resultSet.getString("payment_type")%></td>
                                <td><%=resultSet.getString("amount")%></td>
                                <td><%=resultSet.getString("discount")%></td>
                                <td><%=Double.parseDouble(resultSet.getString("amount")) - Double.parseDouble(resultSet.getString("amount")) * Double.parseDouble(resultSet.getString("discount")) / 100%></td>


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




        <!----------------------- Profile Details -------------------------DDD-------------------->

        <div class="container" style="margin-top: -370px;">
            <div class="row">
                <div class="col-md-12">
                    <div class="view">

                        <%
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle_rental?useSSL=false", "root", "sliitpc16$97");
                                statement = connection.createStatement();

                                String name = request.getParameter("username");
                                user u = new user();
                                u.setUser_name(name);

                                String sql = ("SELECT * from users WHERE username='" + name + "'");

                                resultSet = statement.executeQuery(sql);
                                while (resultSet.next()) {
                                    %><br><br><br>
                        <h2 class="text-left col-sm-5 mb-3">Profile Details</h2>

                        <div class="container">
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="leftside">
                                        <form class="form-horizontal" method="post" action="">
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-3 control-label">User ID</label>
                                                <div class="col-sm-5">
                                                    <input type="text" class="form-control" id="inputFirstName" placeholder="User ID" value="<%= resultSet.getInt("uid")%>" name="uid" id="uid" readonly>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-3 control-label">First Name</label>
                                                <div class="col-sm-5">
                                                    <input type="text" class="form-control" id="first_name" name="first_name" value="<%= resultSet.getString("first_name")%>" placeholder="Enter First Name" readonly>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-5 control-label">Last Name</label>
                                                <div class="col-sm-5">
                                                    <input type="text" class="form-control" id="last_name" name="last_name" value="<%= resultSet.getString("last_name")%>" placeholder="Enter Last Name" readonly>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-5 control-label">User Name</label>
                                                <div class="col-sm-5">
                                                    <input type="text" class="form-control" id="last_name" name="username" value="<%= resultSet.getString("username")%>" placeholder="Enter Last Name" readonly=>
                                                </div>
                                            </div>


                                            <div class="form-group">
                                                <div class="col-sm-offset-2 col-sm-5">
                                                    <a href="profile_update_form.jsp?uid=<%=resultSet.getString("uid") %>"<button id="up" name="up" type="submit" class="btn btn-block btn-success">Update Profile</button></a>
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


        <!--------------------------Profile Update Modal----------------------------------------->











        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


    </body>
</html>

