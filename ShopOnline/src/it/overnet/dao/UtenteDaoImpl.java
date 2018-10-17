package it.overnet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import it.overnet.connection.DBConnection;
import it.overnet.model.Utente;

public class UtenteDaoImpl implements UtenteDao {

	
	private Connection connection;
	private PreparedStatement prepared;
	public UtenteDaoImpl() {connection = DBConnection.getConnection();}
	
	@Override
	public void insertUtente(Utente utente) {
		String istruzione ="insert into utente values(utente_seq.nextval, ?, ?, ?, ?, ?)";
		try (PreparedStatement prepared = connection.prepareStatement(istruzione)){
			prepared.setString(1, utente.getNome());
			prepared.setString(2, utente.getCognome());
			prepared.setString(3, utente.getUsername());
			prepared.setString(4, utente.getPassword());
			prepared.setString(5, utente.getIndirizzo());
			prepared.execute();		
		} catch (SQLException e){
			e.printStackTrace();
		}
	}

	@Override
	public Utente getByUsernameAndPassword(String username, String password) {
		Utente utente = null;		
		String query = "select * from utente where username = ? and password = ?";
		try (PreparedStatement prepared = connection.prepareStatement(query)) {
				prepared.setString(1, username);
				prepared.setString(2, password);
				ResultSet resulSet = prepared.executeQuery();			
			if (resulSet.next()) {
				utente = new Utente();
				utente.setIdUtente(resulSet.getInt(1));
				utente.setNome(resulSet.getString(2));
				utente.setCognome(resulSet.getString(3));
				utente.setUsername(resulSet.getString(4));
				utente.setPassword(resulSet.getString(5));				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return utente;
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
