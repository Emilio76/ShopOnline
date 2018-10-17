<%@page import="it.overnet.model.Prodotto"%>
<%@page import="java.util.List"%>
<%@page import="it.overnet.model.Utente"%>
<%@page import="it.overnet.model.Categoria"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista Prodotti</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/stile.css">
<script type="text/javascript" src="js/popover.js"></script>
</head>
<body>
<%
  Utente utente = (Utente) session.getAttribute("utenteLoggato"); %>
<% List<Prodotto> listaProdotti = (List<Prodotto>) 
request.getAttribute("listaProdotti");%>



<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/ShopOnline">SHOP ONLINE</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="/ShopOnline">Home</a></li>
      <% if (utente == null) { %>
        <li><a href="registrazione.jsp">Registrazione</a></li>
      <li><a href="login.jsp">Login</a></li>
      <% }else{ %>
      <li><a href="Logout">Logout</a></li>
      <li><a href="ProdottiAcquistati">Prodotti Acquistati</a></li>
      <%} %>
      <li><a href="listaProdotti">ListaProdotti</a></li>
      <!-- MENU A TENDINA -->
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="">
        Categorie
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="listaGenere?Categoria=MONITOR">MONITOR</a></li>
          <li><a href="listaGenere?Categoria=TELEFONIA>">TELEFONIA</a></li>
          <li><a href="listaGenere?Categoria=STAMPANTE">STAMPANTE</a></li>
          <li><a href="listaGenere?Categoria=FOTOGRAFIA">FOTOGRAFIA</a></li>
        </ul>
      </li>
    </ul>
  </div>
</nav>

<div class="jumbotron text-center">
<h1>Lista Prodotti</h1>
</div>
<div class="container">
<table class="table table-hover">
<thead>
<th>Nome</th>
<th>Prezzo 
<a href="ordina?sort=prezzo">
<span class="glyphicon glyphicon-sort-by-alphabet">
</span></a></th>
<th>Categoria</th>
<th>Quantita 
<a href="ordina?sort=quantita">
<span class="glyphicon glyphicon-sort-by-order">
</span></a></th>
<th>Acquista</th>
</thead>
<tbody>
<% for (Prodotto prodotto : listaProdotti) { %>
<tr>
<td><%=prodotto.getNome() %></td>
<td><%=prodotto.getCategoria() %></td>
<td><%=prodotto.getMarca() %></td>
<td><%=prodotto.getPrezzo() %></td>
<td><%=prodotto.isOfferta() %></td>
<td><%=prodotto.getSconto() %></td>
<td><%=prodotto.getQuantitaDisponibile() %></td>

<td>
<form action="acquisto" method="get">
<input type="hidden" name="idProdotto" value="<%=prodotto.getIdProdotto()%>">
<input type="submit" value ="Acquista" 
<%if (utente == null || prodotto.getQuantitaDisponibile() < 1){ %>
class="btn btn-primary" onclick="return false"

<% } else {%>
class="btn btn-primary"
<%} %>
<%if (utente == null){ %>
data-toggle="popover" title="Effettua<br>la<br> Login"

<% } %>
<%if (prodotto.getQuantitaDisponibile() < 1 && utente != null){ %>
data-toggle="popover" title="attualmente non disponibile"
<% } %>
>
</form>
</td>
</tr>
<%} %>
</tbody>

</table>
</div>
</body>
</html>


