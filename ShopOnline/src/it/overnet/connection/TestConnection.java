package it.overnet.connection;

import java.sql.Connection;

public class TestConnection {
	
	public static void main(String[] args) {
		
		Connection connection = DBConnection.getConnection();
		if (connection != null)
			System.out.println("connessione ottenuta con successo");
	}
	

}
