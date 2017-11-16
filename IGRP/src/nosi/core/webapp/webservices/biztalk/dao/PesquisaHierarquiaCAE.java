package nosi.core.webapp.webservices.biztalk.dao;

import java.io.Serializable;
import java.util.List;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import com.google.gson.annotations.Expose;

/**
 * @author: Emanuel Pereira
 * 16 Nov 2017
 */

@XmlRootElement(name="lista")
public class PesquisaHierarquiaCAE implements ServiceSerach,Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6401185248766868577L;
	@Expose(serialize = true, deserialize = false)
	private Integer id;
	@Expose(serialize = true, deserialize = false)
	private String codigo;
	@Expose(serialize = true, deserialize = false)
	private Integer crpcae_id;
	@Expose(serialize = true, deserialize = false)
	private Integer self_id;
	@XmlElement(name="row")
	@Expose(serialize = false, deserialize = true)
	private List<PesquisaHierarquiaCAE.RowList> rowList;
	
	public PesquisaHierarquiaCAE(){}
	
	public PesquisaHierarquiaCAE(Integer id, String codigo, Integer crpcae_id, Integer self_id) {
		super();
		this.id = id;
		this.codigo = codigo;
		this.crpcae_id = crpcae_id;
		this.self_id = self_id;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public Integer getCrpcae_id() {
		return crpcae_id;
	}
	public void setCrpcae_id(Integer crpcae_id) {
		this.crpcae_id = crpcae_id;
	}
	public Integer getSelf_id() {
		return self_id;
	}
	public void setSelf_id(Integer self_id) {
		this.self_id = self_id;
	}
	@Override
	public List<PesquisaHierarquiaCAE.RowList> getRowList() {
		return rowList;
	}
	public void setRowList(List<PesquisaHierarquiaCAE.RowList> rowList) {
		this.rowList = rowList;
	}
	
	
	@Override
	public String toString() {
		return "PesquisaHierarquiaCAE [id=" + id + ", codigo=" + codigo + ", crpcae_id=" + crpcae_id + ", self_id="
				+ self_id + ", rowList=" + rowList + "]";
	}


	public static class RowList implements Serializable{

		/**
		 * 
		 */
		private static final long serialVersionUID = 2446623641418792330L;
		
	}
	
}
