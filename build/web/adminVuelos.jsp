<%-- 
    Document   : adminVuelos
    Created on : 16 mar. 2022, 12:08:29 p. m.
    Author     : Oscar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java"%>
<%@ page import="Modelo.Vuelo"%>
<%@ page import="ModeloDAO.VueloDAO"%>
<%@ page import="Modelo.Ciudad"%>
<%@ page import="ModeloDAO.CiudadDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
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
                            <h2>Gestion de vuelos</h2>                            
                        </div>
                    </div>
                    <div class="row">

                        <%
                           CiudadDAO dao1 = new CiudadDAO();
                           List<Ciudad> list1 = dao1.listar();                           
                           Iterator<Ciudad>iter1 = list1.iterator();
                           Iterator<Ciudad>iter2 = list1.iterator();
                           Ciudad cd1 = null;
                        %>

                        <div class="col-md-12 round-border">
                            <div class="form-wrap">
                                <div class="tab">
                                    <form action="ControladorVuelos" method="post">
                                        <div class="row form-group" style="padding: 5px">
                                            <div class="col-md-4">
                                                <label for="origen">Origen</label>                                                
                                                <select name="origen" class="form-control">
                                                    <%
                                                    while(iter1.hasNext()){
                                                        cd1 = iter1.next();                                                    
                                                    %>
                                                    <option value="<%= cd1.getId()%>"><%= cd1.getCiudad()%></option>
                                                    <%
                                                        }
                                                    %>                                                    
                                                </select>                                                
                                            </div> 
                                            <div class="col-md-4">
                                                <label for="destino">Destino</label>
                                                <select name="destino" class="form-control">
                                                    <%
                                                    while(iter2.hasNext()){
                                                        cd1 = iter2.next();
                                                    %>
                                                    <option value="<%= cd1.getId()%>"><%= cd1.getCiudad()%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>                                                
                                            </div> 
                                            <div class="col-md-4">
                                                <label for="precio">Precio</label>
                                                <input type="number" name="precio" class="form-control">
                                            </div>      
                                            <div class="col-md-4">
                                                <label for="fecha_s">Fecha de salida</label>
                                                <input type="date" name="fecha_s" class="form-control">
                                            </div>
                                            <div class="col-md-4">
                                                <label for="hora_s">Hora de salida</label>
                                                <input type="time" name="hora_s" class="form-control">
                                            </div>
                                            <div class="col-md-4">
                                                <label for="hora_l">Hora de llegada</label>
                                                <input type="time" name="hora_l" class="form-control">
                                            </div>
                                        </div>
                                        <div class="row form-group">     
                                            <div class="col-md-12">
                                                <input type="submit" name="accion" class="btn btn-primary btn-block" value="Agregar">
                                                <a href="adminMenu.jsp" class="btn btn-primary btn-block">Volver</a>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row" style="margin-top: 25px">
                        <%
                           VueloDAO dao = new VueloDAO();
                           List<Vuelo> list = dao.listar();
                           Iterator<Vuelo>iter = list.iterator();
                           Vuelo cd = null;
                           while(iter.hasNext()){
                               cd = iter.next();
                        %>


                        <form action="ControladorVuelos" method="post">
                            <div class="col-md-12 fh5co-card-item animate-box" style="padding-left: 0px;">                            
                                <div class="col-md-12">
                                    <div class="col-md-12">
                                        <div class="col-md-6">
                                            <div style="margin-top: 25px;">
                                                <div class="fh5co-text">
                                                    <h2>ID</h2>
                                                    <p><%= cd.getId()%></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div style="margin-top: 25px;">
                                                <div class="fh5co-text">
                                                    <h2>Precio</h2>
                                                    <p><%= cd.getPrecio()%></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div style="margin-top: 25px;">
                                                <div class="fh5co-text">
                                                    <h2>Origen</h2>
                                                    <p><%= cd.getCiudad_origen()%></p>
                                                </div>
                                            </div>
                                        </div>                                    
                                        <div class="col-md-6">
                                            <div style="margin-top: 25px;">
                                                <div class="fh5co-text">
                                                    <h2>Destino</h2>
                                                    <p><%= cd.getCiudad_destino()%></p>
                                                </div>
                                            </div>
                                        </div>
                                                <div class="col-md-4">
                                            <div style="margin-top: 25px;">
                                                <div class="fh5co-text">
                                                    <h2>Fecha salida</h2>
                                                    <p><%= cd.getFecha_salida()%></p>
                                                </div>
                                            </div>
                                        </div>
                                                <div class="col-md-4">
                                            <div style="margin-top: 25px;">
                                                <div class="fh5co-text">
                                                    <h2>Hora salida</h2>
                                                    <p><%= cd.getHora_salida()%></p>
                                                </div>
                                            </div>
                                        </div>
                                                <div class="col-md-4">
                                            <div style="margin-top: 25px;">
                                                <div class="fh5co-text">
                                                    <h2>Hora llegada</h2>
                                                    <p><%= cd.getHora_llegada()%></p>
                                                </div>
                                            </div>
                                        </div>

                                    </div>                                

                                    <input type="hidden" name="id" value="<%= cd.getId()%>">

                                    <div class="col-md-12">
                                        <button type="submit" name="accion" value="Eliminar" class="btn btn-danger btn-block">Eliminar</button>                                     
                                    </div>
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
