package nosi.core.webapp.webservices.rest.pesquisa_geral;

import java.io.Serializable;
import java.util.ArrayList;

import com.google.common.reflect.TypeToken;

import nosi.core.webapp.Core;

/**
 * Isaias.Nunes
 * Jan 15, 2019
 */

public class PesquisaNif implements Serializable{
	private Entries Entries;
	
	public Entries getEntries() {
		return Entries;
	}

	public void setEntries(Entries entries) {
		Entries = entries;
	}
	
	public ArrayList<PesquisaNif> getListNif(String json){
		return  (ArrayList<PesquisaNif>) Core.fromJsonWithJsonBuilder(json, new TypeToken<PesquisaNif>() {}.getType());
	}
}