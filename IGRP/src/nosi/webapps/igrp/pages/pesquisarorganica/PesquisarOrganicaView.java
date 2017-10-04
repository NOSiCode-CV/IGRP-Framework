
package nosi.webapps.igrp.pages.pesquisarorganica;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import nosi.core.config.Config; 

public class PesquisarOrganicaView extends View {
	public String title = "";		
	
	public Field sectionheader_1_text;
	public Field aplicacao;
	public Field descricao;
	public Field estado;
	public Field p_id;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_pesquisar;
	public IGRPButton btn_eidtar;
	public IGRPButton btn_eliminar;
	public IGRPButton btn_menu;
	public IGRPButton btn_transacao;
	public IGRPButton btn_etapa;
	public IGRPButton btn_novo;
	
	public PesquisarOrganicaView(PesquisarOrganica model){			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1");
		form_1 = new IGRPForm("form_1");
		table_1 = new IGRPTable("table_1");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel("");
		sectionheader_1_text.setValue("Gestão Orgânica");
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel("Aplicacao");
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		descricao = new PlainTextField(model,"descricao");
		descricao.setLabel("Descricao");
		descricao.propertie().add("name","p_descricao").add("type","plaintext").add("maxlength","30").add("align","left").add("lookup_parser","false");
		estado = new PlainTextField(model,"estado");
		estado.setLabel("Estado");
		estado.propertie().add("name","p_estado").add("type","plaintext").add("maxlength","30").add("align","left").add("lookup_parser","false");
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel("");
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("tag","id");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_pesquisar = new IGRPButton("Pesquisar","igrp","PesquisarOrganica","index","submit","default|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("code","").add("class","default").add("rel","pesquisar");
		btn_eidtar = new IGRPButton("Eidtar","igrp","nova-organica","editar","_self","default|fa-pencil","","");
		btn_eidtar.propertie.add("type","specific").add("code","").add("class","default").add("rel","eidtar");
		btn_eliminar = new IGRPButton("Eliminar","igrp","PesquisarOrganica","eliminar","confirm","default|fa-trash","","");
		btn_eliminar.propertie.add("type","specific").add("code","").add("class","default").add("rel","eliminar");
		btn_menu = new IGRPButton("Menu","igrp","PesquisarOrganica","menu","submit","default|fa-angle-right","","");
		btn_menu.propertie.add("type","specific").add("code","").add("class","default").add("rel","menu");
		btn_transacao = new IGRPButton("Transacao","igrp","PesquisarOrganica","transacao","submit","default|fa-angle-right","","");
		btn_transacao.propertie.add("type","specific").add("code","").add("class","default").add("rel","transacao");
		btn_etapa = new IGRPButton("Etapa","igrp","PesquisarOrganica","etapa","submit","default|fa-angle-right","","");
		btn_etapa.propertie.add("type","specific").add("code","").add("class","default").add("rel","etapa");
		btn_novo = new IGRPButton("Novo","igrp","NovaOrganica","index","_self","success|fa-plus","","");
		btn_novo.propertie.add("type","specific").add("code","").add("class","default").add("rel","novo");
	}
		
	@Override
	public void render(){
		Config.TITLE = this.title;

		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(aplicacao);


		table_1.addField(descricao);
		table_1.addField(estado);
		table_1.addField(p_id);

		form_1.addButton(btn_pesquisar);
		table_1.addButton(btn_eidtar);
		table_1.addButton(btn_eliminar);
		table_1.addButton(btn_menu);
		table_1.addButton(btn_transacao);
		//table_1.addButton(btn_etapa);

		toolsbar_1.addButton(btn_novo);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
}