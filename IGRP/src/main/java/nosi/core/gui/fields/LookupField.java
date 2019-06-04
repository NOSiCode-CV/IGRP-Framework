package nosi.core.gui.fields;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 13, 2017
 *
 * Description: class to configure lookup field
 */
import java.util.Map;

import nosi.core.webapp.Core;
import nosi.core.webapp.helpers.Route;

import java.util.LinkedHashMap;

public class LookupField extends TextField {

	private Map<String,Object> params;
	private Map<String,Object> lookupParams;
	private boolean isPublic = false;
	private int versionLookup = 1;
	private String app;
	private String page;
	private String action;
	
	public LookupField(Object model,String name) {
		super(model,name);
		this.propertie.put("type", "lookup");
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
	
	public int vertionLookup() {
		return this.versionLookup;
	}

	public boolean isPublic() {
		return isPublic;
	}

	public void setIsPublic(boolean isPublic) {
		this.isPublic = isPublic;
		if(isPublic){
			this.lookup = Route.getResolveUrl(app, page, action, Core.getCurrentDad(),1).replace("?", "").replace("webapps", "");
		}
	}
	
	public void setLookup(String app,String page,String action) {
		this.app = app;
		this.page = page;
		this.action = action;
		this.lookup = Route.getResolveUrl(app, page, action).replace("?", "").replace("webapps", "");
	}
}
