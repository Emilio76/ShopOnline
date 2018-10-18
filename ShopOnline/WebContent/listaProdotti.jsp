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
<script type="text/javascript" src="js/zoom.js"></script>
</head>
<body>
<% Utente utente = (Utente) session.getAttribute("utenteLoggato"); %>
<% List<Prodotto> listaProdotti = (List<Prodotto>) 
request.getAttribute("listaProdotti");%>

 <div class="modal fade" id="enlargeImageModal" tabindex="-1" role="dialog" aria-labelledby="enlargeImageModal" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
        </div>
        <div class="modal-body">
          <img src="" class="enlargeImageModalSource" style="width: 100%;">
        </div>
      </div>
    </div>
</div>

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

<div class="jumbotron text-center">
<h1>Lista Prodotti</h1>
</div>
<div class="container">
<table class="table table-hover">
<thead>
<th>Nome</th>
<th>Categoria</th>
<th>Marca</th>
<th>Prezzo
<a href="ordina?sort=prezzo">
<span class="glyphicon glyphicon-sort-by-alphabet">
</span></a></th>
<th>Quantita
<a href="ordina?sort=quantita">
<span class="glyphicon glyphicon-sort-by-order">
</span></a></th>
<th></th>
<th>Acquista</th>
</thead>
<tbody>
<% for (Prodotto prodotto : listaProdotti) { %>
<tr>
<td><%=prodotto.getNome() %></td>
<td><%=prodotto.getCategoria() %></td>
<td><%=prodotto.getMarca() %></td>
<td><%=prodotto.getPrezzo() %></td>

<td><%=prodotto.getQuantitaDisponibile() %></td>
<div>



<td><img src ="<%=prodotto.getImmagine() %>" width="60%"></td>




</div>
<td>
<form action="carrello" method="get">
<input type="hidden" name="idProdotto" value="<%=prodotto.getIdProdotto()%>">
<button type="button" class="btn btn-default btn-sm">
          <span class="glyphicon glyphicon-shopping-cart"></span> Acquista
        </button>
</form>
</td>
</tr>
<%} %>
</tbody>

</table>
</div>
</body>
</html>


