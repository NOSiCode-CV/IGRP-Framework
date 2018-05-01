
package nosi.webapps.igrp_studio.pages.partilhageral;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import java.util.Optional;
import java.util.ArrayList;
import java.util.List;
import java.util.Collections;
import java.util.Comparator;
import nosi.core.webapp.Igrp;

import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Share;
/*----#end-code----*/

public class PartilhageralController extends Controller {

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException {

		Partilhageral model = new Partilhageral();
		model.load();
		PartilhageralView view = new PartilhageralView();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		model.loadTable_1(Core.query(null,"SELECT 'estado' as estado,'nome' as nome "));
		
		view.aplicacao_origem.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.elemento.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.aplicacao_destino.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		
		----#gen-example */
		/*----#start-code(index)----*/

		view.aplicacao_origem.setValue(new Application().getAllApps());
		view.elemento.setQuery(Core.query(null, "SELECT 'PAGE' as ID,'Page' as NAME "));

		// + "(((SELECT '' as ID,'-- Elemento --' as NAME) union all +"

		// + "union all (SELECT 'WORKFLOW' as ID,'WORKFLOW' as NAME)) "
		// + "union all (SELECT 'SERVICE' as ID,'SERVICE' as NAME)) "
		// + "union all (SELECT 'REPORT' as ID,'REPORT' as NAME))");

		// view.aplicacao_destino.setQuery(Core.query(null,"SELECT '' as ID,'--
		// Selecionar --' as NAME "));

		Optional.of(model.getAplicacao_origem()).ifPresent(v -> {
			try {
				view.aplicacao_destino.setValue(new Application().getAllAppsByFilterId(Integer.parseInt((v))));
			} catch (Exception e) {
			}
		});

		if (Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("post")) {
			List<Partilhageral.Table_1> t = new ArrayList<Partilhageral.Table_1>();

			Optional.of(model.getElemento()).ifPresent(e -> {
				switch (e) {

				case "PAGE":

					List<Action> pages = new ArrayList<Action>();
					try {
						pages = new Action().find()
								.andWhere("application.id", "=", Integer.parseInt(model.getAplicacao_origem())).andWhere("status", "=",1).andWhere("isComponent", "=", "0").all();
					} catch (Exception exception) {
						exception.printStackTrace();
					}

					List<Share> shares = new ArrayList<Share>();
					try {
						shares = new Share().getAllSharedResources(Integer.parseInt(model.getAplicacao_origem()),
								Integer.parseInt(model.getAplicacao_destino()), e);
					} catch (Exception exception) {
					}

					for (Action page : pages) {

						Partilhageral.Table_1 row = new Partilhageral.Table_1();

						row.setEstado(page.getId());
						row.setEstado_check(-1);

						for (Share share : shares) {
							// System.out.println((share.getType_fk() == page.getId() && share.getStatus()
							// == 1));
							if (share.getType_fk() == page.getId() && share.getStatus() == 1) {
								// System.out.println(share);
								row.setEstado(page.getId());
								row.setEstado_check(page.getId());
							}
						}
						row.setNome(page.getPage_descr() + " (" + page.getPage() + ")");
						t.add(row);
					}
					break;

				case "SERVICE":
					break;
				case "REPORT":
					break;
				}
			});

			Collections.sort(t, new SortbyStatus());
			view.table_1.addData(t);

			// return forward("igrp_studio", "Partilha_geral", "index");
		}

		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);
	}

	public Response actionPartilhar() throws IOException, IllegalArgumentException, IllegalAccessException {

		Partilhageral model = new Partilhageral();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp_studio","Partilhageral","index", this.queryString()); //if submit, loads the values
		
		----#gen-example */
		/*----#start-code(partilhar)----*/

		if (Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("POST")) {
			// System.out.println("Entrado ... ");
			sharePage(model);
			return this.forward("igrp_studio", "Partilhageral", "index");
		}

		/*----#end-code----*/
		return this.redirect("igrp_studio", "Partilhageral", "index", this.queryString());
	}

	/*----#start-code(custom_actions)----*/

	private void sharePage(Partilhageral model) {
		List<Share> shares = new ArrayList<Share>();
		if (Core.isInt(model.getAplicacao_origem()) && Core.isInt(model.getAplicacao_destino())) {

			shares = new Share().find().andWhere("env.id", "=", Integer.parseInt(model.getAplicacao_destino()))
					.andWhere("owner.id", "=", Integer.parseInt(model.getAplicacao_origem()))
					.andWhere("type", "=", "PAGE").all();

			List<Share> sharesRemoved = new ArrayList<Share>();
			try {
				sharesRemoved = new Share().find()
						.andWhere("env.id", "=", Integer.parseInt(model.getAplicacao_destino()))
						.andWhere("owner.id", "=", Integer.parseInt(model.getAplicacao_origem()))
						.andWhere("type", "=", "PAGE").all();
			} catch (Exception e) {
			}

			for (Share s : sharesRemoved) { // remove all
				s.setStatus(0);
				s.update();
			}
			String[] estados = Core.getParamArray("p_estado");
			if (Core.isNotNull(estados) && estados.length > 0) {
				boolean flag = false;
				for (String obj : estados) {

					for (Share s : shares) {
						if (new String(s.getType_fk() + "").equals(obj)) {
							s.setStatus(1);
							s = s.update();
							flag = true;
							break;
						}
					}
					if (flag) {
						flag = false;
						continue;
					}

					Share share = new Share();
					Application app1 = new Application();
					app1.setId(Integer.parseInt(model.getAplicacao_origem()));
					Application app2 = new Application();
					app2.setId(Integer.parseInt(model.getAplicacao_destino()));
					share.setOwner(app1);
					share.setEnv(app2);
					share.setStatus(1);
					share.setType("PAGE");
					share.setType_fk(Integer.parseInt(obj));
					share = share.insert();
					if (share != null) {
						Core.setMessageSuccess();
					} else {
						Core.setMessageError();
					}

				}
			}
		} else
			Core.setMessageError();
	}

	class SortbyStatus implements Comparator<Partilhageral.Table_1> {
		public int compare(Partilhageral.Table_1 a, Partilhageral.Table_1 b) {
			return b.getEstado_check() - a.getEstado_check();
		}
	}
	/*----#end-code----*/
}
