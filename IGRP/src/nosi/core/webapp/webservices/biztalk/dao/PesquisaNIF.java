package nosi.core.webapp.webservices.biztalk.dao;

import java.io.Serializable;
import java.util.List;
import javax.xml.bind.annotation.XmlRootElement;
import com.google.gson.annotations.Expose;

import nosi.core.webapp.Core;

/**
 * @author: Emanuel Pereira
 * 15 Nov 2017
 */
@XmlRootElement(name="lista")
public class PesquisaNIF implements ServiceSerach,Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -191934994372579401L;
	@Expose(serialize = false, deserialize = true)
	private Integer numero;
	@Expose(serialize = false, deserialize = true)
	private String nome;
	  
	@Expose(serialize = false, deserialize = true)
	private List<PesquisaNIF.RowList> rowList;
	
	public PesquisaNIF(){}
	
	public PesquisaNIF(Integer numero, String nome) {
		super();
		this.numero = numero;
		this.nome = nome;
	}
	
	public Integer getNumero() {
		return numero;
	}

	public void setNumero(Integer numero) {
		this.numero = numero;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	@Override
	public List<PesquisaNIF.RowList> getRowList() {
		return this.rowList;
	}

	@Override
	public String toString() {
		return "PesquisaNIF [rowList=" + rowList + "]";
	}

	public static class RowList implements Serializable{

		/**
		 * 
		 */
		private static final long serialVersionUID = -532156865815807740L;
		
	}
	
	@Override
	public String getClientID() {
		return Core.getConfig("CLIENT_ID_BIZTALK");
	}

	@Override
	public String getTransactionID() {
		return Core.getConfig("TRANSACTION_ID_BIZTALK_PESQUISA_NIF");
	}

	@Override
	public String getServiceID() {
		return Core.getConfig("SERVICE_ID_BIZTALK_PESQUISA_NIF");
	}
}
