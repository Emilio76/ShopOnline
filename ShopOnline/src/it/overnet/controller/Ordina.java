package it.overnet.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.overnet.dao.ProdottoDaoImpl;
import it.overnet.model.Prodotto;

public class Ordina extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProdottoDaoImpl filmDao = new ProdottoDaoImpl();
		List<Prodotto> listaProdotti = filmDao.getAllProdotti();
		System.out.println("n film : " + listaProdotti.size());
		filmDao.close();
		String sort= req.getParameter("sort");
		if(sort.equals("regista")) {
			Comparator<Prodotto> comparatoreMarca = new Comparator<Prodotto>() {

				@Override
				public int compare(Prodotto f1, Prodotto f2) {
					// TODO Auto-generated method stub
					return f1.getMarca().compareTo(f2.getMarca());
				}
			};
					
					
					Collections.sort(listaProdotti,comparatoreMarca);
		} else if (sort.equals("quantita")){
			Comparator<Prodotto> comparatorePrezzo = new Comparator<Prodotto>() {

				@Override
				public int compare(Prodotto f1, Prodotto f2) {
					if (f1.getPrezzo() > f2.getPrezzo()) {
						return 1;
					}else if (f1.getPrezzo() < f2.getPrezzo()){
						return -1;
					}else{
						return 0;
					}
				
				} 
			};
			Collections.sort(listaProdotti,comparatorePrezzo);
		}
		
		
		
		req.setAttribute("listaProdotti", listaProdotti);
		RequestDispatcher dispatcher = req.getRequestDispatcher("listaProdotti.jsp");
		dispatcher.forward(req, resp);
		
		
	}
	
}
