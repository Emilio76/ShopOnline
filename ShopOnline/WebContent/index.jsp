<%@page import="it.overnet.model.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js">
</script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js">
</script>
<link rel="stylesheet" href="css/stile.css">
</head>
<body>
<!--  -->
<% Utente utente = (Utente) session.getAttribute("utenteLoggato"); %>





<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/ShopOnline">Ciao Store</a>
    </div>
    <ul class="nav navbar-nav" style="width: 93%">
      
      <% if (utente == null) { %>
      <li><a href="registrazione.jsp">Registrazione</a></li>      
      <% } else { %>
            
            <li><a href="prodottiAcquistati">Prodotti Acquistati</a></li>
      <% } %>      
      <li><a href="listaProdotti">Lista Prodotti</a></li>
      
      
      <!--  menu a tendina -->
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="">Categorie
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="listaCategorie?categoria=FOTOGRAFIA">Fotografia</a></li>
          <li><a href="listaCategorie?categoria=MONITOR">Monitor</a></li>
          <li><a href="listaCategorie?categoria=STAMPANTE">Stampanti</a></li>
          <li><a href="listaCategorie?categoria=TELEFONIA">Telefonia</a></li>          
        </ul>
      </li> <!--  chiusura dropdown -->
      
      <ul class="nav navbar-nav navbar-right">
      <li><a href="registrazione.jsp"><span class="glyphicon glyphicon-user"></span> <%if (utente !=null) { %>      
      <%= utente.getUsername() %>
      <% } else { %>
      Sign Up
      <% } %></a></li>
      <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
      
    </ul>
  </div>
</nav>
<!--  chiusura navbar -->
<!-- interazione -->
<div class="jumbotron text-center">
<h1>Ciao Store</h1>
</div>


<!-- carousel -->
<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="3000">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- immagini -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="img/fotografia_fiji.jpg" class="img-carousel">
    </div>

    <div class="item">
      <img src="img/monitor_asus.png" class="img-carousel">
    </div>

    <div class="item">
      <img src="img/telefonia_apple.jpg" class="img-carousel" >
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    
  </a>
</div>

</div>






</body>
</html>