package nosi.core.geographic;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

/**
 * CarlosA.Graca
 * 29/07/2020
 */
public class MapViewer {
	
	private int zoom;
	
	private double[] center;
	
	private boolean fullscreen;
  
    private JsonObject json = new JsonObject();
	
	private JsonArray baseMaps = new JsonArray();
	
	private JsonArray layers = new JsonArray();
	
	private JsonArray widgets = new JsonArray();
  
  	public void add(String obj, boolean value) {
    	
    	this.json.addProperty(obj, value);
    	
    }
	
	public JsonArray getWidgets() {
		return widgets;
	}
	
	public void setWidgets(JsonArray widgets) {
		this.widgets = widgets;
	}
	
    public void addBaseMap(JsonObject basemap) {
    	
    	this.baseMaps.add(basemap);
    	
    }
    
    public void addLayer(JsonObject layer) {
    	
    	this.layers.add(layer);
    	
    }
    
    public void addWidget(JsonObject widget) {
    	
    	this.widgets.add(widget);
    	
    }
    
    public String toString (){
    	    	
    	this.json.add("baseMaps", this.baseMaps);
    	
    	this.json.add("groupLayers", this.layers);
    	    			
    	this.json.add("widgets", this.widgets);
    	    	
    	return this.json.toString();
    	
    }

}
