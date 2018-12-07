package nosi.webapps.igrp.pages.session;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class SessionView extends View {

	public Field sectionheader_1_text;
	public Field aplicacao;
	public Field utilizador;
	public Field data_inicio;
	public Field estado;
	public Field data_fim;
	public Field aplicacao_t;
	public Field utilizadort;
	public Field ip;
	public Field data_inicio_t;
	public Field data_fim_t;
	public Field table_1_filter;
	public IGRPForm sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable table_1;
	public IGRPChart chart_t_sessao;
	public IGRPChart chart_t_session_app;

	public IGRPButton btn_pesquisar;
	public IGRPButton btn_ver_logs;

	public SessionView(){

		this.setPageTitle("Gestao de Sessao");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		form_1 = new IGRPForm("form_1","");

		table_1 = new IGRPTable("table_1","");

		chart_t_sessao = new IGRPChart("chart_t_sessao","Total Sessões");

		chart_t_session_app = new IGRPChart("chart_t_session_app","Total Sessões por Aplicação");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Gestão de Sessão"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("disabled","false").add("tags","false").add("domain","").add("java-type","int");
		
		utilizador = new TextField(model,"utilizador");
		utilizador.setLabel(gt("Utilizador"));
		utilizador.propertie().add("name","p_utilizador").add("type","text").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false");
		
		data_inicio = new DateField(model,"data_inicio");
		data_inicio.setLabel(gt("Data Início"));
		data_inicio.propertie().add("name","p_data_inicio").add("type","date").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false").add("range","true");
		
		estado = new ListField(model,"estado");
		estado.setLabel(gt("Estado"));
		estado.propertie().add("name","p_estado").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("disabled","false").add("tags","false").add("domain","").add("java-type","");
		
		data_fim = new HiddenField(model,"data_fim");
		data_fim.setLabel(gt(""));
		data_fim.propertie().add("name","p_data_fim").add("type","hidden").add("maxlength","30").add("java-type","").add("tag","data_fim");
		
		aplicacao_t = new TextField(model,"aplicacao_t");
		aplicacao_t.setLabel(gt("Aplicação"));
		aplicacao_t.propertie().add("name","p_aplicacao_t").add("type","text").add("maxlength","50");
		
		utilizadort = new TextField(model,"utilizadort");
		utilizadort.setLabel(gt("Utilizador"));
		utilizadort.propertie().add("name","p_utilizadort").add("type","text").add("maxlength","50");
		
		ip = new TextField(model,"ip");
		ip.setLabel(gt("IP"));
		ip.propertie().add("name","p_ip").add("type","text").add("maxlength","30");
		
		data_inicio_t = new DateField(model,"data_inicio_t");
		data_inicio_t.setLabel(gt("Data Início"));
		data_inicio_t.propertie().add("name","p_data_inicio_t").add("type","date").add("maxlength","30").add("range","false");
		
		data_fim_t = new DateField(model,"data_fim_t");
		data_fim_t.setLabel(gt("Data Fim"));
		data_fim_t.propertie().add("name","p_data_fim_t").add("type","date").add("maxlength","30").add("range","false");
		
		table_1_filter = new TextField(model,"table_1_filter");
		table_1_filter.setLabel(gt(""));
		table_1_filter.propertie().add("name","p_table_1_filter").add("type","text").add("maxlength","100");
		


		btn_pesquisar = new IGRPButton("Pesquisar","igrp","Session","index","submit_form","primary|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("rel","pesquisar");

		btn_ver_logs = new IGRPButton("Ver Logs","igrp","Session","ver_logs","submit","default|fa-angle-right","","");
		btn_ver_logs.propertie.add("type","specific").add("rel","ver_logs");

		
		chart_t_sessao.setCaption("");
		chart_t_sessao.setChart_type("pie");
		chart_t_sessao.setXaxys("Eixo de X");
		chart_t_sessao.setYaxys("Eixo de Y");
		chart_t_sessao.setUrl("#");
		chart_t_sessao.addColor("#29477a").addColor("#125d7c").addColor("#8239c9").addColor("#904b53");

		chart_t_session_app.setCaption("");
		chart_t_session_app.setChart_type("pie");
		chart_t_session_app.setXaxys("Eixo de X");
		chart_t_session_app.setYaxys("Eixo de Y");
		chart_t_session_app.setUrl("#");
		chart_t_session_app.addColor("#577573").addColor("#b68374").addColor("#9645e9").addColor("#5d21d6");

	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(aplicacao);
		form_1.addField(utilizador);
		form_1.addField(data_inicio);
		form_1.addField(estado);
		form_1.addField(data_fim);

		table_1.addField(aplicacao_t);
		table_1.addField(utilizadort);
		table_1.addField(ip);
		table_1.addField(data_inicio_t);
		table_1.addField(data_fim_t);
		table_1.addField(table_1_filter);



		form_1.addButton(btn_pesquisar);
		table_1.addButton(btn_ver_logs);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(chart_t_sessao);
		this.addToPage(chart_t_session_app);
	}
		
	@Override
	public void setModel(Model model) {
		
		aplicacao.setValue(model);
		utilizador.setValue(model);
		data_inicio.setValue(model);
		estado.setValue(model);
		data_fim.setValue(model);
		aplicacao_t.setValue(model);
		utilizadort.setValue(model);
		ip.setValue(model);
		data_inicio_t.setValue(model);
		data_fim_t.setValue(model);
		table_1_filter.setValue(model);	

		table_1.loadModel(((Session) model).getTable_1());
		}
}
