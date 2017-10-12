/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.session;
/*---- Import your packages here... ----*/

import nosi.core.config.Connection;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Session.FetchForChart;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.hibernate.cfg.Configuration;

/*---- End ----*/
public class SessionController extends Controller {

	public Response actionIndex(@RParam(rParamName = "dad") String dad)
			throws IOException, IllegalArgumentException, IllegalAccessException, ParseException, SQLException {

		Session model = new Session();
		nosi.webapps.igrp.dao.Session session = new nosi.webapps.igrp.dao.Session();

		if (Igrp.getInstance().getRequest().getMethod().equals("POST")) {
			model.load();
		}

		String dateIn = null;
		String dateOut = null;
		if (model.getData_inicio() != null) {
			dateIn = session.convertDate(model.getData_inicio(), "dd-MM-yyyy", "yyyy-MM-dd");
			dateOut = session.convertDate(model.getData_inicio(), "dd-MM-yyyy", "yyyy-MM-dd");
			System.out.println("Aqui estamos a imprimir a data convertida:  " + dateIn);
		}
		
		System.out.println("KKKKK ---  "+model.getEstado());

		ArrayList<Session.Table_1> data = new ArrayList<>();
		List<nosi.webapps.igrp.dao.Session> sessions = session.find()
				.andWhere("application", "=", model.getAplicacao() != 0 ? model.getAplicacao() : null)
				.andWhere("user.user_name", "=", model.getUtilizador())/*.andWhere("user.status", "=", model.getEstado())*/
				./*
					 * andWhere("startTime", "like", dateIn).andWhere("endTime", "like", finalDateF)
					 */all();

		for (nosi.webapps.igrp.dao.Session s : sessions) {
			Session.Table_1 table = new Session().new Table_1();

			Date auxEndTime = s.getEndTime();
			Date auxStartTime = s.getStartTime();

			SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

			table.setData_fim("" + dateFormat.format(auxEndTime));
			table.setData_inicio("" + dateFormat.format(auxStartTime));

			table.setAplicacao("" + s.getApplication().getId());
			table.setIp(s.getIpAddress());
			table.setUtilizador(s.getUserName());
			data.add(table);
		}

		SessionView view = new SessionView(model);
		view.table_1.addData(data);
		view.aplicacao.setValue(new Application().getListApps());
		HashMap<String, String> status = new HashMap<String, String>();
		status.put("", "--- Escolher estado ---");
		status.put("1", "Ativo");
		status.put("0", "Inativo");
		view.estado.setValue(status);
		view.btn_pesquisar.setLink("index&dad=" + dad);

		// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Graficos%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		// ======================================================================================
		//Total por utilizador
		ArrayList<Session.Chart_t_sessao> listSessionTotal = new ArrayList<Session.Chart_t_sessao>();
		List<nosi.webapps.igrp.dao.Session.FetchForChart> result = session.fechTotalSession();

		for (nosi.webapps.igrp.dao.Session.FetchForChart rs : result) {
			// =========================================
			Session.Chart_t_sessao chart = new Session().new Chart_t_sessao();
			// =========================================
			int total = rs.getTotal();
			String start = rs.getStart();
			// =========================================
			chart.setData(start);
			chart.setTotal(total);
			listSessionTotal.add(chart);
			// =========================================
		}
		view.chart_t_sessao.addData(listSessionTotal);
		
		// ======================================================================================
		//Total por aplicação
		ArrayList<Session.Chart_t_session_app> listSessionTotalPerApp = new ArrayList<Session.Chart_t_session_app>();
		List<nosi.webapps.igrp.dao.Session.FetchForChart> result2 = session.fechTotalSessionPerApp();

		for (nosi.webapps.igrp.dao.Session.FetchForChart rs : result2) {
			// =========================================
			Session.Chart_t_session_app chart = new Session().new Chart_t_session_app();
			// =========================================
			int total = rs.getTotalPerApp();
			String start = rs.getStartPerApp();
			//String appname = rs.getAppName();
			
			//System.out.println("Data de Aplicação: "+start+" -- Aplicação: "+appname+" -- Tota de sessao: "+total);
			// =========================================
			chart.setDataInicio(start);
			//chart.setAppname(appname);
			chart.setTotal(total);
			listSessionTotalPerApp.add(chart);
			// =========================================
		}
		view.chart_t_session_app.addData(listSessionTotalPerApp);
		// ======================================================================================

		// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

		return this.renderView(view);
	}

	public Response actionPesquisar() throws IOException {
		return this.redirect("igrp", "Dominio", "index");
	}

	public void actionVer_logs() {

	}

}
