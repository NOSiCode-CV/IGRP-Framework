/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.session;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import nosi.core.config.Config; 

public class SessionView extends View {
	public String title = "Gestão de Sessao";		
	
	public Field aplicacao;
	public Field utilizador;
	public Field data_inicio;
	public Field data_fim;
	public Field estado;
	public Field ip;
	public Field filter;
	public IGRPForm form_1;
	public IGRPTable table_1;
	public IGRPChart chart_t_sessao;
	public IGRPChart chart_t_session_app;

	public IGRPButton btn_pesquisar;
	public IGRPButton btn_ver_logs;
	public SessionView(Session model){			
		form_1 = new IGRPForm("form_1");
		table_1 = new IGRPTable("table_1");
		chart_t_sessao = new IGRPChart("chart_t_sessao","Total Sessoes");
		chart_t_session_app = new IGRPChart("chart_t_session_app","Total Sessoes por Aplicacao");
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel("Aplicacao");
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		utilizador = new TextField(model,"utilizador");
		utilizador.setLabel("Utilizador");
		utilizador.propertie().add("name","p_utilizador").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		data_inicio = new DateField(model,"data_inicio");
		data_inicio.setLabel("Data Inicio");
		data_inicio.propertie().add("name","p_data_inicio").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","default");
		data_fim = new DateField(model,"data_fim");
		data_fim.setLabel("Data Fim");
		data_fim.propertie().add("name","p_data_fim").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","default");
		estado = new ListField(model,"estado");
		estado.setLabel("Estado");
		estado.propertie().add("name","p_estado").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		ip = new TextField(model,"ip");
		ip.setLabel("IP");
		ip.propertie().add("name","p_ip").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false");
		filter = new TextField(model,"filter");
		filter.setLabel("");
		filter.propertie().add("name","p_table_1_filter").add("type","filter_az");

		btn_pesquisar = new IGRPButton("Pesquisar","igrp","Session","index","submit","default|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("code","").add("class","default").add("rel","pesquisar");
		btn_ver_logs = new IGRPButton("Ver Logs","igrp","Session","ver_logs","submit","default|fa-angle-right","","");
		btn_ver_logs.propertie.add("type","specific").add("code","").add("class","default").add("rel","ver_logs");
		
		chart_t_sessao.setCaption("");
		chart_t_sessao.setChart_type("pie");
		chart_t_sessao.setXaxys("Eixo de X");
		chart_t_sessao.setYaxys("Eixo de Y");
		chart_t_sessao.setUrl("#");
		chart_t_sessao.addColor("#6dc530").addColor("#604a68").addColor("#129020").addColor("#b7dbe1");

		chart_t_session_app.setCaption("");
		chart_t_session_app.setChart_type("pie");
		chart_t_session_app.setXaxys("Eixo de X");
		chart_t_session_app.setYaxys("Eixo de Y");
		chart_t_session_app.setUrl("#");
		chart_t_session_app.addColor("#652955").addColor("#4c9d13").addColor("#6a500b").addColor("#5a0513");

	
	}
		
	@Override
	public void render(){
		Config.TITLE = this.title;

		form_1.addField(aplicacao);
		form_1.addField(utilizador);
		form_1.addField(data_inicio);
		form_1.addField(data_fim);
		form_1.addField(estado);

		table_1.addField(aplicacao);
		table_1.addField(utilizador);
		table_1.addField(ip);
		table_1.addField(data_inicio);
		table_1.addField(data_fim);
		table_1.addField(filter);



		form_1.addButton(btn_pesquisar);
		table_1.addButton(btn_ver_logs);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(chart_t_sessao);
		this.addToPage(chart_t_session_app);
	}
}
/*-------------------------*/