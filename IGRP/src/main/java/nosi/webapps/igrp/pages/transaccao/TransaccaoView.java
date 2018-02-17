
package nosi.webapps.igrp.pages.transaccao;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class TransaccaoView extends View {
	
	
	public Field sectionheader_1_text;
	public Field status;
	public Field status_check;
	public Field descricao;
	public Field codigo;
	public Field aplicacao;
	public Field organica;
	public Field filtro_codigo;
	public IGRPForm sectionheader_1;
	public IGRPTable table_1;
	public IGRPForm form_1;

	public IGRPButton btn_pesquisar;
	public IGRPButton btn_editar;
	public IGRPButton btn_eliminar;
	public TransaccaoView(Transaccao model){

		this.setPageTitle("Transaccao");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");
		table_1 = new IGRPTable("table_1","");
		form_1 = new IGRPForm("form_1","Filtro");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Gestão de Transações"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		status = new CheckBoxField(model,"status");
		status.setLabel(gt("Estado"));
		status.propertie().add("name","p_status").add("type","checkbox").add("maxlength","30").add("switch","true").add("check","true").add("desc","true");
		
		status_check = new CheckBoxField
		(model,"status_check");
		status_check.propertie().add("name","p_status").add("type","checkbox").add("maxlength","30").add("switch","true").add("check","true").add("desc","true");
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("Nome"));
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","30");
		
		codigo = new TextField(model,"codigo");
		codigo.setLabel(gt("Código"));
		codigo.propertie().add("name","p_codigo").add("type","text").add("maxlength","30");
		
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("domain","").add("java-type","");
		
		organica = new ListField(model,"organica");
		organica.setLabel(gt("Organização"));
		organica.propertie().add("name","p_organica").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("domain","").add("java-type","");
		
		filtro_codigo = new TextField(model,"filtro_codigo");
		filtro_codigo.setLabel(gt("Código"));
		filtro_codigo.propertie().add("name","p_filtro_codigo").add("type","text").add("maxlength","30").add("required","false");
		


		btn_pesquisar = new IGRPButton("Pesquisar","igrp","Transaccao","pesquisar","submit","primary|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("rel","pesquisar");

		btn_editar = new IGRPButton("Editar","igrp","Transaccao","editar","modal|refresh","warning|fa-pencil","","");
		btn_editar.propertie.add("type","specific").add("rel","editar");

		btn_eliminar = new IGRPButton("Eliminar","igrp","Transaccao","eliminar","confirm","danger|fa-trash","","");
		btn_eliminar.propertie.add("type","specific").add("rel","eliminar");
		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		table_1.addField(status);
		table_1.addField(status_check);
		table_1.addField(descricao);
		table_1.addField(codigo);

		form_1.addField(aplicacao);
		form_1.addField(organica);
		form_1.addField(filtro_codigo);

		form_1.addButton(btn_pesquisar);
		table_1.addButton(btn_editar);
		table_1.addButton(btn_eliminar);
		this.addToPage(sectionheader_1);
		this.addToPage(table_1);
		this.addToPage(form_1);
	}
}
