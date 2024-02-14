<%-- 
    Document   : LoadedData
    Created on : Dec 27, 2022, 10:26:20 PM
    Author     : Murthi
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="AnalysisDetection.SQLconnection"%>
<%@page import="AnalysisDetection.SQLconnection"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- basic -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- mobile metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1">
        <!-- site metas -->
        <title>Analysis & Detection</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- bootstrap css -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <!-- style css -->
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <!-- Responsive-->
        <link rel="stylesheet" href="css/responsive.css">
        <link rel="stylesheet" href="view/style.css">
        <!-- fevicon -->
        <link rel="icon" href="images/fevicon.png" type="image/gif" />
        <!-- Scrollbar Custom CSS -->
        <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
        <!-- Tweaks for older IEs-->
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
        <!-- fonts -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:400,700|Raleway:400,700&display=swap" rel="stylesheet">
        <!-- owl stylesheets --> 
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link rel='stylesheet' href='https://rawgit.com/FortAwesome/Font-Awesome/master/css/font-awesome.min.css'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
    </head>


    <%
                if (request.getParameter("Success") != null) {%>
    <script>alert('Data Loaded Successfully');</script>  
    <%}
    %>

    <body>
        <!--header section start -->
        <div class="header_section">
            <div class="container-fluid">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="logo"><a href=""></a></div>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item" >
                                <a class="nav-link" href="Home.jsp">Home</a>
                            </li>
                            <li class="nav-item" style="width: 200px ">
                                <a class="nav-link" href="uploaddata.jsp">Upload Dataset</a>
                            </li>
                            <li class="nav-item" style="width: 200px ">
                                <a class="nav-link" href="LoadedData.jsp">Data Cleaning</a>
                            </li>
                            <li class="nav-item" style="width: 200px ">
                                <a class="nav-link" href="DataCleaning.jsp">Pre-Processing</a>
                            </li>
                            <li class="nav-item" style="width: 200px ">
                                <a class="nav-link" href="Detection.jsp">Racism Detection</a>
                            </li>
                            <li class="nav-item" style="width: 100px ">
                                <a class="nav-link" href="Graph.jsp">Graph</a>
                            </li>
                              <li class="nav-item" style="width: 100px ">
                                <a class="nav-link" href="index.jsp">Logout</a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <!--header section end -->
        <!-- contact section start -->
        <div class="contact_srction layout_padding">
            <div class="container">
                <h1 class="contact_taital">Uploaded Dataset</h1>
                <br>
                <br>
                <br>
                <center>Data Cleaning---<a href="symbolsremove" class="btn btn-danger">Remove Symbols</a></center>
                <br>
                <br>
                <br>

                <div id="DataTable">
                    <div id="table_box_bootstrap"></div>
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tweet Text</th>
                            </tr>
                        </thead> 
                        <tbody class="scroll-pane">
                            <%
                                Connection con = SQLconnection.getconnection();
                                Statement st = con.createStatement();
                                try {
                                    ResultSet rs = st.executeQuery("Select * from tweetdata");
                                    while (rs.next()) {
                            %>
                            <tr>
                                <td ><%=rs.getString("id")%></td>
                                <td  ><%=rs.getString("tweet")%></td>
                                <%                                        }
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    }

                                %>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!--===========================================================================================-->





















                <!--===============================================================================================-->                           
            </div>
        </div>
        <!-- contact section end -->
        <!-- footer section start -->
        <div class="footer_section">
            <div class="container">
            </div>
        </div>
        <!-- footer section end -->
        <!-- copyright section start -->
        <div class="copyright_section">
            <div class="container">
                <p class="copyright_text">Copyright 2023 All Rights Reserved.<a href="">Racism Detection</a></p>
            </div>
        </div>
        <!-- copyright section end -->
        <!-- Javascript files-->
        <script src="js/jquery.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery-3.0.0.min.js"></script>
        <script src="js/plugin.js"></script>
        <!-- sidebar -->
        <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
        <script src="js/custom.js"></script>
        <script src="view/script.js"></script>
        <script src="js/owl.carousel.js"></script>
        <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'></script>
    </body>
</html>
