/*---------------------- Create Model ----------------------*/
package nosi.webapps.agenda.pages.agendar;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class Agendar extends Model{		
	@RParam(rParamName = "p_page_title_text")
	private String page_title_text;
	@RParam(rParamName = "p_entidade")
	private String entidade;
	@RParam(rParamName = "p_servico")
	private String servico;
	@RParam(rParamName = "p_balcao")
	private String balcao;
	@RParam(rParamName = "p_data")
	private String data;
	@RParam(rParamName = "p_hora")
	private String hora;
	@RParam(rParamName = "p_nome")
	private String nome;
	
	@RParam(rParamName = "p_nome2")
	private String nome2;
	
	@RParam(rParamName = "p_tipo_documento_de_identificacao")
	private String tipo_documento_de_identificacao;
	@RParam(rParamName = "p_documento_de_identificacao")
	private float documento_de_identificacao;
	@RParam(rParamName = "p_email")
	private String email;
	@RParam(rParamName = "p_telemovel")
	private float telemovel;
	@RParam(rParamName = "p_telefone")
	private float telefone;
	
	@RParam(rParamName = "p_entidade_fk_desc")
	private String []p_entidade_fk_desc;
	@RParam(rParamName = "p_entidade_fk")
	private int []p_entidade_fk;
	
	@RParam(rParamName = "p_servico_fk_desc")
	private String []p_servico_fk_desc;
	@RParam(rParamName = "p_servico_fk")
	private int []p_servico_fk;
	
	@RParam(rParamName = "p_balcao_fk_desc")
	private String []p_balcao_fk_desc;
	@RParam(rParamName = "p_balcao_fk")
	private int []p_balcao_fk;
	
	@RParam(rParamName = "p_data_fk_desc")
	private String []p_data_fk_desc;
	@RParam(rParamName = "p_data_fk")
	private String []p_data_fk;
	
	@RParam(rParamName = "p_hora_fk_desc")
	private String []p_hora_fk_desc;
	@RParam(rParamName = "p_hora_fk")
	private String []p_hora_fk;
	
	@RParam(rParamName = "p_nome_fk_desc")
	private String []p_nome_fk_desc;
	@RParam(rParamName = "p_nome_fk")
	private String []p_nome_fk;

	private ArrayList<Separatorlist_2> separatorlist_2 = new ArrayList<>();
	public void setSeparatorlist_2(ArrayList<Separatorlist_2> separatorlist_2){
		this.separatorlist_2 = separatorlist_2;
	}
	public ArrayList<Separatorlist_2> getseparatorlist_2(){
		return this.separatorlist_2;
	}

	private ArrayList<Table_1> table_1 = new ArrayList<>();
	public void setTable_1(ArrayList<Table_1> table_1){
		this.table_1 = table_1;
	}
	public ArrayList<Table_1> gettable_1(){
		return this.table_1;
	}
	
	public void setPage_title_text(String page_title_text){
		this.page_title_text = page_title_text;
	}
	public String getPage_title_text(){
		return this.page_title_text;
	}
	
	public void setEntidade(String entidade){
		this.entidade = entidade;
	}
	public String getEntidade(){
		return this.entidade;
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
	
	public void setNome(String nome){
		this.nome = nome;
	}
	public String getNome(){
		return this.nome;
	}
	
	public void setTipo_documento_de_identificacao(String tipo_documento_de_identificacao){
		this.tipo_documento_de_identificacao = tipo_documento_de_identificacao;
	}
	public String getTipo_documento_de_identificacao(){
		return this.tipo_documento_de_identificacao;
	}
	
	public void setDocumento_de_identificacao(float documento_de_identificacao){
		this.documento_de_identificacao = documento_de_identificacao;
	}
	public float getDocumento_de_identificacao(){
		return this.documento_de_identificacao;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	public String getEmail(){
		return this.email;
	}
	
	public void setTelemovel(float telemovel){
		this.telemovel = telemovel;
	}
	public float getTelemovel(){
		return this.telemovel;
	}
	
	public void setTelefone(float telefone){
		this.telefone = telefone;
	}
	public float getTelefone(){
		return this.telefone;
	}

	public String[] getP_entidade_fk_desc() {
		return p_entidade_fk_desc;
	}
	public void setP_entidade_fk_desc(String[] p_entidade_fk_desc) {
		this.p_entidade_fk_desc = p_entidade_fk_desc;
	}
	public int[] getP_entidade_fk() {
		return p_entidade_fk;
	}
	public void setP_entidade_fk(int[] p_entidade_fk) {
		this.p_entidade_fk = p_entidade_fk;
	}
	public String[] getP_servico_fk_desc() {
		return p_servico_fk_desc;
	}
	public void setP_servico_fk_desc(String[] p_servico_fk_desc) {
		this.p_servico_fk_desc = p_servico_fk_desc;
	}
	public int[] getP_servico_fk() {
		return p_servico_fk;
	}
	public void setP_servico_fk(int[] p_servico_fk) {
		this.p_servico_fk = p_servico_fk;
	}
	public String[] getP_balcao_fk_desc() {
		return p_balcao_fk_desc;
	}
	public void setP_balcao_fk_desc(String[] p_balcao_fk_desc) {
		this.p_balcao_fk_desc = p_balcao_fk_desc;
	}
	public int[] getP_balcao_fk() {
		return p_balcao_fk;
	}
	public void setP_balcao_fk(int[] p_balcao_fk) {
		this.p_balcao_fk = p_balcao_fk;
	}
	public String[] getP_data_fk_desc() {
		return p_data_fk_desc;
	}
	public void setP_data_fk_desc(String[] p_data_fk_desc) {
		this.p_data_fk_desc = p_data_fk_desc;
	}
	public String[] getP_data_fk() {
		return p_data_fk;
	}
	public void setP_data_fk(String[] p_data_fk) {
		this.p_data_fk = p_data_fk;
	}
	public String[] getP_hora_fk_desc() {
		return p_hora_fk_desc;
	}
	public void setP_hora_fk_desc(String[] p_hora_fk_desc) {
		this.p_hora_fk_desc = p_hora_fk_desc;
	}
	public String[] getP_hora_fk() {
		return p_hora_fk;
	}
	public void setP_hora_fk(String[] p_hora_fk) {
		this.p_hora_fk = p_hora_fk;
	}
	public String[] getP_nome_fk_desc() {
		return p_nome_fk_desc;
	}
	public void setP_nome_fk_desc(String[] p_nome_fk_desc) {
		this.p_nome_fk_desc = p_nome_fk_desc;
	}
	public String[] getP_nome_fk() {
		return p_nome_fk;
	}
	public void setP_nome_fk(String[] p_nome_fk) {
		this.p_nome_fk = p_nome_fk;
	}
	public ArrayList<Separatorlist_2> getSeparatorlist_2() {
		return separatorlist_2;
	}
	public ArrayList<Table_1> getTable_1() {
		return table_1;
	}

	public String getNome2() {
		return nome2;
	}
	public void setNome2(String nome2) {
		this.nome2 = nome2;
	}

	public class Table_1{
		private String tipo_requisito;
		private String descritivo;
		private String formulario;
		public void setTipo_requisito(String tipo_requisito){
			this.tipo_requisito = tipo_requisito;
		}
		public String getTipo_requisito(){
			return this.tipo_requisito;
		}

		public void setDescritivo(String descritivo){
			this.descritivo = descritivo;
		}
		public String getDescritivo(){
			return this.descritivo;
		}

		public void setFormulario(String formulario){
			this.formulario = formulario;
		}
		public String getFormulario(){
			return this.formulario;
		}

	}
	public static class Separatorlist_2{
		
		private String entidade;
		private String servico;
		private String balcao;
		private String data;
		private String hora;
		private String nome;
		
		public void setEntidade(String entidade){
			this.entidade = entidade;
		}
		public String getEntidade(){
			return this.entidade;
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

		public void setNome(String nome){
			this.nome = nome;
		}
		public String getNome(){
			return this.nome;
		}

	}
}
/*-------------------------*/