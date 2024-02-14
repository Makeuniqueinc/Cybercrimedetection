/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalysisDetection;

import Model.SentimentResult;
import SentimentAnalyzing.SentimentAnalyzer;
import java.io.BufferedReader;
import java.io.File;
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
public class SenAnalysisDection extends HttpServlet {

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
            rs = st.executeQuery("Select * from stopremoved");
            int k = st2.executeUpdate("truncate  senanalysisdetections");
            while (rs.next()) {
                String tweet = rs.getString("tweet");
                String[] words = tweet.split(" ");
                ArrayList<String> wordsList = new ArrayList<String>();

                String absolutePath = getServletContext().getRealPath("/BOW/words.txt");

                List<String> racedetect = new ArrayList<String>();
                BufferedReader reader = new BufferedReader(new FileReader(absolutePath));
                String line;
                while ((line = reader.readLine()) != null) {
                    racedetect.add(line.toUpperCase());
                }
                reader.close();

                for (String word : words) {
                    String wordCompare = word.toUpperCase();
                    if (racedetect.contains(wordCompare)) {
                        wordsList.add(word);
                    }
                }
                StringBuilder sb = new StringBuilder();
                for (String str : wordsList) {
                    System.out.println(str + "");
                    sb.append(str + " ");
                }
                if (sb.toString().isEmpty()) {

                    text = tweet;
                    SentimentAnalyzer sentimentAnalyzer = new SentimentAnalyzer();
                    sentimentAnalyzer.initialize();
                    System.out.println("NLP initiated");
                    SentimentResult sentimentResult = sentimentAnalyzer.getSentimentResult(text);
                    System.out.println(text);
                    System.out.println("Sentiment Score: " + sentimentResult.getSentimentScore());
                    System.out.println("Sentiment Type: " + sentimentResult.getSentimentType());
                    System.out.println("Very positive: " + sentimentResult.getSentimentClass().getVeryPositive() + "%");
                    System.out.println("Positive: " + sentimentResult.getSentimentClass().getPositive() + "%");
                    System.out.println("Neutral: " + sentimentResult.getSentimentClass().getNeutral() + "%");
                    System.out.println("Negative: " + sentimentResult.getSentimentClass().getNegative() + "%");
                    System.out.println("Very negative: " + sentimentResult.getSentimentClass().getVeryNegative() + "%");

                    String myStatement = "insert into senanalysisdetections(tweet, getSentimentScore, getSentimentType, getVeryPositive, getPositive, getNeutral, getNegative, getVeryNegative,label,annotation) values (?,?,?,?,?,?,?,?,?,?)";
                    PreparedStatement statement = con3.prepareStatement(myStatement);
                    statement.setString(1, text);
                    statement.setDouble(2, sentimentResult.getSentimentScore());
                    statement.setString(3, sentimentResult.getSentimentType());
                    statement.setDouble(4, sentimentResult.getSentimentClass().getVeryPositive());
                    statement.setDouble(5, sentimentResult.getSentimentClass().getPositive());
                    statement.setDouble(6, sentimentResult.getSentimentClass().getNeutral());
                    statement.setDouble(7, sentimentResult.getSentimentClass().getNegative());
                    statement.setDouble(8, sentimentResult.getSentimentClass().getVeryNegative());
                    statement.setString(9, "0");
                    statement.setString(10, "None");
                    statement.executeUpdate();

                    System.out.println("Lable 0");
                } else {
                    System.out.println("Lable 1");
                    System.out.println("String===== " + tweet);
                    System.out.println("Racist Words===== " + sb.toString());
                    text = tweet;
                    SentimentAnalyzer sentimentAnalyzer = new SentimentAnalyzer();
                    sentimentAnalyzer.initialize();
                    System.out.println("NLP initiated");
                    SentimentResult sentimentResult = sentimentAnalyzer.getSentimentResult(text);
                    System.out.println(text);
                    System.out.println("Sentiment Score: " + sentimentResult.getSentimentScore());
                    System.out.println("Sentiment Type: " + sentimentResult.getSentimentType());
                    System.out.println("Very positive: " + sentimentResult.getSentimentClass().getVeryPositive() + "%");
                    System.out.println("Positive: " + sentimentResult.getSentimentClass().getPositive() + "%");
                    System.out.println("Neutral: " + sentimentResult.getSentimentClass().getNeutral() + "%");
                    System.out.println("Negative: " + sentimentResult.getSentimentClass().getNegative() + "%");
                    System.out.println("Very negative: " + sentimentResult.getSentimentClass().getVeryNegative() + "%");

                    String myStatement = "insert into senanalysisdetections(tweet, getSentimentScore, getSentimentType, getVeryPositive, getPositive, getNeutral, getNegative, getVeryNegative,label,annotation) values (?,?,?,?,?,?,?,?,?,?)";
                    PreparedStatement statement = con3.prepareStatement(myStatement);
                    statement.setString(1, text);
                    statement.setDouble(2, sentimentResult.getSentimentScore());
                    statement.setString(3, sentimentResult.getSentimentType());
                    statement.setDouble(4, sentimentResult.getSentimentClass().getVeryPositive());
                    statement.setDouble(5, sentimentResult.getSentimentClass().getPositive());
                    statement.setDouble(6, sentimentResult.getSentimentClass().getNeutral());
                    statement.setDouble(7, sentimentResult.getSentimentClass().getNegative());
                    statement.setDouble(8, sentimentResult.getSentimentClass().getVeryNegative());
                    statement.setString(9, "1");
                    statement.setString(10, "Racism");
                    statement.executeUpdate();

                }
            }
            response.sendRedirect("Results.jsp?success");

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
