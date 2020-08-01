/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.mysql.jdbc.PreparedStatement;
import java.awt.HeadlessException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import model.payment;
import model.vehicle;

/**
 *
 * @author Prasad Chathuranga
 */
@WebServlet(urlPatterns = {"/deleteVehicle"})
public class deleteVehicle extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         if (request.getParameter("vid") != null) {

            int vid = Integer.parseInt(request.getParameter("vid"));
            vehicle v = new vehicle();
            v.setVid(vid);

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

           try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
               // Logger.getLogger(UpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            try{
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle_rental?useSSL=false", "root", "sliitpc16$97");
                
                
               String sql = "DELETE FROM vehicles WHERE vid=?";
               PreparedStatement pst = (PreparedStatement) conn.prepareStatement(sql);
               pst.setInt(1, v.getVid());
               pst.executeUpdate();
               
               
                
             JOptionPane.showMessageDialog(null, "Data Deleted Successfully !");
            } catch (HeadlessException | SQLException e) {
                System.out.println(e);
                
            }

              
           

        
        response.sendRedirect("vehicle_delete_vehicles.jsp");
        
        }else{
        JOptionPane.showMessageDialog(null, "Data Not Deleted Successfully !");
        response.sendRedirect("vehicle_delete_vehicles.jsp"); 
            
        }
       
    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
