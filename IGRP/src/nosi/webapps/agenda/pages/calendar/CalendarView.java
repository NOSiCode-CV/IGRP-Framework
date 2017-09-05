/*-------------------------*/

/*Create View*/

package nosi.webapps.agenda.pages.calendar;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class CalendarView extends View {
	
	
	public Field calendar_1_lang;
	public Field calendar_1_event;
	public Field calendar_1_add;
	public Field calendar_1_view;
	public Field calendar_1_date;
	public IGRPCalendar calendar_1;

	public CalendarView(Calendar model){
		this.setPageTitle("Calendar");
			
		calendar_1 = new IGRPCalendar("calendar_1");
		calendar_1_lang = new TextField(model,"calendar_1_lang");
		calendar_1_lang.setLabel("Linguagem");
		calendar_1_lang.propertie().add("name","p_calendar_1_lang").add("type","text").add("maxlength","30");
		calendar_1_event = new LinkField(model,"calendar_1_event");
		calendar_1_event.setLabel("Load Eventos");
		calendar_1_event.propertie().add("name","p_calendar_1_event").add("type","link").add("maxlength","4000");
		calendar_1_add = new LinkField(model,"calendar_1_add");
		calendar_1_add.setLabel("add Eventos");
		calendar_1_add.propertie().add("name","p_calendar_1_add").add("type","link").add("maxlength","4000");
		calendar_1_view = new TextField(model,"calendar_1_view");
		calendar_1_view.setLabel("Default View");
		calendar_1_view.propertie().add("name","p_calendar_1_view").add("type","text").add("maxlength","30");
		calendar_1_date = new DateField(model,"calendar_1_date");
		calendar_1_date.setLabel("Default View");
		calendar_1_date.propertie().add("name","p_calendar_1_date").add("type","date").add("maxlength","30");

		
	}
		
	@Override
	public void render(){
		
		calendar_1.addField(calendar_1_lang);
		calendar_1.addField(calendar_1_event);
		calendar_1.addField(calendar_1_add);
		calendar_1.addField(calendar_1_view);
		calendar_1.addField(calendar_1_date);

		this.addToPage(calendar_1);
	}
}
/*-------------------------*/