package nosi.core.webapp;

import java.io.IOException;

import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.pages.defaultPagina.DefaultPaginaController;
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
	protected final void redirect(String app, String page, String action, String qs) throws IOException{
		String aux = "?r=" + app + "/" + page + "/" + action + (qs.equals("") || qs == null ? "" : "&" + qs);
		aux = Igrp.getInstance().getBaseRoute() + aux;
		System.out.println(aux);
		//Igrp.getInstance().getResponse().sendRedirect("" + aux);
	}
	
	// Nao é permitido fazer Override desse method ...
	protected final void redirect(String r, String qs) throws IOException{
		String []aux = r.split("/");
		this.redirect(aux[0], aux[1], aux[2], qs);
	}
	
	// Nao é permitido fazer Override desse method ...
	protected final void redirect(String app, String page, String action) throws IOException{
		this.redirect(app, page, action, "");
	}
	
	// Nao é permitido fazer Override desse method ...
	protected final void redirect(String app, String page, String action, String []paramNames, String []paramValues) throws IOException{
		String aux = "";
		for(int i = 0; i < paramNames.length; i++){
			if(i > 0 && i < paramNames.length)
				aux += "&";
			aux = aux + paramNames[i] + "=" + paramValues[i];
		}
		this.redirect(app, page, action, aux);
	}
	
	public View getView(){
		return this.view;
	}
	
	public static void main(String []args) throws IOException{
		new DefaultPaginaController().redirect("igrp", "page1", "action1");
	}
	
}
