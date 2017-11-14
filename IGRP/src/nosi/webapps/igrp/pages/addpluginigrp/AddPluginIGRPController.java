
package nosi.webapps.igrp.pages.addpluginigrp;

/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.http.Part;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
import nosi.core.webapp.import_export.ImportPluginIGRP;
import nosi.core.webapp.Igrp;
/*----#END-PRESERVED-AREA----*/

public class AddPluginIGRPController extends Controller {		


	public Response actionIndex()  throws IOException, IllegalArgumentException, IllegalAccessException{
		
        /*----#START-PRESERVED-AREA(INDEX)----*/
      	AddPluginIGRP model = new AddPluginIGRP();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
		}
		AddPluginIGRPView view = new AddPluginIGRPView(model);
		return this.renderView(view);
      /*----#END-PRESERVED-AREA----*/
    
	}


	public Response actionImportar()  throws IOException, IllegalArgumentException, IllegalAccessException, ServletException{
		
        /*----#START-PRESERVED-AREA(IMPORTAR)----*/
      	if(Igrp.getMethod().equalsIgnoreCase("post")){
			Collection<Part> parts = Igrp.getInstance().getRequest().getParts();
			boolean imported = false;
			for(Part part:parts){
				if(part.getSubmittedFileName()!=null && part.getSubmittedFileName().endsWith(".jar")){
					imported = new ImportPluginIGRP().importPlugin(part);
				}
			}
			if(imported){
				Core.setMessageSuccess("Plugin Importado com sucesso");
			}else{
				Core.setMessageError("Falha na importação de plugin");
			}
		}
		return this.redirect("igrp","AddPluginIGRP","index");
      /*----#END-PRESERVED-AREA----*/
    
	}
	
	
        /*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
        
    /*----#END-PRESERVED-AREA----*/
}
