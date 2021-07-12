package nosi.core.geographic;

/**
 * CarlosA.Graca
 * 28/07/2020
 */

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import nosi.core.webapp.Core;

public class GetCoordinates {
	
	private String parentField;
	
	private double[] latLng; 
	
	private int zoom;
	
	private boolean editable;

	public String getParentField() {
		return parentField;
	}
	
	public void setParentField(String parentField) {
		this.parentField = parentField;
	}
	
	public double[] getLatLng() {
		return latLng;
	}
	
	public void setLatLng(double[] latLng) {
		this.latLng = latLng;
	}
	
	public int getZoom() {
		return zoom;
	}
	
	public void setZoom(int zoom) {
		this.zoom = zoom;
	}
	
	public boolean getEditable() {
		return editable;
	}
	
	public void setEditable(boolean editable) {
		this.editable = editable;
	}	
		
	public JsonObject toJson() {
	
		JsonObject getcoordinates = new JsonObject();//Widget.toJson(TpWidget.GETCOORDINATES);
        getcoordinates.addProperty("active", false);
      
        JsonObject control = new JsonObject();
        getcoordinates.add("control", control);
        control.addProperty("button", true);
      
        getcoordinates.addProperty("icon", "fa-map-marker");
        getcoordinates.addProperty("nome", "getcoordinates");
        getcoordinates.addProperty("position", "");
        getcoordinates.addProperty("title", "Get Coordinates");
        getcoordinates.addProperty("type", "getcoordinates");
		
		JsonObject data = new JsonObject();
		
		data.addProperty("parent_field_name", this.parentField);
		
		if(Core.isNotNullOrZero(this.zoom))
			data.addProperty("zoom", this.zoom);			
			
		if(Core.isNotNull(this.latLng)) {
			
			JsonArray point = new JsonArray();
			
			point.add(this.latLng[0]);
			
			point.add(this.latLng[1]);
			
			data.add("latLng", point);
			
		}		
		
		data.addProperty("editable", this.editable);
		
		getcoordinates.add("data", data);
		
		return getcoordinates;
		
	}

}
