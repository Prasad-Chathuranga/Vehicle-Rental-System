
import com.mysql.jdbc.PreparedStatement;
import java.awt.HeadlessException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import model.vehicle;
import db.dbconnection;


@WebServlet(urlPatterns = {"/updateVehicle"})
public class updateVehicle extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet updateVehicle</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateVehicle at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        
          if (request.getParameter("update") != null) {

            int vid = Integer.parseInt(request.getParameter("vid"));
            String model = request.getParameter("model");
           String submodel = request.getParameter("submodel");
           String color = request.getParameter("color");
           String number = request.getParameter("number");
           
            vehicle v = new vehicle();
           
            v.setModel(model);
            v.setSubmodel(submodel);
            v.setColor(color);
            v.setNumber(number);
             v.setVid(vid);

      

            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(updatePayment.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle_rental?useSSL=false", "root", "sliitpc16$97");

                String sql = "UPDATE vehicles SET model=?, submodel=?, color=?, number=? WHERE vid=? ";
                PreparedStatement pst = (PreparedStatement) conn.prepareStatement(sql);

                
                pst.setString(1, v.getModel());
                pst.setString(2, v.getSubmodel());
                pst.setString(3, v.getColor());
                pst.setString(4, v.getNumber());
                pst.setInt(5, v.getVid());
                pst.executeUpdate();
                

                JOptionPane.showMessageDialog(null, "Data Updated Successfully !");
                response.sendRedirect("vehicle_update_vehicles.jsp");

            } catch (HeadlessException | SQLException e) {
                System.out.println(e);
            }
        } else {
            JOptionPane.showMessageDialog(null, "Data Not Updated Successfully !");
            response.sendRedirect("vehicle_update_vehicles.jsp");
        }
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
