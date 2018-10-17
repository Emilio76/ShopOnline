package it.overnet.dao;

import java.util.List;

import it.overnet.model.Categoria;
import it.overnet.model.Prodotto;

public interface ProdottoDao {
	
	
	public List<Prodotto> getAllProdotti();

	public List<Prodotto> getProdottiByCat(Categoria categoria);
	
	public List<Prodotto> getProdottiByOfferta(boolean offerta);
	
	public void aggiornaQuantita (int idProdotto, int quantita);
	
	public void close();
}
