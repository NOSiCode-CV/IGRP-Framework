package nosi.core.webapp.webservices.rest.pesquisa_geral;

import java.io.Serializable;

import com.google.common.reflect.TypeToken;

import nosi.core.webapp.Core;

/**
 * Isaias.Nunes
 * Jan 16, 2019
 */
public class Entries implements Serializable{

	private static final long serialVersionUID = 1L;
	private Entry Entry;

	public Entry getEntry() {
		return Entry;
	}

	public void setEntry(Entry entry) {
		Entry = entry;
	}
	public Entries getListNif(String json) {
		return (Entries) Core.fromJson(json, Entries.class);
	}

	@Override
	public String toString() {
		return "Entries [Entry=" + Entry + "]";
	}
	
	
}
