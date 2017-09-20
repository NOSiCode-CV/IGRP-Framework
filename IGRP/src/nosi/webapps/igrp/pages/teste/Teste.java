/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.teste;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;
import java.util.ArrayList;
import java.util.List;

public class Teste extends Model{		
	@RParam(rParamName = "p_calendar_1_lang")
	private String calendar_1_lang;
	@RParam(rParamName = "p_calendar_1_add")
	private String calendar_1_add;
	@RParam(rParamName = "p_calendar_1_view")
	private String calendar_1_view;
	@RParam(rParamName = "p_calendar_1_date")
	private String calendar_1_date;

	private List<Calendar_1_events> calendar_1_events = new ArrayList<>();
	public void setCalendar_1_events(List<Calendar_1_events> calendar_1_events){
		this.calendar_1_events = calendar_1_events;
	}
	public List<Calendar_1_events> getcalendar_1_events(){
		return this.calendar_1_events;
	}
	
	public void setCalendar_1_lang(String calendar_1_lang){
		this.calendar_1_lang = calendar_1_lang;
	}
	public String getCalendar_1_lang(){
		return this.calendar_1_lang;
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


	public static class Calendar_1_events{
		private String calendar_1_title;
		private String calendar_1_description;
		private String calendar_1_id;
		private String calendar_1_start;
		private String calendar_1_end;
		private String calendar_1_bgcolor;
		private String calendar_1_allday;
		public void setCalendar_1_title(String calendar_1_title){
			this.calendar_1_title = calendar_1_title;
		}
		public String getCalendar_1_title(){
			return this.calendar_1_title;
		}

		public void setCalendar_1_description(String calendar_1_description){
			this.calendar_1_description = calendar_1_description;
		}
		public String getCalendar_1_description(){
			return this.calendar_1_description;
		}

		public void setCalendar_1_id(String calendar_1_id){
			this.calendar_1_id = calendar_1_id;
		}
		public String getCalendar_1_id(){
			return this.calendar_1_id;
		}

		public void setCalendar_1_start(String calendar_1_start){
			this.calendar_1_start = calendar_1_start;
		}
		public String getCalendar_1_start(){
			return this.calendar_1_start;
		}

		public void setCalendar_1_end(String calendar_1_end){
			this.calendar_1_end = calendar_1_end;
		}
		public String getCalendar_1_end(){
			return this.calendar_1_end;
		}

		public void setCalendar_1_bgcolor(String calendar_1_bgcolor){
			this.calendar_1_bgcolor = calendar_1_bgcolor;
		}
		public String getCalendar_1_bgcolor(){
			return this.calendar_1_bgcolor;
		}

		public void setCalendar_1_allday(String calendar_1_allday){
			this.calendar_1_allday = calendar_1_allday;
		}
		public String getCalendar_1_allday(){
			return this.calendar_1_allday;
		}

	}
}
/*-------------------------*/