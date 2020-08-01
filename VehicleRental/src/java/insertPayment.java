
import db.dbconnection;
import java.awt.HeadlessException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import model.payment;

@WebServlet(urlPatterns = {"/insertPayment"})
public class insertPayment extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet insertPayment</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet insertPayment at " + request.getContextPath() + "</h1>");
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

        if (request.getParameter("add") != null) {

            String fname = request.getParameter("first_name");
            String lname = request.getParameter("last_name");
            String uname = request.getParameter("username");
            String type = request.getParameter("payment_type");
            String amount = request.getParameter("amount");
            String discount = request.getParameter("discount");

            payment p = new payment();
            p.setFirst_name(fname);
            p.setLast_name(lname);
            p.setUsername(uname);
            p.setPayment_type(type);
            p.setAmount(amount);
            p.setDiscount(discount);

            request.setAttribute("payment", p);

            Boolean status1 = p.isFirstNameFilled();
            Boolean status2 = p.isLastNameFilled();
            Boolean status3 = p.isUserNameFilled();
            Boolean status4 = p.isAmountFilled();

            if (status1 && status2 && status3 && status4 == true) {

                try {
                    Class.forName("com.mysql.jdbc.Driver");

                } catch (ClassNotFoundException e) {
                    System.out.println("Oops ! Something Went Wrong with Database !");
                    e.printStackTrace();
                    return;
                }
                try {

                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle_rental?useSSL=false", "root", "sliitpc16$97");
                    java.sql.Statement st = conn.createStatement();
                    st.executeUpdate("INSERT INTO payments(first_name,last_name,username,payment_type,amount,discount)values('" + fname + "','" + lname + "','" + uname + "','" + type + "','" + amount + "','" + discount + "')");
                    JOptionPane.showMessageDialog(null, "Data Inserted Successfully !");
                } catch (HeadlessException | SQLException e) {
                    System.out.println(e);
                }
            } else {
                JOptionPane.showMessageDialog(null, "Data  not inserted Successfully !");
            }

            response.sendRedirect("payment_add_new_payment.jsp");

        }else{
        
            JOptionPane.showMessageDialog(null, "Data  not inserted Successfully !");
            
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
