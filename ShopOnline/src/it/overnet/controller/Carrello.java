package it.overnet.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.org.apache.regexp.internal.RE;

import it.overnet.dao.ProdottoDaoImpl;
import it.overnet.model.Prodotto;
import it.overnet.model.Utente;

public class Carrello extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int idP = Integer.parseInt(req.getParameter("idProdotto"));
		ProdottoDaoImpl pDao = new ProdottoDaoImpl();
		Prodotto prodotto = pDao.getProdottoById(idP);
		HttpSession sessione = req.getSession();
		List<Prodotto> carrello = (List) sessione.getAttribute("carrello");
		carrello.add(prodotto);
		sessione.setAttribute("carrello", carrello);
		RequestDispatcher dispatcher = req.getRequestDispatcher("carrello.jsp");
		dispatcher.forward(req, resp);
	}
	
}
