package nosi.webapps.igrp.pages.execucaotarefas;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import java.util.Map;
import java.util.LinkedHashMap;

public class ExecucaoTarefasView extends View {

	public Field sectionheader_1_text;
	public Field disponiveis;
	public Field minhas_tarefas;
	public Field estatistica;
	public Field gerir_tarefas;
	public Field colaboradores;
	public Field tipo_processo_form_disponiveis;
	public Field numero_processo_form_disponiveis;
	public Field prioridade_form_disponiveis;
	public Field nada5;
	public Field data_inicio_form_disponiveis;
	public Field data_fim_form_disponiveis;
	public Field tipo_processo_minhas_tarefas;
	public Field numero_processo_minhas_tarefas;
	public Field prioridade_minhas_tarefas;
	public Field nada3_;
	public Field data_inicio_minhas_tarefas;
	public Field data_fim_minhas_tarefas;
	public Field n_tarefas_cocluidas_view_estatistica;
	public Field n_tarefas_pendentes_view_estatistica;
	public Field n_atendimento_dia_view_estatistica;
	public Field media_tempo_view_estatistica;
	public Field view_estatistica_img;
	public Field tipo_processo_gerir_tarefa;
	public Field numero_processo_gerir_tarefa;
	public Field prioridade_gerir_tarefa;
	public Field nada_;
	public Field data_inicio_gerir_tarefa;
	public Field data_fim_gerir_tarefa;
	public Field tipo_processo_colaborador;
	public Field numero_processo_colaborador;
	public Field prioridade_colaborador;
	public Field tipo_etapa_colaborador;
	public Field nada2_;
	public Field data_inicio_colaborador;
	public Field data_fim_colaborador;
	public Field tipo_processo_estatistica;
	public Field numero_processo_estatistica;
	public Field prioridade_estatistica;
	public Field estado_estatistica;
	public Field nada4;
	public Field data_inicio_estatistica;
	public Field data_fim_estatistica;
	public Field prioridade;
	public Field n_tarefa_d;
	public Field tarefas_tabela_disponiveis;
	public Field categorias_processo_tabela_disponiveis;
	public Field data_entrada_tabela_disponiveis;
	public Field data_fim_d;
	public Field p_id_d;
	public Field prioridade_m;
	public Field n_tarefa_m;
	public Field desc_tarefa_tabela_minhas_tarefas;
	public Field tipo_tabela_minhas_tarefas;
	public Field data_entrada_tabela_minhas_tarefas;
	public Field data_fim_m;
	public Field atribuido_por_tabela_minhas_tarefas;
	public Field espera_tabela_minhas_tarefas;
	public Field prm_taskid;
	public Field prioridade_g;
	public Field n_tarefa_g;
	public Field desc_tarefa;
	public Field tipo;
	public Field data_entrada;
	public Field data_fim_g;
	public Field atribuido_por;
	public Field atribuido_a;
	public Field p_id_g;
	public Field numero_processo_tabela;
	public Field nome_colab_tabela;
	public Field contacto_colab_tabela;
	public Field n_tarefas_colab_tabela;
	public Field n_atendimento_colab_tabela;
	public Field media_tempo_colab_tabela;
	public Field ranking_colab_tabela;
	public Field percentagem_colab_tabela;
	public Field foto_colab_tabela;
	public Field param_colab_tabela;
	public Field p_id_c;
	public Field n_processo_estat_tabela;
	public Field desc_tarefa_estat_tabela;
	public Field tipo_estatistica_tabela;
	public Field data_entrada_estat_tabela;
	public Field data_conclusao_estat_tabela;
	public Field p_id_e;
	public IGRPSectionHeader sectionheader_1;
	public IGRPTabContent tabcontent_1;
	public IGRPForm form_disponiveis;
	public IGRPForm form_minhas_tarefas;
	public IGRPView view_estatistica;
	public IGRPForm form_gerir_tarefa;
	public IGRPForm form_colaboradores;
	public IGRPForm form_estatistica;
	public IGRPTable table_disponiveis;
	public IGRPTable table_minhas_tarefas;
	public IGRPTable table_gerir_tarefas;
	public IGRPTable table__colaboradores;
	public IGRPTable table_estatistica;

	public IGRPButton btn_pesquisar_button_disponiveis;
	public IGRPButton btn_pesquisar_button_minhas_tarefas;
	public IGRPButton btn_pesquisar_tarefa;
	public IGRPButton btn_pesquisar_colaborador;
	public IGRPButton btn_pesquisar_estatistica;
	public IGRPButton btn_assumir_button_tabela;
	public IGRPButton btn_executar_button_minha_tarefas;
	public IGRPButton btn_detalhes_minha_tarefa;
	public IGRPButton btn_detalhes_processos_button_minha_tarefas;
	public IGRPButton btn_leberar_tarefa_button_minha_tarefas;
	public IGRPButton btn_transferir_tarefa;
	public IGRPButton btn_detalhes_tarefa;
	public IGRPButton btn_detalhes_processo;
	public IGRPButton btn_alterar_prioridade_tarefa;
	public IGRPButton btn_ver_detalhes;
	public IGRPButton btn_ver_estatistica;
	public IGRPButton btn_enviar_msg;

