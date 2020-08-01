
import com.mysql.jdbc.PreparedStatement;
import java.awt.HeadlessException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;
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

@WebServlet(urlPatterns = {"/updatePayment"})
public class updatePayment extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet updatePayment</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updatePayment at " + request.getContextPath() + "</h1>");
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

            int uid = Integer.parseInt(request.getParameter("uid"));
            String fname = request.getParameter("first_name");
            String lname = request.getParameter("last_name");
            String uname = request.getParameter("username");
            String type = request.getParameter("payment_type");
            String amount = request.getParameter("amount");
            String discount = request.getParameter("discount");

            payment p = new payment();
            p.setUid(uid);
            p.setFirst_name(fname);
            p.setLast_name(lname);
            p.setUsername(uname);
            p.setPayment_type(type);
            p.setAmount(amount);
            p.setDiscount(discount);

            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(updatePayment.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle_rental?useSSL=false", "root", "sliitpc16$97");

                String sql = "UPDATE payments SET first_name=?,last_name=?,username=?,payment_type=?,amount=?,discount=? WHERE uid=?   ";
                PreparedStatement pst = (PreparedStatement) conn.prepareStatement(sql);

                pst.setString(1, p.getFirst_name());
                pst.setString(2, p.getLast_name());
                pst.setString(3, p.getUsername());
                pst.setString(4, p.getPayment_type());
                pst.setString(5, p.getAmount());
                pst.setString(6, p.getDiscount());
                pst.setInt(7, p.getUid());
                pst.executeUpdate();

                JOptionPane.showMessageDialog(null, "Data Updated Successfully !");
                response.sendRedirect("payment_update_payments.jsp");

            } catch (HeadlessException | SQLException e) {
                System.out.println(e);
            }
        } else {
            JOptionPane.showMessageDialog(null, "Data Not Updated Successfully !");
            response.sendRedirect("payment_update_payments.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
