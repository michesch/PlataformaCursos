<%@ page import="java.sql.*" %>
<%@ page import="org.postgresql.Driver" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Cursos Design</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    <!-- CSS here -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/slick.css">
    <link rel="stylesheet" href="assets/css/nice-select.css">
    <link rel="stylesheet" href="assets/css/style.css">
    
</head>

<body>
    <header>
   <!-- Header Start -->
        <div class="header-area"  style="background-color: #4255A4">
            <div class="main-header ">
                <div class="header-bottom  header-sticky">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <!-- Logo -->
                            <div class="col-xl-2 col-lg-2">
                                <div class="logo">
                                    <a href="index.html"><img src="assets/img/logo/logo.png" alt=""></a>
                                </div>
                            </div>
                            <div class="col-xl-10 col-lg-10">
                                <div class="menu-wrapper d-flex align-items-center justify-content-end">
                                    <!-- Main-menu -->
                                    <div class="main-menu d-none d-lg-block">
                                        <nav>
                                            <ul id="navigation">                                                                                          
                                                <li class="active" ><a href="index.html">Home</a></li>
                                                <li><a href="#cursos">Cursos</a></li>
                                                <li><a href="#workshops">Workshops</a></li>
                                                <li><a href="#">Sobre</a></li>                                            
                                                <li><a href="#">Contato</a></li>
                                                <!-- Button -->
                                                <li class="button-header margin-left "><a href="admin/register.jsp" class="btn">Registrar</a></li>
                                                <li class="button-header"><a href="admin/index.jsp" class="btn btn3">Login</a></li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div> 
                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->
    </header>
    <main>
        <!-- Courses area start -->
        <div class="courses-area section-padding40 fix" id="cursos">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-7 col-lg-8">
                        <div class="section-tittle text-center mb-45">
                            <h2>Nossos Cursos</h2>
                        </div>
                    </div>
                </div>
                <div class="courses-actives">
                   
                    <%
                    Connection con = null;
                    Statement st = null;
                    ResultSet rs = null;
                    String url = "jdbc:postgresql://localhost:5432/plataforma";
                    String usuario = "postgres";
                    String senhaBD = "admin";
                    try{
                        Class.forName("org.postgresql.Driver");
                        con = DriverManager.getConnection(url,usuario,senhaBD);
                        st = con.createStatement();
                        rs = st.executeQuery("SELECT *FROM curso ORDER BY id DESC");
                        while(rs.next()){
                            String id = rs.getString("id");
                    %>    
                    <!-- Single -->
                    
                    <div class="properties pb-20">
                        <div class="properties__card">
                            <div class="properties__img overlay1">
                                <img style="width:100%;height:200px;object-fit:cover;" src="arquivos/<%=rs.getString("imagem") %>" class="card-img-top" alt="...">
                            </div>
                            <div class="properties__caption">
                                <h3><%=rs.getString("name") %></h3>
                                <p><%=rs.getString("descr") %></p>
                                <div class="properties__footer d-flex justify-content-between align-items-center">                                    
                                    <div class="price">
                                        <p style="color:red;font-size:20px;text-align:center;">R$<%=rs.getString("valor")%></p>
                                    </div>
                                </div>
                                <button class="btn btn-warning" style="width:100%;">Comprar</button>
                            </div>

                        </div>
                    </div>
                    <!-- Single -->
                    <%    }
                    }catch(Exception e){
                        out.print(e);
                    }

                    %>
                    
                </div>
            </div>
        </div>
        </main>
        <!-- Courses area End -->
        <!-- Workshops area start -->
        <div class="courses-area section-padding40 fix" id="workshops">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-7 col-lg-8">
                        <div class="section-tittle text-center mb-45">
                            <h2>Nossos Workshops</h2>
                        </div>
                    </div>
                </div>
                <div class="courses-actives">
                   
                    <%
                    try{
                        Class.forName("org.postgresql.Driver");
                        con = DriverManager.getConnection(url,usuario,senhaBD);
                        st = con.createStatement();
                        rs = st.executeQuery("SELECT *FROM workshop ORDER BY id DESC");
                        while(rs.next()){
                            String id = rs.getString("id");
                    %>    
                    <!-- Single -->
                    
                    <div class="properties pb-20">
                        <div class="properties__card">
                            <div class="properties__img overlay1">
                                <img style="width:100%;height:200px;object-fit:cover;" src="arquivos/<%=rs.getString("imagem") %>" class="card-img-top" alt="...">
                            </div>
                            <div class="properties__caption">
                                <h3><%=rs.getString("name") %></h3>
                                <p><%=rs.getString("descr") %></p>
                                <div class="properties__footer d-flex justify-content-between align-items-center">                                    
                                    <div class="price">
                                        <p style="color:red;font-size:20px;text-align:center;">R$<%=rs.getString("valor")%></p>
                                    </div>
                                </div>
                                <button class="btn btn-warning" style="width:100%;">Comprar</button>
                            </div>

                        </div>
                    </div>
                    <!-- Single -->
                    <%    }
                    }catch(Exception e){
                        out.print(e);
                    }

                    %>
                    
                </div>
            </div>
        </div>
        </main>
        <!-- Workshops area End -->
    <footer>
     <div class="footer-wrappper" style="background-color: #4255A4" >
        <!-- footer-bottom area -->
        <div class="footer-bottom-area">
            <div class="container">
                <div class="footer-border">
                    <div class="row d-flex align-items-center">
                        <div class="col-xl-12 ">
                            <div class="footer-copy-right text-center">
                                <p>
                                  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved 
                                  </p>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
          <!-- Footer End-->
      </div>
  </footer> 

<!-- JS here -->
<script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
<!-- Jquery, Popper, Bootstrap -->
<script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
<script src="./assets/js/popper.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>
<!-- Jquery Mobile Menu -->
<script src="./assets/js/jquery.slicknav.min.js"></script>

<!-- Jquery Slick , Owl-Carousel Plugins -->
<script src="./assets/js/owl.carousel.min.js"></script>
<script src="./assets/js/slick.min.js"></script>


<!-- Nice-select, sticky -->
<script src="./assets/js/jquery.nice-select.min.js"></script>
<script src="./assets/js/jquery.sticky.js"></script>


<!-- counter , waypoint,Hover Direction -->
<script src="./assets/js/jquery.counterup.min.js"></script>
<script src="./assets/js/waypoints.min.js"></script>
<script src="./assets/js/jquery.countdown.min.js"></script>
<script src="./assets/js/hover-direction-snake.min.js"></script>

<!-- contact js -->
<script src="./assets/js/contact.js"></script>
<script src="./assets/js/jquery.form.js"></script>
<script src="./assets/js/jquery.validate.min.js"></script>
<script src="./assets/js/mail-script.js"></script>
<script src="./assets/js/jquery.ajaxchimp.min.js"></script>

<!-- Jquery Plugins, main Jquery -->	
<script src="./assets/js/plugins.js"></script>
<script src="./assets/js/main.js"></script>

</body>
</html>