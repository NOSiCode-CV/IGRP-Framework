package nosi.webapps.igrp.pages.configdatabase;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.core.webapp.databse.helpers.DatabaseConfigHelper;
import nosi.core.webapp.helpers.EncrypDecrypt;
import nosi.core.webapp.helpers.FileHelper;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Config_env;
import nosi.webapps.igrp.pages.migrate.Migrate;
import nosi.core.webapp.Igrp;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.io.File;
import org.json.JSONObject;

import nosi.core.igrp.mingrations.MigrationIGRP;
import static nosi.core.i18n.Translator.gt;
/*----#end-code----*/
		
public class ConfigDatabaseController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		ConfigDatabase model = new ConfigDatabase();
		model.load();
		ConfigDatabaseView view = new ConfigDatabaseView();
		view.id.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT '1' as default_,'Sit ipsum doloremque dolor sit' as nome_de_conexao_tabela,'Rem labore amet lorem amet' as user_name_tabela,'Dolor laudantium elit unde per' as tipo_de_base_de_dados_tabela,'Mollit amet unde doloremque lo' as t_url_connection,'Mollit anim ut amet adipiscing' as t_driver_connection,'1' as id "));
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.tipo_base_dados.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		String id_app = model.getAplicacao();
		java.util.List<Config_env> list_app = new Config_env().find().andWhere("application", "=",Core.toInt(id_app)).all();
		ArrayList<ConfigDatabase.Table_1> lista_tabela = new ArrayList<>();
		list_app.sort(Comparator.comparing(Config_env::getName));
		for(Config_env lista : list_app) {
			ConfigDatabase.Table_1 tabela = new ConfigDatabase.Table_1();
          	tabela.setId(""+lista.getId());
          	tabela.setTipo_de_base_de_dados_tabela(Core.decrypt(lista.getType_db(), this.ed.SECRET_KEY_ENCRYPT_DB));
			tabela.setNome_de_conexao_tabela(lista.getName());
			tabela.setT_url_connection(
				Core.isNotNull(lista.getUrl_connection())
				?
					Core.decrypt(lista.getUrl_connection(), this.ed.SECRET_KEY_ENCRYPT_DB)
				:
					DatabaseConfigHelper.getUrl(
						tabela.getTipo_de_base_de_dados_tabela(), 
						Core.decrypt(lista.getHost(), this.ed.SECRET_KEY_ENCRYPT_DB), 
						Core.decrypt(lista.getPort(),this.ed.SECRET_KEY_ENCRYPT_DB), 
						Core.decrypt(lista.getName_db(), this.ed.SECRET_KEY_ENCRYPT_DB)
					)
			);
			tabela.setT_driver_connection(Core.isNotNull(lista.getDriver_connection())?Core.decrypt(lista.getDriver_connection(), this.ed.SECRET_KEY_ENCRYPT_DB):DatabaseConfigHelper.getDatabaseDriversExamples(tabela.getTipo_de_base_de_dados_tabela()));
			tabela.setUser_name_tabela(Core.decrypt(lista.getUsername(), this.ed.SECRET_KEY_ENCRYPT_DB));
			
			if(lista.getIsDefault() == 1) {
				tabela.setDefault_(1);
				tabela.setDefault__check(1);
			}else {
				tabela.setDefault_(0);
				tabela.setDefault__check(1);
			}
			
			lista_tabela.add(tabela);
		}
		if (Core.isInt(model.getAplicacao()) ) {
			view.aplicacao.setQuery(Core.query(this.configApp.getBaseConnection(),"SELECT id as ID, name as NAME FROM tbl_env WHERE id=" + Core.toInt(model.getAplicacao())));		 	
			view.tipo_base_dados.setValue(DatabaseConfigHelper.getDatabaseTypes());
			view.table_1.addData(lista_tabela);
			//if EDIT
			if(Core.isNotNull(Core.getParam("p_id_connection"))) {
				Integer id = Core.getParamInt("p_id_connection");
				Config_env config = new Config_env().findOne(id);
				// if it didnt came from failed connection
				if(Core.isNull(Core.getParam("failed_conn"))) {
					model.setAplicacao(config.getApplication().getId().toString());
					model.setTipo_base_dados(Core.decrypt(config.getType_db(),this.ed.SECRET_KEY_ENCRYPT_DB));
					model.setNome_de_conexao(config.getName());
					model.setUrl_connection(Core.decrypt(config.getUrl_connection(),this.ed.SECRET_KEY_ENCRYPT_DB));
					model.setDriver_connection(Core.decrypt(config.getDriver_connection(), this.ed.SECRET_KEY_ENCRYPT_DB));
					model.setUsername(Core.decrypt(config.getUsername(), this.ed.SECRET_KEY_ENCRYPT_DB));
					model.setPassword(null);
					view.btn_gravar.addParameter("p_id", id)
								   .addParameter("conn_name", config.getName())
								   .addParameter("app_name", config.getApplication().getDad())
								   .setLink("edit-gravar");
				}
				// if it is an edit and came from failed connection, just edit the save btn
				else {
					view.btn_gravar.addParameter("p_id", id)
					   .addParameter("conn_name", config.getName())
					   .addParameter("app_name", config.getApplication().getDad())
					   .setLink("edit-gravar");
				}
				
			} else
				if(Core.isNotNull(model.getTipo_base_dados())) {
					if(Core.isNotNull(model.getUrl_connection())){
						if(!model.getUrl_connection().contains(model.getTipo_base_dados()))
							model.setUrl_connection(DatabaseConfigHelper.getUrlConnections(model.getTipo_base_dados()));
					}else
						model.setUrl_connection(DatabaseConfigHelper.getUrlConnections(model.getTipo_base_dados()));	
				model.setDriver_connection(DatabaseConfigHelper.getDatabaseDriversExamples(model.getTipo_base_dados()));
				Integer idApp = Core.toInt(model.getAplicacao());
				Application app = new Application().findOne(idApp);
				List<Config_env> list = new Config_env()
											.find()
											.andWhere("application", "=",idApp)
											.andWhere("type_db", "=",Core.encrypt(model.getTipo_base_dados(),this.ed.SECRET_KEY_ENCRYPT_DB) )
											.all();
				int size = list!=null?(list.size()+1):1;
				model.setNome_de_conexao(app.getDad().toLowerCase()+"_"+model.getTipo_base_dados()+"_"+size);
//				model.setParagraph_1("  Ex: "+ DatabaseConfigHelper.getUrlConnectionsExamples(model.getTipo_base_dados(),new Application().findOne(model.getAplicacao()).getDad()));
				model.setParagraph_1("  Ex: "+ DatabaseConfigHelper.getUrlConnectionsExamples(model.getTipo_base_dados(),"devnosi.gov.cv"));
			}else
              Core.setMessageInfo(gt("-- Selecionar --")+" "+gt("Tipo de base de dados")+"!");
		}
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		ConfigDatabase model = new ConfigDatabase();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id",Core.getParam("p_id"));
		 return this.forward("igrp","ConfigDatabase","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(gravar)----*/
		
      if (Igrp.getMethod().equalsIgnoreCase("post")) {		
			Config_env config = new Config_env();
			config.setApplication(new Application().findOne(Integer.parseInt(model.getAplicacao())));
			config.setCharset("utf-8");
			config.setUsername(Core.encrypt(model.getUsername(),this.ed.SECRET_KEY_ENCRYPT_DB));
			config.setPassword(Core.encrypt(model.getPassword(),this.ed.SECRET_KEY_ENCRYPT_DB));
			config.setType_db(Core.encrypt(model.getTipo_base_dados(),this.ed.SECRET_KEY_ENCRYPT_DB));
			config.setUrl_connection(Core.encrypt(model.getUrl_connection(),this.ed.SECRET_KEY_ENCRYPT_DB));
			config.setDriver_connection(Core.encrypt(model.getDriver_connection(),this.ed.SECRET_KEY_ENCRYPT_DB));
			config.setName(model.getNome_de_conexao());
			Migrate m = new Migrate();
			m.load();
			if (!(new MigrationIGRP().validate(m)) || config.getName().equalsIgnoreCase(this.configApp.getBaseConnection())) {
				Core.setMessageError(gt("Falha na conexão com a base de dados"));
				return this.forward("igrp", "ConfigDatabase", "index&id=" + model.getAplicacao());
			}
			boolean check = new Config_env().find()
											.andWhere("name", "=", config.getName())
											.andWhere("application", "=",Integer.parseInt(model.getAplicacao()))
											.one() == null;
			if (check && !config.getName().equalsIgnoreCase(this.configApp.getBaseConnection()) && !config.getName().equalsIgnoreCase(this.configApp.getH2IGRPBaseConnection())) {
				
				java.util.List<Config_env> all = new Config_env().find().andWhere("application", "=", Integer.parseInt(model.getAplicacao())).all();
				if(all == null || all.isEmpty())
					config.setIsDefault((short)1); 
				
				config = config.insert();
				
				if (config != null) {
					this.saveConfigHibernateFile(config);
					Core.setMessageSuccess();
                    Core.setMessageInfo(gt(new ConfigDatabaseView().nome_de_conexao.getLabel())+": " + config.getName());
					return this.forward("igrp", "ConfigDatabase", "index&id=" + model.getAplicacao());
				}
			} else {
              Core.setMessageWarning(gt(new ConfigDatabaseView().nome_de_conexao.getLabel())+" "+gt("INV"));
				return this.forward("igrp", "ConfigDatabase", "index&id=" + model.getAplicacao());
			}
		}
		
		/*----#end-code----*/
		return this.redirect("igrp","ConfigDatabase","index", this.queryString());	
	}
	
	public Response actionEdit() throws IOException, IllegalArgumentException, IllegalAccessException{
		ConfigDatabase model = new ConfigDatabase();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id",Core.getParam("p_id"));
		 return this.forward("igrp","ConfigDatabase","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(edit)----*/
		this.addQueryString("isEdit", true);
        this.addQueryString("p_id_connection", Core.getParam("p_id"));
		return this.forward("igrp","ConfigDatabase","index", this.queryString());
		/*----#end-code----*/
			
	}
	
	public Response actionDelete() throws IOException, IllegalArgumentException, IllegalAccessException{
		ConfigDatabase model = new ConfigDatabase();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id",Core.getParam("p_id"));
		 return this.forward("igrp","ConfigDatabase","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(delete)----*/
		Config_env obj = new Config_env().findOne(Core.getParamInt("p_id"));
		
		System.out.println(model.getAplicacao());
		
		if(obj != null && obj.getApplication() != null) {
			if(obj.getIsDefault() == 1) {
				java.util.List<Config_env> all = new Config_env().find().
						andWhere("name", "<>", obj.getName())
						.andWhere("application", "=", Integer.parseInt(model.getAplicacao()))
						.all();
				if(all != null && all.size() > 0) {
					Config_env aux = all.get(0);
					aux.setIsDefault((short)1);
					aux = aux.update();
				}
			}
			if (obj.delete(obj.getId())) {
				Core.setMessageSuccess();
			}else
				Core.setMessageError();
			
		}
      this.addQueryString("p_aplicacao",Core.getParam("p_aplicacao")); 
      return this.forward("igrp", "ConfigDatabase", "index", this.queryString());
		/*----#end-code----*/
			
	}
	
/*----#start-code(custom_actions)----*/
	private void saveConfigHibernateFile(Config_env config) throws IOException {
		String package_ = "nosi.webapps." + config.getApplication().getDad().toLowerCase() + ".dao";
		String content = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
				+ "<!DOCTYPE hibernate-configuration SYSTEM \"http://www.hibernate.org/dtd/hibernate-mapping-3.0.dtd\">\n"
				+ "<hibernate-configuration>\n" + "		<session-factory>\n"
				+ "				<!-- Mapping your class here... \n" + "					Ex: <mapping class=\""
				+ package_ + ".Employee\"/>\n" + "				-->\n" + "		</session-factory>\n"
				+ "</hibernate-configuration>";
		String pathWS = this.getConfig().getPathWorkspaceResources();
		String pathServer = this.getConfig().getBasePathClass();
		FileHelper.save(pathServer, config.getName()+"."+config.getApplication().getDad().toLowerCase() + ".cfg.xml", content);
		if (FileHelper.fileExists(pathWS)) {
			FileHelper.save(pathWS, config.getName()+"."+config.getApplication().getDad().toLowerCase() + ".cfg.xml", content);
		}
	}
	private EncrypDecrypt ed = new EncrypDecrypt();
	
	public Response actionChangeStatus() {
		this.format = Response.FORMAT_JSON;
        String id = Core.getParam("p_id");
        boolean response = false;
        
        if(id != null) {
        	Config_env config_env = new Config_env().find().andWhere("name", "=", id).one();
        	if(config_env != null) {
        		java.util.List<Config_env> all = new Config_env().find().andWhere("application.id", "=", config_env.getApplication().getId()).all();
        		if(all != null) {
        			all.forEach(obj->{
        				obj.setIsDefault((short)0);
        				obj = obj.update();
        			});
        		}
        		config_env.setIsDefault((short)1);
        		config_env = config_env.update();
        		if(config_env != null)
        			response = true;
        	}
        }
        JSONObject json = new JSONObject();
        json.put("status", response);     
        return this.renderView(json.toString());
	}
	
	public Response actionEditGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		ConfigDatabase model = new ConfigDatabase();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id",Core.getParam("p_id"));
		 return this.forward("igrp","ConfigDatabase","index", this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(gravar)----*/
		if (Igrp.getMethod().equalsIgnoreCase("post")) {		
			Integer id_conn = Core.getParamInt("p_id");
			Config_env config = new Config_env().findOne(id_conn);
			config.setApplication(new Application().findOne(Integer.parseInt(model.getAplicacao())));
			config.setCharset("utf-8");
			config.setUsername(Core.encrypt(model.getUsername(),this.ed.SECRET_KEY_ENCRYPT_DB));
			config.setPassword(Core.encrypt(model.getPassword(),this.ed.SECRET_KEY_ENCRYPT_DB));
			config.setType_db(Core.encrypt(model.getTipo_base_dados(),this.ed.SECRET_KEY_ENCRYPT_DB));
			config.setUrl_connection(Core.encrypt(model.getUrl_connection(),this.ed.SECRET_KEY_ENCRYPT_DB));
			config.setDriver_connection(Core.encrypt(model.getDriver_connection(),this.ed.SECRET_KEY_ENCRYPT_DB));
			config.setName(model.getNome_de_conexao());
			Migrate m = new Migrate();
			m.load();

			if (!(new MigrationIGRP().validate(m)) || config.getName().equalsIgnoreCase(this.configApp.getBaseConnection()) || config.getName().equalsIgnoreCase(this.configApp.getH2IGRPBaseConnection())) {
				Core.setMessageError(gt("Falha na conexão com a base de dados"));
				
				return this.forward("igrp", "ConfigDatabase", "index&failed_conn=" + true + "&p_id_connection=" + id_conn);
			}
			boolean check = false;
			if(config.getName().equals(Core.getParam("conn_name"))) {
				check = true;
			}
			else check = new Config_env().find()
											.andWhere("name", "=", config.getName())
											.andWhere("application", "=",Integer.parseInt(model.getAplicacao()))
											.one() == null;
			if (check) {
				config = config.update();
				
				if (config != null) {
					this.editConfigHibernateFile(config);
					Core.setMessageSuccess();
                    Core.setMessageInfo(gt(new ConfigDatabaseView().nome_de_conexao.getLabel())+": " + config.getName());
					return this.forward("igrp", "ConfigDatabase", "index&id=" + model.getAplicacao());
				}
			} else {
              Core.setMessageWarning(gt(new ConfigDatabaseView().nome_de_conexao.getLabel())+" "+gt("INV"));
				return this.forward("igrp", "ConfigDatabase", "index&id=" + model.getAplicacao());
			}
		}
		return this.redirect("igrp","ConfigDatabase","index", this.queryString());	
	}

	private void editConfigHibernateFile(Config_env config) throws IOException {
		String oldConnName = Core.getParam("conn_name");
		String oldAppName = Core.getParam("app_name");
		
		String pathWS = this.getConfig().getPathWorkspaceResources();
		String pathServer = this.getConfig().getBasePathClass();
		FileHelper.renameFile(pathServer, oldConnName+"."+oldAppName+".cfg.xml", config.getName()+"."+config.getApplication().getDad().toLowerCase() + ".cfg.xml");
		if (FileHelper.fileExists(pathWS)) {
			FileHelper.renameFile(pathWS + File.separator, oldConnName+"."+oldAppName+".cfg.xml", config.getName()+"."+config.getApplication().getDad().toLowerCase() + ".cfg.xml");
		}
	}
	
	/*----#end-code----*/
}
