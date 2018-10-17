package it.overnet.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import it.overnet.connection.DBConnection;
import it.overnet.model.Categoria;

import it.overnet.model.Prodotto;

public class ProdottoDaoImpl implements ProdottoDao {
	
	private Connection connection;
	
	public ProdottoDaoImpl() {
		connection = DBConnection.getConnection();
	}


	@Override
	public List<Prodotto> getAllProdotti() {
		List<Prodotto> lista = new ArrayList<>();
		String query = "select * from prodotto";
		try (Statement statement = connection.createStatement();
				ResultSet rs = statement.executeQuery(query)) {
			while (rs.next()) {
			Prodotto prodotto = new Prodotto();
			prodotto.setIdProdotto(rs.getInt(1));
			prodotto.setNome(rs.getString(2));
			prodotto.setCategoria();
			
			
	}

	@Override
	public List<Prodotto> getProdottiByCat(Categoria categoria) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Prodotto> getProdottiByOfferta(boolean offerta) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void aggiornaQuantita(int idProdotto, int quantita) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void close() {
		// TODO Auto-generated method stub
		
	}

}
