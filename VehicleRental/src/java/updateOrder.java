
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
import model.orders;
import model.payment;


@WebServlet(urlPatterns = {"/updateOrder"})
public class updateOrder extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        

       
       
       
        
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         
        
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
         if (request.getParameter("drt") != null) {
            
             
             JOptionPane.showMessageDialog(null, "Data Updated Successfully ! "+ request.getParameter("oid"));

            int oid = Integer.parseInt(request.getParameter("oid"));
            String pickdate = request.getParameter("pickdate");
            String returndate = request.getParameter("returndate");
            String uname = request.getParameter("username");
            String model = request.getParameter("model");
            String submodel = request.getParameter("submodel");
            String color = request.getParameter("color");

            orders o = new orders();
             o.setOid(oid);
            o.setPickdate(pickdate);
            o.setReturndate(returndate);
            o.setUsername(uname);
            o.setModel(model);
            o.setSubmodel(submodel);
            o.setColor(color);
           

            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(updatePayment.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle_rental?useSSL=false", "root", "sliitpc16$97");

                String sql = "UPDATE orders SET pickdate=?,returndate=?,username=?,model=?,submodel=?,color=? WHERE oid=?  ";
                PreparedStatement pst = (PreparedStatement) conn.prepareStatement(sql);

                pst.setString(1, o.getPickdate());
                pst.setString(2, o.getReturndate());
                pst.setString(3, o.getUsername());
                pst.setString(4, o.getModel());
                pst.setString(5, o.getSubmodel());
                pst.setString(6, o.getColor());
                pst.setInt(7, o.getOid());
                pst.executeUpdate();

                JOptionPane.showMessageDialog(null, "Data Updated Successfully !");
                response.sendRedirect("order_update_orders.jsp");

            } catch (HeadlessException | SQLException e) {
                System.out.println(e);
            }
        } else {
            JOptionPane.showMessageDialog(null, "Data Not Updated Successfully !");
//            response.sendRedirect("payment_update_payments.jsp");
        }
        
                
       
    }
        
    

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
