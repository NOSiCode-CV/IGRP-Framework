
package nosi.webapps.igrp.pages._cons_proc;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class _CONS_PROCView extends View {
	
	
	public Field aplicacao;
	public Field organica;
	public Field area_fk;
	public Field proc_tp_fk;
	public Field user_fk;
	public Field status;
	public Field referencia_pedido;
	public Field requerente;
	public Field num;
	public Field intervalo_entrada;
	public Field dt_ini;
	public Field dt_fim;
	public Field num_processo;
	public Field processo;
	public Field eatapa;
	public Field dt_inicio_etapa;
	public Field dt_fim_etapa;
	public Field utilizador;
	public Field estado;
	public Field p_id_task;
	public IGRPForm form;
	public IGRPTable table_1;

	public IGRPButton btn_pesquisar;
	public IGRPButton btn_ver_etapa;
	public IGRPButton btn_ver_processo;
	public _CONS_PROCView(_CONS_PROC model){

		this.setPageTitle("Consulta Processo");
			
		form = new IGRPForm("form","");
		table_1 = new IGRPTable("table_1","");
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("maxlength","30").add("multiple","false").add("domain","").add("required","false").add("java-type","");
		
		organica = new ListField(model,"organica");
		organica.setLabel(gt("Organica"));
		organica.propertie().add("name","p_organica").add("type","select").add("maxlength","30").add("multiple","false").add("domain","").add("required","false").add("java-type","");
		
		area_fk = new ListField(model,"area_fk");
		area_fk.setLabel(gt("Area"));
		area_fk.propertie().add("name","p_area_fk").add("type","select").add("maxlength","30").add("multiple","false").add("domain","").add("required","false").add("java-type","");
		
		proc_tp_fk = new ListField(model,"proc_tp_fk");
		proc_tp_fk.setLabel(gt("Tipo Processo"));
		proc_tp_fk.propertie().add("name","p_proc_tp_fk").add("type","select").add("maxlength","30").add("multiple","false").add("domain","").add("required","false").add("java-type","");
		
		user_fk = new ListField(model,"user_fk");
		user_fk.setLabel(gt("Utilizador"));
		user_fk.propertie().add("name","p_user_fk").add("type","select").add("maxlength","30").add("multiple","false").add("domain","").add("required","false").add("java-type","");
		
		status = new ListField(model,"status");
		status.setLabel(gt("Estado"));
		status.propertie().add("name","p_status").add("type","select").add("maxlength","30").add("multiple","false").add("domain","").add("required","false").add("java-type","");
		
		referencia_pedido = new SeparatorField(model,"referencia_pedido");
		referencia_pedido.setLabel(gt("Referencia Pedido"));
		referencia_pedido.propertie().add("type","separator").add("name","p_referencia_pedido").add("maxlength","30");
		
		requerente = new TextField(model,"requerente");
		requerente.setLabel(gt("Requerente"));
		requerente.propertie().add("name","p_requerente").add("type","text").add("maxlength","250").add("required","false");
		
		num = new TextField(model,"num");
		num.setLabel(gt("N   Processo"));
		num.propertie().add("name","p_num").add("type","text").add("maxlength","150").add("required","false");
		
		intervalo_entrada = new SeparatorField(model,"intervalo_entrada");
		intervalo_entrada.setLabel(gt("Intervalo Entrada"));
		intervalo_entrada.propertie().add("type","separator").add("name","p_intervalo_entrada").add("maxlength","30");
		
		dt_ini = new DateField(model,"dt_ini");
		dt_ini.setLabel(gt("Data Inicio"));
		dt_ini.propertie().add("name","p_dt_ini").add("type","date").add("maxlength","30").add("range","false").add("required","false");
		
		dt_fim = new DateField(model,"dt_fim");
		dt_fim.setLabel(gt("Data Fim"));
		dt_fim.propertie().add("name","p_dt_fim").add("type","date").add("maxlength","30").add("range","false").add("required","false");
		
		num_processo = new TextField(model,"num_processo");
		num_processo.setLabel(gt("Nº"));
		num_processo.propertie().add("name","p_num_processo").add("type","text").add("maxlength","30");
		
		processo = new TextField(model,"processo");
		processo.setLabel(gt("Processo"));
		processo.propertie().add("name","p_processo").add("type","text").add("maxlength","100");
		
		eatapa = new TextField(model,"eatapa");
		eatapa.setLabel(gt("Eatapa"));
		eatapa.propertie().add("name","p_eatapa").add("type","text").add("maxlength","100");
		
		dt_inicio_etapa = new TextField(model,"dt_inicio_etapa");
		dt_inicio_etapa.setLabel(gt("Dt. Inicio Etapa"));
		dt_inicio_etapa.propertie().add("name","p_dt_inicio_etapa").add("type","text").add("maxlength","30");
		
		dt_fim_etapa = new TextField(model,"dt_fim_etapa");
		dt_fim_etapa.setLabel(gt("Dt. Fim Etapa"));
		dt_fim_etapa.propertie().add("name","p_dt_fim_etapa").add("type","text").add("maxlength","30");
		
		utilizador = new TextField(model,"utilizador");
		utilizador.setLabel(gt("Utilizador"));
		utilizador.propertie().add("name","p_utilizador").add("type","text").add("maxlength","30");
		
		estado = new ColorField(model,"estado");
		estado.setLabel(gt("Estado"));
		estado.propertie().add("name","p_estado").add("type","color").add("maxlength","30");
		
		p_id_task = new HiddenField(model,"p_id_task");
		p_id_task.setLabel(gt(""));
		p_id_task.propertie().add("name","p_id_task").add("type","hidden").add("maxlength","100").add("tag","id_task");
		


		btn_pesquisar = new IGRPButton("Pesquisar","igrp","_CONS_PROC","pesquisar","submit_form","primary|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("rel","pesquisar");

		btn_ver_etapa = new IGRPButton("Ver Etapa","igrp","_CONS_PROC","ver_etapa","mpsubmit","warning|fa-list-ol","","");
		btn_ver_etapa.propertie.add("type","specific").add("rel","ver_etapa");

		btn_ver_processo = new IGRPButton("Ver Processo","igrp","_CONS_PROC","ver_processo","mpsubmit","primary|fa-sitemap","","");
		btn_ver_processo.propertie.add("type","specific").add("rel","ver_processo");
		
	}
		
	@Override
	public void render(){
		
		form.addField(aplicacao);
		form.addField(organica);
		form.addField(area_fk);
		form.addField(proc_tp_fk);
		form.addField(user_fk);
		form.addField(status);
		form.addField(referencia_pedido);
		form.addField(requerente);
		form.addField(num);
		form.addField(intervalo_entrada);
		form.addField(dt_ini);
		form.addField(dt_fim);

		table_1.addField(num_processo);
		table_1.addField(processo);
		table_1.addField(eatapa);
		table_1.addField(dt_inicio_etapa);
		table_1.addField(dt_fim_etapa);
		table_1.addField(utilizador);
		table_1.addField(estado);
		table_1.addField(p_id_task);

		form.addButton(btn_pesquisar);
		table_1.addButton(btn_ver_etapa);
		table_1.addButton(btn_ver_processo);
		this.addToPage(form);
		this.addToPage(table_1);
	}
}
