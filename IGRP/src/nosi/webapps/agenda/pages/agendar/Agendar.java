/*---------------------- Create Model ----------------------*/
package nosi.webapps.agenda.pages.agendar;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class Agendar extends Model{		
	@RParam(rParamName = "p_page_title_text")
	private String page_title_text;
	@RParam(rParamName = "p_requerente")
	private String requerente;
	@RParam(rParamName = "p_tipo_documento_de_identificacao")
	private String tipo_documento_de_identificacao;
	@RParam(rParamName = "p_documento_de_identificacao")
	private String documento_de_identificacao;
	@RParam(rParamName = "p_email")
	private String email;
	@RParam(rParamName = "p_telemovel")
	private String telemovel;
	@RParam(rParamName = "p_telefone")
	private String telefone;
	@RParam(rParamName = "p_notificacao")
	private int notificacao;
	@RParam(rParamName = "p_agenda_fk")
	private String[] p_agenda_fk;
	@RParam(rParamName = "p_agenda_fk_desc")
	private String[] p_agenda_fk_desc;
	@RParam(rParamName = "p_data_fk")
	private String[] p_data_fk;
	@RParam(rParamName = "p_data_fk_desc")
	private String[] p_data_fk_desc;
	@RParam(rParamName = "p_hora_fk")
	private String[] p_hora_fk;
	@RParam(rParamName = "p_hora_fk_desc")
	private String[] p_hora_fk_desc;
	@RParam(rParamName = "p_nome_fk")
	private String[] p_nome_fk;
	@RParam(rParamName = "p_nome_fk_desc")
	private String[] p_nome_fk_desc;

	private ArrayList<Separatorlist_2> separatorlist_2 = new ArrayList<>();
	public void setSeparatorlist_2(ArrayList<Separatorlist_2> separatorlist_2){
		this.separatorlist_2 = separatorlist_2;
	}
	public ArrayList<Separatorlist_2> getseparatorlist_2(){
		return this.separatorlist_2;
	}
	
	public void setPage_title_text(String page_title_text){
		this.page_title_text = page_title_text;
	}
	public String getPage_title_text(){
		return this.page_title_text;
	}
	
	public void setRequerente(String requerente){
		this.requerente = requerente;
	}
	public String getRequerente(){
		return this.requerente;
	}
	
	public void setTipo_documento_de_identificacao(String tipo_documento_de_identificacao){
		this.tipo_documento_de_identificacao = tipo_documento_de_identificacao;
	}
	public String getTipo_documento_de_identificacao(){
		return this.tipo_documento_de_identificacao;
	}
	
	public void setDocumento_de_identificacao(String documento_de_identificacao){
		this.documento_de_identificacao = documento_de_identificacao;
	}
	public String getDocumento_de_identificacao(){
		return this.documento_de_identificacao;
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
	
	public void setNotificacao(int notificacao){
		this.notificacao = notificacao;
	}
	public int getNotificacao(){
		return this.notificacao;
	}
	
	public void setP_agenda_fk(String[] p_agenda_fk){
		this.p_agenda_fk = p_agenda_fk;
	}
	public String[] getP_agenda_fk(){
		return this.p_agenda_fk;
	}
	
	public void setP_agenda_fk_desc(String[] p_agenda_fk_desc){
		this.p_agenda_fk_desc = p_agenda_fk_desc;
	}
	public String[] getP_agenda_fk_desc(){
		return this.p_agenda_fk_desc;
	}
	
	public void setP_data_fk(String[] p_data_fk){
		this.p_data_fk = p_data_fk;
	}
	public String[] getP_data_fk(){
		return this.p_data_fk;
	}
	
	public void setP_data_fk_desc(String[] p_data_fk_desc){
		this.p_data_fk_desc = p_data_fk_desc;
	}
	public String[] getP_data_fk_desc(){
		return this.p_data_fk_desc;
	}
	
	public void setP_hora_fk(String[] p_hora_fk){
		this.p_hora_fk = p_hora_fk;
	}
	public String[] getP_hora_fk(){
		return this.p_hora_fk;
	}
	
	public void setP_hora_fk_desc(String[] p_hora_fk_desc){
		this.p_hora_fk_desc = p_hora_fk_desc;
	}
	public String[] getP_hora_fk_desc(){
		return this.p_hora_fk_desc;
	}
	
	public void setP_nome_fk(String[] p_nome_fk){
		this.p_nome_fk = p_nome_fk;
	}
	public String[] getP_nome_fk(){
		return this.p_nome_fk;
	}
	
	public void setP_nome_fk_desc(String[] p_nome_fk_desc){
		this.p_nome_fk_desc = p_nome_fk_desc;
	}
	public String[] getP_nome_fk_desc(){
		return this.p_nome_fk_desc;
	}


	public static class Separatorlist_2{
		private Pair agenda;
		private Pair data;
		private Pair hora;
		private Pair nome;
		public static class Pair{
		
			private String key;
			private String value;
			
			public Pair() {}
			
			public Pair(String key, String value) {
				this.key = key;
				this.value = value;
			}
			
			public String getKey() {
				return key;
			}
			public void setKey(String key) {
				this.key = key;
			}
			public String getValue() {
				return value;
			}
			public void setValue(String value) {
				this.value = value;
			}
			
			@Override
			public String toString() {
				return this.key + "_" + this.value;
			}
		}
 		
		public void setAgenda(Pair agenda){
			this.agenda = agenda;
		}
		public Pair getAgenda(){
			return this.agenda;
		}

		public void setData(Pair data){
			this.data = data;
		}
		public Pair getData(){
			return this.data;
		}

		public void setHora(Pair hora){
			this.hora = hora;
		}
		public Pair getHora(){
			return this.hora;
		}

		public void setNome(Pair nome){
			this.nome = nome;
		}
		public Pair getNome(){
			return this.nome;
		}

	}
}
/*-------------------------*/