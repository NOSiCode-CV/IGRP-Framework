package nosi.webapps.marcacao_consulta.pages.maindashboard;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class MaindashboardView extends View {

	public Field upload;
	public Field images;
	public Field sectionheader_1_text;
	public Field nome;
	public Field morada;
	public Field data_nascimento;
	public IGRPForm form_1;
	public IGRPSectionHeader sectionheader_1;
	public IGRPTable table_1;

	public IGRPButton btn_gravar;

	public MaindashboardView(){

		this.setPageTitle("MainDashboard");
			
		form_1 = new IGRPForm("form_1","");

		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");

		table_1 = new IGRPTable("table_1","");

		upload = new FileField(model,"upload");
		upload.setLabel(gt("Upload"));
		upload.propertie().add("name","p_upload").add("type","file").add("accept","").add("targetrend","").add("multiple","false").add("rendvalue","false").add("maxlength","250").add("required","false").add("disabled","false");
		
		images = new TextField(model,"images");
		images.setLabel(gt("Images"));
		images.setValue(gt("/IGRP/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		images.propertie().add("name","p_images").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250").add("placeholder",gt("")).add("desclabel","false");
		
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("<p>Lista utentes</p>"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		nome = new PlainTextField(model,"nome");
		nome.setLabel(gt("Nome"));
		nome.propertie().add("name","p_nome").add("type","plaintext").add("disable_output_escaping","false").add("html_class","").add("maxlength","150").add("showLabel","true").add("group_in","");
		
		morada = new PlainTextField(model,"morada");
		morada.setLabel(gt("Morada"));
		morada.propertie().add("name","p_morada").add("type","plaintext").add("disable_output_escaping","false").add("html_class","").add("maxlength","100").add("showLabel","true").add("group_in","");
		
		data_nascimento = new PlainTextField(model,"data_nascimento");
		data_nascimento.setLabel(gt("Data nascimento"));
		data_nascimento.propertie().add("name","p_data_nascimento").add("type","plaintext").add("disable_output_escaping","false").add("html_class","").add("maxlength","10").add("showLabel","true").add("group_in","");
		


		btn_gravar = new IGRPButton("Gravar","marcacao_consulta","Maindashboard","gravar","submit","primary|fa-angle-right","","");
		btn_gravar.propertie.add("type","form").add("rel","gravar");

		
	}
		
	@Override
	public void render(){
		
		form_1.addField(upload);
		form_1.addField(images);

		sectionheader_1.addField(sectionheader_1_text);

		table_1.addField(nome);
		table_1.addField(morada);
		table_1.addField(data_nascimento);

		form_1.addButton(btn_gravar);
		this.addToPage(form_1);
		this.addToPage(sectionheader_1);
		this.addToPage(table_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		upload.setValue(model);
		nome.setValue(model);
		morada.setValue(model);
		data_nascimento.setValue(model);	

		table_1.loadModel(((Maindashboard) model).getTable_1());
		}
}
