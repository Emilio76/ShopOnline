package it.overnet.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.overnet.dao.UtenteDaoImpl;
import it.overnet.model.Utente;

public class Login extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		UtenteDaoImpl utenteDao = new UtenteDaoImpl();
		Utente utente =utenteDao.getByUsernameAndPassword(username, password);
		System.out.println(utente);
		utenteDao.close();
		if (utente == null) {
			req.setAttribute("login", false);
		    
		}else{
			req.setAttribute("login", true);
			HttpSession sessione = req.getSession();
			sessione.setAttribute("utenteLoggato", utente);
		}
		RequestDispatcher dispatcher = req.getRequestDispatcher("listaProdotti.jsp");
	    dispatcher.forward(req, resp);
	}
	
}
