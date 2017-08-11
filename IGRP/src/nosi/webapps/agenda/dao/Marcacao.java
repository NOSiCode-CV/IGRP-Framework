package nosi.webapps.agenda.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.google.gson.annotations.Expose;

/**
 * @author: Emanuel Pereira
 * 4 Aug 2017
 */
public class Marcacao {
	@Expose(serialize = false, deserialize = true)
	private Integer id;
	private int id_entidade;
	private int id_servico;
	private int id_balcao;
	private String nome;
	private String data_marcacao;
	private String hr_marcacao;
	private String requerente;
	private String tipo_documento;
	private String nr_documento;
	private String telemovel;
	private String telefone;
	private String email;
	private String notificacao;
	private String estado;
	
	private String localizacao;
	private String nome_servico;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public int getId_entidade() {
		return id_entidade;
	}
	public void setId_entidade(int id_entidade) {
		this.id_entidade = id_entidade;
	}
	public int getId_servico() {
		return id_servico;
	}
	public void setId_servico(int id_servico) {
		this.id_servico = id_servico;
	}
	public int getId_balcao() {
		return id_balcao;
	}
	public void setId_balcao(int id_balcao) {
		this.id_balcao = id_balcao;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getData_marcacao() {
		return data_marcacao;
	}
	public void setData_marcacao(String data_marcacao) {
		this.data_marcacao = data_marcacao;
	}
	public String getHr_marcacao() {
		return hr_marcacao;
	}
	public void setHr_marcacao(String hr_marcacao) {
		this.hr_marcacao = hr_marcacao;
	}
	public String getRequerente() {
		return requerente;
	}
	public void setRequerente(String requerente) {
		this.requerente = requerente;
	}
	public String getTipo_documento() {
		return tipo_documento;
	}
	public void setTipo_documento(String tipo_documento) {
		this.tipo_documento = tipo_documento;
	}
	public String getNr_documento() {
		return nr_documento;
	}
	public void setNr_documento(String nr_documento) {
		this.nr_documento = nr_documento;
	}
	public String getTelemovel() {
		return telemovel;
	}
	public void setTelemovel(String telemovel) {
		this.telemovel = telemovel;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNotificacao() {
		return notificacao;
	}
	public void setNotificacao(String notificacao) {
		this.notificacao = notificacao;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	public String getLocalizacao() {
		return localizacao;
	}
	public void setLocalizacao(String localizacao) {
		this.localizacao = localizacao;
	}
	public String getNome_servico() {
		return nome_servico;
	}
	public void setNome_servico(String nome_servico) {
		this.nome_servico = nome_servico;
	}
	public static String convertDate(String date, String formatIn, String formatOut) {
		String myDateString = null;
		try {
			SimpleDateFormat newDateFormat = new SimpleDateFormat(formatIn);
			Date myDate = newDateFormat.parse(date);
			newDateFormat.applyPattern(formatOut);
			myDateString = newDateFormat.format(myDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return myDateString;
	}
}
