/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp_studio.pages.bpmndesigner;
import nosi.core.config.Config;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Part;

import nosi.core.webapp.Response;
import nosi.core.webapp.activit.rest.ProcessDefinitionService;
import nosi.webapps.igrp.dao.Application;

/*----#END-PRESERVED-AREA----*/

public class BPMNDesignerController extends Controller {		


	public Response actionIndex() throws IOException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		BPMNDesigner model = new BPMNDesigner();
		BPMNDesignerView view = new BPMNDesignerView(model);
		view.env_fk.setValue(new Application().getListApps());
		
		List<BPMNDesigner.Gen_table> data = new ArrayList<>();
		for(ProcessDefinitionService process: new ProcessDefinitionService().getProcessDefinitionsAtivos()){
			BPMNDesigner.Gen_table processo = new BPMNDesigner.Gen_table();
			processo.setId(process.getId());
			processo.setTitle(process.getName());
			data.add(processo);
		}
		view.gen_table.addData(data);
		Config.LINK_HOME ="webapps?r=igrp_studio/ListaPage/index";
		return this.renderView(view);
		
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionGravar() throws IOException, ServletException{
		/*----#START-PRESERVED-AREA(GRAVAR)----*/
		Core.setMessageInfo("Botão Gravar"); 
		Core.setMessageSuccess();
		Part data = Igrp.getInstance().getRequest().getPart("p_data");
		System.out.println(data);
		
		return this.redirect("igrp_studio","BPMNDesigner","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionPublicar() throws IOException{
		/*----#START-PRESERVED-AREA(PUBLICAR)----*/
		return this.redirect("igrp_studio","BPMNDesigner","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionExporar_imagem() throws IOException{
		/*----#START-PRESERVED-AREA(EXPORTAR_IMAGEM)----*/
		return this.redirect("igrp_studio","BPMNDesigner","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	/*----#END-PRESERVED-AREA----*/
}
