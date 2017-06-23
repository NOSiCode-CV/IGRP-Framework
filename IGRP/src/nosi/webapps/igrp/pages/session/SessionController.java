/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.session;

import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.Application;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

public class SessionController extends Controller {		

	public Response actionIndex(@RParam(rParamName = "dad") String dad) throws IOException, IllegalArgumentException, IllegalAccessException, ParseException{
		
		Session model = new Session();
		nosi.webapps.igrp.dao.Session_ session = new nosi.webapps.igrp.dao.Session_();
		
		SimpleDateFormat auxFormat = new SimpleDateFormat("dd-MM-yyyy");
		
		if(Igrp.getInstance().getRequest().getMethod().equals("POST")){
			model.load();
			session.setEnvId(model.getAplicacao());
			session.setUserName(model.getUtilizador());
			
			session.setStartTime(model.getData_inicio() != null && !model.getData_inicio().equals("") ? auxFormat.parse(model.getData_inicio()).getTime() : 0);
			session.setEndTime(model.getData_fim() != null && !model.getData_fim().equals("") ? auxFormat.parse(model.getData_fim()).getTime() : 0);
		}
		
		ArrayList<Session.Table_1> data = new ArrayList<>();
		for(Object obj : session.getAllWithFilter()){
			nosi.webapps.igrp.dao.Session_ s = (nosi.webapps.igrp.dao.Session_)obj;
			Session.Table_1 table = new Session().new Table_1();
			
			Date auxEndTime = new Date(s.getEndTime());
			Date auxStartTime = new Date(s.getStartTime());

			SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy"); /*HH:mm:ss*/
			
			if((model.getData_inicio() != null && !model.getData_inicio().equals("") && 
					model.getData_inicio().compareTo(dateFormat.format(auxStartTime)) < 0)
					||
					(model.getData_fim() != null && !model.getData_fim().equals("") && 
					model.getData_fim().compareTo(dateFormat.format(auxEndTime)) > 1)
					)
					continue;
			
			table.setData_fim(""+dateFormat.format(auxEndTime));
			table.setData_inicio(""+dateFormat.format(auxStartTime));
			table.setAplicacao(""+s.getEnvId());
			table.setIp(s.getIpAddress());
			table.setUtilizador(s.getUserName());
			data.add(table);
		}
		
		SessionView view = new SessionView(model);
		view.table_1.addData(data);
		
		HashMap<Integer,String> applications =  new Application().getListApps();
		view.aplicacao.setValue(applications);
		
		HashMap<String, String> status = new HashMap<String,String>();
		status.put("", "--- Escolher estado ---");
		status.put("1", "Ativo");
		status.put("0", "Inativo");
		view.estado.setValue(status);
		
		view.btn_pesquisar.setLink("index&dad=" + dad);
		
		return this.renderView(view);
	}

	public Response actionPesquisar() throws IOException{
		return this.redirect("igrp","Dominio","index");
	}
	
	public Response actionVer_logs() throws IOException{
		return this.redirect("igrp","Session","index");
	}
	
}
