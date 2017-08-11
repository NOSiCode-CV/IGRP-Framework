/*-------------------------*/

/*Create View*/

package nosi.webapps.agenda.pages.myagenda;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class MyAgendaView extends View {
	
	
	public IGRPCalendar calendar_1;

	public MyAgendaView(MyAgenda model){
		this.setPageTitle("Minha Agenda");
			
		calendar_1 = new IGRPCalendar("calendar_1");

		
	
		calendar_1.setLang("pt");
		calendar_1.setDataUrl("/IGRP/images/IGRP/IGRP2.3/core/calendar/3.0.1/data/calendar.json");
		
	}
		
	@Override
	public void render(){
		

		this.addToPage(calendar_1);
	}
}
/*-------------------------*/