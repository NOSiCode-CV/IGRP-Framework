/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.session;
import nosi.core.webapp.Controller;
import java.io.IOException;
import java.util.ArrayList;


public class SessionController extends Controller {		

	public void actionIndex() throws IOException{
		Session model = new Session();
		SessionView view = new SessionView(model);
		ArrayList<Session.Table_1> data = new ArrayList<>();
		for(Object obj:new nosi.webapps.igrp.dao.Session().getAll()){
			nosi.webapps.igrp.dao.Session s = (nosi.webapps.igrp.dao.Session)obj;
			Session.Table_1 table = new Session().new Table_1();
			table.setAplicacao(""+s.getEnvId());
			table.setData_fim(""+s.getEndTime());
			table.setData_inicio(""+s.getStartTime());
			table.setIp(s.getIpAddress());
			table.setUtilizador(s.getUserName());
			data.add(table);
		}
		view.table_1.addData(data);
		this.renderView(view);
	}

	public void actionPesquisar() throws IOException{
			this.redirect("igrp","Dominio","index");
	}
	
	public void actionVer_logs() throws IOException{
			this.redirect("igrp","Session","index");
	}
	
}
