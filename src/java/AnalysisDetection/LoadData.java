/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalysisDetection;

import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Murthi
 */
@MultipartConfig(maxFileSize = 16177215)
public class LoadData extends HttpServlet {

   
    final String filepath = "D:\\";
    int maxFileSize = 77000000;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
           MultipartRequest m = new MultipartRequest(request, filepath,maxFileSize);
           
        File file = m.getFile("dataset");
        String fname = file.getName();
        System.out.println("test------1 "+fname);
        try {
          Connection connection = SQLconnection.getconnection();
               {
 
                String loadQuery = "LOAD DATA INFILE '"+"D:\\"+fname+"'\n" +
"INTO TABLE tweetdata\n" +
"FIELDS TERMINATED BY ','\n" +
"ENCLOSED BY '\"'\n" +
"LINES TERMINATED BY '\\r\\n'  IGNORE 1 LINES (tweet)";
            
                System.out.println(loadQuery);
                Statement stmt = connection.createStatement();
                stmt.execute(loadQuery);
                response.sendRedirect("LoadedData.jsp?Success");
        }
               
        }
        catch (Exception e)
        {
                e.printStackTrace();
        }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
