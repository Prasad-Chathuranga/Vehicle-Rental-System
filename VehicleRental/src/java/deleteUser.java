

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
import model.user;


@WebServlet(urlPatterns = {"/deleteUser"})
public class deleteUser extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        if (request.getParameter("uid") != null) {

            int uid = Integer.parseInt(request.getParameter("uid"));
            user u = new user();
            u.setUid(uid);

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

           try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
               // Logger.getLogger(UpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            try{
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle_rental?useSSL=false", "root", "sliitpc16$97");
                
                
               String sql = "DELETE FROM users WHERE uid=?";
               PreparedStatement pst = (PreparedStatement) conn.prepareStatement(sql);
               pst.setInt(1, u.getUid());
               pst.executeUpdate();
               
               
                
             JOptionPane.showMessageDialog(null, "Data Deleted Successfully !");
             response.sendRedirect("customer_delete_customer.jsp");
            } catch (HeadlessException | SQLException e) {
                System.out.println(e);
                
            }

              
           

        
        }else{
        
            
        response.sendRedirect("customer_delete_customer.jsp");
        JOptionPane.showMessageDialog(null, "Data Not Deleted Successfully !");
            
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
