<%-- 
    Document   : profile_update_form
    Created on : May 16, 2019, 4:47:21 PM
    Author     : Prasad Chathuranga
--%>


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Order</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
        <link href="css/customer-profile-style.css" rel="stylesheet">
        <link href="css/index-style.css" rel="stylesheet">
        <link href="css/profile-style.css" rel="stylesheet">
    </head>
    <body>


        <%
            
                Connection connection = null;
                Statement statement = null;
                ResultSet resultSet = null;

                String oid = request.getParameter("oid");

                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle_rental?useSSL=false", "root", "sliitpc16$97");
                statement = connection.createStatement();
                String sql = "SELECT * FROM orders WHERE oid=" + oid;

                resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {

        %>

        <section id="slider-area" style="margin-top: -45px;">
            == slide Item One ==
            <div class="single-slide-item overlay">
                <div class="container mt-5" >
                    <div class="row">
                        <div class="col-md-8">
                            <div class="border-class">

                                <form class="mt-2" method="post" action="updateOrder">

                                    <div class="form-group">
                                        <div class="col-md-5">
                                            <hr> <h5 class="text-left"><b>&nbsp;&nbsp; BOOK A CAR TODAY ! </b></h5><hr>
                                            <label for="date" ><b>Pickup Date</b></label>&nbsp;&nbsp;&nbsp;&nbsp;<br>
                                            <input style="background:transparent;" type="date" class="form-control"  value="<%=resultSet.getString("pickdate")%>" name="pickdate">
                                        </div>
                                    </div>
                                        
                                        

                                    <div class="form-group">
                                        <div class="col-md-5">
                                            <label for="date" ><b>Return Date</b></label>&nbsp;&nbsp;&nbsp;&nbsp;<br>
                                            <input style="background:transparent;"  type="date" class="form-control" value="<%=resultSet.getString("returndate")%>" name="returndate">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-md-5">
                                            <label for="date" ><b>User Name</b></label>&nbsp;&nbsp;&nbsp;&nbsp;<br>
                                            <input style="background:transparent;"  type="text" class="form-control" placeholder="Enter Your Name" value="<%=resultSet.getString("username")%>" name="username">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-sm-5 control-label"><b>Vehicle Model</b></label>
                                        <div class="col-md-5">
                                            <input style="background:transparent;"  type="text" class="form-control" placeholder="Enter Your Name" value="<%=resultSet.getString("model")%>" name="model">
                                        </div>
                                    </div> 

                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-sm-5 control-label"><b>Sub Model</b></label>
                                        <div class="col-sm-5">
                                            <input style="background:transparent;"  type="text" class="form-control" placeholder="Enter Your Name" value="<%=resultSet.getString("submodel")%>" name="submodel">
                                        </div>
                                    </div>  

                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-sm-5 control-label"><b>Vehicle Color</b></label>
                                        <div class="col-sm-5">
                                            <input style="background:transparent;"  type="text" class="form-control" placeholder="Enter Your Name" value="<%=resultSet.getString("color")%>" name="color">
                                        </div>
                                    </div> 
                                        
                                        <div class="form-group">
                                        <div class="col-md-5">
                                            <label for="date" ><b>Order ID</b></label>&nbsp;&nbsp;&nbsp;&nbsp;<br>
                                            <input style="background:transparent;"  type="text" class="form-control" value="<%=resultSet.getString("oid")%>" name="oid" >
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-sm-5">
                                            <button type="submit"  name="drt"  id="drt" class="btn btn-block btn-warning"><b>Update Order</b></button><hr class="bg-light">
                                        </div>

                                    </div>
                            </div>
                            </form>

                            <%

                                    }

                               
                            %>

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
