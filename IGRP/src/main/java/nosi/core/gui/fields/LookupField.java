package nosi.core.gui.fields;

import java.util.Map;

import nosi.core.config.ConfigApp;
import nosi.core.webapp.Core;
import nosi.core.webapp.helpers.Route;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Menu;

import java.util.LinkedHashMap;

/**
 * @author: Emanuel Pereira
 * <p>
 * Apr 13, 2017
 *
 * Description: class to configure lookup field
 */
public class LookupField extends TextField {

	private final Map<String,Object> params;
	private final Map<String,Object> lookupParams;
	private int versionLookup = 1;
	
	public LookupField(Object model,String name) {
		super(model,name);
		this.propertie().put("type", "lookup");
		this.params = new LinkedHashMap <>();
		this.lookupParams = new LinkedHashMap <>();
	}
	
	@Override
	public void addParam(String key,String value){
		this.params.put(key, value);
	}
	
	@Override
	public void addLookupParam(String key,String value) {
		this.lookupParams.put(key, value);
		this.versionLookup = 2;
	}
	
	public Map<String,Object> getParams(){
		return this.params;
	}
	
	public Map<String,Object> getLookupParams(){
		return this.lookupParams;
	}

	@Override
	public int vertionLookup() {
		return this.versionLookup;
	}

	@Override
	public void setLookup(String app, String page, String action) {
		if(Core.isNullMultiple(app, page, action)){
			this.lookup = Route.getResolveUrl("tutorial","DefaultPage","index&title=PLEASE SET A PAGE").replace("?", "").replace("webapps", "");
			return;
		}

		int isPublic = Core.getParamInt("isPublic");
		String currentDad = Core.getCurrentDad(); 
		if(isPublic == 1)
			this.lookup = Route.getResolveUrl(app, page, action, currentDad, 1).replace("?", "").replace("webapps", "");
		else { 
			this.lookup = Route.getResolveUrl(app, page, action).replace("?", "").replace("webapps", "");
			Application application = Core.findApplicationByDad(app); 
			if(application != null && application.getExterno() == 2) {
				String deployedWarName = Core.getDeployedWarName(); 
				Action pagina = new Action().findByPage(page, app); 
				if(!deployedWarName.equals(application.getUrl()) && pagina != null) {
					this.lookup = new Menu().buildExternalUrl( application.getUrl(), app, page, pagina.getAction());
				}
			}
		}
	}
	
}
