package nosi.webapps.igrp.pages.generator;

import java.io.File;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import java.io.IOException;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.FileHelper;
import nosi.webapps.igrp.dao.Action;
/*----#END-PRESERVED-AREA----*/

public class GeneratorController extends Controller{
	
	public Response actionIndex() throws IOException{		
		/*----#START-PRESERVED-AREA(INDEX)----*/
		this.isNoCached=true;
		Generator model = new Generator();
		String id = Core.getParam("id");
		if(Core.isNotNull(id)){
			try{
				Action ac = new Action();
				ac = ac.findOne(Integer.parseInt(id));	
				if(ac!=null){
					System.out.println("Id="+id);
					model.setGen_elements(this.getConfig().getLinkImgBase().replace("\\", "/")+"images/IGRP/Config/formgen.config.txt?id=");
					model.setId_objeto(Integer.parseInt(id));
					model.setId(ac.getId());
					model.setId_pai(ac.getApplication().getId());
					model.setLink_image(this.getConfig().getLinkImgBase().replace("\\", "/")+"images/IGRP/Config/img.list.php?name=");	
					String json = this.getConfig().getBaseServerPahtXsl(ac)+ File.separator +ac.getPage()+".json";
					if(ac!=null && FileHelper.fileExists(json)){
						json = this.getConfig().getResolvePathPage(ac.getApplication().getDad(),ac.getPage(), ac.getVersion())+"/"+ac.getPage()+".json";
						model.setPage_form(json.replace("\\", "/"));
					}
					model.setPackage_(this.getConfig().getPackage(ac.getApplication().getDad(), ac.getPage(), ac.getAction()));
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