/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.pesquisarorganica;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class PesquisarOrganicaView extends View {		
	
	public Field sectionheader_1_text;
	public Field aplicacao;
	public Field descricao;
	public Field estado;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_novo;
	public IGRPButton btn_pesquisar;
	public PesquisarOrganicaView(PesquisarOrganica model){			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1");
		form_1 = new IGRPForm("form_1");
		table_1 = new IGRPTable("table_1");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel("");
		sectionheader_1_text.setValue("Gestao Organica");
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

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_novo = new IGRPButton("Novo","igrp","nova-organica","index","_self","default|fa-angle-right","","");
		btn_novo.propertie.add("type","specific").add("code","").add("rel","novo");
		btn_pesquisar = new IGRPButton("Pesquisar","igrp","pesquisar-organica","index","_self","default|fa-angle-right","","");
		btn_pesquisar.propertie.add("type","form").add("code","").add("class","default").add("rel","pesquisar");
		
	}
		
	@Override
	public void render(){

		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(aplicacao);


		table_1.addField(descricao);
		table_1.addField(estado);

		toolsbar_1.addButton(btn_novo);
		form_1.addButton(btn_pesquisar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/