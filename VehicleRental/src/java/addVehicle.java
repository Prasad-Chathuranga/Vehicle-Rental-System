
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
import javax.servlet.http.Part;
import javax.swing.JOptionPane;
import model.vehicle;

@WebServlet(urlPatterns = {"/addVehicle"})

public class addVehicle extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addVehicle</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addVehicle at " + request.getContextPath() + "</h1>");
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

            String model = request.getParameter("model");
            String submodel = request.getParameter("submodel");
            String color = request.getParameter("color");
            String number = request.getParameter("number");

            vehicle v = new vehicle();

            v.setModel(model);
            v.setSubmodel(submodel);
            v.setColor(color);
            v.setNumber(number);

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
                int executeUpdate = st.executeUpdate("INSERT INTO vehicles(model,submodel,color,number)values('" + model + "','" + submodel + "','" + color + "','" + number + "')");
                JOptionPane.showMessageDialog(null, "Vehicle Added Successfully !!! ");

                request.getRequestDispatcher("/vehicle_add_vehicle.jsp").forward(request, response);

            } catch (HeadlessException | SQLException e) {
                System.out.println(e);
            }

        }else{JOptionPane.showMessageDialog(null, "Vehicle Not Added Successfully !!! ");}
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
