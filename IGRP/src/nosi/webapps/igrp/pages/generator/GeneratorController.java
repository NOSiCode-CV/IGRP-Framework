package nosi.webapps.igrp.pages.generator;

import java.io.IOException;

import nosi.core.webapp.Controller;

public class GeneratorController extends Controller{

	public void actionIndex() throws IOException{
		
		GeneratorModel model = new GeneratorModel();
	
		this.renderView(
				new GeneratorView().
				addModel("model", model),true
				);
		}
}
