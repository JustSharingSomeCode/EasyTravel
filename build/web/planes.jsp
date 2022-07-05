<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" session="false"%>


<%@ page import="Modelo.PlanesTuristicos"%>
<%@ page import="ModeloDAO.PlanesTuristicosDAO"%>
<%@ page import="Modelo.ReservaPlan"%>
<%@ page import="ModeloDAO.ReservaPlanDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Easy Travel - Registro</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">        

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

            <div class="gtco-section">
                <div class="gtco-container">
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2 text-center gtco-heading">
                            <h2>Planes turisticos</h2>
                            <p>Acompaña tu viaje con los mejores planes turisticos de la zona</p>
                        </div>
                    </div>
                    <div class="row">

                        <%              
                            HttpSession sesion = request.getSession();
                            String user = (String) sesion.getAttribute("userId");  
                            
                            String dest = request.getParameter("dest");
                            
                            List<PlanesTuristicos> list = null;
                            PlanesTuristicosDAO dao = new PlanesTuristicosDAO();
                            
                            if(dest != null)
                            {
                                if(!dest.equals(""))
                                {
                                    list  = dao.listar(user, dest);
                                }
                                else
                                {
                                    list = dao.listar(user);
                                }
                            }
                            else
                            {
                                list = dao.listar(user);
                            }                                                       
                            
                            Iterator<PlanesTuristicos>iter = list.iterator();
                            PlanesTuristicos cd = null;
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
                                        <h2><%= cd.getNombre()%></h2>
                                        <p><%= cd.getDescripcion()%></p>                                    
                                        <p>Adultos: <%= cd.getPrecioAdulto()%></p>
                                        <p>Ninos: <%= cd.getPrecioNino()%></p>
                                    </div>
                                </a>
                                <div class="fh5co-text">
                                    <a href="confirmarPlan.jsp?id=<%= cd.getId()%>" class="btn btn-primary btn-block">Reservar plan</a>
                                </div>
                            </div>
                        </div>                            
                        <%}%>
                    </div>

                    <div class="row">
                        <a href="destination.jsp" class="btn btn-primary btn-block">Volver</a>
                    </div>

                    <div class="row">
                        <div class="col-md-8 col-md-offset-2 text-center gtco-heading">
                            <h2>Planes reservados</h2>
                            <p>Revisa los planes que has reservado hasta la fecha</p>
                        </div>
                    </div>
                    <div class="row">

                        <%                                                                      
                            ReservaPlanDAO dao2 = new ReservaPlanDAO();
                            
                            List<ReservaPlan> list2 = null;
                            
                            if(dest != null)
                            {
                                if(!dest.equals(""))
                                {
                                    list2  = dao2.listar(dest, user);
                                }
                                else
                                {
                                    list2 = dao2.listar(user);
                                }
                            }
                            else
                            {
                                list2 = dao2.listar(user);
                            } 
                                                        
                            Iterator<ReservaPlan>iter2 = list2.iterator();
                            ReservaPlan cd2 = null;
                            while(iter2.hasNext()){
                                cd2 = iter2.next();
                        %>    

                        <form action="ControladorReservaPlan" method="post">
                            <div class="col-md-12 fh5co-card-item">
                                <div class="col-md-12">
                                    <div class="col-md-12">
                                        <div style="margin-top: 25px;">
                                            <div class="fh5co-text">
                                                <h2><%= cd2.getNombre()%></h2>                                            
                                                <p><%= cd2.getDescripcion()%></p>
                                            </div>
                                        </div>
                                    </div>                                                                    

                                    <hr>

                                    <div class="col-md-12">
                                        <div class="col-md-6">
                                            <div style="margin-top: 25px;">                                            
                                                <div class="fh5co-text">
                                                    <h2>Adultos</h2>
                                                    <h3><%= cd2.getnAdultos()%></h3>                                            
                                                </div>                                          
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div style="margin-top: 25px;">                                            
                                                <div class="fh5co-text">
                                                    <h2>Niños</h2>
                                                    <h3><%= cd2.getnNinos()%></h3>                                            
                                                </div>                                          
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-md-12">
                                        <div class="col-md-12">
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
                                    <!--<a href="" class="btn btn-danger btn-block">Cancelar plan</a>-->
                                    <button type="submit" name="accion" value="Eliminar" class="btn btn-danger btn-block">Cancelar plan</button>
                                </div>


                            </div>  
                        </form>
                        <%}%>
                    </div>
                </div>
            </div>

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