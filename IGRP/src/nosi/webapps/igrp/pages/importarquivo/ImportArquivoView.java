/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.importarquivo;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class ImportArquivoView extends View {
	
	
	public Field sectionheader_1_text;
	public Field arquivo;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_import;
	public ImportArquivoView(ImportArquivo model){
		this.setPageTitle("Pagina que importa os arquivos Jar");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");
		form_1 = new IGRPForm("form_1","");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel("");
		
		sectionheader_1_text.setValue("Import Arquivos Jar (Páginas/Aplicações)");
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		arquivo = new FileField(model,"arquivo");
		arquivo.setLabel("Arquivo");
		
		arquivo.propertie().add("name","p_arquivo").add("type","file").add("accept","").add("targetrend","").add("multiple","false").add("rendvalue","false").add("maxlength","30").add("required","true").add("disabled","false").add("right","false").add("class","primary");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_import = new IGRPButton("Import","igrp","ImportArquivo","import","submit","success|fa-download","","");
		btn_import.propertie.add("type","specific").add("code","").add("rel","import");
		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);


		form_1.addField(arquivo);

		toolsbar_1.addButton(btn_import);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/