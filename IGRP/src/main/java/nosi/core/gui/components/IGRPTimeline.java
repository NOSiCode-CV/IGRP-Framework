package nosi.core.gui.components;
/**
 * Iekiny Marcel
 * Jul 31, 2018
 */
public class IGRPTimeline extends IGRPTable{

	public IGRPTimeline(String tag_name) {
		this(tag_name, "");
	}
	
	public IGRPTimeline(String tag_name,String title) {
		super(tag_name, title);
		this.properties.put("type", "timeline");
	}
	
}
