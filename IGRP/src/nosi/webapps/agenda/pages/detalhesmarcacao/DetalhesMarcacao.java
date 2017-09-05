/*---------------------- Create Model ----------------------*/
package nosi.webapps.agenda.pages.detalhesmarcacao;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;

public class DetalhesMarcacao extends Model{		
	@RParam(rParamName = "p_nome")
	private String nome;
	@RParam(rParamName = "p_requerente")
	private String requerente;
	@RParam(rParamName = "p_contato")
	private String contato;
	@RParam(rParamName = "p_email")
	private String email;
	@RParam(rParamName = "p_telemovel")
	private String telemovel;
	@RParam(rParamName = "p_telefone")
	private String telefone;
	@RParam(rParamName = "p_detalhes_agenda")
	private String detalhes_agenda;
	@RParam(rParamName = "p_servico")
	private String servico;
	@RParam(rParamName = "p_balcao")
	private String balcao;
	@RParam(rParamName = "p_data")
	private String data;
	@RParam(rParamName = "p_hora")
	private String hora;
	@RParam(rParamName = "p_tipo_documento")
	private String tipo_documento;
	@RParam(rParamName = "p_n_documento")
	private String n_documento;
	@RParam(rParamName = "p_view_1_img")
	private String view_1_img;
	@RParam(rParamName = "p_id")
	private String p_id;
	
	public void setNome(String nome){
		this.nome = nome;
	}
	public String getNome(){
		return this.nome;
	}
	
	public void setRequerente(String requerente){
		this.requerente = requerente;
	}
	public String getRequerente(){
		return this.requerente;
	}
	
	public void setContato(String contato){
		this.contato = contato;
	}
	public String getContato(){
		return this.contato;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	public String getEmail(){
		return this.email;
	}
	
	public void setTelemovel(String telemovel){
		this.telemovel = telemovel;
	}
	public String getTelemovel(){
		return this.telemovel;
	}
	
	public void setTelefone(String telefone){
		this.telefone = telefone;
	}
	public String getTelefone(){
		return this.telefone;
	}
	
	public void setDetalhes_agenda(String detalhes_agenda){
		this.detalhes_agenda = detalhes_agenda;
	}
	public String getDetalhes_agenda(){
		return this.detalhes_agenda;
	}
	
	public void setServico(String servico){
		this.servico = servico;
	}
	public String getServico(){
		return this.servico;
	}
	
	public void setBalcao(String balcao){
		this.balcao = balcao;
	}
	public String getBalcao(){
		return this.balcao;
	}
	
	public void setData(String data){
		this.data = data;
	}
	public String getData(){
		return this.data;
	}
	
	public void setHora(String hora){
		this.hora = hora;
	}
	public String getHora(){
		return this.hora;
	}
	
	public void setTipo_documento(String tipo_documento){
		this.tipo_documento = tipo_documento;
	}
	public String getTipo_documento(){
		return this.tipo_documento;
	}
	
	public void setN_documento(String n_documento){
		this.n_documento = n_documento;
	}
	public String getN_documento(){
		return this.n_documento;
	}
	
	public void setView_1_img(String view_1_img){
		this.view_1_img = view_1_img;
	}
	public String getView_1_img(){
		return this.view_1_img;
	}
	
	public void setP_id(String p_id){
		this.p_id = p_id;
	}
	public String getP_id(){
		return this.p_id;
	}


}
/*-------------------------*/