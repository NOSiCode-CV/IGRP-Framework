package nosi.webapps.igrp.pages.execucaotarefas;


import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

public class ExecucaoTarefas extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_disponiveis")
	private String disponiveis;
	@RParam(rParamName = "p_minhas_tarefas")
	private String minhas_tarefas;
	@RParam(rParamName = "p_estatistica")
	private String estatistica;
	@RParam(rParamName = "p_gerir_tarefas")
	private String gerir_tarefas;
	@RParam(rParamName = "p_colaboradores")
	private String colaboradores;
	@RParam(rParamName = "p_tipo_processo_form_disponiveis")
	private String tipo_processo_form_disponiveis;
	@RParam(rParamName = "p_numero_processo_form_disponiveis")
	private String numero_processo_form_disponiveis;
	@RParam(rParamName = "p_prioridade_form_disponiveis")
	private String prioridade_form_disponiveis;
	@RParam(rParamName = "p_nada5")
	private String nada5;
	@RParam(rParamName = "p_data_inicio_form_disponiveis")
	private String data_inicio_form_disponiveis;
	@RParam(rParamName = "p_data_fim_form_disponiveis")
	private String data_fim_form_disponiveis;
	@RParam(rParamName = "p_tipo_processo_minhas_tarefas")
	private String tipo_processo_minhas_tarefas;
	@RParam(rParamName = "p_numero_processo_minhas_tarefas")
	private String numero_processo_minhas_tarefas;
	@RParam(rParamName = "p_prioridade_minhas_tarefas")
	private String prioridade_minhas_tarefas;
	@RParam(rParamName = "p_nada3_")
	private String nada3_;
	@RParam(rParamName = "p_data_inicio_minhas_tarefas")
	private String data_inicio_minhas_tarefas;
	@RParam(rParamName = "p_data_fim_minhas_tarefas")
	private String data_fim_minhas_tarefas;
	@RParam(rParamName = "p_n_tarefas_cocluidas_view_estatistica")
	private String n_tarefas_cocluidas_view_estatistica;
	@RParam(rParamName = "p_n_tarefas_pendentes_view_estatistica")
	private String n_tarefas_pendentes_view_estatistica;
	@RParam(rParamName = "p_n_atendimento_dia_view_estatistica")
	private String n_atendimento_dia_view_estatistica;
	@RParam(rParamName = "p_media_tempo_view_estatistica")
	private String media_tempo_view_estatistica;
	@RParam(rParamName = "p_view_estatistica_img")
	private String view_estatistica_img;
	@RParam(rParamName = "p_tipo_processo_gerir_tarefa")
	private String tipo_processo_gerir_tarefa;
	@RParam(rParamName = "p_numero_processo_gerir_tarefa")
	private String numero_processo_gerir_tarefa;
	@RParam(rParamName = "p_prioridade_gerir_tarefa")
	private String prioridade_gerir_tarefa;
	@RParam(rParamName = "p_nada_")
	private String nada_;
	@RParam(rParamName = "p_data_inicio_gerir_tarefa")
	private String data_inicio_gerir_tarefa;
	@RParam(rParamName = "p_data_fim_gerir_tarefa")
	private String data_fim_gerir_tarefa;
	@RParam(rParamName = "p_tipo_processo_colaborador")
	private String tipo_processo_colaborador;
	@RParam(rParamName = "p_numero_processo_colaborador")
	private String numero_processo_colaborador;
	@RParam(rParamName = "p_prioridade_colaborador")
	private String prioridade_colaborador;
	@RParam(rParamName = "p_tipo_etapa_colaborador")
	private String tipo_etapa_colaborador;
	@RParam(rParamName = "p_nada2_")
	private String nada2_;
	@RParam(rParamName = "p_data_inicio_colaborador")
	private String data_inicio_colaborador;
	@RParam(rParamName = "p_data_fim_colaborador")
	private String data_fim_colaborador;
	@RParam(rParamName = "p_tipo_processo_estatistica")
	private String tipo_processo_estatistica;
	@RParam(rParamName = "p_numero_processo_estatistica")
	private String numero_processo_estatistica;
	@RParam(rParamName = "p_prioridade_estatistica")
	private String prioridade_estatistica;
	@RParam(rParamName = "p_estado_estatistica")
	private String estado_estatistica;
	@RParam(rParamName = "p_nada4")
	private String nada4;
	@RParam(rParamName = "p_data_inicio_estatistica")
	private String data_inicio_estatistica;
	@RParam(rParamName = "p_data_fim_estatistica")
	private String data_fim_estatistica;
	
	private List<Table_disponiveis> table_disponiveis = new ArrayList<>();	
	public void setTable_disponiveis(List<Table_disponiveis> table_disponiveis){
		this.table_disponiveis = table_disponiveis;
	}
	public List<Table_disponiveis> getTable_disponiveis(){
		return this.table_disponiveis;
	}
	@RParam(rParamName = "p_table_disponiveis_id")
	private String[] p_table_disponiveis_id;
	@RParam(rParamName = "p_table_disponiveis_del")
	private String[] p_table_disponiveis_del;
	
	public void setP_table_disponiveis_id(String[] p_table_disponiveis_id){
		this.p_table_disponiveis_id = p_table_disponiveis_id;
	}
	public String[] getP_table_disponiveis_id(){
		return this.p_table_disponiveis_id;
	}
	
	public void setP_table_disponiveis_del(String[] p_table_disponiveis_del){
		this.p_table_disponiveis_del = p_table_disponiveis_del;
	}
	public String[] getP_table_disponiveis_del(){
		return this.p_table_disponiveis_del;
	}
	
	private List<Table__colaboradores> table__colaboradores = new ArrayList<>();	
	public void setTable__colaboradores(List<Table__colaboradores> table__colaboradores){
		this.table__colaboradores = table__colaboradores;
	}
	public List<Table__colaboradores> getTable__colaboradores(){
		return this.table__colaboradores;
	}
	@RParam(rParamName = "p_table__colaboradores_id")
	private String[] p_table__colaboradores_id;
	@RParam(rParamName = "p_table__colaboradores_del")
	private String[] p_table__colaboradores_del;
	
	public void setP_table__colaboradores_id(String[] p_table__colaboradores_id){
		this.p_table__colaboradores_id = p_table__colaboradores_id;
	}
	public String[] getP_table__colaboradores_id(){
		return this.p_table__colaboradores_id;
	}
	
	public void setP_table__colaboradores_del(String[] p_table__colaboradores_del){
		this.p_table__colaboradores_del = p_table__colaboradores_del;
	}
	public String[] getP_table__colaboradores_del(){
		return this.p_table__colaboradores_del;
	}
	
	private List<Table_estatistica> table_estatistica = new ArrayList<>();	
	public void setTable_estatistica(List<Table_estatistica> table_estatistica){
		this.table_estatistica = table_estatistica;
	}
	public List<Table_estatistica> getTable_estatistica(){
		return this.table_estatistica;
	}
	@RParam(rParamName = "p_table_estatistica_id")
	private String[] p_table_estatistica_id;
	@RParam(rParamName = "p_table_estatistica_del")
	private String[] p_table_estatistica_del;
	
	public void setP_table_estatistica_id(String[] p_table_estatistica_id){
		this.p_table_estatistica_id = p_table_estatistica_id;
	}
	public String[] getP_table_estatistica_id(){
		return this.p_table_estatistica_id;
	}
	
	public void setP_table_estatistica_del(String[] p_table_estatistica_del){
		this.p_table_estatistica_del = p_table_estatistica_del;
	}
	public String[] getP_table_estatistica_del(){
		return this.p_table_estatistica_del;
	}
	
	private List<Table_minhas_tarefas> table_minhas_tarefas = new ArrayList<>();	
	public void setTable_minhas_tarefas(List<Table_minhas_tarefas> table_minhas_tarefas){
		this.table_minhas_tarefas = table_minhas_tarefas;
	}
	public List<Table_minhas_tarefas> getTable_minhas_tarefas(){
		return this.table_minhas_tarefas;
	}
	@RParam(rParamName = "p_table_minhas_tarefas_id")
	private String[] p_table_minhas_tarefas_id;
	@RParam(rParamName = "p_table_minhas_tarefas_del")
	private String[] p_table_minhas_tarefas_del;
	
	public void setP_table_minhas_tarefas_id(String[] p_table_minhas_tarefas_id){
		this.p_table_minhas_tarefas_id = p_table_minhas_tarefas_id;
	}
	public String[] getP_table_minhas_tarefas_id(){
		return this.p_table_minhas_tarefas_id;
	}
	
	public void setP_table_minhas_tarefas_del(String[] p_table_minhas_tarefas_del){
		this.p_table_minhas_tarefas_del = p_table_minhas_tarefas_del;
	}
	public String[] getP_table_minhas_tarefas_del(){
		return this.p_table_minhas_tarefas_del;
	}
	
	private List<Table_gerir_tarefas> table_gerir_tarefas = new ArrayList<>();	
	public void setTable_gerir_tarefas(List<Table_gerir_tarefas> table_gerir_tarefas){
		this.table_gerir_tarefas = table_gerir_tarefas;
	}
	public List<Table_gerir_tarefas> getTable_gerir_tarefas(){
		return this.table_gerir_tarefas;
	}
	@RParam(rParamName = "p_table_gerir_tarefas_id")
	private String[] p_table_gerir_tarefas_id;
	@RParam(rParamName = "p_table_gerir_tarefas_del")
	private String[] p_table_gerir_tarefas_del;
	
	public void setP_table_gerir_tarefas_id(String[] p_table_gerir_tarefas_id){
		this.p_table_gerir_tarefas_id = p_table_gerir_tarefas_id;
	}
	public String[] getP_table_gerir_tarefas_id(){
		return this.p_table_gerir_tarefas_id;
	}
	
	public void setP_table_gerir_tarefas_del(String[] p_table_gerir_tarefas_del){
		this.p_table_gerir_tarefas_del = p_table_gerir_tarefas_del;
	}
	public String[] getP_table_gerir_tarefas_del(){
		return this.p_table_gerir_tarefas_del;
	}
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setDisponiveis(String disponiveis){
		this.disponiveis = disponiveis;
	}
	public String getDisponiveis(){
		return this.disponiveis;
	}
	
	public void setMinhas_tarefas(String minhas_tarefas){
		this.minhas_tarefas = minhas_tarefas;
	}
	public String getMinhas_tarefas(){
		return this.minhas_tarefas;
	}
	
	public void setEstatistica(String estatistica){
		this.estatistica = estatistica;
	}
	public String getEstatistica(){
		return this.estatistica;
	}
	
	public void setGerir_tarefas(String gerir_tarefas){
		this.gerir_tarefas = gerir_tarefas;
	}
	public String getGerir_tarefas(){
		return this.gerir_tarefas;
	}
	
	public void setColaboradores(String colaboradores){
		this.colaboradores = colaboradores;
	}
	public String getColaboradores(){
		return this.colaboradores;
	}
	
	public void setTipo_processo_form_disponiveis(String tipo_processo_form_disponiveis){
		this.tipo_processo_form_disponiveis = tipo_processo_form_disponiveis;
	}
	public String getTipo_processo_form_disponiveis(){
		return this.tipo_processo_form_disponiveis;
	}
	
	public void setNumero_processo_form_disponiveis(String numero_processo_form_disponiveis){
		this.numero_processo_form_disponiveis = numero_processo_form_disponiveis;
	}
	public String getNumero_processo_form_disponiveis(){
		return this.numero_processo_form_disponiveis;
	}
	
	public void setPrioridade_form_disponiveis(String prioridade_form_disponiveis){
		this.prioridade_form_disponiveis = prioridade_form_disponiveis;
	}
	public String getPrioridade_form_disponiveis(){
		return this.prioridade_form_disponiveis;
	}
	
	public void setNada5(String nada5){
		this.nada5 = nada5;
	}
	public String getNada5(){
		return this.nada5;
	}
	
	public void setData_inicio_form_disponiveis(String data_inicio_form_disponiveis){
		this.data_inicio_form_disponiveis = data_inicio_form_disponiveis;
	}
	public String getData_inicio_form_disponiveis(){
		return this.data_inicio_form_disponiveis;
	}
	
	public void setData_fim_form_disponiveis(String data_fim_form_disponiveis){
		this.data_fim_form_disponiveis = data_fim_form_disponiveis;
	}
	public String getData_fim_form_disponiveis(){
		return this.data_fim_form_disponiveis;
	}
	
	public void setTipo_processo_minhas_tarefas(String tipo_processo_minhas_tarefas){
		this.tipo_processo_minhas_tarefas = tipo_processo_minhas_tarefas;
	}
	public String getTipo_processo_minhas_tarefas(){
		return this.tipo_processo_minhas_tarefas;
	}
	
	public void setNumero_processo_minhas_tarefas(String numero_processo_minhas_tarefas){
		this.numero_processo_minhas_tarefas = numero_processo_minhas_tarefas;
	}
	public String getNumero_processo_minhas_tarefas(){
		return this.numero_processo_minhas_tarefas;
	}
	
	public void setPrioridade_minhas_tarefas(String prioridade_minhas_tarefas){
		this.prioridade_minhas_tarefas = prioridade_minhas_tarefas;
	}
	public String getPrioridade_minhas_tarefas(){
		return this.prioridade_minhas_tarefas;
	}
	
	public void setNada3_(String nada3_){
		this.nada3_ = nada3_;
	}
	public String getNada3_(){
		return this.nada3_;
	}
	
	public void setData_inicio_minhas_tarefas(String data_inicio_minhas_tarefas){
		this.data_inicio_minhas_tarefas = data_inicio_minhas_tarefas;
	}
	public String getData_inicio_minhas_tarefas(){
		return this.data_inicio_minhas_tarefas;
	}
	
	public void setData_fim_minhas_tarefas(String data_fim_minhas_tarefas){
		this.data_fim_minhas_tarefas = data_fim_minhas_tarefas;
	}
	public String getData_fim_minhas_tarefas(){
		return this.data_fim_minhas_tarefas;
	}
	
	public void setN_tarefas_cocluidas_view_estatistica(String n_tarefas_cocluidas_view_estatistica){
		this.n_tarefas_cocluidas_view_estatistica = n_tarefas_cocluidas_view_estatistica;
	}
	public String getN_tarefas_cocluidas_view_estatistica(){
		return this.n_tarefas_cocluidas_view_estatistica;
	}
	
	public void setN_tarefas_pendentes_view_estatistica(String n_tarefas_pendentes_view_estatistica){
		this.n_tarefas_pendentes_view_estatistica = n_tarefas_pendentes_view_estatistica;
	}
	public String getN_tarefas_pendentes_view_estatistica(){
		return this.n_tarefas_pendentes_view_estatistica;
	}
	
	public void setN_atendimento_dia_view_estatistica(String n_atendimento_dia_view_estatistica){
		this.n_atendimento_dia_view_estatistica = n_atendimento_dia_view_estatistica;
	}
	public String getN_atendimento_dia_view_estatistica(){
		return this.n_atendimento_dia_view_estatistica;
	}
	
	public void setMedia_tempo_view_estatistica(String media_tempo_view_estatistica){
		this.media_tempo_view_estatistica = media_tempo_view_estatistica;
	}
	public String getMedia_tempo_view_estatistica(){
		return this.media_tempo_view_estatistica;
	}
	
	public void setView_estatistica_img(String view_estatistica_img){
		this.view_estatistica_img = view_estatistica_img;
	}
	public String getView_estatistica_img(){
		return this.view_estatistica_img;
	}
	
	public void setTipo_processo_gerir_tarefa(String tipo_processo_gerir_tarefa){
		this.tipo_processo_gerir_tarefa = tipo_processo_gerir_tarefa;
	}
	public String getTipo_processo_gerir_tarefa(){
		return this.tipo_processo_gerir_tarefa;
	}
	
	public void setNumero_processo_gerir_tarefa(String numero_processo_gerir_tarefa){
		this.numero_processo_gerir_tarefa = numero_processo_gerir_tarefa;
	}
	public String getNumero_processo_gerir_tarefa(){
		return this.numero_processo_gerir_tarefa;
	}
	
	public void setPrioridade_gerir_tarefa(String prioridade_gerir_tarefa){
		this.prioridade_gerir_tarefa = prioridade_gerir_tarefa;
	}
	public String getPrioridade_gerir_tarefa(){
		return this.prioridade_gerir_tarefa;
	}
	
	public void setNada_(String nada_){
		this.nada_ = nada_;
	}
	public String getNada_(){
		return this.nada_;
	}
	
	public void setData_inicio_gerir_tarefa(String data_inicio_gerir_tarefa){
		this.data_inicio_gerir_tarefa = data_inicio_gerir_tarefa;
	}
	public String getData_inicio_gerir_tarefa(){
		return this.data_inicio_gerir_tarefa;
	}
	
	public void setData_fim_gerir_tarefa(String data_fim_gerir_tarefa){
		this.data_fim_gerir_tarefa = data_fim_gerir_tarefa;
	}
	public String getData_fim_gerir_tarefa(){
		return this.data_fim_gerir_tarefa;
	}
	
	public void setTipo_processo_colaborador(String tipo_processo_colaborador){
		this.tipo_processo_colaborador = tipo_processo_colaborador;
	}
	public String getTipo_processo_colaborador(){
		return this.tipo_processo_colaborador;
	}
	
	public void setNumero_processo_colaborador(String numero_processo_colaborador){
		this.numero_processo_colaborador = numero_processo_colaborador;
	}
	public String getNumero_processo_colaborador(){
		return this.numero_processo_colaborador;
	}
	
	public void setPrioridade_colaborador(String prioridade_colaborador){
		this.prioridade_colaborador = prioridade_colaborador;
	}
	public String getPrioridade_colaborador(){
		return this.prioridade_colaborador;
	}
	
	public void setTipo_etapa_colaborador(String tipo_etapa_colaborador){
		this.tipo_etapa_colaborador = tipo_etapa_colaborador;
	}
	public String getTipo_etapa_colaborador(){
		return this.tipo_etapa_colaborador;
	}
	
	public void setNada2_(String nada2_){
		this.nada2_ = nada2_;
	}
	public String getNada2_(){
		return this.nada2_;
	}
	
	public void setData_inicio_colaborador(String data_inicio_colaborador){
		this.data_inicio_colaborador = data_inicio_colaborador;
	}
	public String getData_inicio_colaborador(){
		return this.data_inicio_colaborador;
	}
	
	public void setData_fim_colaborador(String data_fim_colaborador){
		this.data_fim_colaborador = data_fim_colaborador;
	}
	public String getData_fim_colaborador(){
		return this.data_fim_colaborador;
	}
	
	public void setTipo_processo_estatistica(String tipo_processo_estatistica){
		this.tipo_processo_estatistica = tipo_processo_estatistica;
	}
	public String getTipo_processo_estatistica(){
		return this.tipo_processo_estatistica;
	}
	
	public void setNumero_processo_estatistica(String numero_processo_estatistica){
		this.numero_processo_estatistica = numero_processo_estatistica;
	}
	public String getNumero_processo_estatistica(){
		return this.numero_processo_estatistica;
	}
	
	public void setPrioridade_estatistica(String prioridade_estatistica){
		this.prioridade_estatistica = prioridade_estatistica;
	}
	public String getPrioridade_estatistica(){
		return this.prioridade_estatistica;
	}
	
	public void setEstado_estatistica(String estado_estatistica){
		this.estado_estatistica = estado_estatistica;
	}
	public String getEstado_estatistica(){
		return this.estado_estatistica;
	}
	
	public void setNada4(String nada4){
		this.nada4 = nada4;
	}
	public String getNada4(){
		return this.nada4;
	}
	
	public void setData_inicio_estatistica(String data_inicio_estatistica){
		this.data_inicio_estatistica = data_inicio_estatistica;
	}
	public String getData_inicio_estatistica(){
		return this.data_inicio_estatistica;
	}
	
	public void setData_fim_estatistica(String data_fim_estatistica){
		this.data_fim_estatistica = data_fim_estatistica;
	}
	public String getData_fim_estatistica(){
		return this.data_fim_estatistica;
	}


	public static class Table_disponiveis extends IGRPTable.Table{
		private String n_tarefa_d;
		private String tarefas_tabela_disponiveis;
		private String categorias_processo_tabela_disponiveis;
		private String data_entrada_tabela_disponiveis;
		private String data_fim_d;
		private String p_id_d;
		public void setN_tarefa_d(String n_tarefa_d){
			this.n_tarefa_d = n_tarefa_d;
		}
		public String getN_tarefa_d(){
			return this.n_tarefa_d;
		}

		public void setTarefas_tabela_disponiveis(String tarefas_tabela_disponiveis){
			this.tarefas_tabela_disponiveis = tarefas_tabela_disponiveis;
		}
		public String getTarefas_tabela_disponiveis(){
			return this.tarefas_tabela_disponiveis;
		}

		public void setCategorias_processo_tabela_disponiveis(String categorias_processo_tabela_disponiveis){
			this.categorias_processo_tabela_disponiveis = categorias_processo_tabela_disponiveis;
		}
		public String getCategorias_processo_tabela_disponiveis(){
			return this.categorias_processo_tabela_disponiveis;
		}

		public void setData_entrada_tabela_disponiveis(String data_entrada_tabela_disponiveis){
			this.data_entrada_tabela_disponiveis = data_entrada_tabela_disponiveis;
		}
		public String getData_entrada_tabela_disponiveis(){
			return this.data_entrada_tabela_disponiveis;
		}

		public void setData_fim_d(String data_fim_d){
			this.data_fim_d = data_fim_d;
		}
		public String getData_fim_d(){
			return this.data_fim_d;
		}

		public void setP_id_d(String p_id_d){
			this.p_id_d = p_id_d;
		}
		public String getP_id_d(){
			return this.p_id_d;
		}

	}
	public static class Table__colaboradores extends IGRPTable.Table{
		private String nome_colab_tabela;
		private String contacto_colab_tabela;
		private String n_tarefas_colab_tabela;
		private String n_atendimento_colab_tabela;
		private String media_tempo_colab_tabela;
		private String ranking_colab_tabela;
		private String percentagem_colab_tabela;
		private String foto_colab_tabela;
		private String param_colab_tabela;
		private String p_id_c;
		public void setNome_colab_tabela(String nome_colab_tabela){
			this.nome_colab_tabela = nome_colab_tabela;
		}
		public String getNome_colab_tabela(){
			return this.nome_colab_tabela;
		}

		public void setContacto_colab_tabela(String contacto_colab_tabela){
			this.contacto_colab_tabela = contacto_colab_tabela;
		}
		public String getContacto_colab_tabela(){
			return this.contacto_colab_tabela;
		}

		public void setN_tarefas_colab_tabela(String n_tarefas_colab_tabela){
			this.n_tarefas_colab_tabela = n_tarefas_colab_tabela;
		}
		public String getN_tarefas_colab_tabela(){
			return this.n_tarefas_colab_tabela;
		}

		public void setN_atendimento_colab_tabela(String n_atendimento_colab_tabela){
			this.n_atendimento_colab_tabela = n_atendimento_colab_tabela;
		}
		public String getN_atendimento_colab_tabela(){
			return this.n_atendimento_colab_tabela;
		}

		public void setMedia_tempo_colab_tabela(String media_tempo_colab_tabela){
			this.media_tempo_colab_tabela = media_tempo_colab_tabela;
		}
		public String getMedia_tempo_colab_tabela(){
			return this.media_tempo_colab_tabela;
		}

		public void setRanking_colab_tabela(String ranking_colab_tabela){
			this.ranking_colab_tabela = ranking_colab_tabela;
		}
		public String getRanking_colab_tabela(){
			return this.ranking_colab_tabela;
		}

		public void setPercentagem_colab_tabela(String percentagem_colab_tabela){
			this.percentagem_colab_tabela = percentagem_colab_tabela;
		}
		public String getPercentagem_colab_tabela(){
			return this.percentagem_colab_tabela;
		}

		public void setFoto_colab_tabela(String foto_colab_tabela){
			this.foto_colab_tabela = foto_colab_tabela;
		}
		public String getFoto_colab_tabela(){
			return this.foto_colab_tabela;
		}

		public void setParam_colab_tabela(String param_colab_tabela){
			this.param_colab_tabela = param_colab_tabela;
		}
		public String getParam_colab_tabela(){
			return this.param_colab_tabela;
		}

		public void setP_id_c(String p_id_c){
			this.p_id_c = p_id_c;
		}
		public String getP_id_c(){
			return this.p_id_c;
		}

	}
	public static class Table_estatistica extends IGRPTable.Table{
		private String n_processo_estat_tabela;
		private String tipo_estatistica_tabela;
		private String desc_tarefa_estat_tabela;
		private String data_entrada_estat_tabela;
		private String data_conclusao_estat_tabela;
		private String p_id_e;
		public void setN_processo_estat_tabela(String n_processo_estat_tabela){
			this.n_processo_estat_tabela = n_processo_estat_tabela;
		}
		public String getN_processo_estat_tabela(){
			return this.n_processo_estat_tabela;
		}

		public void setTipo_estatistica_tabela(String tipo_estatistica_tabela){
			this.tipo_estatistica_tabela = tipo_estatistica_tabela;
		}
		public String getTipo_estatistica_tabela(){
			return this.tipo_estatistica_tabela;
		}

		public void setDesc_tarefa_estat_tabela(String desc_tarefa_estat_tabela){
			this.desc_tarefa_estat_tabela = desc_tarefa_estat_tabela;
		}
		public String getDesc_tarefa_estat_tabela(){
			return this.desc_tarefa_estat_tabela;
		}

		public void setData_entrada_estat_tabela(String data_entrada_estat_tabela){
			this.data_entrada_estat_tabela = data_entrada_estat_tabela;
		}
		public String getData_entrada_estat_tabela(){
			return this.data_entrada_estat_tabela;
		}

		public void setData_conclusao_estat_tabela(String data_conclusao_estat_tabela){
			this.data_conclusao_estat_tabela = data_conclusao_estat_tabela;
		}
		public String getData_conclusao_estat_tabela(){
			return this.data_conclusao_estat_tabela;
		}

		public void setP_id_e(String p_id_e){
			this.p_id_e = p_id_e;
		}
		public String getP_id_e(){
			return this.p_id_e;
		}

	}
	public static class Table_minhas_tarefas extends IGRPTable.Table{
		private String n_tarefa_m;
		private String tipo_tabela_minhas_tarefas;
		private String desc_tarefa_tabela_minhas_tarefas;
		private String atribuido_por_tabela_minhas_tarefas;
		private String data_entrada_tabela_minhas_tarefas;
		private String data_fim_m;
		private String espera_tabela_minhas_tarefas;
		private String id;
		public void setN_tarefa_m(String n_tarefa_m){
			this.n_tarefa_m = n_tarefa_m;
		}
		public String getN_tarefa_m(){
			return this.n_tarefa_m;
		}

		public void setTipo_tabela_minhas_tarefas(String tipo_tabela_minhas_tarefas){
			this.tipo_tabela_minhas_tarefas = tipo_tabela_minhas_tarefas;
		}
		public String getTipo_tabela_minhas_tarefas(){
			return this.tipo_tabela_minhas_tarefas;
		}

		public void setDesc_tarefa_tabela_minhas_tarefas(String desc_tarefa_tabela_minhas_tarefas){
			this.desc_tarefa_tabela_minhas_tarefas = desc_tarefa_tabela_minhas_tarefas;
		}
		public String getDesc_tarefa_tabela_minhas_tarefas(){
			return this.desc_tarefa_tabela_minhas_tarefas;
		}

		public void setAtribuido_por_tabela_minhas_tarefas(String atribuido_por_tabela_minhas_tarefas){
			this.atribuido_por_tabela_minhas_tarefas = atribuido_por_tabela_minhas_tarefas;
		}
		public String getAtribuido_por_tabela_minhas_tarefas(){
			return this.atribuido_por_tabela_minhas_tarefas;
		}

		public void setData_entrada_tabela_minhas_tarefas(String data_entrada_tabela_minhas_tarefas){
			this.data_entrada_tabela_minhas_tarefas = data_entrada_tabela_minhas_tarefas;
		}
		public String getData_entrada_tabela_minhas_tarefas(){
			return this.data_entrada_tabela_minhas_tarefas;
		}

		public void setData_fim_m(String data_fim_m){
			this.data_fim_m = data_fim_m;
		}
		public String getData_fim_m(){
			return this.data_fim_m;
		}

		public void setEspera_tabela_minhas_tarefas(String espera_tabela_minhas_tarefas){
			this.espera_tabela_minhas_tarefas = espera_tabela_minhas_tarefas;
		}
		public String getEspera_tabela_minhas_tarefas(){
			return this.espera_tabela_minhas_tarefas;
		}

		public void setId(String id){
			this.id = id;
		}
		public String getId(){
			return this.id;
		}

	}
	public static class Table_gerir_tarefas extends IGRPTable.Table{
		private String numero_processo_tabela;
		private String n_tarefa_g;
		private String tipo;
		private String desc_tarefa;
		private String atribuido_por;
		private String atribuido_a;
		private String data_entrada;
		private String data_fim_g;
		private String p_id_g;
		public void setNumero_processo_tabela(String numero_processo_tabela){
			this.numero_processo_tabela = numero_processo_tabela;
		}
		public String getNumero_processo_tabela(){
			return this.numero_processo_tabela;
		}

		public void setN_tarefa_g(String n_tarefa_g){
			this.n_tarefa_g = n_tarefa_g;
		}
		public String getN_tarefa_g(){
			return this.n_tarefa_g;
		}

		public void setTipo(String tipo){
			this.tipo = tipo;
		}
		public String getTipo(){
			return this.tipo;
		}

		public void setDesc_tarefa(String desc_tarefa){
			this.desc_tarefa = desc_tarefa;
		}
		public String getDesc_tarefa(){
			return this.desc_tarefa;
		}

		public void setAtribuido_por(String atribuido_por){
			this.atribuido_por = atribuido_por;
		}
		public String getAtribuido_por(){
			return this.atribuido_por;
		}

		public void setAtribuido_a(String atribuido_a){
			this.atribuido_a = atribuido_a;
		}
		public String getAtribuido_a(){
			return this.atribuido_a;
		}

		public void setData_entrada(String data_entrada){
			this.data_entrada = data_entrada;
		}
		public String getData_entrada(){
			return this.data_entrada;
		}

		public void setData_fim_g(String data_fim_g){
			this.data_fim_g = data_fim_g;
		}
		public String getData_fim_g(){
			return this.data_fim_g;
		}

		public void setP_id_g(String p_id_g){
			this.p_id_g = p_id_g;
		}
		public String getP_id_g(){
			return this.p_id_g;
		}

	}

	public void loadTable_disponiveis(BaseQueryInterface query) {
		this.setTable_disponiveis(this.loadTable(query,Table_disponiveis.class));
	}

	public void loadTable__colaboradores(BaseQueryInterface query) {
		this.setTable__colaboradores(this.loadTable(query,Table__colaboradores.class));
	}

	public void loadTable_estatistica(BaseQueryInterface query) {
		this.setTable_estatistica(this.loadTable(query,Table_estatistica.class));
	}

	public void loadTable_minhas_tarefas(BaseQueryInterface query) {
		this.setTable_minhas_tarefas(this.loadTable(query,Table_minhas_tarefas.class));
	}

	public void loadTable_gerir_tarefas(BaseQueryInterface query) {
		this.setTable_gerir_tarefas(this.loadTable(query,Table_gerir_tarefas.class));
	}

}
