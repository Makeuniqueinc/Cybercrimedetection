<%-- 
    Document   : uploaddata
    Created on : Dec 27, 2022, 10:03:45 PM
    Author     : Murthi
--%>
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
    
                <%
        if (request.getParameter("cleared") != null) {%>
    <script>alert('Cleared all the Data');</script>  
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
                <h1 class="contact_taital">Upload Dataset</h1>
                <div class="contact_srction_2">
                    <div class="mail_main">
                        <center><form action="LoadData" method="post" enctype="multipart/form-data">
                                <input type="file"name="dataset" width="300px" accept=".csv" class="mail_text" required="">
                                <br> <br> <br><br> <br>
                                <button class="send_bt" style="/* Created with https://www.css-gradient.com */
background: #B443E0;
background: -webkit-linear-gradient(left, #B443E0, #8B6BBF);
background: -moz-linear-gradient(left, #B443E0, #8B6BBF);
background: linear-gradient(to right, #B443E0, #8B6BBF);color: white;" type="submit">Upload</button>
                            </form>
                            <br><br><br>
                            <a href="cleardata.jsp" style="color: red">Clear Previous Data Analysis</a>
                        </center>
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
        <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
    </body>
</html>
