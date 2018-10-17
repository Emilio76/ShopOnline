<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="it.overnet.model.Utente"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% Utente utente =
(Utente) session.getAttribute("utenteLoggato"); %>

<!-- intestazione -->
<div class="jumbotron text-center">
	<h1>Login</h1>
</div>

<!-- form registrazione -->
<form action="login" method="post"
class="form-horizontal" 
onsubmit="return validazioneLogin()">

<div class="form-group">
<label for="username" class="control-label col-md-4">
Inserisci Username</label>
<div class="col-md-5">
<input type="text" name="username" id="username" class="form-control">
</div>
<span class="col-md-3"></span>
</div>

<div class="form-group">
<label for="password" class="control-label col-md-4">
Inserisci Password</label>
<div class="col-md-5">
<input type="password" name="password" id="password" class="form-control">
</div>
<span class="col-md-3"></span>
</div>

<div class="form-group">
<span class="col-md-4"></span>
<div class="col-md-5">
<input type="submit" value="Login" class="btn btn-success">
<input type="reset" value="Ripristina" class="btn btn-warning">
</div>
<span class="col-md-3"></span>
</div>

</form>

<div class="alert alert-danger" id="alert" style="display:none">
<p class="text-center">Non hai rispettato i campi del Form</p>
</div>

<% if (request.getAttribute("login") != null) { %>
<% boolean controllo = (boolean) request.getAttribute("login"); %>	

<% if (controllo) { %>
<div class="alert alert-success">
<p class="text-center">Login avvenuta con successo</p>
</div>
<% } else if (!controllo) { %>
<div class="alert alert-danger">
<p class="text-center">Username o password errati</p>
</div>
<% } %>
<% } %>


</body>
</html>