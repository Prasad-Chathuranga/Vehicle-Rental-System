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
            <title>Update Vehicle Details </title>
        </head>
        <body>


            <%
                Connection connection = null;
                Statement statement = null;
                ResultSet resultSet = null;

                String vid = request.getParameter("vid");

                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle_rental?useSSL=false", "root", "sliitpc16$97");
                statement = connection.createStatement();
                String sql = "SELECT * FROM vehicles WHERE vid=" + vid;

                resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {

            %>
            <hr>

            <h2 class="text-center mt-3 col-sm-5 mb-3">Update Vehicle Details</h2>

            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="leftside">
                            <form class="form-horizontal" method="post" action="updateVehicle">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-3 control-label">Vehicle ID</label>
                                    <div class="col-sm-5">
                                        <input type="text" class="form-control" id="inputFirstName" placeholder="Vehicle ID" value="<%= resultSet.getInt("vid")%>" name="vid" id="vid">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-3 control-label">Vehicle Model</label>
                                    <div class="col-sm-5">
                                         <input type="text" class="form-control" id="amount" value="<%= resultSet.getString("model")%>" name="model" placeholder="Vehicle Model">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-5 control-label">Sub Model</label>
                                     <div class="col-sm-5">
                                     <input type="text" class="form-control" id="amount" value="<%= resultSet.getString("submodel")%>" name="submodel" placeholder="Vehicle Sub Model">
                                </div>
                                </div>

                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-5 control-label">Color</label>
                                    <div class="col-sm-5">
                                        <input type="text" class="form-control" id="amount" value="<%= resultSet.getString("color")%>" name="color" placeholder="Vehicle Color">
                                </div>

                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-5 control-label">Vehicle Number</label>
                                    <div class="col-sm-5">
                                        <input type="text" class="form-control" id="amount" value="<%= resultSet.getString("number")%>" name="number" placeholder="Vehicle Number">
                                    </div>
                                </div>   


                                


                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-5">
                                        <button id="update" value="update" name="update" type="submit" class="btn btn-block btn-success">Update Vehicle Details</button>
                                    </div>
                                </div>
                            </form>
                            <% }%>
                        </div>
                    </div>
                </div>
            </div>





            <br>









            <!-- Optional JavaScript -->
            <!-- jQuery first, then Popper.js, then Bootstrap JS -->
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        </body>
    </html>
