/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.execucaotarefas;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class ExecucaoTarefasView extends View {
	
	
	public Field sectionheader_1_text;
	public Field gerir_tarefas;
	public Field colaboradores;
	public Field estatistica;
	public Field minhas_tarefas;
	public Field disponiveis;
	public Field organica_gerir_tarefa;
	public Field numero_processo_gerir_tarefa;
	public Field tipo_processo_gerir_tarefa;
	public Field data_inicio_gerir_tarefa;
	public Field data_fim_gerir_tarefa;
	public Field prioridade_gerir_tarefa;
	public Field pesquisa_gerir_tarefa;
	public Field organica_colaborador;
	public Field numero_processo_colaborador;
	public Field tipo_processo_colaborador;
	public Field tipo_etapa_colaborador;
	public Field data_inicio_colaborador;
	public Field data_fim_colaborador;
	public Field prioridade_colaborador;
	public Field n_tarefas_cocluidas_view_estatistica;
	public Field n_tarefas_pendentes_view_estatistica;
	public Field n_atendimento_dia_view_estatistica;
	public Field media_tempo_view_estatistica;
	public Field posicao_ranking_view_estatistica;
	public Field view_estatistica_img;
	public Field organica_minhas_tarefas;
	public Field numero_processo_minhas_tarefas;
	public Field tipo_processo_minhas_tarefas;
	public Field data_inicio_minhas_tarefas;
	public Field data_fim_minhas_tarefas;
	public Field prioridade_minhas_tarefas;
	public Field pesquisa_minhas_tarefas;
	public Field organica_form_disponiveis;
	public Field numero_processo_form_disponiveis;
	public Field tipo_processo_form_disponiveis;
	public Field data_inicio_form_disponiveis;
	public Field data_fim_form_disponiveis;
	public Field prioridade_form_disponiveis;
	public Field pesquisar_form_disponiveis;
	public Field data_inicio_estatistica;
	public Field data_fim_estatistica;
	public Field numero_processo_estatistica;
	public Field prioridade_estatistica;
	public Field tipo_processo_estatistica;
	public Field estado_estatistica;
	public Field n_processo_estat_tabela;
	public Field tipo_estatistica_tabela;
	public Field desc_tarefa_estat_tabela;
	public Field data_entrada_estat_tabela;
	public Field data_conclusao_estat_tabela;
	public Field numero_processo_tabela;
	public Field tipo;
	public Field desc_tarefa;
	public Field atribuido_por;
	public Field atribuido_a;
	public Field data_entrada;
	public Field tarefas_tabela_disponiveis;
	public Field categorias_processo_tabela_disponiveis;
	public Field data_entrada_tabela_disponiveis;
	public Field nome_colab_tabela;
	public Field contacto_colab_tabela;
	public Field n_tarefas_colab_tabela;
	public Field n_atendimento_colab_tabela;
	public Field media_tempo_colab_tabela;
	public Field ranking_colab_tabela;
	public Field percentagem_colab_tabela;
	public Field foto_colab_tabela;
	public Field param_colab_tabela;
	public Field tipo_tabela_minhas_tarefas;
	public Field desc_tarefa_tabela_minhas_tarefas;
	public Field atribuido_por_tabela_minhas_tarefas;
	public Field data_entrada_tabela_minhas_tarefas;
	public Field espera_tabela_minhas_tarefas;
	public IGRPSectionHeader sectionheader_1;
	public IGRPTabContent tabcontent_1;
	public IGRPForm form_gerir_tarefa;
	public IGRPForm form_colaboradores;
	public IGRPView view_estatistica;
	public IGRPForm form_minhas_tarefas;
	public IGRPForm form_disponiveis;
	public IGRPForm form_estatistica;
	public IGRPTable table_estatistica;
	public IGRPTable table_gerir_tarefas;
	public IGRPTable table_disponiveis;
	public IGRPTable table__colaboradores;
	public IGRPTable table_minhas_tarefas;

	public IGRPButton btn_pesquisar_tarefa;
	public IGRPButton btn_pesquisar_colaborador;
	public IGRPButton btn_pesquisar_button_minhas_tarefas;
	public IGRPButton btn_pesquisar_button_disponiveis;
	public IGRPButton btn_pesquisar_estatistica;
	public IGRPButton btn_transferir_tarefa;
	public IGRPButton btn_detalhes_tarefa;
	public IGRPButton btn_detalhes_processo;
	public IGRPButton btn_alterar_prioridade_tarefa;
	public IGRPButton btn_assumir_button_tabela;
	public IGRPButton btn_ver_estatistica;
	public IGRPButton btn_ver_detalhes;
	public IGRPButton btn_enviar_msg;
	public IGRPButton btn_executar_button_minha_tarefas;
	public IGRPButton btn_detalhes_processos_button_minha_tarefas;
	public IGRPButton btn_leberar_tarefa_button_minha_tarefas;
	public Field p_id;
	public ExecucaoTarefasView(ExecucaoTarefas model){
		this.setPageTitle("Execucao Tarefas");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");
		tabcontent_1 = new IGRPTabContent("tabcontent_1","");
		form_gerir_tarefa = new IGRPForm("form_gerir_tarefa","");
		form_colaboradores = new IGRPForm("form_colaboradores","");
		view_estatistica = new IGRPView("view_estatistica","");
		form_minhas_tarefas = new IGRPForm("form_minhas_tarefas","");
		form_disponiveis = new IGRPForm("form_disponiveis","");
		form_estatistica = new IGRPForm("form_estatistica","");
		table_estatistica = new IGRPTable("table_estatistica","");
		table_gerir_tarefas = new IGRPTable("table_gerir_tarefas","");
		table_disponiveis = new IGRPTable("table_disponiveis","");
		table__colaboradores = new IGRPTable("table__colaboradores","");
		table_minhas_tarefas = new IGRPTable("table_minhas_tarefas","");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel("");
		
		sectionheader_1_text.setValue("Distribuição de Tarefas");
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		gerir_tarefas = new TextField(model,"gerir_tarefas");
		gerir_tarefas.setLabel("Gerir Tarefas");
		
		gerir_tarefas.propertie().add("name","p_gerir_tarefas").add("type","button").add("target_fields","").add("closerefresh","false").add("iconColor","#333").add("iconClass","").add("img","fa-tasks").add("maxlength","50");
		colaboradores = new TextField(model,"colaboradores");
		colaboradores.setLabel("Colaboradores");
		
		colaboradores.propertie().add("name","p_colaboradores").add("type","button").add("target_fields","").add("closerefresh","false").add("iconColor","#333").add("iconClass","").add("img","fa-users").add("maxlength","50");
		estatistica = new TextField(model,"estatistica");
		estatistica.setLabel("Estatística");
		
		estatistica.propertie().add("name","p_estatistica").add("type","button").add("target_fields","").add("closerefresh","false").add("iconColor","#333").add("iconClass","").add("img","fa-line-chart").add("maxlength","50");
		minhas_tarefas = new TextField(model,"minhas_tarefas");
		minhas_tarefas.setLabel("Minhas Tarefas");
		
		minhas_tarefas.propertie().add("name","p_minhas_tarefas").add("type","button").add("target_fields","").add("closerefresh","false").add("iconColor","#333").add("iconClass","").add("img","fa-address-book-o").add("maxlength","50");
		disponiveis = new TextField(model,"disponiveis");
		disponiveis.setLabel("Disponíveis");
		
		disponiveis.propertie().add("name","p_disponiveis").add("type","button").add("target_fields","").add("closerefresh","false").add("iconColor","#333").add("iconClass","").add("img","fa-calendar-check-o").add("maxlength","50");
		organica_gerir_tarefa = new ListField(model,"organica_gerir_tarefa");
		organica_gerir_tarefa.setLabel("Orgânica");
		
		organica_gerir_tarefa.propertie().add("name","p_organica_gerir_tarefa").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		numero_processo_gerir_tarefa = new TextField(model,"numero_processo_gerir_tarefa");
		numero_processo_gerir_tarefa.setLabel("Número Processo");
		
		numero_processo_gerir_tarefa.propertie().add("name","p_numero_processo_gerir_tarefa").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		tipo_processo_gerir_tarefa = new ListField(model,"tipo_processo_gerir_tarefa");
		tipo_processo_gerir_tarefa.setLabel("Tipo Processo");
		
		tipo_processo_gerir_tarefa.propertie().add("name","p_tipo_processo_gerir_tarefa").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		data_inicio_gerir_tarefa = new DateField(model,"data_inicio_gerir_tarefa");
		data_inicio_gerir_tarefa.setLabel("Data inicio");
		
		data_inicio_gerir_tarefa.propertie().add("name","p_data_inicio_gerir_tarefa").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","default");
		data_fim_gerir_tarefa = new DateField(model,"data_fim_gerir_tarefa");
		data_fim_gerir_tarefa.setLabel("Data Fim");
		
		data_fim_gerir_tarefa.propertie().add("name","p_data_fim_gerir_tarefa").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","default");
		prioridade_gerir_tarefa = new ListField(model,"prioridade_gerir_tarefa");
		prioridade_gerir_tarefa.setLabel("Prioridade");
		
		prioridade_gerir_tarefa.propertie().add("name","p_prioridade_gerir_tarefa").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		pesquisa_gerir_tarefa = new TextField(model,"pesquisa_gerir_tarefa");
		pesquisa_gerir_tarefa.setLabel("Pesquisa");
		
		pesquisa_gerir_tarefa.propertie().add("name","p_pesquisa_gerir_tarefa").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		organica_colaborador = new ListField(model,"organica_colaborador");
		organica_colaborador.setLabel("Orgânica");
		
		organica_colaborador.propertie().add("name","p_organica_colaborador").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		numero_processo_colaborador = new TextField(model,"numero_processo_colaborador");
		numero_processo_colaborador.setLabel("Número Processo");
		
		numero_processo_colaborador.propertie().add("name","p_numero_processo_colaborador").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		tipo_processo_colaborador = new ListField(model,"tipo_processo_colaborador");
		tipo_processo_colaborador.setLabel("Tipo Processo");
		
		tipo_processo_colaborador.propertie().add("name","p_tipo_processo_colaborador").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		tipo_etapa_colaborador = new ListField(model,"tipo_etapa_colaborador");
		tipo_etapa_colaborador.setLabel("Tipo Etapa");
		
		tipo_etapa_colaborador.propertie().add("name","p_tipo_etapa_colaborador").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		data_inicio_colaborador = new DateField(model,"data_inicio_colaborador");
		data_inicio_colaborador.setLabel("Data Inicio");
		
		data_inicio_colaborador.propertie().add("name","p_data_inicio_colaborador").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","default");
		data_fim_colaborador = new DateField(model,"data_fim_colaborador");
		data_fim_colaborador.setLabel("Data Fim");
		
		data_fim_colaborador.propertie().add("name","p_data_fim_colaborador").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","default");
		prioridade_colaborador = new ListField(model,"prioridade_colaborador");
		prioridade_colaborador.setLabel("Prioridade");
		
		prioridade_colaborador.propertie().add("name","p_prioridade_colaborador").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		n_tarefas_cocluidas_view_estatistica = new TextField(model,"n_tarefas_cocluidas_view_estatistica");
		n_tarefas_cocluidas_view_estatistica.setLabel("N. Tarefas Cocluidas");
		
		n_tarefas_cocluidas_view_estatistica.propertie().add("name","p_n_tarefas_cocluidas_view_estatistica").add("type","text").add("maxlength","30");
		n_tarefas_pendentes_view_estatistica = new TextField(model,"n_tarefas_pendentes_view_estatistica");
		n_tarefas_pendentes_view_estatistica.setLabel("N. Tarefas Pendentes");
		
		n_tarefas_pendentes_view_estatistica.propertie().add("name","p_n_tarefas_pendentes_view_estatistica").add("type","text").add("maxlength","30");
		n_atendimento_dia_view_estatistica = new TextField(model,"n_atendimento_dia_view_estatistica");
		n_atendimento_dia_view_estatistica.setLabel("N. Atendimento Dia");
		
		n_atendimento_dia_view_estatistica.propertie().add("name","p_n_atendimento_dia_view_estatistica").add("type","text").add("maxlength","30");
		media_tempo_view_estatistica = new TextField(model,"media_tempo_view_estatistica");
		media_tempo_view_estatistica.setLabel("Media Tempo");
		
		media_tempo_view_estatistica.propertie().add("name","p_media_tempo_view_estatistica").add("type","text").add("maxlength","30");
		posicao_ranking_view_estatistica = new TextField(model,"posicao_ranking_view_estatistica");
		posicao_ranking_view_estatistica.setLabel("Posição Ranking");
		
		posicao_ranking_view_estatistica.propertie().add("name","p_posicao_ranking_view_estatistica").add("type","text").add("maxlength","30");
		view_estatistica_img = new TextField(model,"view_estatistica_img");
		view_estatistica_img.setLabel("");
		
		view_estatistica_img.propertie().add("type","text").add("name","p_view_estatistica_img").add("maxlength","300");
		organica_minhas_tarefas = new ListField(model,"organica_minhas_tarefas");
		organica_minhas_tarefas.setLabel("Orgânica");
		
		organica_minhas_tarefas.propertie().add("name","p_organica_minhas_tarefas").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		numero_processo_minhas_tarefas = new TextField(model,"numero_processo_minhas_tarefas");
		numero_processo_minhas_tarefas.setLabel("Número Processo");
		
		numero_processo_minhas_tarefas.propertie().add("name","p_numero_processo_minhas_tarefas").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		tipo_processo_minhas_tarefas = new ListField(model,"tipo_processo_minhas_tarefas");
		tipo_processo_minhas_tarefas.setLabel("Tipo Processo");
		
		tipo_processo_minhas_tarefas.propertie().add("name","p_tipo_processo_minhas_tarefas").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		data_inicio_minhas_tarefas = new DateField(model,"data_inicio_minhas_tarefas");
		data_inicio_minhas_tarefas.setLabel("Data Inicio");
		
		data_inicio_minhas_tarefas.propertie().add("name","p_data_inicio_minhas_tarefas").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","default");
		data_fim_minhas_tarefas = new DateField(model,"data_fim_minhas_tarefas");
		data_fim_minhas_tarefas.setLabel("Data Fim");
		
		data_fim_minhas_tarefas.propertie().add("name","p_data_fim_minhas_tarefas").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","default");
		prioridade_minhas_tarefas = new ListField(model,"prioridade_minhas_tarefas");
		prioridade_minhas_tarefas.setLabel("Prioridade");
		
		prioridade_minhas_tarefas.propertie().add("name","p_prioridade_minhas_tarefas").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		pesquisa_minhas_tarefas = new TextField(model,"pesquisa_minhas_tarefas");
		pesquisa_minhas_tarefas.setLabel("Pesquisa");
		
		pesquisa_minhas_tarefas.propertie().add("name","p_pesquisa_minhas_tarefas").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		organica_form_disponiveis = new ListField(model,"organica_form_disponiveis");
		organica_form_disponiveis.setLabel("Orgânica");
		
		organica_form_disponiveis.propertie().add("name","p_organica_form_disponiveis").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		numero_processo_form_disponiveis = new TextField(model,"numero_processo_form_disponiveis");
		numero_processo_form_disponiveis.setLabel("Número Processo");
		
		numero_processo_form_disponiveis.propertie().add("name","p_numero_processo_form_disponiveis").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		tipo_processo_form_disponiveis = new ListField(model,"tipo_processo_form_disponiveis");
		tipo_processo_form_disponiveis.setLabel("Tipo Processo");
		
		tipo_processo_form_disponiveis.propertie().add("name","p_tipo_processo_form_disponiveis").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		data_inicio_form_disponiveis = new DateField(model,"data_inicio_form_disponiveis");
		data_inicio_form_disponiveis.setLabel("Data Inicio");
		
		data_inicio_form_disponiveis.propertie().add("name","p_data_inicio_form_disponiveis").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","default");
		data_fim_form_disponiveis = new DateField(model,"data_fim_form_disponiveis");
		data_fim_form_disponiveis.setLabel("Data Fim");
		
		data_fim_form_disponiveis.propertie().add("name","p_data_fim_form_disponiveis").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","default");
		prioridade_form_disponiveis = new ListField(model,"prioridade_form_disponiveis");
		prioridade_form_disponiveis.setLabel("Prioridade");
		
		prioridade_form_disponiveis.propertie().add("name","p_prioridade_form_disponiveis").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		pesquisar_form_disponiveis = new TextField(model,"pesquisar_form_disponiveis");
		pesquisar_form_disponiveis.setLabel("Pesquisar");
		
		pesquisar_form_disponiveis.propertie().add("name","p_pesquisar_form_disponiveis").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		data_inicio_estatistica = new DateField(model,"data_inicio_estatistica");
		data_inicio_estatistica.setLabel("Data Inicio");
		
		data_inicio_estatistica.propertie().add("name","p_data_inicio_estatistica").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","default");
		data_fim_estatistica = new DateField(model,"data_fim_estatistica");
		data_fim_estatistica.setLabel("Data Fim");
		
		data_fim_estatistica.propertie().add("name","p_data_fim_estatistica").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","default");
		numero_processo_estatistica = new TextField(model,"numero_processo_estatistica");
		numero_processo_estatistica.setLabel("Número Processo");
		
		numero_processo_estatistica.propertie().add("name","p_numero_processo_estatistica").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		prioridade_estatistica = new ListField(model,"prioridade_estatistica");
		prioridade_estatistica.setLabel("Prioridade");
		
		prioridade_estatistica.propertie().add("name","p_prioridade_estatistica").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		tipo_processo_estatistica = new ListField(model,"tipo_processo_estatistica");
		tipo_processo_estatistica.setLabel("Tipo Processo");
		
		tipo_processo_estatistica.propertie().add("name","p_tipo_processo_estatistica").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		estado_estatistica = new ListField(model,"estado_estatistica");
		estado_estatistica.setLabel("Estado");
		
		estado_estatistica.propertie().add("name","p_estado_estatistica").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		n_processo_estat_tabela = new TextField(model,"n_processo_estat_tabela");
		n_processo_estat_tabela.setLabel("N. Processo");
		
		n_processo_estat_tabela.propertie().add("name","p_n_processo_estat_tabela").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		tipo_estatistica_tabela = new TextField(model,"tipo_estatistica_tabela");
		tipo_estatistica_tabela.setLabel("Tipo");
		
		tipo_estatistica_tabela.propertie().add("name","p_tipo_estatistica_tabela").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		desc_tarefa_estat_tabela = new TextField(model,"desc_tarefa_estat_tabela");
		desc_tarefa_estat_tabela.setLabel("Desc. Tarefa");
		
		desc_tarefa_estat_tabela.propertie().add("name","p_desc_tarefa_estat_tabela").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		data_entrada_estat_tabela = new TextField(model,"data_entrada_estat_tabela");
		data_entrada_estat_tabela.setLabel("Data Entrada");
		
		data_entrada_estat_tabela.propertie().add("name","p_data_entrada_estat_tabela").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		data_conclusao_estat_tabela = new TextField(model,"data_conclusao_estat_tabela");
		data_conclusao_estat_tabela.setLabel("Data ConclusÃ£o");
		
		data_conclusao_estat_tabela.propertie().add("name","p_data_conclusao_estat_tabela").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		numero_processo_tabela = new TextField(model,"numero_processo_tabela");
		numero_processo_tabela.setLabel("Número Processo");
		
		numero_processo_tabela.propertie().add("name","p_numero_processo_tabela").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		tipo = new TextField(model,"tipo");
		tipo.setLabel("Tipo");
		
		tipo.propertie().add("name","p_tipo").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		desc_tarefa = new TextField(model,"desc_tarefa");
		desc_tarefa.setLabel("Desc. Tarefa");
		
		desc_tarefa.propertie().add("name","p_desc_tarefa").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		atribuido_por = new TextField(model,"atribuido_por");
		atribuido_por.setLabel("Atribuido Por");
		
		atribuido_por.propertie().add("name","p_atribuido_por").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		atribuido_a = new TextField(model,"atribuido_a");
		atribuido_a.setLabel("Atribuido A");
		
		atribuido_a.propertie().add("name","p_atribuido_a").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		data_entrada = new TextField(model,"data_entrada");
		data_entrada.setLabel("Data Entrada");
		
		data_entrada.propertie().add("name","p_data_entrada").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		tarefas_tabela_disponiveis = new TextField(model,"tarefas_tabela_disponiveis");
		tarefas_tabela_disponiveis.setLabel("Tarefas");
		
		tarefas_tabela_disponiveis.propertie().add("name","p_tarefas_tabela_disponiveis").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		categorias_processo_tabela_disponiveis = new TextField(model,"categorias_processo_tabela_disponiveis");
		categorias_processo_tabela_disponiveis.setLabel("Categorias Processo");
		
		categorias_processo_tabela_disponiveis.propertie().add("name","p_categorias_processo_tabela_disponiveis").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		data_entrada_tabela_disponiveis = new TextField(model,"data_entrada_tabela_disponiveis");
		data_entrada_tabela_disponiveis.setLabel("Data Entrada");
		
		data_entrada_tabela_disponiveis.propertie().add("name","p_data_entrada_tabela_disponiveis").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		nome_colab_tabela = new TextField(model,"nome_colab_tabela");
		nome_colab_tabela.setLabel("Nome");
		
		nome_colab_tabela.propertie().add("name","p_nome_colab_tabela").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		contacto_colab_tabela = new TextField(model,"contacto_colab_tabela");
		contacto_colab_tabela.setLabel("Contacto");
		
		contacto_colab_tabela.propertie().add("name","p_contacto_colab_tabela").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		n_tarefas_colab_tabela = new TextField(model,"n_tarefas_colab_tabela");
		n_tarefas_colab_tabela.setLabel("N. Tarefas");
		
		n_tarefas_colab_tabela.propertie().add("name","p_n_tarefas_colab_tabela").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		n_atendimento_colab_tabela = new TextField(model,"n_atendimento_colab_tabela");
		n_atendimento_colab_tabela.setLabel("N. Atendimento");
		
		n_atendimento_colab_tabela.propertie().add("name","p_n_atendimento_colab_tabela").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		media_tempo_colab_tabela = new TextField(model,"media_tempo_colab_tabela");
		media_tempo_colab_tabela.setLabel("Media Tempo");
		
		media_tempo_colab_tabela.propertie().add("name","p_media_tempo_colab_tabela").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		ranking_colab_tabela = new TextField(model,"ranking_colab_tabela");
		ranking_colab_tabela.setLabel("Ranking");
		
		ranking_colab_tabela.propertie().add("name","p_ranking_colab_tabela").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		percentagem_colab_tabela = new TextField(model,"percentagem_colab_tabela");
		percentagem_colab_tabela.setLabel("Percentagem");
		
		percentagem_colab_tabela.propertie().add("name","p_percentagem_colab_tabela").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		foto_colab_tabela = new TextField(model,"foto_colab_tabela");
		foto_colab_tabela.setLabel("Foto");
		
		foto_colab_tabela.propertie().add("name","p_foto_colab_tabela").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		param_colab_tabela = new TextField(model,"param_colab_tabela");
		param_colab_tabela.setLabel("Param");
		
		param_colab_tabela.propertie().add("name","p_param_colab_tabela").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		tipo_tabela_minhas_tarefas = new TextField(model,"tipo_tabela_minhas_tarefas");
		tipo_tabela_minhas_tarefas.setLabel("Tipo");
		
		tipo_tabela_minhas_tarefas.propertie().add("name","p_tipo_tabela_minhas_tarefas").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		desc_tarefa_tabela_minhas_tarefas = new TextField(model,"desc_tarefa_tabela_minhas_tarefas");
		desc_tarefa_tabela_minhas_tarefas.setLabel("Desc. Tarefa");
		
		desc_tarefa_tabela_minhas_tarefas.propertie().add("name","p_desc_tarefa_tabela_minhas_tarefas").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		atribuido_por_tabela_minhas_tarefas = new TextField(model,"atribuido_por_tabela_minhas_tarefas");
		atribuido_por_tabela_minhas_tarefas.setLabel("Atribuido Por");
		
		atribuido_por_tabela_minhas_tarefas.propertie().add("name","p_atribuido_por_tabela_minhas_tarefas").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		data_entrada_tabela_minhas_tarefas = new TextField(model,"data_entrada_tabela_minhas_tarefas");
		data_entrada_tabela_minhas_tarefas.setLabel("Data Entrada");
		
		data_entrada_tabela_minhas_tarefas.propertie().add("name","p_data_entrada_tabela_minhas_tarefas").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		espera_tabela_minhas_tarefas = new TextField(model,"espera_tabela_minhas_tarefas");
		espera_tabela_minhas_tarefas.setLabel("Espera");
		
		espera_tabela_minhas_tarefas.propertie().add("name","p_espera_tabela_minhas_tarefas").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");

		btn_pesquisar_tarefa = new IGRPButton("Pesquisar","igrp","ExecucaoTarefas","pesquisar_tarefa","submit","default|fa-search","","");
		btn_pesquisar_tarefa.propertie.add("type","form").add("code","").add("class","default").add("rel","pesquisar_tarefa");
		btn_pesquisar_colaborador = new IGRPButton("Pesquisar","igrp","ExecucaoTarefas","pesquisar_colaborador","submit","default|fa-search","","");
		btn_pesquisar_colaborador.propertie.add("type","form").add("code","").add("class","default").add("rel","pesquisar_colaborador");
		btn_pesquisar_button_minhas_tarefas = new IGRPButton("Pesquisar","igrp","ExecucaoTarefas","pesquisar_button_minhas_tarefas","submit","default|fa-search","","");
		btn_pesquisar_button_minhas_tarefas.propertie.add("type","form").add("code","").add("class","default").add("rel","pesquisar_button_minhas_tarefas");
		btn_pesquisar_button_disponiveis = new IGRPButton("Pesquisar","igrp","ExecucaoTarefas","pesquisar_button_disponiveis","submit","default|fa-search","","");
		btn_pesquisar_button_disponiveis.propertie.add("type","form").add("code","").add("class","default").add("rel","pesquisar_button_disponiveis");
		btn_pesquisar_estatistica = new IGRPButton("Pesquisar","igrp","ExecucaoTarefas","pesquisar_estatistica","submit","default|fa-search","","");
		btn_pesquisar_estatistica.propertie.add("type","form").add("code","").add("class","default").add("rel","pesquisar_estatistica");
		btn_transferir_tarefa = new IGRPButton("Transferir Tarefa","igrp","ExecucaoTarefas","transferir_tarefa","_blank","default|fa-angle-right","","");
		btn_transferir_tarefa.propertie.add("type","specific").add("code","").add("class","default").add("rel","transferir_tarefa");
		btn_detalhes_tarefa = new IGRPButton("Detalhes Tarefa","igrp","ExecucaoTarefas","detalhes_tarefa","_blank","default|fa-angle-right","","");
		btn_detalhes_tarefa.propertie.add("type","specific").add("code","").add("class","default").add("rel","detalhes_tarefa");
		btn_detalhes_processo = new IGRPButton("Detalhes Processo","igrp","ExecucaoTarefas","detalhes_processo","_blank","default|fa-angle-right","","");
		btn_detalhes_processo.propertie.add("type","specific").add("code","").add("class","default").add("rel","detalhes_processo");
		btn_alterar_prioridade_tarefa = new IGRPButton("Alterar Prioridade Tarefa","igrp","ExecucaoTarefas","alterar_prioridade_tarefa","_blank","default|fa-angle-right","","");
		btn_alterar_prioridade_tarefa.propertie.add("type","specific").add("code","").add("class","default").add("rel","alterar_prioridade_tarefa");
		btn_assumir_button_tabela = new IGRPButton("Assumir","igrp","ExecucaoTarefas","assumir_button_tabela","alert_submit","success|fa-check","","");
		btn_assumir_button_tabela.propertie.add("type","specific").add("code","").add("class","success").add("rel","assumir_button_tabela");
		btn_ver_estatistica = new IGRPButton("Ver Estatistica","igrp","ExecucaoTarefas","ver_estatistica","_blank","default|fa-angle-right","","");
		btn_ver_estatistica.propertie.add("type","specific").add("code","").add("class","default").add("rel","ver_estatistica");
		btn_ver_detalhes = new IGRPButton("Ver Detalhes","igrp","ExecucaoTarefas","ver_detalhes","_blank","default|fa-angle-right","","");
		btn_ver_detalhes.propertie.add("type","specific").add("code","").add("class","default").add("rel","ver_detalhes");
		btn_enviar_msg = new IGRPButton("Enviar Msg","igrp","ExecucaoTarefas","enviar_msg","_blank","default|fa-angle-right","","");
		btn_enviar_msg.propertie.add("type","specific").add("code","").add("class","default").add("rel","enviar_msg");
		btn_executar_button_minha_tarefas = new IGRPButton("Executar","igrp","ExecucaoTarefas","executar_button_minha_tarefas","_self","default|fa-angle-right","","");
		btn_executar_button_minha_tarefas.propertie.add("type","specific").add("code","").add("class","default").add("rel","executar_button_minha_tarefas");
		btn_detalhes_processos_button_minha_tarefas = new IGRPButton("Detalhes Processos","igrp","ExecucaoTarefas","detalhes_processos_button_minha_tarefas","submit","default|fa-angle-right","","");
		btn_detalhes_processos_button_minha_tarefas.propertie.add("type","specific").add("code","").add("class","default").add("rel","detalhes_processos_button_minha_tarefas");
		btn_leberar_tarefa_button_minha_tarefas = new IGRPButton("Liberar Tarefa","igrp","ExecucaoTarefas","leberar_tarefa_button_minha_tarefas","alert_submit","default|fa-angle-right","","");
		btn_leberar_tarefa_button_minha_tarefas.propertie.add("type","specific").add("code","").add("class","default").add("rel","leberar_tarefa_button_minha_tarefas");
		
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel("");
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("iskey","false").add("tag","id");

	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		tabcontent_1.addField(gerir_tarefas);
		tabcontent_1.addField(colaboradores);
		tabcontent_1.addField(estatistica);
		tabcontent_1.addField(minhas_tarefas);
		tabcontent_1.addField(disponiveis);

		form_gerir_tarefa.addField(organica_gerir_tarefa);
		form_gerir_tarefa.addField(numero_processo_gerir_tarefa);
		form_gerir_tarefa.addField(tipo_processo_gerir_tarefa);
		form_gerir_tarefa.addField(data_inicio_gerir_tarefa);
		form_gerir_tarefa.addField(data_fim_gerir_tarefa);
		form_gerir_tarefa.addField(prioridade_gerir_tarefa);
		form_gerir_tarefa.addField(pesquisa_gerir_tarefa);

		form_colaboradores.addField(organica_colaborador);
		form_colaboradores.addField(numero_processo_colaborador);
		form_colaboradores.addField(tipo_processo_colaborador);
		form_colaboradores.addField(tipo_etapa_colaborador);
		form_colaboradores.addField(data_inicio_colaborador);
		form_colaboradores.addField(data_fim_colaborador);
		form_colaboradores.addField(prioridade_colaborador);

		view_estatistica.addField(n_tarefas_cocluidas_view_estatistica);
		view_estatistica.addField(n_tarefas_pendentes_view_estatistica);
		view_estatistica.addField(n_atendimento_dia_view_estatistica);
		view_estatistica.addField(media_tempo_view_estatistica);
		view_estatistica.addField(posicao_ranking_view_estatistica);
		view_estatistica.addField(view_estatistica_img);

		form_minhas_tarefas.addField(organica_minhas_tarefas);
		form_minhas_tarefas.addField(numero_processo_minhas_tarefas);
		form_minhas_tarefas.addField(tipo_processo_minhas_tarefas);
		form_minhas_tarefas.addField(data_inicio_minhas_tarefas);
		form_minhas_tarefas.addField(data_fim_minhas_tarefas);
		form_minhas_tarefas.addField(prioridade_minhas_tarefas);
		form_minhas_tarefas.addField(pesquisa_minhas_tarefas);

		form_disponiveis.addField(organica_form_disponiveis);
		form_disponiveis.addField(numero_processo_form_disponiveis);
		form_disponiveis.addField(tipo_processo_form_disponiveis);
		form_disponiveis.addField(data_inicio_form_disponiveis);
		form_disponiveis.addField(data_fim_form_disponiveis);
		form_disponiveis.addField(prioridade_form_disponiveis);
		form_disponiveis.addField(pesquisar_form_disponiveis);

		form_estatistica.addField(data_inicio_estatistica);
		form_estatistica.addField(data_fim_estatistica);
		form_estatistica.addField(numero_processo_estatistica);
		form_estatistica.addField(prioridade_estatistica);
		form_estatistica.addField(tipo_processo_estatistica);
		form_estatistica.addField(estado_estatistica);

		table_estatistica.addField(n_processo_estat_tabela);
		table_estatistica.addField(tipo_estatistica_tabela);
		table_estatistica.addField(desc_tarefa_estat_tabela);
		table_estatistica.addField(data_entrada_estat_tabela);
		table_estatistica.addField(data_conclusao_estat_tabela);
		table_estatistica.addField(p_id);

		table_gerir_tarefas.addField(numero_processo_tabela);
		table_gerir_tarefas.addField(tipo);
		table_gerir_tarefas.addField(desc_tarefa);
		table_gerir_tarefas.addField(atribuido_por);
		table_gerir_tarefas.addField(atribuido_a);
		table_gerir_tarefas.addField(data_entrada);
		table_gerir_tarefas.addField(p_id);

		table_disponiveis.addField(tarefas_tabela_disponiveis);
		table_disponiveis.addField(categorias_processo_tabela_disponiveis);
		table_disponiveis.addField(data_entrada_tabela_disponiveis);
		table_disponiveis.addField(p_id);

		table__colaboradores.addField(nome_colab_tabela);
		table__colaboradores.addField(contacto_colab_tabela);
		table__colaboradores.addField(n_tarefas_colab_tabela);
		table__colaboradores.addField(n_atendimento_colab_tabela);
		table__colaboradores.addField(media_tempo_colab_tabela);
		table__colaboradores.addField(ranking_colab_tabela);
		table__colaboradores.addField(percentagem_colab_tabela);
		table__colaboradores.addField(foto_colab_tabela);
		table__colaboradores.addField(param_colab_tabela);
		table__colaboradores.addField(p_id);

		table_minhas_tarefas.addField(tipo_tabela_minhas_tarefas);
		table_minhas_tarefas.addField(desc_tarefa_tabela_minhas_tarefas);
		table_minhas_tarefas.addField(atribuido_por_tabela_minhas_tarefas);
		table_minhas_tarefas.addField(data_entrada_tabela_minhas_tarefas);
		table_minhas_tarefas.addField(espera_tabela_minhas_tarefas);
		table_minhas_tarefas.addField(p_id);

		form_gerir_tarefa.addButton(btn_pesquisar_tarefa);
		form_colaboradores.addButton(btn_pesquisar_colaborador);
		form_minhas_tarefas.addButton(btn_pesquisar_button_minhas_tarefas);
		form_disponiveis.addButton(btn_pesquisar_button_disponiveis);
		form_estatistica.addButton(btn_pesquisar_estatistica);
		table_gerir_tarefas.addButton(btn_transferir_tarefa);
		table_gerir_tarefas.addButton(btn_detalhes_tarefa);
		table_gerir_tarefas.addButton(btn_detalhes_processo);
		table_gerir_tarefas.addButton(btn_alterar_prioridade_tarefa);
		table_disponiveis.addButton(btn_assumir_button_tabela);
		table__colaboradores.addButton(btn_ver_estatistica);
		table__colaboradores.addButton(btn_ver_detalhes);
		table__colaboradores.addButton(btn_enviar_msg);
		table_minhas_tarefas.addButton(btn_executar_button_minha_tarefas);
		table_minhas_tarefas.addButton(btn_detalhes_processos_button_minha_tarefas);
		table_minhas_tarefas.addButton(btn_leberar_tarefa_button_minha_tarefas);
		this.addToPage(sectionheader_1);
		this.addToPage(tabcontent_1);
		this.addToPage(form_gerir_tarefa);
		this.addToPage(form_colaboradores);
		this.addToPage(view_estatistica);
		this.addToPage(form_minhas_tarefas);
		this.addToPage(form_disponiveis);
		this.addToPage(form_estatistica);
		this.addToPage(table_estatistica);
		this.addToPage(table_gerir_tarefas);
		this.addToPage(table_disponiveis);
		this.addToPage(table__colaboradores);
		this.addToPage(table_minhas_tarefas);
	}
}
/*-------------------------*/