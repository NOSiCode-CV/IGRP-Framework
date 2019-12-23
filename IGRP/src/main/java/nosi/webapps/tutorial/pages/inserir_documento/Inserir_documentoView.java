package nosi.webapps.tutorial.pages.inserir_documento;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class Inserir_documentoView extends View {

	public Field sectionheader_1_text;
	public Field titulo;
	public Field type;
	public Field descricao;
	public Field relacionados;
	public Field id_doc;
	public Field link_upload_img;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;

	public IGRPButton btn_salvar;

	public Inserir_documentoView(){

		this.setPageTitle("Inserir Documento");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");

		form_1 = new IGRPForm("form_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("<p>Inserir um novo documento</p>"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		titulo = new TextField(model,"titulo");
		titulo.setLabel(gt("Título do documento"));
		titulo.propertie().add("name","p_titulo").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false");
		
		type = new ListField(model,"type");
		type.setLabel(gt("Tipo"));
		type.propertie().add("name","p_type").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","true").add("disabled","false").add("java-type","");
		
		descricao = new TextEditorField(model,"descricao");
		descricao.setLabel(gt("Documento"));
		descricao.propertie().add("name","p_descricao").add("type","texteditor").add("maxlength","999999").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false");
		
		relacionados = new ListField(model,"relacionados");
		relacionados.setLabel(gt("Documentos relacionados"));
		relacionados.propertie().add("name","p_relacionados").add("type","select").add("multiple","true").add("tags","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","");
		
		id_doc = new HiddenField(model,"id_doc");
		id_doc.setLabel(gt(""));
		id_doc.propertie().add("name","p_id_doc").add("type","hidden").add("maxlength","250").add("java-type","").add("tag","id_doc");
		
		link_upload_img = new HiddenField(model,"link_upload_img");
		link_upload_img.setLabel(gt(""));
		link_upload_img.propertie().add("name","p_link_upload_img").add("type","hidden").add("maxlength","250").add("java-type","").add("tag","link_upload_img");
		


		btn_salvar = new IGRPButton("Salvar","tutorial","Inserir_documento","salvar","submit_form","primary|fa-save","","");
		btn_salvar.propertie.add("type","form").add("class","primary").add("rel","salvar").add("refresh_components","");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(titulo);
		form_1.addField(type);
		form_1.addField(descricao);
		form_1.addField(relacionados);
		form_1.addField(id_doc);
		form_1.addField(link_upload_img);

		form_1.addButton(btn_salvar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		titulo.setValue(model);
		type.setValue(model);
		descricao.setValue(model);
		relacionados.setValue(model);
		id_doc.setValue(model);
		link_upload_img.setValue(model);	

		}
}
