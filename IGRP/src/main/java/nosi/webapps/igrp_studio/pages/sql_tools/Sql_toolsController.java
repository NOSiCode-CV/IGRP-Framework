package nosi.webapps.igrp_studio.pages.sql_tools;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.core.webapp.databse.helpers.DatabaseMetadaHelper;
import nosi.core.webapp.databse.helpers.DatabaseMetadaHelper.Column;
import java.util.List;
import java.util.Map;

import javax.persistence.Tuple;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Config_env;
import nosi.core.gui.components.IGRPTable;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.TextField;
import java.sql.SQLException;
import nosi.core.xml.XMLWritter;

/*----#end-code----*/
		
public class Sql_toolsController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Sql_tools model = new Sql_tools();
		model.load();
		Sql_toolsView view = new Sql_toolsView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT  "));
		view.application.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.data_source.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		view.application.setValue(new Application().getListApps());
		if (Core.isNotNull(model.getApplication())) {
			final Map<Object, Object> listDSbyEnv = new Config_env().getListDSbyEnv(Core.toInt(model.getApplication()));
			if(listDSbyEnv.size() == 2){
				model.setData_source(listDSbyEnv.keySet().toArray()[1].toString());
			}
			view.data_source.setValue(listDSbyEnv);
		}
		view.table_1.setVisible(false);
		if (Core.isNotNull(model.getApplication()) && Core.isNotNull(model.getData_source()) && Core.isNotNull(model.getSql())) {
			String sql = this.getRemoveSpaceSql(model.getSql());
			Config_env config_env = new Config_env().find()
					.andWhere("application", "=", Core.toInt(model.getApplication(),-1))
					.andWhere("id", "=", Core.toInt(model.getData_source(),-1)).one();
			ResultSet r = new ResultSet();
			long start=System.currentTimeMillis();
			
			if (!this.startWithSelect(sql)) {				
				r = Core.executeQuery(config_env, sql);
			} else {
				try {
					QueryInterface query = Core.query(sql,config_env);
					List<Tuple> list = query.getResultList();
					Core.setMessageInfo(""+(System.currentTimeMillis() - start )+" ms");
					this.addRowToTable(view.table_1,list, sql, config_env);
					view.table_1.setVisible(true);
				}catch(SQLException e) {
					Core.setMessageInfo("error catch: "+(System.currentTimeMillis() - start )+" ms");
					r.setError(e.getMessage());
				}
			}
			if (r.hasError()) {
				Core.setMessageError(r.getError());
			} else {
				Core.setMessageSuccess();
			}
			
		}
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionRun() throws IOException, IllegalArgumentException, IllegalAccessException{
		Sql_tools model = new Sql_tools();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp_studio","ListaPage","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(run)----*/
		if (Core.isNotNull(model.getApplication()) && Core.isNotNull(model.getData_source()) && Core.isNotNull(model.getSql())) {
			return this.forward("igrp_studio", "Sql_tools", "index", this.queryString());
		}
		/*----#end-code----*/
		return this.redirect("igrp_studio","ListaPage","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/
	private void addRowToTable(IGRPTable table_1, List<Tuple> list, String sql, Config_env config_env) throws SQLException {
		List<Column> columns = new DatabaseMetadaHelper().getCollumns(config_env, sql.trim());
		columns.stream().forEach(c -> {
			Field field = new TextField(null, c.getName());
			field.setLabel(c.getName());
			table_1.addField(field);
		});
		XMLWritter rows = new XMLWritter();
		if(list!=null) {
			for(Tuple t:list) {
				rows.startElement("row");
				columns.stream().forEach(c -> {
					try {
						rows.setElement(c.getName(), t.get(c.getName()));
					}catch(IllegalArgumentException e) {
						rows.setElement(c.getName(), "");
					}
				});
				rows.endElement();
			}
			table_1.addRowsXMl(rows.toString());
		}
	}

	private boolean startWithSelect(String sql) {	
		return sql.toLowerCase().startsWith("select");
	}
	
	private String getRemoveSpaceSql(String sql) {
		if(Core.isNotNull(sql)) {
			sql = sql.replaceAll("(\r\n|\n|\t)", " ");
			return sql.trim();
		}
		return "";
	}
	/*----#end-code----*/
}
