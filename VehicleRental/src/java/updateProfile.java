
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
import model.user;


@WebServlet(urlPatterns = {"/updateProfile"})
public class updateProfile extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
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
        
        
         if(request.getParameter("up") != null){
            
        int uid = Integer.parseInt(request.getParameter("uid"));
        String fname = request.getParameter("first_name");
        String lname = request.getParameter("last_name");
        String uname = request.getParameter("username");
        String pw = request.getParameter("password");
        String rpw = request.getParameter("re_password");
        
        user u = new user();
        u.setUid(uid);
        u.setFirst_name(fname);
        u.setLast_name(lname);
        u.setUser_name(uname);
        u.setPassword(pw);
        u.setRe_password(rpw);
        
        

        try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                System.out.println(e);
            }
            try{
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle_rental?useSSL=false", "root", "sliitpc16$97");
                
               
               String sql = "UPDATE users SET first_name=?, last_name=?, username=?, password=?, re_password=? WHERE uid=?";
               PreparedStatement pst = (PreparedStatement) conn.prepareStatement(sql);
               pst.setString(1, u.getFirst_name());
               pst.setString(2, u.getLast_name());
               pst.setString(3, u.getUser_name());
               pst.setString(4, u.getPassword());
               pst.setString(5, u.getRe_password());
               pst.setInt(6, u.getUid());
               pst.executeUpdate();
                
                JOptionPane.showMessageDialog(null, "Update Successfull ! You've to Login Again !!!");
                response.sendRedirect("customer_login.jsp");
             
            } catch (HeadlessException | SQLException e) {
                System.out.println(e);
            }
            
              
           

        }else{
         
             JOptionPane.showMessageDialog(null, "Update Unsuccessfull !");
             
         }
         
         
//        response.sendRedirect("customer_login.jsp");
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
