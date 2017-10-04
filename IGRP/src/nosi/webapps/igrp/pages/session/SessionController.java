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
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

		// Fecth datas
		ArrayList<Session.Table_1> data = new ArrayList<>();
		List<nosi.webapps.igrp.dao.Session> sessions = session.find()
				.andWhere("application", "=", model.getAplicacao() != 0 ? model.getAplicacao() : null)
				.andWhere("user.user_name", "=", model.getUtilizador()).andWhere("user.status", "=", model.getEstado())
				.andWhere("startTime", "=", model.getData_inicio() != null ? model.getData_inicio() : null)
				.andWhere("endTime", "=", model.getData_fim() != null ? model.getData_inicio() : null).all();

		for (nosi.webapps.igrp.dao.Session s : sessions) {
			Session.Table_1 table = new Session().new Table_1();
			Date auxEndTime = s.getEndTime();
			Date auxStartTime = s.getStartTime();
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy"); /* HH:mm:ss */
			if ((model.getData_inicio() != null && !model.getData_inicio().equals("")
					&& model.getData_inicio().compareTo(auxStartTime) < 0)
					|| (model.getData_fim() != null && !model.getData_fim().equals("")
							&& model.getData_fim().compareTo(auxEndTime) > 1))
				continue;
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

		// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Graficos%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		// ======================================================================================
		ArrayList<Session.Chart_t_sessao> listSession = new ArrayList<>();
		ResultSet res = session.fetchDataPerSql();
		while (res.next()) {
			Session.Chart_t_sessao chart = new Session().new Chart_t_sessao();
			// =========================================
			int total = res.getInt("total");
			String start = res.getString("datainicio");
			// =========================================
			chart.setData(start);
			chart.setTotal(total);
			listSession.add(chart);
			// =========================================
		}
		view.chart_t_sessao.addData(listSession);
		// ======================================================================================
		// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

		return this.renderView(view);
	}

	public Response actionPesquisar() throws IOException {
		return this.redirect("igrp", "Dominio", "index");
	}

	public void actionVer_logs()
			throws IOException, IllegalArgumentException, IllegalAccessException, ParseException, SQLException {
		// =======================================================================================
		Session model = new Session();
		nosi.webapps.igrp.dao.Session session = new nosi.webapps.igrp.dao.Session();
		// =======================================================================================

		// =======================================================================================
		model.load();
		// =======================================================================================

		// Algumas condiçoes de teste
		// =====================================================================================
		// Date data;
		// if (model.getData_inicio() == null) {
		// data = new Date();
		// } else
		// data = model.getData_inicio();
		// =======================================================================================

		/*
		 * String sql =
		 * "SELECT CONVERT(s.starttime, DATE) as datainicio, COUNT(*) as total " +
		 * "FROM TBL_SESSION s" + " WHERE s.username = " + "'" + model.getUtilizador() +
		 * "'" + " GROUP BY datainicio ORDER BY 1"; //
		 * 
		 * // Este metodo que vamos utilizar para obter o resultado da seleção com a
		 * base // de dados ResultSet res = session.fetchDataPerSql(sql); while
		 * (res.next()) { int total = res.getInt("total"); Date start =
		 * res.getDate("datainicio"); }
		 */

		/*
		 * try { PreparedStatement statement =
		 * Connection.getConnection().prepareStatement(sql); // Execução de query
		 * ResultSet res = statement.executeQuery();
		 * 
		 * 
		 * while (res.next()) {
		 * 
		 * int total = res.getInt("total"); Date start = res.getDate("datainicio");
		 * 
		 * System.out.println(" start -- " + start); System.out.println(" Total -- " +
		 * total);
		 * 
		 * } } catch (SQLException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 */

		// =============================================================================================

	}

}
