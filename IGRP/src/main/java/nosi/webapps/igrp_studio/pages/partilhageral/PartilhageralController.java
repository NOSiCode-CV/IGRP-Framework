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
import nosi.core.webapp.helpers.CheckBoxHelper;
import nosi.core.webapp.Igrp;
import java.util.HashMap;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Share;
import nosi.webapps.igrp.dao.Transaction;
/*----#end-code----*/
		
public class PartilhageralController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Partilhageral model = new Partilhageral();
		model.load();
		PartilhageralView view = new PartilhageralView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT '1' as estado,'Officia iste elit doloremque amet sed unde accusantium ut iste elit totam consectetur aliqua amet pe' as nome "));
		view.aplicacao_origem.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.elemento.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.aplicacao_destino.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		String dad = Core.getCurrentDad();

		if (!"igrp".equalsIgnoreCase(dad) && !"igrp_studio".equalsIgnoreCase(dad)) {
			model.setAplicacao_origem("" + (Core.findApplicationByDad(dad)).getId());
			model.setApp_or(model.getAplicacao_origem());
			view.aplicacao_origem.propertie().add("disabled", "true");

		} else if (Core.isNotNull(model.getApp_or())) // para caso remote list invocar index, funcionar dentro de uma
														// aplicacao com campo disabled 
			model.setAplicacao_origem(model.getApp_or());

		view.aplicacao_origem.setValue(new Application().getListApps());
		// Hardcoded select element page for now
		HashMap<String, String> targets = new HashMap<>();
		targets.put(null, "--- Select type ---");
		targets.put(TipoPartilha.PAGE.getCodigo(), TipoPartilha.PAGE.getDescricao());
		targets.put(TipoPartilha.TRANSACTION.getCodigo(), TipoPartilha.TRANSACTION.getDescricao());
		view.elemento.setValue(targets);

		Optional.of(model.getAplicacao_origem()).ifPresent(v -> {

			view.aplicacao_destino.setValue(new Application().getAllAppsActiveByFilterId(Core.toInt(v)));

		});

		List<Partilhageral.Table_1> t = new ArrayList<Partilhageral.Table_1>(); 
		
		if(model.getElemento() != null) {
			
			TipoPartilha tp = TipoPartilha.getByCodigo(model.getElemento());
			
			if(tp != null) {
				
				switch (tp) {
	
					case PAGE: 
	
						List<Action> pages = new ArrayList<Action>();
						pages = new Action().find().andWhere("application.id", "=", Core.toInt(model.getAplicacao_origem()))
								.andWhere("status", "=", 1).andWhere("isComponent", "=", (short) 0).all();
	
						List<Share> shares = new ArrayList<Share>();
						shares = new Share().getAllSharedResources(Core.toInt(model.getAplicacao_origem()),
								Core.toInt(model.getAplicacao_destino()), TipoPartilha.PAGE.getCodigo());
						for (Action page : pages) {
							Partilhageral.Table_1 row = new Partilhageral.Table_1();
							row.setEstado(page.getId());
							row.setEstado_check(-1);
	
							for (Share share : shares) {
								if (share.getType_fk() == page.getId() && share.getStatus() == 1) {
									row.setEstado(page.getId());
									row.setEstado_check(page.getId());
								}
							}
							row.setNome(page.getPage_descr() + " (" + page.getPage() + ")");
							t.add(row);
						}
						
						break;
						
					case SERV:
						break;
					case REPORT:
						break;
						
					case TRANSACTION: 
						
						
						List<Transaction> transactions = new ArrayList<Transaction>();
						transactions = new Transaction().find().andWhere("application.id", "=", Core.toInt(model.getAplicacao_origem()))
								.andWhere("status", "=", 1).all();
	
						List<Share> sharesTransactions = new ArrayList<Share>();
						sharesTransactions = new Share().getAllSharedResources(Core.toInt(model.getAplicacao_origem()),
								Core.toInt(model.getAplicacao_destino()), TipoPartilha.TRANSACTION.getCodigo());
						
						for (Transaction transaction : transactions) {
							Partilhageral.Table_1 row = new Partilhageral.Table_1();
							row.setEstado(transaction.getId());
							row.setEstado_check(-1); 
							
							for (Share share : sharesTransactions) {
								if (share.getType_fk() == transaction.getId() && share.getStatus() == 1) {
									row.setEstado(transaction.getId());
									row.setEstado_check(transaction.getId());
								}
							}
							
							row.setNome(transaction.getDescr() + " (" + transaction.getCode() + ")");
							
							t.add(row);
						}
						
					break;
				default:
					break;
					
					}
					
				}
		}

		

		Collections.sort(t, new SortbyStatus());

		view.table_1.addData(t);
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionPartilhar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Partilhageral model = new Partilhageral();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp_studio","Partilhageral","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(partilhar)----*/

		if (Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("POST")) {
			if (Core.isNotNull(model.getApp_or()))
				model.setAplicacao_origem(model.getApp_or());
			share(model);
			this.loadQueryString();
		}

		/*----#end-code----*/
		return this.redirect("igrp_studio","Partilhageral","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/

	private void share(Partilhageral model) {
		List<Share> shares = new ArrayList<Share>();
		if (Core.isInt(model.getAplicacao_origem()) && Core.isInt(model.getAplicacao_destino())) {

			shares = new Share().find().andWhere("env.id", "=", Core.toInt(model.getAplicacao_destino()))
					.andWhere("owner.id", "=", Core.toInt(model.getAplicacao_origem())).andWhere("type", "=", model.getElemento())
					.all();

			CheckBoxHelper cp = Core.extractCheckBox(Core.getParamArray("p_estado_fk"),
					Core.getParamArray("p_estado_check_fk"));

			List<Share> sharesRemoved = new ArrayList<Share>();

			sharesRemoved = new Share().find().andWhere("env.id", "=", Core.toInt(model.getAplicacao_destino()))
					.andWhere("owner.id", "=", Core.toInt(model.getAplicacao_origem())).andWhere("type", "=", model.getElemento())
					.all();

			for (Share s : sharesRemoved) { // remove all
				s.setStatus(0);
				s.update();
			}

			Boolean sucess = true;

			boolean flag = false;
			for (String obj : cp.getChekedIds()) {
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
				app1.setId(Core.toInt(model.getAplicacao_origem()));
				Application app2 = new Application();
				app2.setId(Core.toInt(model.getAplicacao_destino()));
				share.setOwner(app1);
				share.setEnv(app2);
				share.setStatus(1);
				share.setType(model.getElemento());
				share.setType_fk(Core.toInt(obj));
				share = share.insert();
				if (share.hasError()) {
					sucess = false;
				}
			}

			if (sucess) {
				Core.setMessageSuccess();
			} else {
				Core.setMessageError();
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
