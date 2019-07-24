package nosi.webapps.app_teste.pages.teste_blocos;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.Config;

public class Teste_blocosView extends View {

	public Field nomeee;
	public Field moraadaa;
	public Field estadoooo;
	public Field nome;
	public Field morada;
	public Field estado_civil;
	public Field data_de_registro;
	public Field anexos;
	public Field nomes;
	public Field moradas;
	public Field estados;
	public Field datas;
	public Field anexoss;
	public Field anexoss_desc;
	public IGRPTable table_2;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPButton btn_salvar;
	public IGRPButton btn_testar_where;
	public IGRPButton btn_editar;

	public Teste_blocosView(){

		this.setPageTitle("teste blocos");
			
		table_2 = new IGRPTable("table_2","");

		form_1 = new IGRPForm("form_1","");

		table_1 = new IGRPTable("table_1","");

		nomeee = new TextField(model,"nomeee");
		nomeee.setLabel(gt("Nomeee"));
		nomeee.propertie().add("name","p_nomeee").add("type","text").add("maxlength","30").add("showLabel","true");
		
		moraadaa = new TextField(model,"moraadaa");
		moraadaa.setLabel(gt("MOraadaa"));
		moraadaa.propertie().add("name","p_moraadaa").add("type","text").add("maxlength","30").add("showLabel","true");
		
		estadoooo = new TextField(model,"estadoooo");
		estadoooo.setLabel(gt("Estadoooo"));
		estadoooo.propertie().add("name","p_estadoooo").add("type","text").add("maxlength","30").add("showLabel","true");
		
		nome = new TextField(model,"nome");
		nome.setLabel(gt("Nome"));
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("desclabel","false");
		
		morada = new TextField(model,"morada");
		morada.setLabel(gt("Morada"));
		morada.propertie().add("name","p_morada").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("desclabel","false");
		
		estado_civil = new ListField(model,"estado_civil");
		estado_civil.setLabel(gt("Estado civil"));
		estado_civil.propertie().add("name","p_estado_civil").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","");
		
		data_de_registro = new DateField(model,"data_de_registro");
		data_de_registro.setLabel(gt("Data de registro"));
		data_de_registro.propertie().add("name","p_data_de_registro").add("type","date").add("range","false").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("desclabel","false");
		
		anexos = new FileField(model,"anexos");
		anexos.setLabel(gt("Anexos"));
		anexos.propertie().add("name","p_anexos").add("type","file").add("accept","").add("targetrend","").add("multiple","false").add("rendvalue","false").add("maxlength","250").add("required","false").add("disabled","false");
		
		nomes = new TextField(model,"nomes");
		nomes.setLabel(gt("Nomes"));
		nomes.propertie().add("name","p_nomes").add("type","text").add("maxlength","30").add("showLabel","true");
		
		moradas = new TextField(model,"moradas");
		moradas.setLabel(gt("Moradas"));
		moradas.propertie().add("name","p_moradas").add("type","text").add("maxlength","30").add("showLabel","true");
		
		estados = new TextField(model,"estados");
		estados.setLabel(gt("Estados"));
		estados.propertie().add("name","p_estados").add("type","text").add("maxlength","30").add("showLabel","true");
		
		datas = new TextField(model,"datas");
		datas.setLabel(gt("Datas"));
		datas.propertie().add("name","p_datas").add("type","text").add("maxlength","30").add("showLabel","true");
		
		anexoss = new LinkField(model,"anexoss");
		anexoss.setLabel(gt("Anexoss"));
		anexoss.setValue(new Config().getResolveUrl("app_teste","Teste_blocos","index"));

									anexoss_desc = new LinkField(model,"anexoss_desc");
		anexoss_desc.setLabel(gt("Anexoss"));
		anexoss.propertie().add("name","p_anexoss").add("type","link").add("target","_self").add("request_fields","").add("list_source","").add("refresh_submit","false").add("maxlength","30").add("showLabel","true").add("show_header","true").add("desc","true");
		


		btn_salvar = new IGRPButton("Salvar","app_teste","Teste_blocos","salvar","submit","primary|fa-angle-right","","");
		btn_salvar.propertie.add("type","form").add("rel","salvar");

		btn_testar_where = new IGRPButton("Testar where","app_teste","Teste_blocos","testar_where","submit","primary|fa-angle-right","","");
		btn_testar_where.propertie.add("type","form").add("rel","testar_where");

		btn_editar = new IGRPButton("Editar","app_teste","Teste_blocos","editar","_blank","primary|fa-angle-right","","");
		btn_editar.propertie.add("type","specific").add("rel","editar");

		
	}
		
	@Override
	public void render(){
		
		table_2.addField(nomeee);
		table_2.addField(moraadaa);
		table_2.addField(estadoooo);

		form_1.addField(nome);
		form_1.addField(morada);
		form_1.addField(estado_civil);
		form_1.addField(data_de_registro);
		form_1.addField(anexos);

		table_1.addField(nomes);
		table_1.addField(moradas);
		table_1.addField(estados);
		table_1.addField(datas);
		table_1.addField(anexoss);
		table_1.addField(anexoss_desc);

		form_1.addButton(btn_salvar);
		form_1.addButton(btn_testar_where);
		table_2.addButton(btn_editar);
		this.addToPage(table_2);
		this.addToPage(form_1);
		this.addToPage(table_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		nomeee.setValue(model);
		moraadaa.setValue(model);
		estadoooo.setValue(model);
		nome.setValue(model);
		morada.setValue(model);
		estado_civil.setValue(model);
		data_de_registro.setValue(model);
		anexos.setValue(model);
		nomes.setValue(model);
		moradas.setValue(model);
		estados.setValue(model);
		datas.setValue(model);
		anexoss.setValue(model);
		anexoss_desc.setValue(model);	

		table_2.loadModel(((Teste_blocos) model).getTable_2());
		table_1.loadModel(((Teste_blocos) model).getTable_1());
		}
}
