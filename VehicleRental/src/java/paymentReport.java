

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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


@WebServlet(urlPatterns = {"/paymentReport"})
public class paymentReport extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        
        response.setContentType("application/pdf");
        OutputStream out = response.getOutputStream();

        try {
            try {
            } catch (Exception e) {
                System.out.println(e);
            }
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;

            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle_rental?useSSL=false", "root", "sliitpc16$97");
            statement = connection.createStatement();
            String sql = "SELECT * FROM payments";

            try {

                Document documento = new Document();
                PdfWriter.getInstance(documento, out);

                documento.open();

                documento.add(new Phrase(Chunk.NEWLINE));
                documento.add(new Phrase(Chunk.NEWLINE));
                documento.add(new Paragraph("--------------------------------------------------------------------------------------------------------------------------------"));

                Paragraph p1 = new Paragraph();
                Font font = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD, BaseColor.BLUE);
                p1.add(new Phrase(Chunk.NEWLINE));
                p1.add(new Phrase(Chunk.NEWLINE));
                p1.add(new Phrase("- Payment Details Report -", font));
                p1.setAlignment(Element.ALIGN_CENTER);
                p1.add(new Phrase(Chunk.NEWLINE));
                p1.add(new Phrase(Chunk.NEWLINE));
                documento.add(p1);

//                documento.add(new Phrase(Chunk.NEWLINE));
//                documento.add(new Phrase(Chunk.NEWLINE));
                documento.add(new Paragraph("--------------------------------------------------------------------------------------------------------------------------------"));

                Paragraph p2 = new Paragraph();
                Font font2 = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.NORMAL, BaseColor.BLACK);
//                p2.add(new Phrase("The code is pretty straight-forward. We start by instantiating the com.itextpdf.text.Document class." + "Then pass this Documentinstance to the PDFWriter class along-with the FileOutputStream object", font2));
//                p2.setAlignment(Element.ALIGN_JUSTIFIED);
                p2.add(new Phrase(Chunk.NEWLINE));
                p2.add(new Phrase(Chunk.NEWLINE));
                documento.add(p2);

                PdfPTable tab = new PdfPTable(7);
                PdfPCell c1 = new PdfPCell(new Paragraph("User ID", new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.MAGENTA)));
                PdfPCell c2 = new PdfPCell(new Paragraph("First Name", new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.MAGENTA)));
                PdfPCell c3 = new PdfPCell(new Paragraph("Last Name", new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.MAGENTA)));
                PdfPCell c4 = new PdfPCell(new Paragraph("User Name", new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.MAGENTA)));
                PdfPCell c5 = new PdfPCell(new Paragraph("Payment Type", new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.MAGENTA)));
                PdfPCell c6 = new PdfPCell(new Paragraph("Amount", new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.MAGENTA)));
                PdfPCell c7 = new PdfPCell(new Paragraph("Discount", new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.MAGENTA)));

                tab.addCell(c1);
                tab.addCell(c2);
                tab.addCell(c3);
                tab.addCell(c4);
                tab.addCell(c5);
                tab.addCell(c6);
                tab.addCell(c7);

                float[] columnWidths = new float[]{20, 20, 20, 20, 20, 20, 20};
                tab.setWidths(columnWidths);

                tab.setWidthPercentage(100); //set table width to 100%

                resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {

                    tab.addCell(resultSet.getString("uid"));
                    tab.addCell(resultSet.getString("first_name"));
                    tab.addCell(resultSet.getString("last_name"));
                    tab.addCell(resultSet.getString("username"));
                    tab.addCell(resultSet.getString("payment_type"));
                    tab.addCell(resultSet.getString("amount"));
                    tab.addCell(resultSet.getString("discount"));

                }

                documento.add(tab);

                documento.add(new Phrase(Chunk.NEWLINE));
                documento.add(new Phrase(Chunk.NEWLINE));
                documento.add(new Paragraph("--------------------------------------------------------------------------------------------------------------------------------"));

                documento.close();
            } catch (DocumentException e) {
                System.out.println(e);
            }

        } finally {
            out.close();
        }
       
    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(paymentReport.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(paymentReport.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(paymentReport.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(paymentReport.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
