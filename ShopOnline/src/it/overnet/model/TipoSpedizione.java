package it.overnet.model;

public enum TipoSpedizione {
	
	UN_GIORNO(1, 15),
	UNA_SETTIMANA(7, 5),
	IERI(0, 100);
	
	private int giorni;
	private double prezzo;
	private TipoSpedizione(int giorni, double prezzo) {
		this.giorni = giorni;
		this.prezzo = prezzo;
	}
	public int getGiorni() {
		return giorni;
	}
	public void setGiorni(int giorni) {
		this.giorni = giorni;
	}
	public double getPrezzo() {
		return prezzo;
	}
	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}
	
	
	

}
