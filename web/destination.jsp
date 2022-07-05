<!DOCTYPE HTML>
<!--
        Traveler by freehtml5.co
        Twitter: http://twitter.com/fh5co
        URL: http://freehtml5.co
-->
<%@ page language="java" session="false"%>
<%@ page import="Modelo.Ciudad"%>
<%@ page import="ModeloDAO.CiudadDAO"%>
<%@ page import="Modelo.ReservaVuelo"%>
<%@ page import="ModeloDAO.ReservaVueloDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%> 
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Easy Travel - Vuelos</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Free HTML5 Website Template by FreeHTML5.co" />
        <meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
        <meta name="author" content="FreeHTML5.co" />

        <!-- Facebook and Twitter integration -->
        <meta property="og:title" content=""/>
        <meta property="og:image" content=""/>
        <meta property="og:url" content=""/>
        <meta property="og:site_name" content=""/>
        <meta property="og:description" content=""/>
        <meta name="twitter:title" content="" />
        <meta name="twitter:image" content="" />
        <meta name="twitter:url" content="" />
        <meta name="twitter:card" content="" />

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

        <div class="gtco-loader"></div>

        <div id="page">

            <div class="c_header">

                <h1 style="margin: 20px">
                    <a href="index.jsp" style="color: black">
                        <span style="color: #09C6AB">E</span>asy <span style="color: #09C6AB">T</span>ravel
                    </a>
                </h1>      
                <hr>

            </div>            
            <!-- <div class="page-inner"> 
            <nav class="gtco-nav" role="navigation">
                    <div class="gtco-container">
                            
                            <div class="row">
                                <div class="col-sm-4 col-xs-12" style="background-color: black">
                                            <div id="gtco-logo"><a href="index.jsp">Traveler <em>.</em></a></div>
                                    </div>
                                
                                    <div class="col-xs-8 text-right menu-1">
                                            <ul>
                                                    <li class="active"><a href="destination.html">Destination</a></li>
                                                    <li class="has-dropdown">
                                                            <a href="#">Travel</a>
                                                            <ul class="dropdown">
                                                                    <li><a href="#">Europe</a></li>
                                                                    <li><a href="#">Asia</a></li>
                                                                    <li><a href="#">America</a></li>
                                                                    <li><a href="#">Canada</a></li>
                                                            </ul>
                                                    </li>
                                                    <li><a href="pricing.html">Pricing</a></li>
                                                    <li><a href="contact.html">Contact</a></li>
                                            </ul>	
                                    </div>
                                
                            </div>
                            
                    </div>
            </nav>
            -->

            <!-- comment 
            <header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner" style="background-image: url(images/img_6.jpg)">
                    <div class="overlay"></div>
                    <div class="gtco-container">
                            <div class="row">
                                    <div class="col-md-12 col-md-offset-0 text-center">
                                            <div class="row row-mt-15em">
    
                                                    <div class="col-md-12 mt-text animate-box" data-animate-effect="fadeInUp">
                                                            <h1>Destination</h1>	
                                                    </div>
                                                    
                                            </div>
                                            
                                    </div>
                            </div>
                    </div>
            </header>
            -->

            <div class="gtco-section">
                <div class="gtco-container">
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2 text-center gtco-heading">
                            <h2>Ciudades mas visitadas</h2>
                            <p>Conoce los lugares mas visitados del mundo</p>
                        </div>
                    </div>
                    <div class="row">

                        <!--
                        <form action="agendar.jsp">
                            <div class="col-lg-4 col-md-4 col-sm-6">
                                <div class="fh5co-card-item fh5co-text">

                                    <a href="https://estaticos.muyinteresante.es/uploads/images/test/60b4a8d15cafe819e843397a/empire-state-redes.jpg" class="image-popup">
                                        <figure>
                                            <div class="overlay"><i class="ti-plus"></i></div>
                                            <img style="min-width: 100%; min-height: 100%" src="https://estaticos.muyinteresante.es/uploads/images/test/60b4a8d15cafe819e843397a/empire-state-redes.jpg" alt="Image" class="img-responsive">
                                        </figure>
                                        <div class="fh5co-text">
                                            <h2>New York, USA</h2>
                                            <p>Far far away, behind the word mountains, far from the countries Vokalia..</p>                                    
                                        </div>
                                    </a>
                                    <div class="fh5co-text">
                                        <input type="submit" class="btn btn-primary" value="Agendar un viaje">
                                    </div>
                                </div>
                            </div>
                        </form>
                        
                        <form action="agendar.jsp">
                            <div class="col-lg-4 col-md-4 col-sm-6">
                                <div class="fh5co-card-item fh5co-text">

                                    <a href="https://www.kayak.com.co/rimg/himg/8d/79/64/revato-1383973-12136887-729771.jpg?width=1366&height=768&crop=true" class="image-popup">
                                        <figure>
                                            <div class="overlay"><i class="ti-plus"></i></div>
                                            <img style="min-width: 100%; min-height: 100%" src="https://www.kayak.com.co/rimg/himg/8d/79/64/revato-1383973-12136887-729771.jpg?width=1366&height=768&crop=true" alt="Image" class="img-responsive">
                                        </figure>
                                        <div class="fh5co-text">
                                            <h2>New York, USA</h2>
                                            <p>Far far away, behind the word mountains, far from the countries Vokalia..</p>                                    
                                        </div>
                                    </a>
                                    <div class="fh5co-text">
                                        <input type="submit" class="btn btn-primary" value="Agendar un viaje">
                                    </div>
                                </div>
                            </div>
                        </form>
                        
                        <form action="agendar.jsp">
                            <div class="col-lg-4 col-md-4 col-sm-6">
                                <div class="fh5co-card-item fh5co-text">

                                    <a href="https://www.caracteristicas.co/wp-content/uploads/2018/08/japon-e1573443544393-800x400.jpg" class="image-popup">
                                        <figure>
                                            <div class="overlay"><i class="ti-plus"></i></div>
                                            <img style="min-width: 100%; min-height: 100%" src="https://www.caracteristicas.co/wp-content/uploads/2018/08/japon-e1573443544393-800x400.jpg" alt="Image" class="img-responsive">
                                        </figure>
                                        <div class="fh5co-text">
                                            <h2>New York, USA</h2>
                                            <p>Far far away, behind the word mountains, far from the countries Vokalia..</p>                                    
                                        </div>
                                    </a>
                                    <div class="fh5co-text">
                                        <input type="submit" class="btn btn-primary" value="Agendar un viaje">
                                    </div>
                                </div>
                            </div>
                        </form>
                        -->
                        <%                                                         
                            CiudadDAO dao = new CiudadDAO();
                            List<Ciudad> list = dao.listar();
                            Iterator<Ciudad>iter = list.iterator();
                            Ciudad cd = null;
                            while(iter.hasNext()){
                                cd = iter.next();
                        %>                            
                        <div class="col-lg-4 col-md-4 col-sm-6">
                            <div class="fh5co-card-item fh5co-text">

                                <a href="<%= cd.getImagenURL()%>" class="image-popup">
                                    <figure>
                                        <div class="overlay"><i class="ti-plus"></i></div>
                                        <img style="min-width: 100%; min-height: 100%" src="<%= cd.getImagenURL()%>" alt="Image" class="img-responsive">
                                    </figure>
                                    <div class="fh5co-text">
                                        <h2><%= cd.getCiudad() + ", " + cd.getPais()%></h2>
                                        <p><%= cd.getDescripcion()%></p>                                    
                                    </div>
                                </a>
                                <div class="fh5co-text">
                                    <a href="agendar.jsp" class="btn btn-primary">Buscar viajes</a>                                        
                                </div>
                            </div>
                        </div>                            
                        <%}%>                                                                       
                    </div>
                    
                    <hr>
                    <a href="planes.jsp" class="btn btn-primary btn-block">Buscar planes turisticos</a>
                    
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2 text-center gtco-heading">
                            <h2>Vuelos reservados</h2>
                            <p>Revisa los vuelos que has reservado hasta la fecha</p>
                        </div>
                        <%        
                            HttpSession sesion = request.getSession();
                            String user = (String) sesion.getAttribute("userId");                            
                            
                            ReservaVueloDAO dao2 = new ReservaVueloDAO();
                            List<ReservaVuelo> list2 = dao2.listar(user);
                            Iterator<ReservaVuelo>iter2 = list2.iterator();
                            ReservaVuelo cd2 = null;
                            while(iter2.hasNext()){
                                cd2 = iter2.next();
                        %>

                        <form action="ControladorReservasVuelo" method="post">
                            <div class="col-md-12 fh5co-card-item">

                                <div class="col-md-12">
                                    <div class="col-md-6">
                                        <div style="margin-top: 25px;">
                                            <div class="fh5co-text">
                                                <h2>Ciudad Origen</h2>
                                                <h3><%= cd2.getOrigen()%></h3>
                                                <p><%= cd2.getHora_salida()%></p>
                                            </div>
                                        </div>
                                    </div>                                    
                                    <div class="col-md-6">
                                        <div style="margin-top: 25px;">
                                            <div class="fh5co-text">
                                                <h2>Ciudad Destino</h2>
                                                <h3><%= cd2.getDestino()%></h3>
                                                <p><%= cd2.getHora_llegada()%></p>
                                            </div>
                                        </div>
                                    </div>

                                    <hr>

                                    <div class="col-md-12">
                                        <div class="col-md-6">
                                            <div style="margin-top: 25px;">                                            
                                                <div class="fh5co-text">
                                                    <h2>Pasajeros</h2>
                                                    <h3><%= cd2.getnPasajeros()%></h3>                                            
                                                </div>                                          
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div style="margin-top: 30px;">
                                                <div class="fh5co-text">                                               
                                                    <h2>Total</h2>
                                                    <h3><%= cd2.getTotal()%></h3>                                              
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>                                  

                                <input type="hidden" name="id" value="<%= cd2.getId()%>">

                                <div class="col-md-12" style="margin-top: 25px; margin-bottom: 20px">
                                    <a href="planes.jsp?dest=<%= cd2.getIdDestino()%>" class="btn btn-primary btn-block">Buscar planes turisticos</a>
                                    <button type="submit" name="accion" value="Eliminar" class="btn btn-danger btn-block">Cancelar vuelo</button>
                                </div>
                            </div>
                        </form>
                        <%}%>                                                
                    </div>
                </div>


                <!-- comment 
                <div id="gtco-subscribe">
                        <div class="gtco-container">
                                <div class="row animate-box">
                                        <div class="col-md-8 col-md-offset-2 text-center gtco-heading">
                                                <h2>Subscribe</h2>
                                                <p>Be the first to know about the new templates.</p>
                                        </div>
                                </div>
                                <div class="row animate-box">
                                        <div class="col-md-8 col-md-offset-2">
                                                <form class="form-inline">
                                                        <div class="col-md-6 col-sm-6">
                                                                <div class="form-group">
                                                                        <label for="email" class="sr-only">Email</label>
                                                                        <input type="email" class="form-control" id="email" placeholder="Your Email">
                                                                </div>
                                                        </div>
                                                        <div class="col-md-6 col-sm-6">
                                                                <button type="submit" class="btn btn-default btn-block">Subscribe</button>
                                                        </div>
                                                </form>
                                        </div>
                                </div>
                        </div>
                </div>
                -->
                <footer id="gtco-footer" role="contentinfo">
                    <div class="gtco-container">
                        <div class="row row-p	b-md">

                            <div class="col-md-4">
                                <div class="gtco-widget">
                                    <h3>Sobre nosotros</h3>
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore eos molestias quod sint ipsum possimus temporibus officia iste perspiciatis consectetur in fugiat repudiandae cum. Totam cupiditate nostrum ut neque ab?</p>
                                </div>
                            </div>

                            <div class="col-md-3 col-md-push-1">
                                <div class="gtco-widget">
                                    <h3>Contactanos</h3>
                                    <ul class="gtco-quick-contact">
                                        <li><a href="#"><i class="icon-phone"></i> +1 234 567 890</a></li>
                                        <li><a href="#"><i class="icon-mail2"></i> info@freehtml5.co</a></li>
                                        <li><a href="#"><i class="icon-chat"></i> Live Chat</a></li>
                                    </ul>
                                </div>
                            </div>

                        </div>

                        <div class="row copyright">
                            <div class="col-md-12">
                                <p class="pull-left">
                                    <small class="block">&copy; 2016 Free HTML5. All Rights Reserved.</small> 
                                    <small class="block">Designed by <a href="https://freehtml5.co/" target="_blank">FreeHTML5.co</a> Demo Images: <a href="http://unsplash.com/" target="_blank">Unsplash</a></small>
                                </p>
                                <p class="pull-right">
                                <ul class="gtco-social-icons pull-right">
                                    <li><a href="#"><i class="icon-twitter"></i></a></li>
                                    <li><a href="#"><i class="icon-facebook"></i></a></li>
                                    <li><a href="#"><i class="icon-linkedin"></i></a></li>
                                    <li><a href="#"><i class="icon-dribbble"></i></a></li>
                                </ul>
                                </p>
                            </div>
                        </div>

                    </div>
                </footer>


            </div>

            <div class="gototop js-top">
                <a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
            </div>

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