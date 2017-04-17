package nosi.core.webapp;
/**
 * @author Marcel Iekiny
 * Apr 15, 2017
 */
public abstract class Controller {
	
	private View view;
	
	public Controller(){
		
	}
	
	protected void renderView(View view, boolean isRenderPartial){ // renderiza a view e aplica ou nao um layout
		this.view = view;
		view.setContext(this); // associa controller ao view
		this.view.render();
		this.view.getPage().renderContent(!isRenderPartial);
	}
	
	protected void redirect(String app, String page, String action, String qs){
		
	}
	
	protected void redirect(String app, String page, String action, String []paramNames, String []paramValues){
		String aux = "";
		for(int i = 0; i < paramNames.length; i++){
			aux = aux + paramNames[i] + "=" + paramValues[i];
			if(i < paramNames.length - 1)
				aux += "&";
		}
		this.redirect(app, page, action, aux);
	}
	
}
