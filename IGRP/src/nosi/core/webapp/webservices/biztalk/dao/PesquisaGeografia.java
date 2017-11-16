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
public class PesquisaGeografia implements ServiceSerach,Serializable{

	 /**
	 * 
	 */
	private static final long serialVersionUID = 8146541972727528140L;
	@Expose(serialize = false, deserialize = true)
	private Integer id;
	@Expose(serialize = false, deserialize = true)
	private String zona;
	@Expose(serialize = false, deserialize = true)
	private String freguesia;
	@Expose(serialize = false, deserialize = true)
	private String concelho;
	@Expose(serialize = false, deserialize = true)
	private String ilha;
	@Expose(serialize = false, deserialize = true)
	private String pais;
	@Expose(serialize = false, deserialize = true)
	private String nivel_detalhe;
	@Expose(serialize = false, deserialize = true)
	private String tp_geog_cd;
	@Expose(serialize = false, deserialize = true)
	private String codigo_ine;
	@Expose(serialize = false, deserialize = true)
	private String codigo;
	@Expose(serialize = false, deserialize = true)
	private String self_id;
	@XmlElement(name="row")
	@Expose(serialize = false, deserialize = true)
	private List<PesquisaGeografia.RowList> rowList;

	public PesquisaGeografia(){}
	
	public PesquisaGeografia(Integer id, String zona, String freguesia, String concelho, String ilha, String pais,
			String nivel_detalhe, String tp_geog_cd, String codigo_ine, String codigo, String self_id) {
		super();
		this.id = id;
		this.zona = zona;
		this.freguesia = freguesia;
		this.concelho = concelho;
		this.ilha = ilha;
		this.pais = pais;
		this.nivel_detalhe = nivel_detalhe;
		this.tp_geog_cd = tp_geog_cd;
		this.codigo_ine = codigo_ine;
		this.codigo = codigo;
		this.self_id = self_id;
	}
	@Override
	public List<PesquisaGeografia.RowList> getRowList() {
		return this.rowList;
	}		
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getZona() {
		return zona;
	}
	public void setZona(String zona) {
		this.zona = zona;
	}
	public String getFreguesia() {
		return freguesia;
	}
	public void setFreguesia(String freguesia) {
		this.freguesia = freguesia;
	}
	public String getConcelho() {
		return concelho;
	}
	public void setConcelho(String concelho) {
		this.concelho = concelho;
	}
	public String getIlha() {
		return ilha;
	}
	public void setIlha(String ilha) {
		this.ilha = ilha;
	}
	public String getPais() {
		return pais;
	}
	public void setPais(String pais) {
		this.pais = pais;
	}
	public String getNivel_detalhe() {
		return nivel_detalhe;
	}
	public void setNivel_detalhe(String nivel_detalhe) {
		this.nivel_detalhe = nivel_detalhe;
	}
	public String getTp_geog_cd() {
		return tp_geog_cd;
	}
	public void setTp_geog_cd(String tp_geog_cd) {
		this.tp_geog_cd = tp_geog_cd;
	}
	public String getCodigo_ine() {
		return codigo_ine;
	}
	public void setCodigo_ine(String codigo_ine) {
		this.codigo_ine = codigo_ine;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getSelf_id() {
		return self_id;
	}
	public void setSelf_id(String self_id) {
		this.self_id = self_id;
	}
	public void setRowList(List<PesquisaGeografia.RowList> rowList) {
		this.rowList = rowList;
	}


	@Override
	public String toString() {
		return "PesquisaGeografia [id=" + id + ", zona=" + zona + ", freguesia=" + freguesia + ", concelho=" + concelho
				+ ", ilha=" + ilha + ", pais=" + pais + ", nivel_detalhe=" + nivel_detalhe + ", tp_geog_cd="
				+ tp_geog_cd + ", codigo_ine=" + codigo_ine + ", codigo=" + codigo + ", self_id=" + self_id
				+ ", rowList=" + rowList + "]";
	}


	public static class RowList implements Serializable{

		/**
		 * 
		 */
		private static final long serialVersionUID = -2418647871832269737L;
		
	}

}
