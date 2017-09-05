/*-------------------------*/

/*Create View*/

package nosi.webapps.agenda.pages.agdashboard;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class AGDashboardView extends View {
	
	
	public Field entidade;
	public Field data_de_;
	public Field data_ate;
	public Field agendamentos_do_dia_tit;
	public Field agendamentos_do_dia_val;
	public Field agendamentos_do_dia_txt;
	public Field agendamentos_do_dia_url;
	public Field agendamentos_do_dia_bg;
	public Field agendamentos_do_dia_icn;
	public Field agendamentos_atendidos_tit;
	public Field agendamentos_atendidos_lbl;
	public Field agendamentos_atendidos_val;
	public Field agendamentos_atendidos_desc;
	public Field agendamentos_atendidos_url;
	public Field agendamentos_atendidos_bg;
	public IGRPForm form_1;
	public IGRPBox box_1;
	public IGRPStartBox agendamentos_do_dia;
	public IGRPChart chart_1;
	public IGRPCircleStatBox agendamentos_atendidos;
	public IGRPBox box_2;
	public IGRPChart chart_2;
	public IGRPChart chart_5;
	public IGRPChart chart_3;

	public IGRPButton btn_pesquisar;
	public AGDashboardView(AGDashboard model){
		this.setPageTitle("Dashboard Agenda Eletronica");
			
		form_1 = new IGRPForm("form_1");
		box_1 = new IGRPBox("box_1");
		agendamentos_do_dia = new IGRPStartBox("agendamentos_do_dia");
		chart_1 = new IGRPChart("chart_1","Agendamentos por balcão");
		agendamentos_atendidos = new IGRPCircleStatBox("agendamentos_atendidos");
		box_2 = new IGRPBox("box_2");
		chart_2 = new IGRPChart("chart_2","Agendamentos por assunto");
		chart_5 = new IGRPChart("chart_5","Agendamento por Serviço");
		chart_3 = new IGRPChart("chart_3","Agendamentos por estado");
		entidade = new LookupField(model,"entidade");
		entidade.setLabel("Entidade");
		entidade.propertie().add("name","p_entidade").add("type","lookup").add("action","").add("page","").add("app","").add("lookup_type","LOOKUP").add("class","primary").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		data_de_ = new DateField(model,"data_de_");
		data_de_.setLabel("Data de ");
		data_de_.propertie().add("name","p_data_de_").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","primary");
		data_ate = new DateField(model,"data_ate");
		data_ate.setLabel("Data até");
		data_ate.propertie().add("name","p_data_ate").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","primary");
		agendamentos_do_dia_tit = new TextField(model,"agendamentos_do_dia_tit");
		agendamentos_do_dia_tit.setLabel("Box Title");
		agendamentos_do_dia_tit.propertie().add("name","p_agendamentos_do_dia_tit").add("type","text").add("maxlength","4000").add("persist","true");
		agendamentos_do_dia_val = new TextField(model,"agendamentos_do_dia_val");
		agendamentos_do_dia_val.setLabel("Value");
		agendamentos_do_dia_val.propertie().add("name","p_agendamentos_do_dia_val").add("type","text").add("maxlength","4000").add("persist","true");
		agendamentos_do_dia_txt = new TextField(model,"agendamentos_do_dia_txt");
		agendamentos_do_dia_txt.setLabel("Url Text");
		agendamentos_do_dia_txt.propertie().add("name","p_agendamentos_do_dia_txt").add("type","text").add("maxlength","4000").add("persist","true");
		agendamentos_do_dia_url = new TextField(model,"agendamentos_do_dia_url");
		agendamentos_do_dia_url.setLabel("Url");
		agendamentos_do_dia_url.propertie().add("name","p_agendamentos_do_dia_url").add("type","text").add("maxlength","4000").add("persist","true");
		agendamentos_do_dia_bg = new TextField(model,"agendamentos_do_dia_bg");
		agendamentos_do_dia_bg.setLabel("Background");
		agendamentos_do_dia_bg.propertie().add("name","p_agendamentos_do_dia_bg").add("type","text").add("maxlength","4000").add("persist","true");
		agendamentos_do_dia_icn = new TextField(model,"agendamentos_do_dia_icn");
		agendamentos_do_dia_icn.setLabel("Icon");
		agendamentos_do_dia_icn.propertie().add("name","p_agendamentos_do_dia_icn").add("type","text").add("maxlength","4000").add("persist","true");
		agendamentos_atendidos_tit = new TextField(model,"agendamentos_atendidos_tit");
		agendamentos_atendidos_tit.setLabel("Circle Box Title");
		agendamentos_atendidos_tit.propertie().add("name","p_agendamentos_atendidos_tit").add("type","text").add("maxlength","4000").add("persist","true");
		agendamentos_atendidos_lbl = new TextField(model,"agendamentos_atendidos_lbl");
		agendamentos_atendidos_lbl.setLabel("Percent Text");
		agendamentos_atendidos_lbl.propertie().add("name","p_agendamentos_atendidos_lbl").add("type","text").add("maxlength","4000").add("persist","true");
		agendamentos_atendidos_val = new TextField(model,"agendamentos_atendidos_val");
		agendamentos_atendidos_val.setLabel("Percent Value");
		agendamentos_atendidos_val.propertie().add("name","p_agendamentos_atendidos_val").add("type","text").add("maxlength","4000");
		agendamentos_atendidos_desc = new TextField(model,"agendamentos_atendidos_desc");
		agendamentos_atendidos_desc.setLabel("Description");
		agendamentos_atendidos_desc.propertie().add("name","p_agendamentos_atendidos_desc").add("type","text").add("maxlength","4000").add("persist","true");
		agendamentos_atendidos_url = new TextField(model,"agendamentos_atendidos_url");
		agendamentos_atendidos_url.setLabel("Link");
		agendamentos_atendidos_url.propertie().add("name","p_agendamentos_atendidos_url").add("type","text").add("maxlength","4000");
		agendamentos_atendidos_bg = new TextField(model,"agendamentos_atendidos_bg");
		agendamentos_atendidos_bg.setLabel("Background");
		agendamentos_atendidos_bg.propertie().add("name","p_agendamentos_atendidos_bg").add("type","text").add("maxlength","4000").add("persist","true");

		btn_pesquisar = new IGRPButton("Pesquisar","agenda","AGDashboard","pesquisar","submit","primary|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("code","").add("class","primary").add("rel","pesquisar");
		
		chart_1.setCaption("");
		chart_1.setChart_type("column");
		chart_1.setXaxys("Eixo de X");
		chart_1.setYaxys("Eixo de Y");
		chart_1.setUrl("#");
		chart_1.addColor("#480c64").addColor("#4cef29").addColor("#bb7326").addColor("#c8cd8c");

		chart_2.setCaption("");
		chart_2.setChart_type("bar");
		chart_2.setXaxys("Eixo de X");
		chart_2.setYaxys("Eixo de Y");
		chart_2.setUrl("#");
		chart_2.addColor("#17a6ae").addColor("#1cd72c").addColor("#c6bd95").addColor("#52e6cc");

		chart_5.setCaption("");
		chart_5.setChart_type("column");
		chart_5.setXaxys("Eixo de X");
		chart_5.setYaxys("Eixo de Y");
		chart_5.setUrl("#");
		chart_5.addColor("#bb7f8b").addColor("#1f7da6").addColor("#54793d").addColor("#b2373f");

		chart_3.setCaption("");
		chart_3.setChart_type("pie");
		chart_3.setXaxys("Eixo de X");
		chart_3.setYaxys("Eixo de Y");
		chart_3.setUrl("#");
		chart_3.addColor("#d7e603").addColor("#411f26").addColor("#9c8c9e").addColor("#47a6bd");

	
	}
		
	@Override
	public void render(){
		
		form_1.addField(entidade);
		form_1.addField(data_de_);
		form_1.addField(data_ate);


		agendamentos_do_dia.addField(agendamentos_do_dia_tit);
		agendamentos_do_dia.addField(agendamentos_do_dia_val);
		agendamentos_do_dia.addField(agendamentos_do_dia_txt);
		agendamentos_do_dia.addField(agendamentos_do_dia_url);
		agendamentos_do_dia.addField(agendamentos_do_dia_bg);
		agendamentos_do_dia.addField(agendamentos_do_dia_icn);


		agendamentos_atendidos.addField(agendamentos_atendidos_tit);
		agendamentos_atendidos.addField(agendamentos_atendidos_lbl);
		agendamentos_atendidos.addField(agendamentos_atendidos_val);
		agendamentos_atendidos.addField(agendamentos_atendidos_desc);
		agendamentos_atendidos.addField(agendamentos_atendidos_url);
		agendamentos_atendidos.addField(agendamentos_atendidos_bg);





		form_1.addButton(btn_pesquisar);
		this.addToPage(form_1);
		this.addToPage(box_1);
		this.addToPage(agendamentos_do_dia);
		this.addToPage(chart_1);
		this.addToPage(agendamentos_atendidos);
		this.addToPage(box_2);
		this.addToPage(chart_2);
		this.addToPage(chart_5);
		this.addToPage(chart_3);
	}
}
/*-------------------------*/