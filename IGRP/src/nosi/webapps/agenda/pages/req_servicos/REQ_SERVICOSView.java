/*-------------------------*/

/*Create View*/

package nosi.webapps.agenda.pages.req_servicos;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class REQ_SERVICOSView extends View {
	
	
	public Field sectionheader_1_text;
	public Field servico;
	public Field tipo_requisito;
	public Field upload;
	public Field descritivo;
	public IGRPBox box_1;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;
	public IGRPSeparatorList separatorlist_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public REQ_SERVICOSView(REQ_SERVICOS model){
		this.setPageTitle("Requisições de Serviços");
			
		box_1 = new IGRPBox("box_1");
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1");
		form_1 = new IGRPForm("form_1");
		separatorlist_1 = new IGRPSeparatorList("separatorlist_1");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel("");
		sectionheader_1_text.setValue("Requisitos");
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		servico = new ListField(model,"servico");
		servico.setLabel("Serviço");
		servico.propertie().add("name","p_servico").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false");
		tipo_requisito = new ListField(model,"tipo_requisito");
		tipo_requisito.setLabel("Tipo Requisito");
		tipo_requisito.propertie().add("name","p_tipo_requisito").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false").add("visible","true").add("desc","true");
		upload = new FileField(model,"upload");
		upload.setLabel("Upload");
		upload.propertie().add("name","p_upload").add("type","file").add("accept","file_extension").add("multiple","false").add("maxlength","30").add("required","false").add("disabled","false").add("right","false").add("visible","true").add("class","primary").add("desc","true");
		descritivo = new TextAreaField(model,"descritivo");
		descritivo.setLabel("Descritivo");
		descritivo.propertie().add("name","p_descritivo").add("type","textarea").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("visible","true").add("desc","true");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_gravar = new IGRPButton("Gravar","agenda","REQ_SERVICOS","gravar","submit","success|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");
		
	
	}
		
	@Override
	public void render(){
		

		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(servico);

		separatorlist_1.addField(tipo_requisito);
		separatorlist_1.addField(upload);
		separatorlist_1.addField(descritivo);


		toolsbar_1.addButton(btn_gravar);
		this.addToPage(box_1);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(separatorlist_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/