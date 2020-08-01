<%-- 
    Document   : register
    Created on : May 12, 2019, 3:19:39 PM
    Author     : Prasad Chathuranga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title> Add Vehicle </title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        <link rel="stylesheet" href="css/add-vehicle-style.css">


    </head>

    <body>



        <!------------------------------->
        <br>
        <h3 class="ml-5"> Add Vehicle </h3>
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-8">
                    <div class="leftside">
                        <form class="form-horizontal" method="post" action="addVehicle">

                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-5 control-label">Vehicle Model</label>
                                <div class="col-sm-5">
                                    <select class="form-control" name="model">
                                        <option>Suzuki</option>
                                        <option>Toyota</option>
                                        <option>Mitsubishi</option>
                                        <option>Tata</option>
                                    </select>
                                </div>
                            </div>  

                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-5 control-label">Sub Model</label>
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
                                <label for="inputEmail3" class="col-sm-5 control-label">Vehicle Color</label>
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
                                <label for="inputEmail3" class="col-sm-5 control-label">Vehicle Number</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="number" name="number" placeholder="Enter Vehicle Number">
                                </div>
                            </div>

                            <!--                            <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-3 control-label">File Link</label>
                                                            <div class="col-sm-5">
                                                                <input type="file" class="form-control" id="file" name="file">
                                                            </div>
                                                        </div>-->


                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-5">
                                    <button id="add" value="add" name="add" type="submit" class="btn btn-block btn-success">Add Vehicle</button>
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
                                    <th><b>Vehicle ID</b></th>
                                    <th><b>Vehicle Model</b></th>
                                    <th><b>Sub Model</b></th>
                                    <th><b>Color</b></th>
                                    <th><b>Vehicle Number</b></th>



                                </tr>
                                <%
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle_rental?useSSL=false", "root", "sliitpc16$97");
                                        statement = connection.createStatement();
                                        String sql = "SELECT * FROM vehicles";

                                        resultSet = statement.executeQuery(sql);
                                        while (resultSet.next()) {
                                %>
                                <tr bgcolor="#DEB887">

                                    <td><%=resultSet.getString("vid")%></td>
                                    <td><%=resultSet.getString("model")%></td>
                                    <td><%=resultSet.getString("submodel")%></td>
                                    <td><%=resultSet.getString("color")%></td>
                                    <td><%=resultSet.getString("number")%></td>



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



            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>



    </body>
</html>

<!--
<div class="form-group">
    <label for="inputEmail3" class="col-sm-5 control-label">Vehicle Color</label>
    <div class="col-md-12">

        <select class="form-control col-md-8" name="payment_type">
            <option>White</option>
            <option>Black</option>
            <option>Blue</option>
            <option>Gray</option>
            <option>Green</option>
            <option>Red</option>
        </select>
    </div>
</div> -->

<!--<div class="form-group">
    <label for="inputEmail3" class="col-sm-5 control-label">Vehicle Model</label>
    <div class="col-sm-12">

        <select class="form-control" name="payment_type">
            <option>Suzuki</option>
            <option>Toyota</option>
            <option>Mitsubishi</option>
     /div>   
       <option>Tata</option>
        </select>
    </div>
</div>   -->
