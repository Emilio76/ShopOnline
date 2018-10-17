<%@page import="it.overnet.model.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registrazione</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js">
</script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js">
</script>
<script type="text/javascript" src="js/gestioneForm.js"></script>
</head>
<body>
<% Utente utente = (Utente) session.getAttribute("utenteLoggato"); %>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/ShopOnline">Ciao Store</a>
    </div>
    <ul class="nav navbar-nav" style="width: 93%">
      
      <% if (utente == null) { %>
      <li><a href="registrazione.jsp">Registrazione</a></li>
      <li><a href="login.jsp">Login</a></li>
      <% } else { %>
            <li><a href="logout">Logout</a></li>
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
      <%if (utente !=null) { %>
      <li style="float:right" ><a>
      <%= utente.getUsername() %></a></li>
      <% } %>
      
      
    </ul>
  </div>
</nav>
<!--  chiusura navbar -->
<!-- interazione -->
<div class="jumbotron text-center">
<h1>Ciao Store</h1>
</div>

<!--  form registrazione -->
<form action="registrazione" method="post" class="form-horizontal" onsubmit="return validazioneRegistrazione()">
<div class="form-group">
<label for="nome" class="control-label col-md-4">Nome</label>
<div class="col-md-5">
<input type="text" name="nome" id="nome" class="form-control">
</div>
<span class="col-md-3"></span>
</div>

<div class="form-group">
<label for="cognome" class="control-label col-md-4">Cognome</label>
<div class="col-md-5">
<input type="text" name="cognome" id="cognome" class="form-control">
</div>
<span class="col-md-3"></span>
</div>

<div class="form-group">
<label for="indirizzo" class="control-label col-md-4">Indirizzo</label>
<div class="col-md-5">
<input type="text" name="indirizzo" id="indirizzo" class="form-control">
</div>
<span class="col-md-3"></span>
</div>

<div class="form-group">
<label for="username" class="control-label col-md-4">Username</label>
<div class="col-md-5">
<input type="text" name="username" id="username" class="form-control">
</div>
<span class="col-md-3"></span>
</div>

<div class="form-group">
<label for="password" class="control-label col-md-4">Password</label>
<div class="col-md-5">
<input type="password" name="password" id="password" class="form-control">
</div>
<span class="col-md-3"></span>
</div>

<div class="form-group">
<span class="col-md-4"></span>
<div class="col-md-5">
<input type="submit" value="Registrati" class="btn btn-success">
<input type="reset" value="Ripristina" class="btn btn-warning">
</div>
<span class="col-md-3"></span>
</div>	
</form>




<div class="alert alert-danger" id="alert" style="display: none">
<p class="text-center">Non hai rispettato i campi del Form</p>
</div>
<% if(request.getAttribute("inserito") != null ) { %>
<div class="alert alert-success">
<p class="text-center">Registrazione avvenuta con sulcesso</p>
</div>
<% } %>
</body>
</html>