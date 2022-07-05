<%-- 
    Document   : agendar
    Created on : 17 feb. 2022, 2:24:25 p. m.
    Author     : Oscar
--%>

<%@ page language="java"%>
<%@ page import="Modelo.Vuelo"%>
<%@ page import="ModeloDAO.VueloDAO"%>
<%@ page import="Modelo.Ciudad"%>
<%@ page import="ModeloDAO.CiudadDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Easy Travel - Login</title>
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

        <div class="page">
            <div class="c_header">

                <h1 style="margin: 20px">
                    <a href="index.jsp" style="color: black">
                        <span style="color: #09C6AB">E</span>asy <span style="color: #09C6AB">T</span>ravel
                    </a>
                </h1>      
                <hr>
            </div>  

            <%
                           CiudadDAO dao1 = new CiudadDAO();
                           List<Ciudad> list1 = dao1.listar();                           
                           Iterator<Ciudad>iter1 = list1.iterator();
                           Iterator<Ciudad>iter2 = list1.iterator();
                           Ciudad cd1 = null;
            %>

            <div class="gtco-section">
                <div class="gtco-container">
                    <div class="row">
                        <div class="col-md-12 round-border">
                            <div class="form-wrap">
                                <div class="tab">
                                    <form>
                                        <div class="row form-group" style="padding: 5px">
                                            <div class="col-md-4">
                                                <label for="origen">Origen</label>
                                                <select name="origen" class="form-control">
                                                    <option value="">Seleccione una opcion</option>
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
                                                    <option value="">Seleccione una opcion</option>
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
                                                <label for="fecha">Fecha salida</label>
                                                <input type="date" name="fecha" class="form-control">
                                            </div>                                           
                                        </div>
                                        <div class="row form-group">     
                                            <div class="col-md-12">
                                                <input type="submit" id="fullname" class="btn btn-primary btn-block" value="Buscar">
                                                <a href="destination.jsp" class="btn btn-primary btn-block">Volver</a>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>   
                    </div>

                    <hr>

                    <div class="row" style="margin-top: 20px">


                        <%
                           VueloDAO dao = new VueloDAO();
                           
                           String orig = request.getParameter("origen");
                           String dest = request.getParameter("destino");
                           String fecha = request.getParameter("fecha");
                           
                           List<Vuelo> list = null;
                           
                           if(orig != null && dest != null && fecha != null)
                           {
                                if(!orig.equals("") && !dest.equals("") && !fecha.equals(""))
                                {
                                list = dao.listarPorCiudadFecha(orig, dest, fecha);
                                }
                                else if (!orig.equals("") && !dest.equals(""))
                                {
                                list = dao.listarPorCiudad(orig, dest);
                                }
                                else
                                {
                                list= dao.listar();
                                }
                           }                           
                            else
                            {
                                list= dao.listar();
                            }
                           
                           
                           Iterator<Vuelo>iter = list.iterator();
                           Vuelo cd = null;
                           while(iter.hasNext()){
                               cd = iter.next();
                        %>


                        <div class="col-md-12 fh5co-card-item animate-box" style="padding-left: 0px;">
                            <div class="col-md-4" style="padding: 0; height: 100%;">
                                <figure style="margin: 0px; width: 100%; height: 100%">
                                    <img style="min-width: 100%; min-height: 100% " src="<%= cd.getImagenURL()%>" alt="Image" class="img-responsive">
                                </figure>
                            </div>
                            <div class="col-md-8">
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <div style="margin-top: 25px;">
                                            <div class="fh5co-text">
                                                <h2><%= cd.getCiudad_origen()%></h2>
                                                <p><%= cd.getHora_salida()%></p>
                                            </div>
                                        </div>
                                    </div>   
                                    <div class="col-md-4">
                                        <div style="margin-top: 25px;">
                                            <div class="fh5co-text">                                                
                                                <p><%= cd.getFecha_salida()%></p>
                                            </div>
                                        </div>
                                    </div> 
                                    <div class="col-md-4">
                                        <div style="margin-top: 25px;">
                                            <div class="fh5co-text">
                                                <h2><%= cd.getCiudad_destino()%></h2>
                                                <p><%= cd.getHora_llegada()%></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>                                

                                <div class="col-md-12">
                                    <a href="confirmarAgendar.jsp?id=<%= cd.getId()%>" class="btn btn-primary btn-block">Seleccionar</a>                                        
                                </div>
                            </div>
                        </div> 


                        <%}%>

                    </div>
                </div>                
            </div>
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
