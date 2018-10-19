<%@page import="it.overnet.model.Utente"%>
<%@page import="it.overnet.model.Prodotto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CARRELLO</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/stile.css">
</head>
<body>
<%
  Utente utente = (Utente) session.getAttribute("utenteLoggato"); %>


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
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> <%if (utente !=null) { %>      
      <%= utente.getUsername() %>
      <% } else { %>
      Sign Up
      <% } %></a></li>
      <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
      
    </ul>
  </div>
</nav>
<h1>IL TUO CARRELLO</h1>



<% List<Prodotto> carrello = (List<Prodotto>) 
request.getSession().getAttribute("carrello");%>


<div class="jumbotron text-center">
<h1>Lista Carrello</h1>
</div>
<div class="container">
<table class="table table-hover">
<thead>
<th>Nome</th>
<th>Categoria</th>
<th>Marca</th>
<th>Prezzo

</span></a></th>
</thead>
<tbody>
<% for (Prodotto prodotto : carrello) { %>
<tr>
<td><%=prodotto.getNome() %></td>
<td><%=prodotto.getCategoria() %></td>
<td><%=prodotto.getMarca() %></td>
<td><%=prodotto.getPrezzo() %></td>


<div>


<td><img src ="<%=prodotto.getImmagine() %>" width="60%"></td>

</div>

<td> <form action="/action_page.php">
  <select name="quantita">
    <option value="1"selected>1</option>
    <option value="2">2</option>
    <option value="3">3</option>
     <option value="4">4</option>
      <option value="5">5</option>
      <option value="6">6</option>
      <option value="7">7</option>
      <option value="8">8</option>
      <option value="9">9</option>
      <option value="10">10</option>
      </select>
  </form>
  <input type="submit" class="button" value="elimina">
</tr>
<%} %>
<td> <form action="/action_page.php">
  <select name="spedizione">
    <option value="ieri">IERI</option>
    <option value="oggi">OGGI</option>
    <option value="domani" selected>DOMANI</option>
  </select>
  <br><br>
  <input type="submit">
  </form>
</body>
</html>