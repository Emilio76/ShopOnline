package it.overnet.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.overnet.dao.UtenteDaoImpl;
import it.overnet.model.Utente;

public class Registrazione extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nome = req.getParameter("nome");
		String cognome = req.getParameter("cognome");
		String indirizzo = req.getParameter("indirizzo");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
        Utente utente = new Utente();
		utente.setNome(nome);
		utente.setCognome(cognome);
		utente.setIndirizzo(indirizzo);
		utente.setUsername(username);
		utente.setPassword(password);
		System.out.println(utente);
		UtenteDaoImpl utenteDao = new UtenteDaoImpl();
		utenteDao.insertUtente(utente);
		utenteDao.close();
		req.setAttribute("inserito", true);
		RequestDispatcher dispatcher = req.getRequestDispatcher("registrazione.jsp");
		dispatcher.forward(req, resp);
		
		
	}
}
