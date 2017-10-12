/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.teste;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class TesteView extends View {
	
	
	public Field calendar_1_lang;
	public Field calendar_1_add;
	public Field calendar_1_view;
	public Field calendar_1_date;
	public Field calendar_1_title;
	public Field calendar_1_description;
	public Field calendar_1_id;
	public Field calendar_1_start;
	public Field calendar_1_end;
	public Field calendar_1_bgcolor;
	public Field calendar_1_allday;
	public IGRPCalendar calendar_1;
	public IGRPTable calendar_1_events;

	public TesteView(Teste model){
		this.setPageTitle("Teste");
			
		calendar_1 = new IGRPCalendar("calendar_1","");
		calendar_1_events = new IGRPTable("calendar_1_events","");
		calendar_1_lang = new TextField(model,"calendar_1_lang");
		calendar_1_lang.setLabel("Linguagem");
		
		calendar_1_lang.propertie().add("name","p_calendar_1_lang").add("type","text").add("maxlength","30");
		calendar_1_add = new LinkField(model,"calendar_1_add");
		calendar_1_add.setLabel("add Eventos");
		
		calendar_1_add.propertie().add("name","p_calendar_1_add").add("type","link").add("maxlength","4000");
		calendar_1_view = new TextField(model,"calendar_1_view");
		calendar_1_view.setLabel("Default View");
		
		calendar_1_view.propertie().add("name","p_calendar_1_view").add("type","text").add("maxlength","30");
		calendar_1_date = new DateField(model,"calendar_1_date");
		calendar_1_date.setLabel("Default View");
		
		calendar_1_date.propertie().add("name","p_calendar_1_date").add("type","date").add("maxlength","30");
		calendar_1_title = new TextField(model,"calendar_1_title");
		calendar_1_title.setLabel("Titulo do Evento");
		
		calendar_1_title.propertie().add("name","p_calendar_1_title").add("type","text").add("maxlength","200");
		calendar_1_description = new TextField(model,"calendar_1_description");
		calendar_1_description.setLabel("Descricao do evento");
		
		calendar_1_description.propertie().add("name","p_calendar_1_description").add("type","text").add("maxlength","400");
		calendar_1_id = new TextField(model,"calendar_1_id");
		calendar_1_id.setLabel("ID do Evento");
		
		calendar_1_id.propertie().add("name","p_calendar_1_id").add("type","text").add("maxlength","30");
		calendar_1_start = new DateField(model,"calendar_1_start");
		calendar_1_start.setLabel("Data Inicio do Evento");
		
		calendar_1_start.propertie().add("name","p_calendar_1_start").add("type","date").add("maxlength","30");
		calendar_1_end = new DateField(model,"calendar_1_end");
		calendar_1_end.setLabel("Data Fim do Evento");
		
		calendar_1_end.propertie().add("name","p_calendar_1_end").add("type","date").add("maxlength","30");
		calendar_1_bgcolor = new TextField(model,"calendar_1_bgcolor");
		calendar_1_bgcolor.setLabel("Cor de Fundo do Evento simboliza prioridade");
		
		calendar_1_bgcolor.propertie().add("name","p_calendar_1_bgcolor").add("type","text").add("maxlength","30");
		calendar_1_allday = new TextField(model,"calendar_1_allday");
		calendar_1_allday.setLabel("Evento Dia Todo (value Boolean)");
		
		calendar_1_allday.propertie().add("name","p_calendar_1_allday").add("type","text").add("maxlength","30");

		
	}
		
	@Override
	public void render(){
		
		calendar_1.addField(calendar_1_lang);
		calendar_1.addField(calendar_1_add);
		calendar_1.addField(calendar_1_view);
		calendar_1.addField(calendar_1_date);

		calendar_1_events.addField(calendar_1_title);
		calendar_1_events.addField(calendar_1_description);
		calendar_1_events.addField(calendar_1_id);
		calendar_1_events.addField(calendar_1_start);
		calendar_1_events.addField(calendar_1_end);
		calendar_1_events.addField(calendar_1_bgcolor);
		calendar_1_events.addField(calendar_1_allday);

		this.addToPage(calendar_1);
		this.addToPage(calendar_1_events);
	}
}
/*-------------------------*/