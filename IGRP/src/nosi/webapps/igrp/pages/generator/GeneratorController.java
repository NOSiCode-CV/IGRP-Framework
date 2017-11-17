package nosi.webapps.igrp.pages.generator;

/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import java.io.IOException;
import nosi.core.config.Config;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.FileHelper;
import nosi.webapps.igrp.dao.Action;
/*----#END-PRESERVED-AREA----*/

public class GeneratorController extends Controller{
	
	public Response actionIndex() throws IOException{		
		/*----#START-PRESERVED-AREA(INDEX)----*/
		Generator model = new Generator();
		String id = Igrp.getInstance().getRequest().getParameter("id");
		if(id!=null && !id.equals("")){
			try{
				Action ac = new Action();
				ac = ac.findOne(Integer.parseInt(id));	
				if(ac!=null){
					model.setGen_elements("images/IGRP/Config/formgen.config.txt?id=");
					model.setId_objeto(Integer.parseInt(id));
					model.setId(ac.getId());
					model.setId_pai(ac.getApplication().getId());
					model.setLink_image("images/IGRP/Config/img.list.php?name=");	
					String json = Config.getResolvePathXsl(ac.getApplication().getDad(), ac.getPage(), ac.getVersion())+"/"+ac.getPage()+".json";
					if(ac!=null && FileHelper.fileExists(Config.getBasePathXsl()+json)){
						model.setPage_form(json);
					}
					model.setPackage_(Config.getPackage(ac.getApplication().getDad(), ac.getPage(), ac.getAction()));
					model.setPage(ac.getPage());
					GeneratorView view = new GeneratorView(model);
					return this.renderView(view,true);
				}
			}catch(NumberFormatException e){
				return this.redirect("igrp", "error-page", "exception");
			}
		}
		return this.redirect("igrp", "error-page", "exception");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	/*----#END-PRESERVED-AREA----*/
}