package it.overnet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
		String query = "select * from prodotti";
		try (Statement statement = connection.createStatement();
				ResultSet rs = statement.executeQuery(query)) {
			while (rs.next()) {
			Prodotto prodotto = new Prodotto();
			prodotto.setIdProdotto(rs.getInt(1));
			prodotto.setNome(rs.getString(2));
			prodotto.setCategoria(Categoria.valueOf(rs.getString(3)));
			prodotto.setMarca(rs.getString(4));
			prodotto.setPrezzo(rs.getDouble(5));
			prodotto.setOfferta(rs.getBoolean(6));
			prodotto.setSconto(rs.getInt(7));
			prodotto.setQuantitaDisponibile(rs.getInt(8));
			prodotto.setImmagine(rs.getString(9));
			
			lista.add(prodotto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lista;
			
	}

	@Override
	public List<Prodotto> getProdottiByCat(Categoria categoria) {
		List<Prodotto> listaProdotti = new ArrayList<>();
		String query = "select * from prodotto where categoria = ?";
		ResultSet rs = null;
		try (PreparedStatement prepared = connection.prepareStatement(query)) {
			prepared.setString(1, categoria.toString());
			rs= prepared.executeQuery();
			while (rs.next()) {
				Prodotto prodotto = new Prodotto();
				prodotto.setIdProdotto(rs.getInt(1));
				prodotto.setNome(rs.getString(2));
				prodotto.setCategoria(Categoria.valueOf(rs.getString(3)));
				prodotto.setMarca(rs.getString(4));
				prodotto.setPrezzo(rs.getDouble(5));
				prodotto.setOfferta(rs.getBoolean(6));
				prodotto.setSconto(rs.getInt(7));
				prodotto.setQuantitaDisponibile(rs.getInt(8));
				prodotto.setImmagine(rs.getString(9));
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listaProdotti;
	}

	@Override
	public List<Prodotto> getProdottiByOfferta(boolean offerta) {
		List<Prodotto> listaProdotti = new ArrayList<>();
		String query = "select * from prodotto where offerta = 1";
		ResultSet rs = null;
		try (Statement statement = connection.createStatement()) {			
			rs= statement.executeQuery(query);
			while (rs.next()) {
				Prodotto prodotto = new Prodotto();
				prodotto.setIdProdotto(rs.getInt(1));
				prodotto.setNome(rs.getString(2));
				prodotto.setCategoria(Categoria.valueOf(rs.getString(3)));
				prodotto.setMarca(rs.getString(4));
				prodotto.setPrezzo(rs.getDouble(5));
				prodotto.setOfferta(rs.getBoolean(6));
				prodotto.setSconto(rs.getInt(7));
				prodotto.setQuantitaDisponibile(rs.getInt(8));
				prodotto.setImmagine(rs.getString(9));
			}				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listaProdotti;
	}
	
	
	@Override
	public Prodotto getProdottoById(int id) {
		String query = "select * from prodotti where id_prodotto = '"+ id +"'";
		Prodotto prodotto = new Prodotto();
		
		try(Statement statement = connection.createStatement();
		ResultSet rs = statement.executeQuery(query)) {
			if (rs.next()) {
			
				prodotto.setIdProdotto(rs.getInt(1));
				prodotto.setNome(rs.getString(2));
				prodotto.setCategoria(Categoria.valueOf(rs.getString(3)));
				prodotto.setMarca(rs.getString(4));
				prodotto.setPrezzo(rs.getDouble(5));
				prodotto.setOfferta(rs.getBoolean(6));
				prodotto.setSconto(rs.getInt(7));
				prodotto.setQuantitaDisponibile(rs.getInt(8));
				prodotto.setImmagine(rs.getString(9));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return prodotto;
	}
	

	@Override
	public void aggiornaQuantita(int idProdotto, int quantita) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void close() {
		if (connection != null){
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}



}
