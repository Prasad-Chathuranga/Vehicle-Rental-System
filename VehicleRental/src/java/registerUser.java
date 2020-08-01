

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
import model.user;
import org.apache.jasper.tagplugins.jstl.core.Out;


@WebServlet(urlPatterns = {"/registerUser"})
public class registerUser extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet registerUser</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet registerUser at " + request.getContextPath() + "</h1>");
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
        
        
       // if(request.getParameter("sign_up") != null){
        
        String fname = request.getParameter("first_name");
        String lname = request.getParameter("last_name");
        String uname = request.getParameter("user_name");
        String pw = request.getParameter("password");
        String re_pw = request.getParameter("re_password");
        

        user u = new user();
        u.setFirst_name(fname);
        u.setLast_name(lname);
        u.setUser_name(uname);
        u.setPassword(pw);
        u.setRe_password(re_pw);

        request.setAttribute("user", u);

        Boolean status1 = u.isFirstNameFilled();
        Boolean status2 = u.isLastNameFilled();
        Boolean status3 = u.isUserNameFilled();
        Boolean status4 = u.isPasswordFilled();
        Boolean status5 = u.isRePasswordFilled();

        if (status1 && status2 && status3 && status4 && status5 == true) {
            try {
                Class.forName("com.mysql.jdbc.Driver");

            } catch (ClassNotFoundException e) {
                System.out.println("Oops ! Something Went Wrong with Database !");
                System.out.println(e);
                return;
            }
            try {
                
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle_rental?useSSL=false", "root", "sliitpc16$97");
                java.sql.Statement st = conn.createStatement();
                int executeUpdate = st.executeUpdate("INSERT INTO users(first_name,last_name,username,password,re_password)values('" + fname + "','" + lname + "','" + uname + "','" + pw + "','" + re_pw + "')");
                JOptionPane.showMessageDialog(null, "Registration Successfull ! Please Login Now !!! ");
                
                request.getRequestDispatcher("/customer_login.jsp").forward(request, response);
                
            } 
            catch (HeadlessException | SQLException e) {
                System.out.println(e);
            }

        } else {
            JOptionPane.showMessageDialog(null, "Registration Unsuccessfull ! Make Sure You've Filled All Fields  !! !");
           

        }
         response.sendRedirect("customer_register.jsp");
    
        
        
    //}
    }
   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
