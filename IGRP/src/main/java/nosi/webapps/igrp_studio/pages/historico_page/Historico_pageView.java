package nosi.webapps.igrp_studio.pages.historico_page;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class Historico_pageView extends View {

	public Field descricao_form;
	public Field comentario;
	public Field id_historico;
	public Field id_page_form;
	public Field sectionheader_1_text;
	public Field nome;
	public Field descricao;
	public Field comentario_tbl;
	public Field data;
	public Field id_historico_tbl;
	public Field id_page;
	public IGRPForm form_1;
	public IGRPSectionHeader sectionheader_1;
	public IGRPTable table_1;

	public IGRPButton btn_salvar;
	public IGRPButton btn_editar_comentario;

	public Historico_pageView(){

		this.setPageTitle("Historico_page");
			
		form_1 = new IGRPForm("form_1","");

		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");

		table_1 = new IGRPTable("table_1","");

		descricao_form = new TextField(model,"descricao_form");
		descricao_form.setLabel(gt("Descrição"));
		descricao_form.propertie().add("name","p_descricao_form").add("type","text").add("maxlength","250").add("required","true").add("readonly","true").add("disabled","false").add("placeholder",gt("")).add("desclabel","false");
		
		comentario = new TextField(model,"comentario");
		comentario.setLabel(gt("Comentário"));
		comentario.propertie().add("name","p_comentario").add("type","text").add("maxlength","100").add("required","true").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false");
		
		id_historico = new HiddenField(model,"id_historico");
		id_historico.setLabel(gt(""));
		id_historico.propertie().add("name","p_id_historico").add("type","hidden").add("maxlength","250").add("java-type","").add("tag","id_historico");
		
		id_page_form = new HiddenField(model,"id_page_form");
		id_page_form.setLabel(gt(""));
		id_page_form.propertie().add("name","p_id_page_form").add("type","hidden").add("maxlength","250").add("java-type","").add("tag","id_page_form");
		
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Sectionheader"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		nome = new TextField(model,"nome");
		nome.setLabel(gt("Nome"));
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("Descrição"));
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		comentario_tbl = new TextField(model,"comentario_tbl");
		comentario_tbl.setLabel(gt("Comentário"));
		comentario_tbl.propertie().add("name","p_comentario_tbl").add("type","text").add("maxlength","50").add("showLabel","true").add("group_in","");
		
		data = new DateField(model,"data");
		data.setLabel(gt("Data"));
		data.propertie().add("name","p_data").add("type","date").add("range","false").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		id_historico_tbl = new HiddenField(model,"id_historico_tbl");
		id_historico_tbl.setLabel(gt(""));
		id_historico_tbl.propertie().add("name","p_id_historico_tbl").add("type","hidden").add("maxlength","30").add("showLabel","true").add("group_in","").add("java-type","").add("tag","id_historico_tbl");
		
		id_page = new HiddenField(model,"id_page");
		id_page.setLabel(gt(""));
		id_page.propertie().add("name","p_id_page").add("type","hidden").add("maxlength","30").add("showLabel","true").add("group_in","").add("java-type","").add("tag","id_page");
		


		btn_salvar = new IGRPButton("Salvar","igrp_studio","Historico_page","salvar","submit","primary|fa-save","","");
		btn_salvar.propertie.add("id","button_7969_322f").add("type","form").add("class","primary").add("rel","salvar").add("refresh_components","form_1,table_1");

		btn_editar_comentario = new IGRPButton("Editar Comentário","igrp_studio","Historico_page","editar_comentario","submit","warning|fa-edit","","");
		btn_editar_comentario.propertie.add("id","button_20fb_3895").add("type","specific").add("class","warning").add("rel","editar_comentario").add("refresh_components","");

		
	}
		
	@Override
	public void render(){
		
		form_1.addField(descricao_form);
		form_1.addField(comentario);
		form_1.addField(id_historico);
		form_1.addField(id_page_form);

		sectionheader_1.addField(sectionheader_1_text);

		table_1.addField(nome);
		table_1.addField(descricao);
		table_1.addField(comentario_tbl);
		table_1.addField(data);
		table_1.addField(id_historico_tbl);
		table_1.addField(id_page);

		form_1.addButton(btn_salvar);
		table_1.addButton(btn_editar_comentario);
		this.addToPage(form_1);
		this.addToPage(sectionheader_1);
		this.addToPage(table_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		descricao_form.setValue(model);
		comentario.setValue(model);
		id_historico.setValue(model);
		id_page_form.setValue(model);
		nome.setValue(model);
		descricao.setValue(model);
		comentario_tbl.setValue(model);
		data.setValue(model);
		id_historico_tbl.setValue(model);
		id_page.setValue(model);	

		table_1.loadModel(((Historico_page) model).getTable_1());
		}
}
