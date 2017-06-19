/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.datasource;
import nosi.core.webapp.View;
import nosi.core.config.Config;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class DataSourceView extends View {
	
	
	public Field tipo;
	public Field nome;
	public Field aplicacao;
	public Field area;
	public Field processo;
	public Field etapa;
	public Field objecto;
	public Field pagina;
	public Field query;
	public Field servico;
	public Field p_id_pagina;
	public Field p_id_servico;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public IGRPButton btn_fechar;
	public DataSourceView(DataSource model){
		this.setPageTitle("Data Source");
			
		form_1 = new IGRPForm("form_1");
		tipo = new ListField(model,"tipo");
		tipo.setLabel("Tipo");
		tipo.propertie().add("name","p_tipo").add("type","select").add("multiple","false").add("maxlength","100").add("required","true").add("change","false").add("disabled","false").add("right","false");
		nome = new TextField(model,"nome");
		nome.setLabel("Nome");
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","80").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel("Aplicacao");
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("maxlength","100").add("required","false").add("change","false").add("disabled","false").add("right","false");
		area = new ListField(model,"area");
		area.setLabel("Area");
		area.propertie().add("name","p_area").add("type","select").add("multiple","false").add("maxlength","100").add("required","false").add("change","false").add("disabled","false").add("right","false");
		processo = new ListField(model,"processo");
		processo.setLabel("Processo");
		processo.propertie().add("name","p_processo").add("type","select").add("multiple","false").add("maxlength","100").add("required","false").add("change","false").add("disabled","false").add("right","false");
		etapa = new ListField(model,"etapa");
		etapa.setLabel("Etapa");
		etapa.propertie().add("name","p_etapa").add("type","select").add("multiple","false").add("maxlength","100").add("required","false").add("change","false").add("disabled","false").add("right","false");
		objecto = new TextField(model,"objecto");
		objecto.setLabel("Objecto");
		objecto.propertie().add("name","p_objecto").add("type","text").add("maxlength","100").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		pagina = new LookupField(model,"pagina");
		pagina.setLabel("Pagina");
		pagina.propertie().add("name","p_pagina").add("type","lookup").add("action","index").add("page","DataSource").add("app","igrp").add("lookup_type","LOOKUP").add("class","default").add("maxlength","100").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		query = new TextAreaField(model,"query");
		query.setLabel("Query");
		query.propertie().add("name","p_query").add("type","textarea").add("maxlength","4000").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		servico = new LookupField(model,"servico");
		servico.setLabel("Servico");
		servico.propertie().add("name","p_servico").add("type","lookup").add("action","index").add("page","DataSource").add("app","igrp").add("lookup_type","LOOKUP").add("class","default").add("maxlength","200").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		p_id_pagina = new HiddenField(model,"p_id_pagina");
		p_id_pagina.setLabel("");
		p_id_pagina.propertie().add("name","p_id_pagina").add("type","hidden").add("maxlength","30").add("tag","id_pagina");
		p_id_servico = new HiddenField(model,"p_id_servico");
		p_id_servico.setLabel("");
		p_id_servico.propertie().add("name","p_id_servico").add("type","hidden").add("maxlength","30").add("tag","id_servico");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_gravar = new IGRPButton("Gravar","igrp","DataSource","gravar","submit","default|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");
		btn_fechar = new IGRPButton("Fechar","igrp","DataSource","fechar","_close","default|fa-close","","");
		btn_fechar.propertie.add("type","specific").add("code","").add("rel","fechar");
		
	
	}
		
	@Override
	public void render(){
		Config.target = "_blank";		

		form_1.addField(tipo);
		form_1.addField(nome);
		form_1.addField(aplicacao);
		form_1.addField(area);
		form_1.addField(processo);
		form_1.addField(etapa);
		form_1.addField(objecto);
		form_1.addField(pagina);
		form_1.addField(query);
		form_1.addField(servico);
		form_1.addField(p_id_pagina);
		form_1.addField(p_id_servico);

		toolsbar_1.addButton(btn_gravar);
		toolsbar_1.addButton(btn_fechar);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/