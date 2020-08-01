

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
import model.orders;


@WebServlet(urlPatterns = {"/addOrder"})
public class addOrder extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addOrder</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addOrder at " + request.getContextPath() + "</h1>");
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
     
        
         if (request.getParameter("addorder") != null) {
         
         
             
        String pickdate = request.getParameter("pickdate");
        String returndate  = request.getParameter("returndate");
        String username = request.getParameter("username");
        String model = request.getParameter("model");
        String submodel = request.getParameter("submodel");
        String color = request.getParameter("color");
        
        orders o = new orders();
        o.setPickdate(pickdate);
        o.setReturndate(returndate);
        o.setUsername(username);
        o.setModel(model);
        o.setSubmodel(submodel);
        o.setColor(color);
        
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
                int executeUpdate = st.executeUpdate("INSERT INTO orders(pickdate,returndate,username,model,submodel,color)values('" + pickdate + "','" + returndate + "','" + username + "','" + model + "','" + submodel + "','" + color + "')");
                JOptionPane.showMessageDialog(null, "Order Successfull !!! We'll Process Your Order & Will Add Order Details to Your Profile on Your Next Login !!!  ");
                
                request.getRequestDispatcher("/customer_login.jsp").forward(request, response);
                
            } 
            catch (HeadlessException | SQLException e) {
                System.out.println(e);
            }
             
             
             
         
         
         
         }else{}
        
        
    }

   
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
