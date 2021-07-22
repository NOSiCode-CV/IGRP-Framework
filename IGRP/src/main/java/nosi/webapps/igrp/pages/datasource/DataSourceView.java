package nosi.webapps.igrp.pages.datasource;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class DataSourceView extends View {

	public Field tipo;
	public Field data_source;
	public Field nome;
	public Field processo;
	public Field etapa;
	public Field objecto;
	public Field pagina;
	public Field query;
	public Field servico;
	public Field id_pagina;
	public Field id_servico;
	public Field id;
	public Field id_env;
	public Field datasorce_app;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public IGRPButton btn_fechar;

	public DataSourceView(){

		this.setPageTitle("Registar Data Source");
			
		form_1 = new IGRPForm("form_1","");

		tipo = new ListField(model,"tipo");
		tipo.setLabel(gt("Tipo"));
		tipo.propertie().add("name","p_tipo").add("type","select").add("multiple","false").add("maxlength","100").add("required","true").add("disabled","false").add("domain","").add("java-type","").add("tags","false");
		
		data_source = new ListField(model,"data_source");
		data_source.setLabel(gt("Data Source"));
		data_source.propertie().add("name","p_data_source").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","true").add("disabled","false").add("java-type","").add("tags","false");
		
		nome = new TextField(model,"nome");
		nome.setLabel(gt("Nome"));
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","80").add("required","true").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false");
		
		processo = new ListField(model,"processo");
		processo.setLabel(gt("Processo"));
		processo.propertie().add("name","p_processo").add("type","select").add("multiple","false").add("maxlength","100").add("required","true").add("disabled","false").add("domain","").add("java-type","").add("tags","false");
		
		etapa = new ListField(model,"etapa");
		etapa.setLabel(gt("Etapa"));
		etapa.propertie().add("name","p_etapa").add("type","select").add("multiple","false").add("maxlength","100").add("required","true").add("disabled","false").add("domain","").add("java-type","").add("tags","false");
		
		objecto = new TextField(model,"objecto");
		objecto.setLabel(gt("Objeto"));
		objecto.propertie().add("name","p_objecto").add("type","text").add("maxlength","100").add("required","true").add("readonly","false").add("disabled","false").add("placeholder",gt("Table or View name")).add("desclabel","false");
		
		pagina = new LookupField(model,"pagina");
		pagina.setLabel(gt("Página"));
		pagina.setLookup("igrp","Dominio","index");
		pagina.addParam("target","_blank");
		pagina.propertie().add("name","p_pagina").add("type","lookup").add("lookup_type","LOOKUP").add("class","primary").add("maxlength","100").add("required","true").add("readonly","true").add("disabled","false").add("placeholder",gt("")).add("lookup_eraser","true").add("desclabel","false");
		
		query = new TextAreaField(model,"query");
		query.setLabel(gt("Query"));
		query.propertie().add("name","p_query").add("type","textarea").add("maxlength","4000").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("SELECT * FROM tableName")).add("desclabel","false");
		
		servico = new LookupField(model,"servico");
		servico.setLabel(gt("Serviço"));
		servico.setLookup("igrp","DataSource","index");
		servico.addParam("target","_blank");
		servico.propertie().add("name","p_servico").add("type","lookup").add("lookup_type","LOOKUP").add("class","default").add("maxlength","200").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("lookup_eraser","false").add("desclabel","false");
		
		id_pagina = new HiddenField(model,"id_pagina");
		id_pagina.setLabel(gt(""));
		id_pagina.propertie().add("name","p_id_pagina").add("type","hidden").add("maxlength","30").add("java-type","int").add("tag","id_pagina");
		
		id_servico = new HiddenField(model,"id_servico");
		id_servico.setLabel(gt(""));
		id_servico.propertie().add("name","p_id_servico").add("type","hidden").add("maxlength","30").add("java-type","").add("tag","id_servico");
		
		id = new HiddenField(model,"id");
		id.setLabel(gt(""));
		id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("java-type","").add("tag","id");
		
		id_env = new HiddenField(model,"id_env");
		id_env.setLabel(gt(""));
		id_env.propertie().add("name","p_id_env").add("type","hidden").add("maxlength","30").add("java-type","").add("tag","id_env");
		
		datasorce_app = new HiddenField(model,"datasorce_app");
		datasorce_app.setLabel(gt(""));
		datasorce_app.propertie().add("name","p_datasorce_app").add("type","hidden").add("maxlength","250").add("java-type","").add("tag","datasorce_app");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_gravar = new IGRPButton("Gravar","igrp","DataSource","gravar","submit","primary|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("rel","gravar").add("refresh_components","");

		btn_fechar = new IGRPButton("Fechar","igrp","DataSource","fechar","_close","danger|fa-close","","");
		btn_fechar.propertie.add("type","specific").add("rel","fechar").add("refresh_components","");

		
	}
		
	@Override
	public void render(){
		

		form_1.addField(tipo);
		form_1.addField(data_source);
		form_1.addField(nome);
		form_1.addField(processo);
		form_1.addField(etapa);
		form_1.addField(objecto);
		form_1.addField(pagina);
		form_1.addField(query);
		form_1.addField(servico);
		form_1.addField(id_pagina);
		form_1.addField(id_servico);
		form_1.addField(id);
		form_1.addField(id_env);
		form_1.addField(datasorce_app);

		toolsbar_1.addButton(btn_gravar);
		toolsbar_1.addButton(btn_fechar);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		tipo.setValue(model);
		data_source.setValue(model);
		nome.setValue(model);
		processo.setValue(model);
		etapa.setValue(model);
		objecto.setValue(model);
		pagina.setValue(model);
		query.setValue(model);
		servico.setValue(model);
		id_pagina.setValue(model);
		id_servico.setValue(model);
		id.setValue(model);
		id_env.setValue(model);
		datasorce_app.setValue(model);	

		}
}
