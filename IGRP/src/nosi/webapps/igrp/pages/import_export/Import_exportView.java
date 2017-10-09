/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.import_export;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class Import_exportView extends View {
	
	
	public Field sectionheader_1_text;
	public Field aplicacao;
	public Field data_de;
	public Field data_ate;
	public Field tipo;
	public Field aplicacao_tabela;
	public Field utilizador;
	public Field data;
	public Field tipo_tabela;
	public Field download;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_export;
	public IGRPButton btn_import;
	public IGRPButton btn_pesquisar;
	public Import_exportView(Import_export model){
		this.setPageTitle("Importar e exportar uma aplicacao");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");
		form_1 = new IGRPForm("form_1","");
		table_1 = new IGRPTable("table_1","");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel("");
		
		sectionheader_1_text.setValue("Import/Export de uma Aplicação");
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel("Aplicação");
		
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		data_de = new DateField(model,"data_de");
		data_de.setLabel("Data De");
		
		data_de.propertie().add("name","p_data_de").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","default");
		data_ate = new DateField(model,"data_ate");
		data_ate.setLabel("Data até");
		
		data_ate.propertie().add("name","p_data_ate").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","default");
		tipo = new ListField(model,"tipo");
		tipo.setLabel("Tipo");
		
		tipo.propertie().add("name","p_tipo").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		aplicacao_tabela = new TextField(model,"aplicacao_tabela");
		aplicacao_tabela.setLabel("Aplicação");
		
		aplicacao_tabela.propertie().add("name","p_aplicacao_tabela").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		utilizador = new TextField(model,"utilizador");
		utilizador.setLabel("Utilizador");
		
		utilizador.propertie().add("name","p_utilizador").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		data = new TextField(model,"data");
		data.setLabel("Data");
		
		data.propertie().add("name","p_data").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		tipo_tabela = new TextField(model,"tipo_tabela");
		tipo_tabela.setLabel("Tipo");
		
		tipo_tabela.propertie().add("name","p_tipo_tabela").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		download = new TextField(model,"download");
		download.setLabel("Download");
		
		download.propertie().add("name","p_download").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_export = new IGRPButton("Export","igrp","Import_export","export","_blank","danger|fa-chevron-up","","");
		btn_export.propertie.add("type","specific").add("code","").add("rel","export");
		btn_import = new IGRPButton("Import","igrp","Import_export","import","_blank","success|fa-chevron-down","","");
		btn_import.propertie.add("type","specific").add("code","").add("rel","import");
		btn_pesquisar = new IGRPButton("Pesquisar","igrp","Import_export","pesquisar","submit","default|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("code","").add("class","default").add("rel","pesquisar");
		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(aplicacao);
		form_1.addField(data_de);
		form_1.addField(data_ate);
		form_1.addField(tipo);


		table_1.addField(aplicacao_tabela);
		table_1.addField(utilizador);
		table_1.addField(data);
		table_1.addField(tipo_tabela);
		table_1.addField(download);

		toolsbar_1.addButton(btn_export);
		toolsbar_1.addButton(btn_import);
		form_1.addButton(btn_pesquisar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/