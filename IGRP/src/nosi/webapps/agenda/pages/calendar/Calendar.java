/*---------------------- Create Model ----------------------*/
package nosi.webapps.agenda.pages.calendar;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.config.Config;

public class Calendar extends Model{		
	@RParam(rParamName = "p_calendar_1_lang")
	private String calendar_1_lang;
	@RParam(rParamName = "p_calendar_1_event")
	private String calendar_1_event;
	@RParam(rParamName = "p_calendar_1_add")
	private String calendar_1_add;
	@RParam(rParamName = "p_calendar_1_view")
	private String calendar_1_view;
	@RParam(rParamName = "p_calendar_1_date")
	private String calendar_1_date;
	
	public void setCalendar_1_lang(String calendar_1_lang){
		this.calendar_1_lang = calendar_1_lang;
	}
	public String getCalendar_1_lang(){
		return this.calendar_1_lang;
	}
	
	public void setCalendar_1_event(String app,String page,String action){
		this.calendar_1_event = Config.getResolveUrl(app, page, action);
	}
	public String getCalendar_1_event(){
		return this.calendar_1_event;
	}
	
	public void setCalendar_1_add(String app,String page,String action){
		this.calendar_1_add = Config.getResolveUrl(app, page, action);
	}
	public String getCalendar_1_add(){
		return this.calendar_1_add;
	}
	
	public void setCalendar_1_view(String calendar_1_view){
		this.calendar_1_view = calendar_1_view;
	}
	public String getCalendar_1_view(){
		return this.calendar_1_view;
	}
	
	public void setCalendar_1_date(String calendar_1_date){
		this.calendar_1_date = calendar_1_date;
	}
	public String getCalendar_1_date(){
		return this.calendar_1_date;
	}


}
/*-------------------------*/