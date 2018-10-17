package it.overnet.dao;

import it.overnet.model.Utente;

public interface UtenteDao {
	
	public void insertUtente (Utente utente);
	
	public Utente getByUsernameAndPassword ( String username, String password);
	
	public void close();

}
