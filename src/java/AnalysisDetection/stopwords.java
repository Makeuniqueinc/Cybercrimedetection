/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalysisDetection;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Murthi
 */
public class stopwords extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String text = null;
            ResultSet rs;
            Connection con3 = SQLconnection.getconnection();

            Statement st = (Statement) con3.createStatement();
            Statement st2 = (Statement) con3.createStatement();
            rs = (ResultSet) st.executeQuery("Select * from dataclean");
            
            int k =st2.executeUpdate("truncate  stopremoved");
            StringBuffer sb = new StringBuffer();

            while (rs.next()) {
                String reviews_text = rs.getString("tweet");
                text = reviews_text;

                String s = text;
                System.out.println("String " + s);
                String[] words = s.split(" ");
                ArrayList<String> wordsList = new ArrayList<String>();
                String absolutePath = getServletContext().getRealPath("/BOW/stopword.txt");

                List<String> stopWordsSet = new ArrayList<String>();
                BufferedReader reader = new BufferedReader(new FileReader(absolutePath));
                String line;
                while ((line = reader.readLine()) != null) {
                    stopWordsSet.add(line.toUpperCase());
                }
                reader.close();

                for (String word : words) {
                    String wordCompare = word.toUpperCase();
                    if (!stopWordsSet.contains(wordCompare)) {
                        wordsList.add(word);
                    }
                }

                StringBuilder nn = new StringBuilder();
                for (String str : wordsList) {
                    System.out.println(str + " ");
                    nn.append(str + " ");

                }
                System.out.println("Final===== " + nn.toString());

                String myStatement = "insert into stopremoved(tweet) values (?)";
                PreparedStatement statement = con3.prepareStatement(myStatement);
                statement.setString(1, nn.toString());
                statement.executeUpdate();

            }
            response.sendRedirect("Detection.jsp?success");

        } catch (SQLException ex) {
            Logger.getLogger(stopwords.class.getName()).log(Level.SEVERE, null, ex);
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
