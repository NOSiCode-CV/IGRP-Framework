package nosi.webapps.igrp_studio.pages.config_error_msg;

import nosi.core.webapp.Controller;//
import nosi.core.webapp.databse.helpers.ResultSet;//
import nosi.core.webapp.databse.helpers.QueryInterface;//
import java.io.IOException;//
import nosi.core.webapp.Core;//
import nosi.core.webapp.Response;//
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Config;
import java.util.ArrayList;
import java.util.List;
/*----#end-code----*/



public class Config_error_msgController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException {
		Config_error_msg model = new Config_error_msg();
		model.load();
		Config_error_msgView view = new Config_error_msgView();
		view.id_config.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT 'Magna ipsum officia ipsum moll' as application_tab,'Aliqua iste aliqua unde omnis' as msg_table,'hidden-edd6_38d3' as id_config "));
		view.application.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/* Start-Code-Block (index) *//* End-Code-Block (index) */
		/*----#start-code(index)----*/

		view.application.setValue(new Application().getListApps());

		try {

			List<Config> tblconfigfilter = new Config().find().where("name", "like", "%ERROR_MSG_%").all();
			List<Config_error_msg.Table_1> tblconfigTable = new ArrayList<>();

			if (Core.isNotNull(tblconfigfilter)) {
				for (Config c : tblconfigfilter) {
					Config_error_msg.Table_1 row = new Config_error_msg.Table_1();
					row.setMsg_table(c.getValue());
					row.setApplication_tab(Core.isNotNull(c.getApplication()) ? c.getApplication().getName() : "");
					row.setId_config(c.getId() + "");
					tblconfigTable.add(row);
				}
			}

			model.setTable_1(tblconfigTable);
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			String isEdit = Core.getParam("isEdit");
			if (Core.isNotNull(isEdit)) {

				Config tblconfigTable = new Config().findOne(Core.toInt(Core.getParam("p_id_config")));
				if (tblconfigTable != null) {
					model.setMsg(tblconfigTable.getValue());
					model.setApplication(tblconfigTable.getApplication().getId() + "");
				}

				view.btn_salvar.addParameter("isEdit", "true").addParameter("p_id_config",
						Core.getParam("p_id_config"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);
	}

	public Response actionSalvar() throws IOException, IllegalArgumentException, IllegalAccessException {
		Config_error_msg model = new Config_error_msg();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_id_config",Core.getParam("p_id_config"));
		  return this.forward("igrp_studio","Config_error_msg","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (salvar) *//* End-Code-Block */
		/*----#start-code(salvar)----*/

		String isEdit = Core.getParam("isEdit");
		
			Config tblconfig;
			Application app = new Application().findOne(Core.toInt(model.getApplication()));

			if (Core.isNotNull(isEdit)) {
				tblconfig = new Config().findOne(Core.toInt(Core.getParam("p_id_config")));
				tblconfig.setValue(model.getMsg());
				tblconfig.setApplication(app);
				tblconfig.update();
			} else {
				tblconfig = new Config();
				tblconfig.setValue(model.getMsg());
				tblconfig.setApplication(app);
				tblconfig.setName("ERROR_MSG_" + app.getDad());
				tblconfig.insert();
			}
		
		if (tblconfig.hasError())
			Core.setMessageError();
		else
			Core.setMessageSuccess();

		//
		// if(Core.isNotNull(isEdit)) {
		// this.addQueryString("isEdit", "true");
		// return
		// this.forward("igrp_studio","Config_error_msg","index",this.queryString());
		// }

		/*----#end-code----*/
		return this.redirect("igrp_studio", "Config_error_msg", "index", this.queryString());
	}

	public Response actionEdit() throws IOException, IllegalArgumentException, IllegalAccessException {
		Config_error_msg model = new Config_error_msg();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_id_config",Core.getParam("p_id_config"));
		  return this.forward("igrp_studio","Config_error_msg","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (edit) *//* End-Code-Block */
		/*----#start-code(edit)----*/
		this.addQueryString("isEdit", "true");
		this.addQueryString("p_id_config", Core.getParam("p_id_config"));
		/*----#end-code----*/
		return this.redirect("igrp_studio", "Config_error_msg", "index", this.queryString());
	}

	public Response actionDelete() throws IOException, IllegalArgumentException, IllegalAccessException {
		Config_error_msg model = new Config_error_msg();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_id_config",Core.getParam("p_id_config"));
		  return this.forward("igrp_studio","Config_error_msg","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (delete) *//* End-Code-Block */
		/*----#start-code(delete)----*/
		Config tblconfig = new Config().findOne(Core.toInt(Core.getParam("p_id_config")));
		if (tblconfig != null && !tblconfig.hasError()) {
			boolean del = tblconfig.delete();
			if (del)
				Core.setMessageSuccess();
			else
				Core.setMessageError();
		}

		/*----#end-code----*/
		return this.redirect("igrp_studio", "Config_error_msg", "index", this.queryString());
	}
	/* Start-Code-Block (custom-actions) *//* End-Code-Block */
	/*----#start-code(custom_actions)----*/

	/*----#end-code----*/
}
