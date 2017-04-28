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
	
	public Controller(){
		this.view = null;
	}
	
	// Not is allow to do Override of this method ...
	protected final void renderView(View view, boolean isRenderPartial) throws IOException{ // renderiza a view e aplica ou nao um layout
		this.view = view;
		view.setContext(this); // associa controller ao view
		this.view.render();
		String result = this.view.getPage().renderContent(!isRenderPartial);
		Igrp app = Igrp.getInstance();
		app.getResponse().setContentType("text/xml;charset=UTF-8");
		app.getResponse().getWriter().append(result);
	}
	
	// Not is allow to do Override of this method ...
	protected final void renderView(View view) throws IOException{ // Overload ...
		this.renderView(view, false);
	}
	
	// Not is allow to do Override of this method ...
	private final void redirect(String url){
		//System.out.println(url);
		try {
			Igrp.getInstance().getResponse().sendRedirect("" + url);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// Not is allow to do Override of this method ...
	protected final void redirect(String app, String page, String action, String qs) throws IOException{
		this.redirect(Route.toUrl(app, page, action, qs));
	}
	
	// Not is allow to do Override of this method ...
	protected final void redirect(String r, String qs) throws IOException{
		this.redirect(Route.toUrl(r, qs));
	}
	
	/// Not is allow to do Override of this method ...
	protected final void redirect(String app, String page, String action) throws IOException{
		this.redirect(Route.toUrl(app, page, action));
	}
	
	// Not is allow to do Override of this method ...
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
