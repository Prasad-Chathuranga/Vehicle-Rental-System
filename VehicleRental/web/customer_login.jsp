<%-- 
    Document   : register
    Created on : May 12, 2019, 3:19:39 PM
    Author     : Prasad Chathuranga
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title> Login </title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        <link href="css/login-style.css" rel="stylesheet">
        <link href="css/index-style.css" rel="stylesheet">
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
                        <a href="#" class="nav-item nav-link text-warning"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="#" class="nav-item nav-link text-warning"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="#" class="nav-item nav-link text-warning"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="#" class="nav-item nav-link text-warning"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="#" class="nav-item nav-link text-warning"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                    <div class="navbar-nav ml-auto">
                        <!--<a href="customer_login.jsp" class="nav-item nav-link"><button class="btn btn-outline-warning">Login</button></a>-->
                        <a href="customer_register.jsp" class="nav-item nav-link"><button class="btn btn-outline-warning">Sign Up</button></a>
                    </div>
                </div>
            </nav>
        </div>

       


        <section id="lgoin-page-wrap" class="bg-dark">
            <div class="container bg-dark">
                <div class="row">
                    <div class="col-lg-4 col-md-8 m-auto">
                        <div class="login-page-content">
                            <div class="login-form bg-dark">
                                <h3 class="align text-light">User Login </h3><hr class="bg-light">
                                <form action="loginUser" method="post">

                                    



                                    <div class="form-group">
                                        <label for="exampleInputEmail1" class="text-light">User Name</label>
                                        <input type="text" class="form-control" id="exampleInputEmail1" id="user_name" name="username" placeholder="Enter Username">

                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1" class="text-light">Password</label>
                                        <input type="password" class="form-control" name="password" id="password" placeholder="Password">
                                    </div>
                                    <small id="emailHelp" class="form-text text-muted align text-light">We'll Never Share Your Details with Anyone Else !</small><hr class="bg-light">
                                    <div>
                                         <button  type="submit" name="login" id="login"  class="btn btn-block btn-success">Login </button>  <hr class="bg-light">
                                    </div>




                                    <div>
                                        <p class="text-center text-light">Don't have an Account? <br><a href="customer_register.jsp">Sign Up from Here !</a></p>
                                    </div>
                                    
                                    
                                </form>
                                   
                                    
                                  
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>



        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </body>
</html>
