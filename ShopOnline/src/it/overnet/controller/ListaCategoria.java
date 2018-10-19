package it.overnet.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import it.overnet.dao.ProdottoDaoImpl;
import it.overnet.model.Categoria;
import it.overnet.model.Prodotto;

public class ListaCategoria extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String categoriaString = req.getParameter("categoria");
		Categoria categoria = Categoria.valueOf(categoriaString);
		ProdottoDaoImpl prodottoDao = new ProdottoDaoImpl();
		List<Prodotto> listaProdotti = prodottoDao.getProdottiByCat(categoria);
		System.out.println("n prodotti x categoria : " + listaProdotti.size());
		prodottoDao.close();
		req.setAttribute("listaProdotti", listaProdotti);
		RequestDispatcher dispatcher = req.getRequestDispatcher("listaProdotti.jsp");
		dispatcher.forward(req, resp);
		
	
	}
	
}
