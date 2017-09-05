/*-------------------------*/

/*Create Controller*/

package nosi.webapps.agenda.pages.calendar;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import nosi.core.webapp.Response;
import nosi.webapps.agenda.dao.Marcacao;
import nosi.core.gui.components.IGRPCalendar;
/*---- End ----*/


public class CalendarController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/
		Calendar model = new Calendar();
		model.setCalendar_1_event("agenda","Calendar","GetCalendar");
		model.setCalendar_1_add("agenda","Calendar","agenda");
		CalendarView view = new CalendarView(model);
		return this.renderView(view);
		/*---- End ----*/
	}

	/*---- Insert your actions here... ----*/
	public PrintWriter actionGetCalendar() throws IOException{
		Igrp.getInstance().getResponse().setContentType("application/json");
		IGRPCalendar calendar = new IGRPCalendar();
		String filter = " ";	
		List<Marcacao> marcacoes = Marcacao.getAllMarcacao(filter);
		for(Marcacao m:marcacoes){
			IGRPCalendar.Calendar c = new IGRPCalendar.Calendar();
			c.setAllDay(false);
			if(m.getEstado().equalsIgnoreCase("ATIVO"))
				c.setColor("#FFEB3B");
			else if(m.getEstado().equalsIgnoreCase("INATIVO"))
				c.setColor("#f44336");
			else if(m.getEstado().equalsIgnoreCase("CONFIRMADO"))
				c.setColor("#0091EA");
			else if(m.getEstado().equalsIgnoreCase("REALIZADO"))
				c.setColor("#00E676");
			c.setStart(m.getData_marcacao()+"T"+m.getHr_marcacao());
			c.setEnd(m.getData_marcacao()+"T"+m.getHr_marcacao());
			c.setTitle(m.getNome()+"\n"+m.getTipo_documento());
			c.setId(m.getId());
			c.setParams("id="+m.getId());
			calendar.add(c);
		}
		return Igrp.getInstance().getResponse().getWriter().append(calendar.getCalendar());
	}
	
	public Response actionAgenda() throws IOException{
		String id = Igrp.getInstance().getRequest().getParameter("p_event_id");
		String p_date = Igrp.getInstance().getRequest().getParameter("p_date");
		if(id!=null && !id.equals("")){
			return this.redirect("agenda", "DetalhesMarcacao", "index&p_event_id="+id);
		}
		return this.redirect("agenda", "Agendar", "index&p_date="+p_date);
	}
	/*---- End ----*/
}
