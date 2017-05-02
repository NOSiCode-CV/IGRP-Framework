package nosi.webapps.igrp.pages.generator;

import java.io.IOException;

import nosi.core.config.Config;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.Action;

public class GeneratorController extends Controller{

	
	public void actionIndex() throws IOException{		
		Generator model = new Generator();
		String id = Igrp.getInstance().getRequest().getParameter("id");
		Object obj = new Action().getOne(Integer.parseInt(id));
		Action ac = (Action) obj;
		
		model.setGen_elements("images/IGRP/Config/formgen.config.txt?id=");
		model.setId_objeto(Integer.parseInt(id));
		model.setId(ac.getId());
		model.setId_pai(ac.getEnv_fk());
		model.setLink_image("images/IGRP/Config/img.list.php?name=");	
		if(ac!=null && ac.getXsl_src()!=null && !ac.getXsl_src().equals("")){
			model.setPage_form("images/IGRP/IGRP"+Config.getPageVersion()+"/app/"+ac.getEnv().getDad()+"/"+ac.getPage().toLowerCase()+"/"+ac.getPage()+".json");
		}
		model.setPackage_("nosi.webapps."+ac.getEnv().getDad().toLowerCase()+".pages");
		model.setPage(ac.getPage());
		GeneratorView view = new GeneratorView(model);
		this.renderView(view,true);
	}
}