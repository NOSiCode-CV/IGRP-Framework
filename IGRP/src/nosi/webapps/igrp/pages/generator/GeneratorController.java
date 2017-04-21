package nosi.webapps.igrp.pages.generator;

import java.io.IOException;

import nosi.core.webapp.Controller;

public class GeneratorController extends Controller{

	
	public void actionIndex() throws IOException{		
		GeneratorModel model = new GeneratorModel();
		model.setGen_elements("images/IGRP/Config/formgen.config.txt?id=");
		model.setId_objeto(11);
		model.setLink_image("images/IGRP/Config/img.list.php?name=");
		model.setLink_save("images/IGRP/Config/data.txt");
		GeneratorView view = new GeneratorView(model);
		this.renderView(view,true);
	}
}
