<%-- 
    Document   : Graph
    Created on : Dec 28, 2022, 10:54:37 PM
    Author     : Murthi
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="AnalysisDetection.SQLconnection"%>
<%@page import="java.sql.Connection"%>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
    </head>
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
                <div class="contact_srction_2">
                    <%
                        String tweetcount = "", race = "";
                        try {
                            Connection con = SQLconnection.getconnection();

                            Statement st = con.createStatement();
                            ResultSet rs0 = st.executeQuery("SELECT  COUNT(id) AS tweetcount FROM  senanalysisdetections");
                            rs0.next();
                            {

                                tweetcount = rs0.getString("tweetcount");
                            }
                            rs0.close();
                            Statement st1 = con.createStatement();
                            ResultSet rs2 = st1.executeQuery("SELECT  COUNT(id) AS race FROM  senanalysisdetections where label='1'");
                            rs2.next();
                            {
                                race = rs2.getString("race");
                            }
                            //Integer sii = rs0.getInt("value_occurrence");
                            System.out.println("count------------------> " + tweetcount);
                            System.out.println("count------------------> " + race);

                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    %>
                    <div class="mail_main">
                        <div id="chartContainer" style="height: 500px; width: 100%;"></div>
                    </div>
                </div>
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
        <script>
            
window.onload = function () {
	var chart = new CanvasJS.Chart("chartContainer",
	{
		title:{
			text: "Racism Detection"
		},
		legend: {
			maxWidth: 350,
			itemWidth: 120
		},
		data: [
		{
			type: "pie",
			showInLegend: true,
			legendText: "{indexLabel}",
			dataPoints: [
				{ y:  <%=tweetcount%>, indexLabel: "Total Tweets" },
				{ y: <%=race%>, indexLabel: "Racism Tweets" }
			]
		}
		]
	});
	chart.render();
}
        </script>
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
        <!-- javascript --> 
        <script src="js/owl.carousel.js"></script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
    </body>
</html>

