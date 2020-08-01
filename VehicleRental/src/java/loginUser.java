
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

@WebServlet(urlPatterns = {"/loginUser"})
public class loginUser extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet loginUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loginUser at " + request.getContextPath() + "</h1>");
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

        String uname = request.getParameter("username");
        String pw = request.getParameter("password");
        

        user u = new user();
        u.setUser_name(uname);
        u.setPassword(pw);
  

        request.setAttribute("user", u);

        Boolean status3 = u.isUserNameFilled();
        Boolean status4 = u.isPasswordFilled();

        if (status3 && status4 == true) {

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
                st.executeUpdate("SELECT username,password FROM users(username,password)values('" + uname + "','" + pw + "')");

            } catch (HeadlessException | SQLException e) {
                System.out.println(e);
            }

        

        if (uname.equals(u.getUser_name()) && (pw.equals(u.getPassword()))) {

            JOptionPane.showMessageDialog(null, "Login Successfull ! Welcome '" + uname + "' !!! ");

            request.getRequestDispatcher("customer_profile.jsp?uname="+ uname).forward(request, response);
        } else {
            
         
        
        }
        }else{
            
            JOptionPane.showMessageDialog(null, "Login Unsuccessfull ! Make Sure You've Entered Correct User Name & Password !! !");
        }

        response.sendRedirect("customer_login.jsp");

        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
