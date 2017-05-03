package nosi.core.webapp;

import java.io.IOException;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.helpers.Route;
import nosi.webapps.igrp.pages.defaultpagina.DefaultpaginaController;
/**
 * @author Marcel Iekiny
 * Apr 15, 2017
 */
public abstract class Controller {
	
	private View view;
	
	private boolean isRedirect; // To specify when to redirect or render the content ... (Detected by the bug with flash message)
	
	public Controller(){
		this.view = null;
		this.isRedirect = false; // Default value ...
	}
	
	protected final void renderView(View view, boolean isRenderPartial) throws IOException{ // renderiza a view e aplica ou nao um layout
		if(!this.isRedirect){ // (Bug to fixe) dont render content if redirect
			this.view = view;
			view.setContext(this); // associa controller ao view
			this.view.render();
			String result = this.view.getPage().renderContent(!isRenderPartial);
			Igrp app = Igrp.getInstance();
			app.getResponse().setContentType("text/xml;charset=UTF-8");
			app.getResponse().getWriter().append(result);
		}
		
	}
	
	protected final void renderView(View view) throws IOException{ // Overload ...
		this.renderView(view, false);
	}
	
	private final void redirect(String url){
		this.isRedirect = true;
		try {
			Igrp.getInstance().getResponse().sendRedirect("webapps" + url);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	protected final void redirect(String app, String page, String action, String qs) throws IOException{
		this.redirect(Route.toUrl(app, page, action, qs));
	}
	
	protected final void redirect(String r, String qs) throws IOException{
		this.redirect(Route.toUrl(r, qs));
	}
	
	protected final void redirect(String app, String page, String action) throws IOException{
		this.redirect(Route.toUrl(app, page, action));
	}
	
	protected final void redirect(String app, String page, String action, String []paramNames, String []paramValues) throws IOException{
		this.redirect(Route.toUrl(app, page, action, paramNames, paramValues));
	}
	
	protected final void redirectToExternal(String url){
		this.redirect(url);
	}
	
	public View getView(){
		return this.view;
	}
	
}