	public ExecucaoTarefasView(){

		this.setPageTitle("Execucao Tarefas");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");

		tabcontent_1 = new IGRPTabContent("tabcontent_1","");

		form_disponiveis = new IGRPForm("form_disponiveis","Filtro");

		form_minhas_tarefas = new IGRPForm("form_minhas_tarefas","Filtro");

		view_estatistica = new IGRPView("view_estatistica","");

		form_gerir_tarefa = new IGRPForm("form_gerir_tarefa","Filtro");

		form_colaboradores = new IGRPForm("form_colaboradores","Filtro");

		form_estatistica = new IGRPForm("form_estatistica","Filtro");

		table_disponiveis = new IGRPTable("table_disponiveis","");

		table_minhas_tarefas = new IGRPTable("table_minhas_tarefas","");

		table_gerir_tarefas = new IGRPTable("table_gerir_tarefas","");

		table__colaboradores = new IGRPTable("table__colaboradores","");

		table_estatistica = new IGRPTable("table_estatistica","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Distribuição de Tarefas"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		disponiveis = new TextField(model,"disponiveis");
		disponiveis.setLabel(gt("Disponíveis"));
		disponiveis.propertie().add("name","p_disponiveis").add("type","button").add("img","fa-calendar-check-o").add("request_fields","").add("refresh_submit","false").add("refresh_components","").add("adbcli","").add("notvalidatefields","false").add("maxlength","50");
		
		minhas_tarefas = new TextField(model,"minhas_tarefas");
		minhas_tarefas.setLabel(gt("Minhas Tarefas"));
		minhas_tarefas.propertie().add("name","p_minhas_tarefas").add("type","button").add("img","fa-address-book-o").add("request_fields","").add("refresh_submit","false").add("refresh_components","").add("adbcli","").add("notvalidatefields","false").add("maxlength","50");
		
		estatistica = new TextField(model,"estatistica");
		estatistica.setLabel(gt("Estatística"));
		estatistica.propertie().add("name","p_estatistica").add("type","button").add("img","fa-line-chart").add("request_fields","").add("refresh_submit","false").add("refresh_components","").add("adbcli","").add("notvalidatefields","false").add("maxlength","50");
		
		gerir_tarefas = new TextField(model,"gerir_tarefas");
		gerir_tarefas.setLabel(gt("Gerir Tarefas"));
		gerir_tarefas.propertie().add("name","p_gerir_tarefas").add("type","button").add("img","fa-tasks").add("request_fields","").add("refresh_submit","false").add("refresh_components","").add("adbcli","").add("notvalidatefields","false").add("maxlength","50");
		
		colaboradores = new TextField(model,"colaboradores");
		colaboradores.setLabel(gt("Colaboradores"));
		colaboradores.propertie().add("name","p_colaboradores").add("type","button").add("img","fa-users").add("request_fields","").add("refresh_submit","false").add("refresh_components","").add("adbcli","").add("notvalidatefields","false").add("maxlength","50");
		
		tipo_processo_form_disponiveis = new ListField(model,"tipo_processo_form_disponiveis");
		tipo_processo_form_disponiveis.setLabel(gt("Tipo Processo"));
		tipo_processo_form_disponiveis.propertie().add("name","p_tipo_processo_form_disponiveis").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("disabled","false").add("tags","false").add("java-type","").add("load_service_data","false").add("tooltip","false").add("disable_copy_paste","false");
		
		numero_processo_form_disponiveis = new TextField(model,"numero_processo_form_disponiveis");
		numero_processo_form_disponiveis.setLabel(gt("Nº Processo"));
		numero_processo_form_disponiveis.propertie().add("name","p_numero_processo_form_disponiveis").add("type","text").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false").add("disablehtml","true").add("inputmask","").add("tooltip","false").add("disable_copy_paste","false");
		
		prioridade_form_disponiveis = new ListField(model,"prioridade_form_disponiveis");
		prioridade_form_disponiveis.setLabel(gt("Prioridade"));
		prioridade_form_disponiveis.propertie().add("name","p_prioridade_form_disponiveis").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","30").add("required","false").add("disabled","false").add("java-type","").add("load_service_data","false").add("tooltip","false").add("disable_copy_paste","false");
		
		nada5 = new SeparatorField(model,"nada5");
		nada5.setLabel(gt(" "));
		nada5.propertie().add("name","p_nada5").add("type","separator").add("maxlength","250").add("placeholder",gt("")).add("desclabel","false").add("tooltip","false").add("disable_copy_paste","false");
		
		data_inicio_form_disponiveis = new DateField(model,"data_inicio_form_disponiveis");
		data_inicio_form_disponiveis.setLabel(gt("Data apartir de"));
		data_inicio_form_disponiveis.propertie().add("name","p_data_inicio_form_disponiveis").add("type","date").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("class","success").add("range","false").add("desclabel","false").add("disableWeekends","false").add("disabledBeforetoday","false").add("daysoff","false").add("tooltip","false").add("disable_copy_paste","false");
		
		data_fim_form_disponiveis = new DateField(model,"data_fim_form_disponiveis");
		data_fim_form_disponiveis.setLabel(gt("Data até"));
		data_fim_form_disponiveis.propertie().add("name","p_data_fim_form_disponiveis").add("type","date").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("class","danger").add("range","false").add("desclabel","false").add("disableWeekends","false").add("disabledBeforetoday","false").add("daysoff","false").add("tooltip","false").add("disable_copy_paste","false");
		
		tipo_processo_minhas_tarefas = new ListField(model,"tipo_processo_minhas_tarefas");
		tipo_processo_minhas_tarefas.setLabel(gt("Tipo Processo"));
		tipo_processo_minhas_tarefas.propertie().add("name","p_tipo_processo_minhas_tarefas").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("disabled","false").add("tags","false").add("java-type","").add("load_service_data","false").add("tooltip","false").add("disable_copy_paste","false");
		
		numero_processo_minhas_tarefas = new TextField(model,"numero_processo_minhas_tarefas");
		numero_processo_minhas_tarefas.setLabel(gt("Nº Processo"));
		numero_processo_minhas_tarefas.propertie().add("name","p_numero_processo_minhas_tarefas").add("type","text").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false").add("disablehtml","true").add("inputmask","").add("tooltip","false").add("disable_copy_paste","false");
		
		prioridade_minhas_tarefas = new ListField(model,"prioridade_minhas_tarefas");
		prioridade_minhas_tarefas.setLabel(gt("Prioridade"));
		prioridade_minhas_tarefas.propertie().add("name","p_prioridade_minhas_tarefas").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("disabled","false").add("tags","false").add("java-type","").add("load_service_data","false").add("tooltip","false").add("disable_copy_paste","false");
		
		nada3_ = new SeparatorField(model,"nada3_");
		nada3_.setLabel(gt(" "));
		nada3_.propertie().add("name","p_nada3_").add("type","separator").add("maxlength","250").add("placeholder",gt("")).add("desclabel","false").add("tooltip","false").add("disable_copy_paste","false");
		
		data_inicio_minhas_tarefas = new DateField(model,"data_inicio_minhas_tarefas");
		data_inicio_minhas_tarefas.setLabel(gt("Data apartir de"));
		data_inicio_minhas_tarefas.propertie().add("name","p_data_inicio_minhas_tarefas").add("type","date").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("class","success").add("range","false").add("desclabel","false").add("disableWeekends","false").add("disabledBeforetoday","false").add("daysoff","false").add("tooltip","false").add("disable_copy_paste","false");
		
		data_fim_minhas_tarefas = new DateField(model,"data_fim_minhas_tarefas");
		data_fim_minhas_tarefas.setLabel(gt("Data até"));
		data_fim_minhas_tarefas.propertie().add("name","p_data_fim_minhas_tarefas").add("type","date").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("class","danger").add("range","false").add("desclabel","false").add("disableWeekends","false").add("disabledBeforetoday","false").add("daysoff","false").add("tooltip","false").add("disable_copy_paste","false");
		
		n_tarefas_cocluidas_view_estatistica = new TextField(model,"n_tarefas_cocluidas_view_estatistica");
		n_tarefas_cocluidas_view_estatistica.setLabel(gt("N. Tarefas Cocluidas"));
		n_tarefas_cocluidas_view_estatistica.propertie().add("name","p_n_tarefas_cocluidas_view_estatistica").add("type","text").add("maxlength","30").add("class","success").add("img","").add("showlabel","true");
		
		n_tarefas_pendentes_view_estatistica = new TextField(model,"n_tarefas_pendentes_view_estatistica");
		n_tarefas_pendentes_view_estatistica.setLabel(gt("N. Tarefas Pendentes"));
		n_tarefas_pendentes_view_estatistica.propertie().add("name","p_n_tarefas_pendentes_view_estatistica").add("type","text").add("maxlength","30").add("class","warning").add("img","").add("showlabel","true");
		
		n_atendimento_dia_view_estatistica = new TextField(model,"n_atendimento_dia_view_estatistica");
		n_atendimento_dia_view_estatistica.setLabel(gt("N. Atendimento Dia"));
		n_atendimento_dia_view_estatistica.propertie().add("name","p_n_atendimento_dia_view_estatistica").add("type","text").add("maxlength","30").add("class","default").add("img","fa-hashtag").add("showlabel","true");
		
		media_tempo_view_estatistica = new TextField(model,"media_tempo_view_estatistica");
		media_tempo_view_estatistica.setLabel(gt("Media Tempo"));
		media_tempo_view_estatistica.propertie().add("name","p_media_tempo_view_estatistica").add("type","text").add("maxlength","30").add("class","default").add("img","fa-clock-o").add("showlabel","true");
		
		view_estatistica_img = new TextField(model,"view_estatistica_img");
		view_estatistica_img.setLabel(gt(""));
		view_estatistica_img.propertie().add("type","text").add("name","p_view_estatistica_img").add("maxlength","300");
		
		tipo_processo_gerir_tarefa = new ListField(model,"tipo_processo_gerir_tarefa");
		tipo_processo_gerir_tarefa.setLabel(gt("Tipo Processo"));
		tipo_processo_gerir_tarefa.propertie().add("name","p_tipo_processo_gerir_tarefa").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("disabled","false").add("tags","false").add("java-type","").add("load_service_data","false").add("tooltip","false").add("disable_copy_paste","false");
		
		numero_processo_gerir_tarefa = new TextField(model,"numero_processo_gerir_tarefa");
		numero_processo_gerir_tarefa.setLabel(gt("Nº Processo"));
		numero_processo_gerir_tarefa.propertie().add("name","p_numero_processo_gerir_tarefa").add("type","text").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false").add("disablehtml","true").add("inputmask","").add("tooltip","false").add("disable_copy_paste","false");
		
		prioridade_gerir_tarefa = new ListField(model,"prioridade_gerir_tarefa");
		prioridade_gerir_tarefa.setLabel(gt("Prioridade"));
		prioridade_gerir_tarefa.propertie().add("name","p_prioridade_gerir_tarefa").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("disabled","false").add("tags","false").add("java-type","").add("load_service_data","false").add("tooltip","false").add("disable_copy_paste","false");
		
		nada_ = new SeparatorField(model,"nada_");
		nada_.setLabel(gt(" "));
		nada_.propertie().add("name","p_nada_").add("type","separator").add("maxlength","250").add("placeholder",gt("")).add("desclabel","false").add("tooltip","false").add("disable_copy_paste","false");
		
		data_inicio_gerir_tarefa = new DateField(model,"data_inicio_gerir_tarefa");
		data_inicio_gerir_tarefa.setLabel(gt("Data apartir de"));
		data_inicio_gerir_tarefa.propertie().add("name","p_data_inicio_gerir_tarefa").add("type","date").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("class","success").add("range","false").add("desclabel","false").add("disableWeekends","false").add("disabledBeforetoday","false").add("daysoff","false").add("tooltip","false").add("disable_copy_paste","false");
		
		data_fim_gerir_tarefa = new DateField(model,"data_fim_gerir_tarefa");
		data_fim_gerir_tarefa.setLabel(gt("Data até"));
		data_fim_gerir_tarefa.propertie().add("name","p_data_fim_gerir_tarefa").add("type","date").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("class","danger").add("range","false").add("desclabel","false").add("disableWeekends","false").add("disabledBeforetoday","false").add("daysoff","false").add("tooltip","false").add("disable_copy_paste","false");
		
		tipo_processo_colaborador = new ListField(model,"tipo_processo_colaborador");
		tipo_processo_colaborador.setLabel(gt("Tipo Processo"));
		tipo_processo_colaborador.propertie().add("name","p_tipo_processo_colaborador").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("disabled","false").add("tags","false").add("java-type","").add("load_service_data","false").add("tooltip","false").add("disable_copy_paste","false");
		
		numero_processo_colaborador = new TextField(model,"numero_processo_colaborador");
		numero_processo_colaborador.setLabel(gt("Nº Processo"));
		numero_processo_colaborador.propertie().add("name","p_numero_processo_colaborador").add("type","text").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false").add("disablehtml","true").add("inputmask","").add("tooltip","false").add("disable_copy_paste","false");
		
		prioridade_colaborador = new ListField(model,"prioridade_colaborador");
		prioridade_colaborador.setLabel(gt("Prioridade"));
		prioridade_colaborador.propertie().add("name","p_prioridade_colaborador").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("disabled","false").add("tags","false").add("java-type","").add("load_service_data","false").add("tooltip","false").add("disable_copy_paste","false");
		
		tipo_etapa_colaborador = new ListField(model,"tipo_etapa_colaborador");
		tipo_etapa_colaborador.setLabel(gt("Tipo Etapa"));
		tipo_etapa_colaborador.propertie().add("name","p_tipo_etapa_colaborador").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("disabled","false").add("tags","false").add("java-type","").add("load_service_data","false").add("tooltip","false").add("disable_copy_paste","false");
		
		nada2_ = new SeparatorField(model,"nada2_");
		nada2_.setLabel(gt(" "));
		nada2_.propertie().add("name","p_nada2_").add("type","separator").add("maxlength","250").add("placeholder",gt("")).add("desclabel","false").add("tooltip","false").add("disable_copy_paste","false");
		
		data_inicio_colaborador = new DateField(model,"data_inicio_colaborador");
		data_inicio_colaborador.setLabel(gt("Data apartir de"));
		data_inicio_colaborador.propertie().add("name","p_data_inicio_colaborador").add("type","date").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("class","success").add("range","false").add("desclabel","false").add("disableWeekends","false").add("disabledBeforetoday","false").add("daysoff","false").add("tooltip","false").add("disable_copy_paste","false");
		
		data_fim_colaborador = new DateField(model,"data_fim_colaborador");
		data_fim_colaborador.setLabel(gt("Data até"));
		data_fim_colaborador.propertie().add("name","p_data_fim_colaborador").add("type","date").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("class","danger").add("range","false").add("desclabel","false").add("disableWeekends","false").add("disabledBeforetoday","false").add("daysoff","false").add("tooltip","false").add("disable_copy_paste","false");
		
		tipo_processo_estatistica = new ListField(model,"tipo_processo_estatistica");
		tipo_processo_estatistica.setLabel(gt("Tipo Processo"));
		tipo_processo_estatistica.propertie().add("name","p_tipo_processo_estatistica").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("disabled","false").add("tags","false").add("java-type","").add("load_service_data","false").add("tooltip","false").add("disable_copy_paste","false");
		
		numero_processo_estatistica = new TextField(model,"numero_processo_estatistica");
		numero_processo_estatistica.setLabel(gt("Nº Processo"));
		numero_processo_estatistica.propertie().add("name","p_numero_processo_estatistica").add("type","text").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false").add("disablehtml","true").add("inputmask","").add("tooltip","false").add("disable_copy_paste","false");
		
		prioridade_estatistica = new ListField(model,"prioridade_estatistica");
		prioridade_estatistica.setLabel(gt("Prioridade"));
		prioridade_estatistica.propertie().add("name","p_prioridade_estatistica").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","30").add("required","false").add("disabled","false").add("java-type","").add("load_service_data","false").add("tooltip","false").add("disable_copy_paste","false");
		
		estado_estatistica = new ListField(model,"estado_estatistica");
		estado_estatistica.setLabel(gt("Estado"));
		estado_estatistica.propertie().add("name","p_estado_estatistica").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("disabled","false").add("tags","false").add("java-type","").add("load_service_data","false").add("tooltip","false").add("disable_copy_paste","false");
		
		nada4 = new SeparatorField(model,"nada4");
		nada4.setLabel(gt(" "));
		nada4.propertie().add("name","p_nada4").add("type","separator").add("maxlength","250").add("placeholder",gt("")).add("desclabel","false").add("tooltip","false").add("disable_copy_paste","false");
		
		data_inicio_estatistica = new DateField(model,"data_inicio_estatistica");
		data_inicio_estatistica.setLabel(gt("Data apartir de"));
		data_inicio_estatistica.propertie().add("name","p_data_inicio_estatistica").add("type","date").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("class","success").add("range","false").add("desclabel","false").add("disableWeekends","false").add("disabledBeforetoday","false").add("daysoff","false").add("tooltip","false").add("disable_copy_paste","false");
		
		data_fim_estatistica = new DateField(model,"data_fim_estatistica");
		data_fim_estatistica.setLabel(gt("Data conclusão"));
		data_fim_estatistica.propertie().add("name","p_data_fim_estatistica").add("type","date").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("class","danger").add("range","false").add("desclabel","false").add("disableWeekends","false").add("disabledBeforetoday","false").add("daysoff","false").add("tooltip","false").add("disable_copy_paste","false");
		
		prioridade = new ColorField(model,"prioridade");
		prioridade.setLabel(gt("Prioridade"));
		prioridade.propertie().add("name","p_prioridade").add("type","color").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		n_tarefa_d = new TextField(model,"n_tarefa_d");
		n_tarefa_d.setLabel(gt("Nº Processo"));
		n_tarefa_d.propertie().add("name","p_n_tarefa_d").add("type","text").add("maxlength","100").add("showLabel","true").add("group_in","");
		
		tarefas_tabela_disponiveis = new TextField(model,"tarefas_tabela_disponiveis");
		tarefas_tabela_disponiveis.setLabel(gt("Tarefa"));
		tarefas_tabela_disponiveis.propertie().add("name","p_tarefas_tabela_disponiveis").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		categorias_processo_tabela_disponiveis = new TextField(model,"categorias_processo_tabela_disponiveis");
		categorias_processo_tabela_disponiveis.setLabel(gt("Tipo processo"));
		categorias_processo_tabela_disponiveis.propertie().add("name","p_categorias_processo_tabela_disponiveis").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		data_entrada_tabela_disponiveis = new TextField(model,"data_entrada_tabela_disponiveis");
		data_entrada_tabela_disponiveis.setLabel(gt("Data entrada"));
		data_entrada_tabela_disponiveis.propertie().add("name","p_data_entrada_tabela_disponiveis").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		data_fim_d = new DateField(model,"data_fim_d");
		data_fim_d.setLabel(gt("Data fim"));
		data_fim_d.propertie().add("name","p_data_fim_d").add("type","date").add("maxlength","30").add("range","false").add("showLabel","true").add("group_in","").add("disableWeekends","false").add("disabledBeforetoday","false").add("daysoff","false");
		
		p_id_d = new HiddenField(model,"p_id_d");
		p_id_d.setLabel(gt(""));
		p_id_d.propertie().add("name","p_p_id_d").add("type","hidden").add("maxlength","30").add("java-type","").add("showLabel","true").add("group_in","").add("tag","p_id_d");
		
		prioridade_m = new ColorField(model,"prioridade_m");
		prioridade_m.setLabel(gt("Prioridade"));
		prioridade_m.propertie().add("name","p_prioridade_m").add("type","color").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		n_tarefa_m = new TextField(model,"n_tarefa_m");
		n_tarefa_m.setLabel(gt("Nº Processo"));
		n_tarefa_m.propertie().add("name","p_n_tarefa_m").add("type","text").add("maxlength","100").add("showLabel","true").add("group_in","");
		
		desc_tarefa_tabela_minhas_tarefas = new TextField(model,"desc_tarefa_tabela_minhas_tarefas");
		desc_tarefa_tabela_minhas_tarefas.setLabel(gt("Tarefa"));
		desc_tarefa_tabela_minhas_tarefas.propertie().add("name","p_desc_tarefa_tabela_minhas_tarefas").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		tipo_tabela_minhas_tarefas = new TextField(model,"tipo_tabela_minhas_tarefas");
		tipo_tabela_minhas_tarefas.setLabel(gt("Tipo processo"));
		tipo_tabela_minhas_tarefas.propertie().add("name","p_tipo_tabela_minhas_tarefas").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		data_entrada_tabela_minhas_tarefas = new TextField(model,"data_entrada_tabela_minhas_tarefas");
		data_entrada_tabela_minhas_tarefas.setLabel(gt("Data entrada"));
		data_entrada_tabela_minhas_tarefas.propertie().add("name","p_data_entrada_tabela_minhas_tarefas").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		data_fim_m = new DateField(model,"data_fim_m");
		data_fim_m.setLabel(gt("Data fim"));
		data_fim_m.propertie().add("name","p_data_fim_m").add("type","date").add("maxlength","30").add("range","false").add("showLabel","true").add("group_in","").add("disableWeekends","false").add("disabledBeforetoday","false").add("daysoff","false");
		
		atribuido_por_tabela_minhas_tarefas = new TextField(model,"atribuido_por_tabela_minhas_tarefas");
		atribuido_por_tabela_minhas_tarefas.setLabel(gt("Atribuido por"));
		atribuido_por_tabela_minhas_tarefas.propertie().add("name","p_atribuido_por_tabela_minhas_tarefas").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		espera_tabela_minhas_tarefas = new TextField(model,"espera_tabela_minhas_tarefas");
		espera_tabela_minhas_tarefas.setLabel(gt("Espera"));
		espera_tabela_minhas_tarefas.propertie().add("name","p_espera_tabela_minhas_tarefas").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		prm_taskid = new HiddenField(model,"prm_taskid");
		prm_taskid.setLabel(gt(""));
		prm_taskid.propertie().add("name","p_prm_taskid").add("type","hidden").add("maxlength","30").add("java-type","").add("showLabel","true").add("group_in","").add("tag","prm_taskid");
		
		prioridade_g = new ColorField(model,"prioridade_g");
		prioridade_g.setLabel(gt("Prioridade"));
		prioridade_g.propertie().add("name","p_prioridade_g").add("type","color").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		n_tarefa_g = new TextField(model,"n_tarefa_g");
		n_tarefa_g.setLabel(gt("Nº Processo"));
		n_tarefa_g.propertie().add("name","p_n_tarefa_g").add("type","text").add("maxlength","100").add("showLabel","true").add("group_in","");
		
		desc_tarefa = new TextField(model,"desc_tarefa");
		desc_tarefa.setLabel(gt("Tarefa"));
		desc_tarefa.propertie().add("name","p_desc_tarefa").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		tipo = new TextField(model,"tipo");
		tipo.setLabel(gt("Tipo processo"));
		tipo.propertie().add("name","p_tipo").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		data_entrada = new TextField(model,"data_entrada");
		data_entrada.setLabel(gt("Data entrada"));
		data_entrada.propertie().add("name","p_data_entrada").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		data_fim_g = new DateField(model,"data_fim_g");
		data_fim_g.setLabel(gt("Data fim"));
		data_fim_g.propertie().add("name","p_data_fim_g").add("type","date").add("maxlength","30").add("range","false").add("showLabel","true").add("group_in","").add("disableWeekends","false").add("disabledBeforetoday","false").add("daysoff","false");
		
		atribuido_por = new TextField(model,"atribuido_por");
		atribuido_por.setLabel(gt("Atribuido por"));
		atribuido_por.propertie().add("name","p_atribuido_por").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		atribuido_a = new TextField(model,"atribuido_a");
		atribuido_a.setLabel(gt("Atribuido a"));
		atribuido_a.propertie().add("name","p_atribuido_a").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		p_id_g = new HiddenField(model,"p_id_g");
		p_id_g.setLabel(gt(""));
		p_id_g.propertie().add("name","p_p_id_g").add("type","hidden").add("maxlength","30").add("java-type","").add("showLabel","true").add("group_in","").add("tag","p_id_g");
		
		numero_processo_tabela = new HiddenField(model,"numero_processo_tabela");
		numero_processo_tabela.setLabel(gt(""));
		numero_processo_tabela.propertie().add("name","p_numero_processo_tabela").add("type","hidden").add("maxlength","30").add("showLabel","true").add("group_in","").add("java-type","").add("tag","numero_processo_tabela");
		
		nome_colab_tabela = new TextField(model,"nome_colab_tabela");
		nome_colab_tabela.setLabel(gt("Nome"));
		nome_colab_tabela.propertie().add("name","p_nome_colab_tabela").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		contacto_colab_tabela = new TextField(model,"contacto_colab_tabela");
		contacto_colab_tabela.setLabel(gt("Contacto"));
		contacto_colab_tabela.propertie().add("name","p_contacto_colab_tabela").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		n_tarefas_colab_tabela = new TextField(model,"n_tarefas_colab_tabela");
		n_tarefas_colab_tabela.setLabel(gt("Nº Tarefas"));
		n_tarefas_colab_tabela.propertie().add("name","p_n_tarefas_colab_tabela").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		n_atendimento_colab_tabela = new TextField(model,"n_atendimento_colab_tabela");
		n_atendimento_colab_tabela.setLabel(gt("Nº Atendimento"));
		n_atendimento_colab_tabela.propertie().add("name","p_n_atendimento_colab_tabela").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		media_tempo_colab_tabela = new TextField(model,"media_tempo_colab_tabela");
		media_tempo_colab_tabela.setLabel(gt("Media Tempo"));
		media_tempo_colab_tabela.propertie().add("name","p_media_tempo_colab_tabela").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		ranking_colab_tabela = new TextField(model,"ranking_colab_tabela");
		ranking_colab_tabela.setLabel(gt("Ranking"));
		ranking_colab_tabela.propertie().add("name","p_ranking_colab_tabela").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		percentagem_colab_tabela = new TextField(model,"percentagem_colab_tabela");
		percentagem_colab_tabela.setLabel(gt("%"));
		percentagem_colab_tabela.propertie().add("name","p_percentagem_colab_tabela").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		foto_colab_tabela = new TextField(model,"foto_colab_tabela");
		foto_colab_tabela.setLabel(gt("Foto"));
		foto_colab_tabela.propertie().add("name","p_foto_colab_tabela").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		param_colab_tabela = new TextField(model,"param_colab_tabela");
		param_colab_tabela.setLabel(gt("Param"));
		param_colab_tabela.propertie().add("name","p_param_colab_tabela").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		p_id_c = new HiddenField(model,"p_id_c");
		p_id_c.setLabel(gt(""));
		p_id_c.propertie().add("name","p_p_id_c").add("type","hidden").add("maxlength","30").add("java-type","").add("showLabel","true").add("group_in","").add("tag","p_id_c");
		
		n_processo_estat_tabela = new TextField(model,"n_processo_estat_tabela");
		n_processo_estat_tabela.setLabel(gt("Nº Processo"));
		n_processo_estat_tabela.propertie().add("name","p_n_processo_estat_tabela").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		desc_tarefa_estat_tabela = new TextField(model,"desc_tarefa_estat_tabela");
		desc_tarefa_estat_tabela.setLabel(gt("Tarefa"));
		desc_tarefa_estat_tabela.propertie().add("name","p_desc_tarefa_estat_tabela").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		tipo_estatistica_tabela = new TextField(model,"tipo_estatistica_tabela");
		tipo_estatistica_tabela.setLabel(gt("Tipo processo"));
		tipo_estatistica_tabela.propertie().add("name","p_tipo_estatistica_tabela").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		data_entrada_estat_tabela = new TextField(model,"data_entrada_estat_tabela");
		data_entrada_estat_tabela.setLabel(gt("Data entrada"));
		data_entrada_estat_tabela.propertie().add("name","p_data_entrada_estat_tabela").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		data_conclusao_estat_tabela = new TextField(model,"data_conclusao_estat_tabela");
		data_conclusao_estat_tabela.setLabel(gt("Data conclusão"));
		data_conclusao_estat_tabela.propertie().add("name","p_data_conclusao_estat_tabela").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		p_id_e = new HiddenField(model,"p_id_e");
		p_id_e.setLabel(gt(""));
		p_id_e.propertie().add("name","p_p_id_e").add("type","hidden").add("maxlength","30").add("java-type","").add("showLabel","true").add("group_in","").add("tag","p_id_e");
		


		btn_pesquisar_button_disponiveis = new IGRPButton("Pesquisar","igrp","ExecucaoTarefas","pesquisar_button_disponiveis","submit_ajax","primary|fa-search","","");
		btn_pesquisar_button_disponiveis.propertie.add("id","button_8ee9_d629").add("type","form").add("class","primary").add("rel","pesquisar_button_disponiveis").add("refresh_components","table_disponiveis");

		btn_pesquisar_button_minhas_tarefas = new IGRPButton("Pesquisar","igrp","ExecucaoTarefas","pesquisar_button_minhas_tarefas","submit_ajax","primary|fa-search","","");
		btn_pesquisar_button_minhas_tarefas.propertie.add("id","button_e8d8_bc35").add("type","form").add("class","primary").add("rel","pesquisar_button_minhas_tarefas").add("refresh_components","table_minhas_tarefas");

		btn_pesquisar_tarefa = new IGRPButton("Pesquisar","igrp","ExecucaoTarefas","pesquisar_tarefa","submit_ajax","primary|fa-search","","");
		btn_pesquisar_tarefa.propertie.add("id","button_2cf3_f7d9").add("type","form").add("class","primary").add("rel","pesquisar_tarefa").add("refresh_components","table_gerir_tarefas");

		btn_pesquisar_colaborador = new IGRPButton("Pesquisar","igrp","ExecucaoTarefas","pesquisar_colaborador","submit_ajax","primary|fa-search","","");
		btn_pesquisar_colaborador.propertie.add("id","button_cbf9_4278").add("type","form").add("class","primary").add("rel","pesquisar_colaborador").add("refresh_components","table__colaboradores");

		btn_pesquisar_estatistica = new IGRPButton("Pesquisar","igrp","ExecucaoTarefas","pesquisar_estatistica","submit_ajax","primary|fa-search","","");
		btn_pesquisar_estatistica.propertie.add("id","button_bf98_a80c").add("type","form").add("class","primary").add("rel","pesquisar_estatistica").add("refresh_components","table_estatistica");

		btn_assumir_button_tabela = new IGRPButton("Assumir","igrp","ExecucaoTarefas","assumir_button_tabela","alert_submit","success|fa-check","","");
		btn_assumir_button_tabela.propertie.add("id","button_c509_2c6e").add("type","specific").add("class","success").add("rel","assumir_button_tabela").add("refresh_components","").add("labelConfirm","Deseja realmente realizar esta operação?");

		btn_executar_button_minha_tarefas = new IGRPButton("Executar","igrp","ExecucaoTarefas","executar_button_minha_tarefas","_self","primary|fa-play","","");
		btn_executar_button_minha_tarefas.propertie.add("id","button_1b69_e3d6").add("type","specific").add("class","primary").add("rel","executar_button_minha_tarefas").add("refresh_components","");

		btn_detalhes_minha_tarefa = new IGRPButton("Detalhes Tarefa","igrp","ExecucaoTarefas","detalhes_minha_tarefa","modal","info|fa-file-text","","");
		btn_detalhes_minha_tarefa.propertie.add("id","button_517a_8ea3").add("type","specific").add("class","info").add("rel","detalhes_minha_tarefa").add("refresh_components","");

		btn_detalhes_processos_button_minha_tarefas = new IGRPButton("Detalhes Processos","igrp","ExecucaoTarefas","detalhes_processos_button_minha_tarefas","modal","default|fa-sitemap","","");
		btn_detalhes_processos_button_minha_tarefas.propertie.add("id","button_1551_60cb").add("type","specific").add("class","default").add("rel","detalhes_processos_button_minha_tarefas").add("refresh_components","");

		btn_leberar_tarefa_button_minha_tarefas = new IGRPButton("Liberar Tarefa","igrp","ExecucaoTarefas","leberar_tarefa_button_minha_tarefas","alert_submit","warning|fa-close","","");
		btn_leberar_tarefa_button_minha_tarefas.propertie.add("id","button_99a9_b288").add("type","specific").add("class","warning").add("rel","leberar_tarefa_button_minha_tarefas").add("refresh_components","").add("labelConfirm","Deseja realmente realizar esta operação?");

		btn_transferir_tarefa = new IGRPButton("Transferir Tarefa","igrp","ExecucaoTarefas","transferir_tarefa","mpsubmit|refresh","primary|fa-exchange","","");
		btn_transferir_tarefa.propertie.add("id","button_936c_f6e3").add("type","specific").add("class","primary").add("rel","transferir_tarefa").add("refresh_components","");

		btn_detalhes_tarefa = new IGRPButton("Detalhes Tarefa","igrp","ExecucaoTarefas","detalhes_tarefa","modal","info|fa-file-text","","");
		btn_detalhes_tarefa.propertie.add("id","button_4b3c_5782").add("type","specific").add("class","info").add("rel","detalhes_tarefa").add("refresh_components","");

		btn_detalhes_processo = new IGRPButton("Detalhes Processo","igrp","ExecucaoTarefas","detalhes_processo","modal","default|fa-sitemap","","");
		btn_detalhes_processo.propertie.add("id","button_bc5c_af17").add("type","specific").add("class","default").add("rel","detalhes_processo").add("refresh_components","");

		btn_alterar_prioridade_tarefa = new IGRPButton("Alterar Prioridade Tarefa","igrp","ExecucaoTarefas","alterar_prioridade_tarefa","mpsubmit|refresh","warning|fa-pencil","","");
		btn_alterar_prioridade_tarefa.propertie.add("id","button_7385_4c77").add("type","specific").add("class","warning").add("rel","alterar_prioridade_tarefa").add("refresh_components","");

		btn_ver_detalhes = new IGRPButton("Ver Detalhes","igrp","ExecucaoTarefas","ver_detalhes","modal","primary|fa-address-card","","");
		btn_ver_detalhes.propertie.add("id","button_17fb_9014").add("type","specific").add("class","primary").add("rel","ver_detalhes").add("refresh_components","");

		btn_ver_estatistica = new IGRPButton("Ver Estatistica","igrp","ExecucaoTarefas","ver_estatistica","modal","info|fa-line-chart","","");
		btn_ver_estatistica.propertie.add("id","button_298e_8233").add("type","specific").add("class","info").add("rel","ver_estatistica").add("refresh_components","");

		btn_enviar_msg = new IGRPButton("Enviar Msg","igrp","ExecucaoTarefas","enviar_msg","modal","warning|fa-send-o","","");
		btn_enviar_msg.propertie.add("id","button_998d_99ce").add("type","specific").add("class","warning").add("rel","enviar_msg").add("refresh_components","");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		tabcontent_1.addField(disponiveis);
		tabcontent_1.addField(minhas_tarefas);
		tabcontent_1.addField(estatistica);
		tabcontent_1.addField(gerir_tarefas);
		tabcontent_1.addField(colaboradores);

		form_disponiveis.addField(tipo_processo_form_disponiveis);
		form_disponiveis.addField(numero_processo_form_disponiveis);
		form_disponiveis.addField(prioridade_form_disponiveis);
		form_disponiveis.addField(nada5);
		form_disponiveis.addField(data_inicio_form_disponiveis);
		form_disponiveis.addField(data_fim_form_disponiveis);

		form_minhas_tarefas.addField(tipo_processo_minhas_tarefas);
		form_minhas_tarefas.addField(numero_processo_minhas_tarefas);
		form_minhas_tarefas.addField(prioridade_minhas_tarefas);
		form_minhas_tarefas.addField(nada3_);
		form_minhas_tarefas.addField(data_inicio_minhas_tarefas);
		form_minhas_tarefas.addField(data_fim_minhas_tarefas);

		view_estatistica.addField(n_tarefas_cocluidas_view_estatistica);
		view_estatistica.addField(n_tarefas_pendentes_view_estatistica);
		view_estatistica.addField(n_atendimento_dia_view_estatistica);
		view_estatistica.addField(media_tempo_view_estatistica);
		view_estatistica.addField(view_estatistica_img);

		form_gerir_tarefa.addField(tipo_processo_gerir_tarefa);
		form_gerir_tarefa.addField(numero_processo_gerir_tarefa);
		form_gerir_tarefa.addField(prioridade_gerir_tarefa);
		form_gerir_tarefa.addField(nada_);
		form_gerir_tarefa.addField(data_inicio_gerir_tarefa);
		form_gerir_tarefa.addField(data_fim_gerir_tarefa);

		form_colaboradores.addField(tipo_processo_colaborador);
		form_colaboradores.addField(numero_processo_colaborador);
		form_colaboradores.addField(prioridade_colaborador);
		form_colaboradores.addField(tipo_etapa_colaborador);
		form_colaboradores.addField(nada2_);
		form_colaboradores.addField(data_inicio_colaborador);
		form_colaboradores.addField(data_fim_colaborador);

		form_estatistica.addField(tipo_processo_estatistica);
		form_estatistica.addField(numero_processo_estatistica);
		form_estatistica.addField(prioridade_estatistica);
		form_estatistica.addField(estado_estatistica);
		form_estatistica.addField(nada4);
		form_estatistica.addField(data_inicio_estatistica);
		form_estatistica.addField(data_fim_estatistica);

		table_disponiveis.addField(prioridade);
		table_disponiveis.addField(n_tarefa_d);
		table_disponiveis.addField(tarefas_tabela_disponiveis);
		table_disponiveis.addField(categorias_processo_tabela_disponiveis);
		table_disponiveis.addField(data_entrada_tabela_disponiveis);
		table_disponiveis.addField(data_fim_d);
		table_disponiveis.addField(p_id_d);
		/* start table_disponiveis legend colors*/
		Map<Object, Map<String, String>> table_disponiveis_colors= new LinkedHashMap<>();
		Map<String, String> color_dc2b4c_table_disponiveis = new LinkedHashMap<>();
		color_dc2b4c_table_disponiveis.put("#dc2b4c","Urgente");
		table_disponiveis_colors.put("100",color_dc2b4c_table_disponiveis);
		Map<String, String> color_ffb266_table_disponiveis = new LinkedHashMap<>();
		color_ffb266_table_disponiveis.put("#ffb266","Alta");
		table_disponiveis_colors.put("75",color_ffb266_table_disponiveis);
		Map<String, String> color_ffff00_table_disponiveis = new LinkedHashMap<>();
		color_ffff00_table_disponiveis.put("#ffff00","Normal");
		table_disponiveis_colors.put("50",color_ffff00_table_disponiveis);
		Map<String, String> color_008000_table_disponiveis = new LinkedHashMap<>();
		color_008000_table_disponiveis.put("#008000","Baixa");
		table_disponiveis_colors.put("25",color_008000_table_disponiveis);
		Map<String, String> color_00a9ff_table_disponiveis = new LinkedHashMap<>();
		color_00a9ff_table_disponiveis.put("#00a9ff","Muito baixa");
		table_disponiveis_colors.put("0",color_00a9ff_table_disponiveis);
		this.table_disponiveis.setLegendColors(table_disponiveis_colors);
		/* end table_disponiveis legend colors*/
		table_minhas_tarefas.addField(prioridade_m);
		table_minhas_tarefas.addField(n_tarefa_m);
		table_minhas_tarefas.addField(desc_tarefa_tabela_minhas_tarefas);
		table_minhas_tarefas.addField(tipo_tabela_minhas_tarefas);
		table_minhas_tarefas.addField(data_entrada_tabela_minhas_tarefas);
		table_minhas_tarefas.addField(data_fim_m);
		table_minhas_tarefas.addField(atribuido_por_tabela_minhas_tarefas);
		table_minhas_tarefas.addField(espera_tabela_minhas_tarefas);
		table_minhas_tarefas.addField(prm_taskid);
		/* start table_minhas_tarefas legend colors*/
		Map<Object, Map<String, String>> table_minhas_tarefas_colors= new LinkedHashMap<>();
		Map<String, String> color_dc2b4c_table_minhas_tarefas = new LinkedHashMap<>();
		color_dc2b4c_table_minhas_tarefas.put("#dc2b4c","Urgente");
		table_minhas_tarefas_colors.put("100",color_dc2b4c_table_minhas_tarefas);
		Map<String, String> color_ffb266_table_minhas_tarefas = new LinkedHashMap<>();
		color_ffb266_table_minhas_tarefas.put("#ffb266","Alta");
		table_minhas_tarefas_colors.put("75",color_ffb266_table_minhas_tarefas);
		Map<String, String> color_ffff00_table_minhas_tarefas = new LinkedHashMap<>();
		color_ffff00_table_minhas_tarefas.put("#ffff00","Normal");
		table_minhas_tarefas_colors.put("50",color_ffff00_table_minhas_tarefas);
		Map<String, String> color_008000_table_minhas_tarefas = new LinkedHashMap<>();
		color_008000_table_minhas_tarefas.put("#008000","Baixa");
		table_minhas_tarefas_colors.put("25",color_008000_table_minhas_tarefas);
		Map<String, String> color_00a9ff_table_minhas_tarefas = new LinkedHashMap<>();
		color_00a9ff_table_minhas_tarefas.put("#00a9ff","Muito baixa");
		table_minhas_tarefas_colors.put("0",color_00a9ff_table_minhas_tarefas);
		this.table_minhas_tarefas.setLegendColors(table_minhas_tarefas_colors);
		/* end table_minhas_tarefas legend colors*/
		table_gerir_tarefas.addField(prioridade_g);
		table_gerir_tarefas.addField(n_tarefa_g);
		table_gerir_tarefas.addField(desc_tarefa);
		table_gerir_tarefas.addField(tipo);
		table_gerir_tarefas.addField(data_entrada);
		table_gerir_tarefas.addField(data_fim_g);
		table_gerir_tarefas.addField(atribuido_por);
		table_gerir_tarefas.addField(atribuido_a);
		table_gerir_tarefas.addField(p_id_g);
		table_gerir_tarefas.addField(numero_processo_tabela);
		/* start table_gerir_tarefas legend colors*/
		Map<Object, Map<String, String>> table_gerir_tarefas_colors= new LinkedHashMap<>();
		Map<String, String> color_dc2b4c_table_gerir_tarefas = new LinkedHashMap<>();
		color_dc2b4c_table_gerir_tarefas.put("#dc2b4c","Urgente");
		table_gerir_tarefas_colors.put("100",color_dc2b4c_table_gerir_tarefas);
		Map<String, String> color_ffb266_table_gerir_tarefas = new LinkedHashMap<>();
		color_ffb266_table_gerir_tarefas.put("#ffb266","Alta");
		table_gerir_tarefas_colors.put("75",color_ffb266_table_gerir_tarefas);
		Map<String, String> color_ffff00_table_gerir_tarefas = new LinkedHashMap<>();
		color_ffff00_table_gerir_tarefas.put("#ffff00","Normal");
		table_gerir_tarefas_colors.put("50",color_ffff00_table_gerir_tarefas);
		Map<String, String> color_008000_table_gerir_tarefas = new LinkedHashMap<>();
		color_008000_table_gerir_tarefas.put("#008000","Baixa");
		table_gerir_tarefas_colors.put("25",color_008000_table_gerir_tarefas);
		Map<String, String> color_00a9ff_table_gerir_tarefas = new LinkedHashMap<>();
		color_00a9ff_table_gerir_tarefas.put("#00a9ff","Muito baixa");
		table_gerir_tarefas_colors.put("0",color_00a9ff_table_gerir_tarefas);
		this.table_gerir_tarefas.setLegendColors(table_gerir_tarefas_colors);
		/* end table_gerir_tarefas legend colors*/
		table__colaboradores.addField(nome_colab_tabela);
		table__colaboradores.addField(contacto_colab_tabela);
		table__colaboradores.addField(n_tarefas_colab_tabela);
		table__colaboradores.addField(n_atendimento_colab_tabela);
		table__colaboradores.addField(media_tempo_colab_tabela);
		table__colaboradores.addField(ranking_colab_tabela);
		table__colaboradores.addField(percentagem_colab_tabela);
		table__colaboradores.addField(foto_colab_tabela);
		table__colaboradores.addField(param_colab_tabela);
		table__colaboradores.addField(p_id_c);

		table_estatistica.addField(n_processo_estat_tabela);
		table_estatistica.addField(desc_tarefa_estat_tabela);
		table_estatistica.addField(tipo_estatistica_tabela);
		table_estatistica.addField(data_entrada_estat_tabela);
		table_estatistica.addField(data_conclusao_estat_tabela);
		table_estatistica.addField(p_id_e);

		form_disponiveis.addButton(btn_pesquisar_button_disponiveis);
		form_minhas_tarefas.addButton(btn_pesquisar_button_minhas_tarefas);
		form_gerir_tarefa.addButton(btn_pesquisar_tarefa);
		form_colaboradores.addButton(btn_pesquisar_colaborador);
		form_estatistica.addButton(btn_pesquisar_estatistica);
		table_disponiveis.addButton(btn_assumir_button_tabela);
		table_minhas_tarefas.addButton(btn_executar_button_minha_tarefas);
		table_minhas_tarefas.addButton(btn_detalhes_minha_tarefa);
		table_minhas_tarefas.addButton(btn_detalhes_processos_button_minha_tarefas);
		table_minhas_tarefas.addButton(btn_leberar_tarefa_button_minha_tarefas);
		table_gerir_tarefas.addButton(btn_transferir_tarefa);
		table_gerir_tarefas.addButton(btn_detalhes_tarefa);
		table_gerir_tarefas.addButton(btn_detalhes_processo);
		table_gerir_tarefas.addButton(btn_alterar_prioridade_tarefa);
		table__colaboradores.addButton(btn_ver_detalhes);
		table__colaboradores.addButton(btn_ver_estatistica);
		table__colaboradores.addButton(btn_enviar_msg);
		this.addToPage(sectionheader_1);
		this.addToPage(tabcontent_1);
		this.addToPage(form_disponiveis);
		this.addToPage(form_minhas_tarefas);
		this.addToPage(view_estatistica);
		this.addToPage(form_gerir_tarefa);
		this.addToPage(form_colaboradores);
		this.addToPage(form_estatistica);
		this.addToPage(table_disponiveis);
		this.addToPage(table_minhas_tarefas);
		this.addToPage(table_gerir_tarefas);
		this.addToPage(table__colaboradores);
		this.addToPage(table_estatistica);
	}
		
	@Override
	public void setModel(Model model) {
		
		disponiveis.setValue(model);
		minhas_tarefas.setValue(model);
		estatistica.setValue(model);
		gerir_tarefas.setValue(model);
		colaboradores.setValue(model);
		tipo_processo_form_disponiveis.setValue(model);
		numero_processo_form_disponiveis.setValue(model);
		prioridade_form_disponiveis.setValue(model);
		nada5.setValue(model);
		data_inicio_form_disponiveis.setValue(model);
		data_fim_form_disponiveis.setValue(model);
		tipo_processo_minhas_tarefas.setValue(model);
		numero_processo_minhas_tarefas.setValue(model);
		prioridade_minhas_tarefas.setValue(model);
		nada3_.setValue(model);
		data_inicio_minhas_tarefas.setValue(model);
		data_fim_minhas_tarefas.setValue(model);
		n_tarefas_cocluidas_view_estatistica.setValue(model);
		n_tarefas_pendentes_view_estatistica.setValue(model);
		n_atendimento_dia_view_estatistica.setValue(model);
		media_tempo_view_estatistica.setValue(model);
		view_estatistica_img.setValue(model);
		tipo_processo_gerir_tarefa.setValue(model);
		numero_processo_gerir_tarefa.setValue(model);
		prioridade_gerir_tarefa.setValue(model);
		nada_.setValue(model);
		data_inicio_gerir_tarefa.setValue(model);
		data_fim_gerir_tarefa.setValue(model);
		tipo_processo_colaborador.setValue(model);
		numero_processo_colaborador.setValue(model);
		prioridade_colaborador.setValue(model);
		tipo_etapa_colaborador.setValue(model);
		nada2_.setValue(model);
		data_inicio_colaborador.setValue(model);
		data_fim_colaborador.setValue(model);
		tipo_processo_estatistica.setValue(model);
		numero_processo_estatistica.setValue(model);
		prioridade_estatistica.setValue(model);
		estado_estatistica.setValue(model);
		nada4.setValue(model);
		data_inicio_estatistica.setValue(model);
		data_fim_estatistica.setValue(model);
		prioridade.setValue(model);
		n_tarefa_d.setValue(model);
		tarefas_tabela_disponiveis.setValue(model);
		categorias_processo_tabela_disponiveis.setValue(model);
		data_entrada_tabela_disponiveis.setValue(model);
		data_fim_d.setValue(model);
		p_id_d.setValue(model);
		prioridade_m.setValue(model);
		n_tarefa_m.setValue(model);
		desc_tarefa_tabela_minhas_tarefas.setValue(model);
		tipo_tabela_minhas_tarefas.setValue(model);
		data_entrada_tabela_minhas_tarefas.setValue(model);
		data_fim_m.setValue(model);
		atribuido_por_tabela_minhas_tarefas.setValue(model);
		espera_tabela_minhas_tarefas.setValue(model);
		prm_taskid.setValue(model);
		prioridade_g.setValue(model);
		n_tarefa_g.setValue(model);
		desc_tarefa.setValue(model);
		tipo.setValue(model);
		data_entrada.setValue(model);
		data_fim_g.setValue(model);
		atribuido_por.setValue(model);
		atribuido_a.setValue(model);
		p_id_g.setValue(model);
		numero_processo_tabela.setValue(model);
		nome_colab_tabela.setValue(model);
		contacto_colab_tabela.setValue(model);
		n_tarefas_colab_tabela.setValue(model);
		n_atendimento_colab_tabela.setValue(model);
		media_tempo_colab_tabela.setValue(model);
		ranking_colab_tabela.setValue(model);
		percentagem_colab_tabela.setValue(model);
		foto_colab_tabela.setValue(model);
		param_colab_tabela.setValue(model);
		p_id_c.setValue(model);
		n_processo_estat_tabela.setValue(model);
		desc_tarefa_estat_tabela.setValue(model);
		tipo_estatistica_tabela.setValue(model);
		data_entrada_estat_tabela.setValue(model);
		data_conclusao_estat_tabela.setValue(model);
		p_id_e.setValue(model);	

		table_disponiveis.loadModel(((ExecucaoTarefas) model).getTable_disponiveis());
		table_minhas_tarefas.loadModel(((ExecucaoTarefas) model).getTable_minhas_tarefas());
		table_gerir_tarefas.loadModel(((ExecucaoTarefas) model).getTable_gerir_tarefas());
		table__colaboradores.loadModel(((ExecucaoTarefas) model).getTable__colaboradores());
		table_estatistica.loadModel(((ExecucaoTarefas) model).getTable_estatistica());
		}
}
