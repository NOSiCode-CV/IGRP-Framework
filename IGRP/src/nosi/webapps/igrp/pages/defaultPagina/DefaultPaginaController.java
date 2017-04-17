package nosi.webapps.igrp.pages.defaultPagina;

import nosi.core.webapp.Controller;

import java.io.IOException;

import nosi.core.webapp.*;
/**
 * @author Marcel Iekiny
 * Apr 15, 2017
 */
public class DefaultPaginaController extends Controller{
	
	public void actionIndex() throws IOException{
		
	DefaultPaginaModel model = new DefaultPaginaModel();
	/*
	 * Put your other model here ...
	 * */
	
	/*
	 * Put some business logic here ...
	 * */
	
	this.renderView(new DefaultPaginaView().addModel("model1", model).addModel("model2", new String("Iekiny Marcel")));
		
	}
	
}
