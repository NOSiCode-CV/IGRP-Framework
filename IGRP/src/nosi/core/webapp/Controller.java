package nosi.core.webapp;

import java.io.IOException;

import nosi.core.webapp.Igrp;
/**
 * @author Marcel Iekiny
 * Apr 15, 2017
 */
public abstract class Controller {
	
	private View view;
	
	public Controller(){
		this.view = null;
	}
	
	// Nao é permitido fazer Override desse method ...
	protected final void renderView(View view, boolean isRenderPartial) throws IOException{ // renderiza a view e aplica ou nao um layout
		this.view = view;
		view.setContext(this); // associa controller ao view
		this.view.render();
		String result = this.view.getPage().renderContent(!isRenderPartial);
		Igrp app = Igrp.getInstance();
		app.getResponse().setContentType("text/xml;charset=UTF-8");
		app.getResponse().getWriter().append(result);
	}
	
	// Nao é permitido fazer Override desse method ...
	protected final void renderView(View view) throws IOException{ // Overload ...
		this.renderView(view, false);
	}
	
	// Nao é permitido fazer Override desse method ...
	protected final void redirect(String app, String page, String action, String qs){
		
	}
	
	// Nao é permitido fazer Override desse method ...
	protected final void redirect(String app, String page, String action, String []paramNames, String []paramValues){
		String aux = "";
		for(int i = 0; i < paramNames.length; i++){
			aux = aux + paramNames[i] + "=" + paramValues[i];
			if(i < paramNames.length - 1)
				aux += "&";
		}
		this.redirect(app, page, action, aux);
	}
	
	public View getView(){
		return this.view;
	}
	
}
