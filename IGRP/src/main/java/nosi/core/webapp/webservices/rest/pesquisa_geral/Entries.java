package nosi.core.webapp.webservices.rest.pesquisa_geral;

import java.io.Serializable;
import java.util.ArrayList;


/**
 * Isaias.Nunes
 * Jan 16, 2019
 */
public class Entries implements Serializable{
	
	private ArrayList<Entry> Entry;

	public ArrayList<Entry> getEntry() {
		return Entry;
	}

	public void setEntry(ArrayList<Entry> entry) {
		Entry = entry;
	}
	
	
}
