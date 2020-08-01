<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        <link rel="stylesheet" href="css/index-style.css">
        <title>Available Vehicles</title>
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

        <!------------------------------->

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
                        <a href="index.html" class="nav-item nav-link text-warning">HOME</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="vehicle_details.jsp" class="nav-item nav-link text-warning">AVAILABLE VEHICLES</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="#" class="nav-item nav-link text-warning">ABOUT US</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="#" class="nav-item nav-link text-warning">CONTACT US</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="#" class="nav-item nav-link  text-warning" onclick="myFunction()">BOOK A CAR NOW</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                    <div class="navbar-nav ml-auto">
                        <a href="customer_login.jsp" class="nav-item nav-link"><button class="btn btn-outline-warning">Login</button></a>
                        <a href="customer_register.jsp" class="nav-item nav-link"><button class="btn btn-outline-warning">Sign Up</button></a>
                    </div>
                </div>
            </nav>
        </div>


        <%@page import="java.sql.DriverManager"%>
        <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.Connection"%>


        <%
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
        %>

        <div>
            <br>
            <h3 class="text-center"> Available Vehicles </h3> 



            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle_rental?useSSL=false", "root", "sliitpc16$97");
                    statement = connection.createStatement();
                    String sql = "SELECT * FROM vehicles";

                    resultSet = statement.executeQuery(sql);
                    while (resultSet.next()) {
            %>




            <div class="card-deck" style="margin-left: 50px; margin-right: 50px; margin-top: 3px;">
                <div class="card">
                    <img src="images/001.jpg" class="card-img-top" style="width: 18rem; align-self: center">
                    <div class="card-body bg-dark">
                        <h5 class="card-title text-center text-warning"> Vehicle Model : <%=resultSet.getString("model")%> </h5>
                        <p class="card-text text-center text-light"> Vehicle ID : <%=resultSet.getString("vid")%> <p>
                        <p class="card-text text-center text-light"> Sub Model : <%=resultSet.getString("submodel")%> <p>
                        <p class="card-text text-center text-light"> Vehicle Color : <%=resultSet.getString("color")%> <p>
                        <p class="card-text text-center text-light"> Vehicle Number : <%=resultSet.getString("number")%> <p>
                    </div>
                </div>


            </div>
        </div>

        <%
                }

            } catch (Exception e) {
                out.println(e);
            }
        %>


        <!-- Footer Bottom Start -->
        <div class="footer-bottom-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <p>Copyright &copy; <script>document.write(new Date().getFullYear());</script> All Rights Reserved | Sri Lanka</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer Bottom End -->

        <!--== Footer Area End ==-->

        <script>
            function myFunction() {
                alert("Access Denied ! You've to Login First !!");
            }
        </script>



        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </body>
</html>
