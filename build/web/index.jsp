<%-- 
    Document   : index
    Created on : 13 feb. 2022, 5:59:50 p. m.
    Author     : Oscar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Easy Travel - Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- comment 
        <meta name="description" content="Free HTML5 Website Template by FreeHTML5.co" />
        <meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
        <meta name="author" content="FreeHTML5.co" />-->

        <!-- Facebook and Twitter integration 
        <meta property="og:title" content=""/>
        <meta property="og:image" content=""/>
        <meta property="og:url" content=""/>
        <meta property="og:site_name" content=""/>
        <meta property="og:description" content=""/>
        <meta name="twitter:title" content="" />
        <meta name="twitter:image" content="" />
        <meta name="twitter:url" content="" />
        <meta name="twitter:card" content="" />-->

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700" rel="stylesheet">

        <!-- Animate.css -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- Icomoon Icon Fonts-->
        <link rel="stylesheet" href="css/icomoon.css">
        <!-- Themify Icons-->
        <link rel="stylesheet" href="css/themify-icons.css">
        <!-- Bootstrap  -->
        <link rel="stylesheet" href="css/bootstrap.css">

        <!-- Magnific Popup -->
        <link rel="stylesheet" href="css/magnific-popup.css">

        <!-- Magnific Popup -->
        <link rel="stylesheet" href="css/bootstrap-datepicker.min.css">

        <!-- Owl Carousel  -->
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">

        <!-- Theme style  -->
        <link rel="stylesheet" href="css/style.css">

        <!-- Modernizr JS -->
        <script src="js/modernizr-2.6.2.min.js"></script>
        <!-- FOR IE9 below -->
        <!--[if lt IE 9]>
        <script src="js/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>        
        <header id="gtco-header" class="gtco-cover gtco-cover-md" role="banner" style="background-image: url(images/img_bg_2.jpg); width: 100%; height: 100vh">
            <div class="overlay" style="overflow: auto">
                <div class="gtco-container">
                    <div class="row">
                        <div class="col-md-12 col-md-offset-0 text-left">


                            <div class="row row-mt-15em">
                                <div class="col-md-7 mt-text animate-box" data-animate-effect="fadeInUp">
                                    <h1>Easy travel2</h1>	
                                    <h2>Listo para las vacaciones?</h2>
                                </div>
                                <div class="col-md-4 col-md-push-1 animate-box" data-animate-effect="fadeInRight">
                                    <div class="form-wrap">
                                        <div class="tab">

                                            <div class="tab-content">
                                                <div class="tab-content-inner active" data-content="signup">
                                                    <h3>Login</h3>
                                                    <form action="ControladorLogin" method="post">
                                                        <div class="row form-group">
                                                            <div class="col-md-12">
                                                                <label for="fullname">Usuario</label>
                                                                <input type="text" name="usuario" class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="row form-group">
                                                            <div class="col-md-12">
                                                                <label for="fullname">Contraseña</label>
                                                                <input type="password" name="contrasena" class="form-control">
                                                            </div>
                                                        </div>
                                                        <!--
                                                        <div class="row form-group">
                                                            <div class="col-md-12">
                                                                <label for="activities">Activities</label>
                                                                <select name="#" id="activities" class="form-control">
                                                                    <option value="">Activities</option>
                                                                    <option value="">Hiking</option>
                                                                    <option value="">Caving</option>
                                                                    <option value="">Swimming</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="row form-group">
                                                            <div class="col-md-12">
                                                                <label for="destination">Destination</label>
                                                                <select name="#" id="destination" class="form-control">
                                                                    <option value="">Philippines</option>
                                                                    <option value="">USA</option>
                                                                    <option value="">Australia</option>
                                                                    <option value="">Singapore</option>
                                                                </select>
                                                            </div>
                                                        </div>
    
                                                        <div class="row form-group">
                                                            <div class="col-md-12">
                                                                <label for="date-start">Date Travel</label>
                                                                <input type="text" id="date-start" class="form-control">
                                                            </div>
                                                        </div>
                                                        -->
                                                        <div class="row form-group">
                                                            <div class="col-md-12">
                                                                <input type="submit" class="btn btn-primary btn-block" name="accion" value="Ingresar">
                                                            </div>
                                                        </div>
                                                    </form>	
                                                    <form action="registro.jsp">
                                                        <div class="row form-group">
                                                            <div class="col-md-12">
                                                                <input type="submit" class="btn btn-primary btn-block" value="Registrarse">
                                                            </div>
                                                        </div>
                                                    </form>
                                                    
                                                    <hr>
                                                    
                                                    <a href="/AgenciaViajes/adminLogin.jsp">
                                                        <button class="btn btn-primary btn-block">Ingresar como administrador</button>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>
        <!-- jQuery Easing -->
        <script src="js/jquery.easing.1.3.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Waypoints -->
        <script src="js/jquery.waypoints.min.js"></script>
        <!-- Carousel -->
        <script src="js/owl.carousel.min.js"></script>
        <!-- countTo -->
        <script src="js/jquery.countTo.js"></script>

        <!-- Stellar Parallax -->
        <script src="js/jquery.stellar.min.js"></script>

        <!-- Magnific Popup -->
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/magnific-popup-options.js"></script>

        <!-- Datepicker -->
        <script src="js/bootstrap-datepicker.min.js"></script>


        <!-- Main -->
        <script src="js/main.js"></script>
    </body>
</html>
