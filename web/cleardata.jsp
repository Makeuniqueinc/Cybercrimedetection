<%-- 
    Document   : cleardata
    Created on : Dec 28, 2022, 12:07:38 PM
    Author     : Murthi
--%>
<%@page import="AnalysisDetection.SQLconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection con = SQLconnection.getconnection();
            Statement st = con.createStatement();
            Statement st1 = con.createStatement();
            Statement st2 = con.createStatement();
            Statement st3 = con.createStatement();
            int i = st.executeUpdate("truncate dataclean");
            int j = st1.executeUpdate("truncate senanalysisdetections");
            int k = st2.executeUpdate("truncate stopremoved");
            int l = st3.executeUpdate("truncate tweetdata");
        %>
        <script>window.location.replace("uploaddata.jsp?cleared");</script>
    </body>
</html>dy>
</html>
