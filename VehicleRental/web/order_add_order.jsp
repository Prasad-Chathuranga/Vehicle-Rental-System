<%-- 
    Document   : profile_update_form
    Created on : May 16, 2019, 4:47:21 PM
    Author     : Prasad Chathuranga
--%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Order</title>
        
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
<!--                        <a href="customer_login.jsp" class="nav-item nav-link text-warning">HOME</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="customer_register.jsp" class="nav-item nav-link text-warning">SERVICES</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="customer_register.jsp" class="nav-item nav-link text-warning">ABOUT US</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="customer_register.jsp" class="nav-item nav-link text-warning">CONTACT US</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="customer_register.jsp" class="nav-item nav-link text-warning">BOOK A CAR NOW</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->
                    </div>
                    


<!--                    <div class="navbar-nav ml-auto">
                        <a href="customer_login.jsp" class="nav-item nav-link"><button class="btn btn-outline-warning">Log Out</button></a>
                        <a href="customer_register.jsp" class="nav-item nav-link"><button class="btn btn-outline-warning">Sign Up</button></a>
                    </div>-->
                </div>
            </nav>
            
        </div>

        
       
        
               <section id="slider-area" style="margin-top: -45px;">
                 
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
        
<!--                                        <div class="form-group">
                                            <div class="col-sm-5">
                                                <a href="customer_profile?uid" style="text-decoration: none;"><button class="btn btn-block btn-primary"><b>Back to Profile</b></button></a>
                                                <hr class="bg-light">
                                            </div>-->
        
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
