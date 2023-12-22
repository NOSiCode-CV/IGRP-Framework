package nosi.webapps.igrp.pages.configdatabase;

import nosi.core.webapp.Controller;//
import nosi.core.webapp.databse.helpers.ResultSet;//
import nosi.core.webapp.databse.helpers.QueryInterface;//
import java.io.IOException;//
import nosi.core.webapp.Core;//
import nosi.core.webapp.Response;//
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/

import static nosi.core.i18n.Translator.gt;

import java.io.File;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Properties;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.dom4j.tree.DefaultComment;
import org.dom4j.tree.DefaultElement;
import org.json.JSONObject;

import nosi.core.config.Config;
import nosi.core.config.ConfigApp;
import nosi.core.igrp.mingrations.MigrationIGRP;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.databse.helpers.DatabaseConfigHelper;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.dao_helper.SaveMapeamentoDAO;
import nosi.core.webapp.security.EncrypDecrypt;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Config_env;
import nosi.webapps.igrp.pages.migrate.Migrate;

/*----#end-code----*/
		
public class ConfigDatabaseController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		ConfigDatabase model = new ConfigDatabase();
		model.load();
		model.setAbrir_cfgxml("igrp","ConfigDatabase","index");
		ConfigDatabaseView view = new ConfigDatabaseView();
		view.nome_de_conexao_tabela.setParam(true);
		view.id.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT '1' as default_,'Lorem officia consectetur aper' as nome_de_conexao_tabela,'Adipiscing ipsum perspiciatis' as user_name_tabela,'Sit sed deserunt mollit amet' as tipo_de_base_de_dados_tabela,'Doloremque ipsum aperiam elit' as t_url_connection,'Mollit sit omnis doloremque vo' as t_driver_connection,'hidden-fc11_e4e3' as id "));
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.tipo_base_dados.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/* Start-Code-Block (index) *//* End-Code-Block (index) */
		/*----#start-code(index)----*/
		//model.setLink_doc(this.getConfig().getResolveUrl("tutorial","Listar_documentos","index&p_type=base_dados"));
		Integer idApp = Core.toInt(model.getAplicacao());
		
		
		java.util.List<Config_env> listApp = new Config_env().find().andWhere("application", "=",idApp).all();
		ArrayList<ConfigDatabase.Table_1> listaTabela = new ArrayList<>();
		listApp.sort(Comparator.comparing(Config_env::getName));
		for(Config_env lista : listApp) {
			ConfigDatabase.Table_1 tabela = new ConfigDatabase.Table_1();
          	tabela.setId(""+lista.getId());
          	tabela.setTipo_de_base_de_dados_tabela(Core.decrypt(lista.getType_db(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB));
			tabela.setNome_de_conexao_tabela(lista.getName());
			tabela.setT_url_connection(
				Core.isNotNull(lista.getUrl_connection())?Core.decrypt(lista.getUrl_connection(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB):DatabaseConfigHelper.getUrl(
						tabela.getTipo_de_base_de_dados_tabela(), 
						Core.decrypt(lista.getHost(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB), 
						Core.decrypt(lista.getPort(),EncrypDecrypt.SECRET_KEY_ENCRYPT_DB), 
						Core.decrypt(lista.getName_db(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB)
					)
			);
			tabela.setT_driver_connection(Core.isNotNull(lista.getDriver_connection())?Core.decrypt(lista.getDriver_connection(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB):DatabaseConfigHelper.getDatabaseDriversExamples(tabela.getTipo_de_base_de_dados_tabela()));
			tabela.setUser_name_tabela(Core.decrypt(lista.getUsername(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB));
			
			if(lista.getIsDefault() == 1) {
				tabela.setDefault_(1);
				tabela.setDefault__check(1);
			}else {
				tabela.setDefault_(0);
				tabela.setDefault__check(1);
			}
			
			listaTabela.add(tabela);
		}
		if (Core.isInt(model.getAplicacao()) ) {
			//if EDIT
			if(Core.isNotNull(Core.getParam("p_id_connection"))) {
				Integer id = Core.getParamInt("p_id_connection");
				Config_env config = new Config_env().findOne(id);
				
				
				// if it didnt came from failed connection
				if(Core.isNull(Core.getParam("failed_conn"))) {
					model.setAplicacao(config.getApplication().getId().toString());
					model.setTipo_base_dados(Core.decrypt(config.getType_db(),EncrypDecrypt.SECRET_KEY_ENCRYPT_DB));
					model.setNome_de_conexao(config.getName());
					model.setUrl_connection(Core.decrypt(config.getUrl_connection(),EncrypDecrypt.SECRET_KEY_ENCRYPT_DB));
					model.setDriver_connection(Core.decrypt(config.getDriver_connection(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB));
					if(config.getName_db()!=null)
						model.setSql_dialect(config.getName_db());
					else
						model.setSql_dialect(DatabaseConfigHelper.getHibernateDialect(Core.decrypt(config.getType_db(),EncrypDecrypt.SECRET_KEY_ENCRYPT_DB)));
					model.setUsername(Core.decrypt(config.getUsername(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB));
					model.setPassword(null);
					model.setSave_properties(Core.toInt(config.getHost()));
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
				view.sectionheader_1_text.setValue("Configuração da base de dados <span style=\"font-size: x-small;\">(connection_identify: "+config.getConnection_identify()+")</span>");
				view.abrir_cfgxml.setVisible(saveProps(config));
				model.setAbrir_cfgxml("igrp","ConfigDatabase","ver")
					.addParam("conn_name", config.getName())
					.addParam("app_name", config.getApplication().getDad().toLowerCase());
				//view.abrir_cfgxml.
			} else
				if(Core.isNotNull(model.getTipo_base_dados())) {
					if(Core.isNotNull(model.getUrl_connection().trim())){
						if(!model.getUrl_connection().trim().contains(model.getTipo_base_dados()))
							model.setUrl_connection(DatabaseConfigHelper.getUrlConnections(model.getTipo_base_dados()));
					}else
						model.setUrl_connection(DatabaseConfigHelper.getUrlConnections(model.getTipo_base_dados()));	
				model.setDriver_connection(DatabaseConfigHelper.getDatabaseDriversExamples(model.getTipo_base_dados()));
				model.setSql_dialect(DatabaseConfigHelper.getHibernateDialect(model.getTipo_base_dados()));
				model.setSave_properties(1);
				Application app = new Application().findOne(idApp);
				List<Config_env> list = new Config_env()
											.find()
											.andWhere("application", "=",idApp)
											.andWhere("type_db", "=",Core.encrypt(model.getTipo_base_dados(),EncrypDecrypt.SECRET_KEY_ENCRYPT_DB) )
											.all();
				int size = list!=null?(list.size()+1):1;
				model.setNome_de_conexao(app.getDad().toLowerCase()+"_"+model.getTipo_base_dados()+"_"+size);
//				model.setParagraph_1("  Ex: "+ DatabaseConfigHelper.getUrlConnectionsExamples(model.getTipo_base_dados(),new Application().findOne(model.getAplicacao()).getDad()));
				model.setParagraph_1("  Ex: "+ DatabaseConfigHelper.getUrlConnectionsExamples(model.getTipo_base_dados(),"devnosi.gov.cv"));
				view.abrir_cfgxml.setVisible(false);
			}else
              Core.setMessageInfo(gt("-- Selecionar --")+" "+gt("Tipo de base de dados")+"!");
			
			
			view.aplicacao.setQuery(Core.query(this.configApp.getBaseConnection(),"SELECT id as ID, name as NAME FROM tbl_env WHERE id=" + Core.toInt(model.getAplicacao())));		 	
			view.tipo_base_dados.setValue(DatabaseConfigHelper.getDatabaseTypes());
			view.table_1.addData(listaTabela);
	
			view.driver_connection.propertie().add("tooltip","Property specifies the JDBC driver class to be used for the database connection. The appropriate driver class depends on the specific database management system (DBMS) you are using. Here are the driver classes for some popular DBMS"); 
			view.sql_dialect.propertie().replace("tooltip","Property specifies the SQL dialect to be used by Hibernate when interacting with the database. The appropriate dialect depends on the specific database management system (DBMS) you are using. Here are some common dialects for popular DBMS");
			
			

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
		  this.addQueryString("p_nome_de_conexao_tabela",Core.getParam("p_nome_de_conexao_tabela"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  return this.forward("igrp","ConfigDatabase","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (gravar)  *//* End-Code-Block  */
		/*----#start-code(gravar)----*/
		
      if (Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("post")) {		
			Config_env config = new Config_env();
			config.setApplication(Core.findApplicationById(Core.toInt(model.getAplicacao())));
			config.setCharset("utf-8");
			config.setUsername(Core.encrypt(model.getUsername().trim(),EncrypDecrypt.SECRET_KEY_ENCRYPT_DB));
			config.setPassword(Core.encrypt(model.getPassword().trim(),EncrypDecrypt.SECRET_KEY_ENCRYPT_DB));
			config.setType_db(Core.encrypt(model.getTipo_base_dados(),EncrypDecrypt.SECRET_KEY_ENCRYPT_DB));
			config.setUrl_connection(Core.encrypt(model.getUrl_connection().trim(),EncrypDecrypt.SECRET_KEY_ENCRYPT_DB));
			config.setDriver_connection(Core.encrypt(model.getDriver_connection(),EncrypDecrypt.SECRET_KEY_ENCRYPT_DB));
			config.setName(model.getNome_de_conexao().trim());
				//SQL dialect will be saved in the not used collumn name_db
			config.setName_db(model.getSql_dialect().trim());
				//Save .properties 1 yes
			config.setHost(model.getSave_properties()+"");
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
			if (check && !config.getName().equalsIgnoreCase(this.configApp.getBaseConnection())) {
				java.util.List<Config_env> all = new Config_env().find().andWhere("application", "=", Integer.parseInt(model.getAplicacao())).all();
				if(all == null || all.isEmpty())
					config.setIsDefault((short)1); 
				
				config = config.insert();
				
				if (config != null) {
					this.saveConfigHibernateFile(config);
					this.saveHibPropertiesFile(model);
					Core.setMessageSuccess();
                    Core.setMessageInfo(gt(new ConfigDatabaseView().nome_de_conexao.getLabel())+": " + config.getName());
                    this.addQueryString("p_aplicacao",model.getAplicacao()); 
					return this.redirect("igrp", "ConfigDatabase", "index", this.queryString());
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
		  this.addQueryString("p_nome_de_conexao_tabela",Core.getParam("p_nome_de_conexao_tabela"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  return this.forward("igrp","ConfigDatabase","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (edit)  *//* End-Code-Block  */
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
		  this.addQueryString("p_nome_de_conexao_tabela",Core.getParam("p_nome_de_conexao_tabela"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  return this.forward("igrp","Dominio","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (delete)  *//* End-Code-Block  */
		/*----#start-code(delete)----*/
		Config_env obj = new Config_env().findOne(Core.getParamInt("p_id"));
		
		if(obj != null && obj.getApplication() != null) {
			if(obj.getIsDefault() == 1) {
				java.util.List<Config_env> all = new Config_env().find().
						andWhere("name", "<>", obj.getName())
						.andWhere("application", "=", Integer.parseInt(model.getAplicacao()))
						.all();
				if(all != null && !all.isEmpty()) {
					Config_env aux = all.get(0);
					aux.setIsDefault((short)1);
					aux.update();
				}
			}
			String fileName = obj.getName()+"."+obj.getApplication().getDad().toLowerCase() + ".cfg.xml"; 
			String path = new Config().getPathConexao() ;
			if (obj.delete(obj.getId())) {
				FileHelper.forceDelete(path + File.separator + fileName);
				Core.setMessageSuccess();
			}else
				Core.setMessageError();
			
		}
      this.addQueryString("p_aplicacao",Core.getParam("p_aplicacao")); 
      return this.forward("igrp", "ConfigDatabase", "index", this.queryString());
		/*----#end-code----*/
			
	}
	/* Start-Code-Block (custom-actions)  *//* End-Code-Block  */
/*----#start-code(custom_actions)----*/
	
	
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
		if (Core.isHttpPost()) {		
			Integer idConn = Core.getParamInt("p_id");
			Config_env config = new Config_env().findOne(idConn);
			config.setApplication(Core.findApplicationById(Integer.parseInt(model.getAplicacao())));
			config.setCharset("utf-8");
			config.setUsername(Core.encrypt(model.getUsername().trim(),EncrypDecrypt.SECRET_KEY_ENCRYPT_DB));
			config.setPassword(Core.encrypt(model.getPassword().trim(),EncrypDecrypt.SECRET_KEY_ENCRYPT_DB));
			config.setType_db(Core.encrypt(model.getTipo_base_dados(),EncrypDecrypt.SECRET_KEY_ENCRYPT_DB));
			config.setUrl_connection(Core.encrypt(model.getUrl_connection().trim(),EncrypDecrypt.SECRET_KEY_ENCRYPT_DB));
			config.setDriver_connection(Core.encrypt(model.getDriver_connection(),EncrypDecrypt.SECRET_KEY_ENCRYPT_DB));
			config.setName(model.getNome_de_conexao().trim());
			config.setName_db(model.getSql_dialect().trim());
			config.setHost(model.getSave_properties()+"");
			Migrate m = new Migrate();
			m.load();

			if (!(new MigrationIGRP().validate(m)) || config.getName().equalsIgnoreCase(this.configApp.getBaseConnection())) {
				Core.setMessageError(gt("Falha na conexão com a base de dados"));
				return this.forward("igrp", "ConfigDatabase", "index&failed_conn=" + true + "&p_id_connection=" + idConn);
			}
			boolean check = false;
			if(model.getNome_de_conexao().trim().equals(Core.getParam("conn_name"))) {
				check = true;
			}
			else  //Checks if the changed name for the connection exists in the database first before update 
				check = new Config_env().find()
											.andWhere("name", "=", config.getName())
											.andWhere("application", "=",Integer.parseInt(model.getAplicacao()))
											.one() == null;
			if (check) {
				config = config.update();
				
				if (config != null) { // Editar aqui ... 
					boolean success = updateHibernateConfigFileOfApp(config, model); 
					System.out.println("Hibernate File .cfg updat status success = " + success);
					if(saveProps(config))
						saveHibPropertiesFile(model);
					
					Core.setMessageSuccess();
                    Core.setMessageInfo(gt(new ConfigDatabaseView().nome_de_conexao.getLabel())+": " + config.getName());
                    this.addQueryString("p_aplicacao",model.getAplicacao()); 
					return this.redirect("igrp", "ConfigDatabase", "index", this.queryString());
				}
			} else {
              Core.setMessageWarning(gt(new ConfigDatabaseView().nome_de_conexao.getLabel())+" "+gt("INV"));
				return this.forward("igrp", "ConfigDatabase", "index&id=" + model.getAplicacao());
			}
		}
		return this.redirect("igrp","ConfigDatabase","index", this.queryString());	
	}

	private String getHibernateConfig(Config_env config,String package_) {
		if(saveProps(config))
			return "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" + 
			"<!DOCTYPE hibernate-configuration PUBLIC\r\n" + 
			"\"-//Hibernate/Hibernate Configuration DTD 3.0//EN\"\r\n" + 
			"\"http://www.hibernate.org/dtd/hibernate-configuration-3.0.dtd\">\n"+ 
			"<hibernate-configuration>\n" + 
			"\t<session-factory>\n" +
			"\n\t\t<!-- hibernate.connection.driver_class,.url,.username,.password and .dialect now in "+config.getName()+"."+config.getApplication().getDad().toLowerCase()+".properties  -->\r\n\n" + 
			"\t\t<property name=\"hibernate.hbm2ddl.auto\">update</property>\r\n" + 
			"\t\t<property name=\"hibernate.connection.isolation\">2</property>\r\n" + 
			"\t\t<property name=\"hibernate.connection.autocommit\">false</property>\r\n" + 
			"\t\t<property name=\"hibernate.hbm2ddl.jdbc_metadata_extraction_strategy\">individually</property>\r\n" + 
			"\t\t<property name=\"hibernate.current_session_context_class\">org.hibernate.context.internal.ThreadLocalSessionContext</property>\r\n" + 
			"\t\t<property name=\"hibernate.transaction.auto_close_session\">DELAYED_ACQUISITION_AND_RELEASE_AFTER_TRANSACTION</property>\r\n" + 
			"\t\t<!-- Hikaricp configuration -->\r\n" + 
			"\t\t<property name=\"hibernate.connection.provider_class\">org.hibernate.hikaricp.internal.HikariCPConnectionProvider</property>\r\n" + 
			"\t\t<property name=\"hibernate.hikari.connectionTimeout\">120000</property>\r\n" + 
			"\t\t<property name=\"hibernate.hikari.idleTimeout\">600000</property>\r\n" + 
			"\t\t<property name=\"hibernate.hikari.minimumIdle\">0</property>\r\n" + 
			"\t\t<property name=\"hibernate.hikari.maximumPoolSize\">10</property>\r\n" + 
			"\t\t<property name=\"hibernate.hikari.maxLifetime\">1800000</property>\r\n" + 
			"\t\t<property name=\"hibernate.hikari.leakDetectionThreshold\">0</property>\r\n" +
			"\t\t<!-- Mapping your class here... \n" + 
			"\t\tEx: <mapping class=\""+ package_ + ".Employee\"/>" + 
			" \t\t-->\n" + 
			"\t</session-factory>\n"+ 
			"</hibernate-configuration>";
		
		return "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" + 
				"<!DOCTYPE hibernate-configuration PUBLIC\r\n" + 
				"\"-//Hibernate/Hibernate Configuration DTD 3.0//EN\"\r\n" + 
				"\"http://www.hibernate.org/dtd/hibernate-configuration-3.0.dtd\">\n"+ 
				"<hibernate-configuration>\n" + 
				"\t<session-factory>\n" +
				"\t\t<property name=\"hibernate.connection.driver_class\">"+Core.decrypt(config.getDriver_connection(),EncrypDecrypt.SECRET_KEY_ENCRYPT_DB)+"</property>\r\n" + 
				"\t\t<property name=\"hibernate.connection.url\">"+Core.decrypt(config.getUrl_connection().trim(),EncrypDecrypt.SECRET_KEY_ENCRYPT_DB)+"</property>\r\n" + 
				"\t\t<property name=\"hibernate.connection.username\">"+Core.decrypt(config.getUsername().trim(),EncrypDecrypt.SECRET_KEY_ENCRYPT_DB)+"</property>\r\n" + 
				"\t\t<property name=\"hibernate.connection.password\">"+Core.decrypt(config.getPassword().trim(),EncrypDecrypt.SECRET_KEY_ENCRYPT_DB)+"</property>\r\n" + 
				"\t\t<property name=\"hibernate.hbm2ddl.auto\">update</property>\r\n" + 
				"\t\t<property name=\"hibernate.connection.isolation\">2</property>\r\n" + 
				"\t\t<property name=\"hibernate.connection.autocommit\">false</property>\r\n" + 
				"\t\t<property name=\"hibernate.hbm2ddl.jdbc_metadata_extraction_strategy\">individually</property>\r\n" + 
				"\t\t<property name=\"hibernate.current_session_context_class\">org.hibernate.context.internal.ThreadLocalSessionContext</property>\r\n" + 
				"\t\t<property name=\"hibernate.transaction.auto_close_session\">DELAYED_ACQUISITION_AND_RELEASE_AFTER_TRANSACTION</property>\r\n" + 
				"\t\t<property name=\"hibernate.dialect\">"+config.getName_db()+"</property>\n"+
				"\t\t<!-- Hikaricp configuration -->\r\n" + 
				"\t\t<property name=\"hibernate.connection.provider_class\">org.hibernate.hikaricp.internal.HikariCPConnectionProvider</property>\r\n" + 
				"\t\t<property name=\"hibernate.hikari.connectionTimeout\">120000</property>\r\n" + 
				"\t\t<property name=\"hibernate.hikari.idleTimeout\">600000</property>\r\n" + 
				"\t\t<property name=\"hibernate.hikari.minimumIdle\">0</property>\r\n" + 
				"\t\t<property name=\"hibernate.hikari.maximumPoolSize\">10</property>\r\n" + 
				"\t\t<property name=\"hibernate.hikari.maxLifetime\">1800000</property>\r\n" + 
				"\t\t<property name=\"hibernate.hikari.leakDetectionThreshold\">0</property>\r\n" +
				"\t\t<!-- Mapping your class here... \n" + 
				"\t\tEx: <mapping class=\""+ package_ + ".Employee\"/>" + 
				" \t\t-->\n" + 
				"\t</session-factory>\n"+ 
				"</hibernate-configuration>";
		
	}
	
	private void saveConfigHibernateFile(Config_env config) throws IOException {
		String package_ = "nosi.webapps." + config.getApplication().getDad().toLowerCase() + ".dao";
		String content = this.getHibernateConfig(config,package_);
		String pathWS = this.getConfig().getPathWorkspaceResources();
		String pathServer = this.getConfig().getBasePathClass();
		FileHelper.save(pathServer, config.getName()+"."+config.getApplication().getDad().toLowerCase() + ".cfg.xml", content);
		if (FileHelper.fileExists(pathWS)) {
			FileHelper.save(pathWS, config.getName()+"."+config.getApplication().getDad().toLowerCase() + ".cfg.xml", content);
		}
	}
	
	private void saveHibPropertiesFile(ConfigDatabase model) throws IOException {
		Properties hibProps= new Properties();
		hibProps.setProperty("hibernate.connection.driver_class", model.getDriver_connection().trim());
		hibProps.setProperty("hibernate.dialect", model.getSql_dialect().trim());
		hibProps.setProperty("hibernate.connection.url", model.getUrl_connection().trim());
		hibProps.setProperty("hibernate.connection.username", model.getUsername().trim());
		hibProps.setProperty("hibernate.connection.password", model.getPassword().trim());
		
		String path = new Config().getPathConexao() ;
		String aplicacao = Core.findApplicationById(Core.toInt(model.getAplicacao())).getDad();
		String pFilename= model.getNome_de_conexao()+"."+aplicacao.toLowerCase() + ".properties";
		ConfigApp.getInstance().saveProperties(hibProps, path+pFilename);
		
	}
	
	
	
	private boolean updateHibernateConfigFileOfApp(Config_env config, ConfigDatabase model) {
		boolean success = false;
		try {
			String path = new Config().getPathConexao() ;
			String fileNameOld = Core.getParam("conn_name")+"."+config.getApplication().getDad().toLowerCase() + ".cfg.xml"; 
			String cfgFileContent = SaveMapeamentoDAO.getHibernateConfig(path + fileNameOld); 
			cfgFileContent = processHibernateConfigFileXml(cfgFileContent, config); 			
			
			String fileNameNew = config.getName()+"."+config.getApplication().getDad().toLowerCase() + ".cfg.xml"; 
			if(cfgFileContent != null && !cfgFileContent.isEmpty()) 
				success = this.saveFiles(fileNameNew, cfgFileContent, path); 
			
			if(success && !fileNameOld.equals(fileNameNew)) {
				FileHelper.forceDelete(path + fileNameOld);
				FileHelper.forceDelete(path + fileNameOld.replace(".cfg.xml", ".properties"));
			}
				
		} catch (Exception e) {
			e.printStackTrace(); 
		}
		return success;
	}
	
	private String processHibernateConfigFileXml(String xmlInput, Config_env config) {
		String xmlOutput = null; 
		boolean foundUrl = false,foundUser = false,foundPass = false,foundDriver = false,foundDialect = false;
		try {
			SAXReader reader = new SAXReader();
			reader.setFeature("http://xml.org/sax/features/external-general-entities", false);
			reader.setFeature("http://xml.org/sax/features/external-parameter-entities", false);

			Document doc = reader.read(new StringReader(xmlInput)); 

			Element root = doc.getRootElement();

			    // iterate through child elements of root
			    List<Element> i = root.elements("session-factory"); 
			   
			    	Element element = i.get(0);
			 
			    	   List<Element> listElemts = element.elements();
           for (Element property : listElemts) {
              String attrName = property.attributeValue("name");
              if (attrName != null) {
                 switch (attrName) {
                    case "hibernate.connection.url":
                       if (saveProps(config)) {
                          element.remove(property);
                          DefaultComment dElem = new DefaultComment(property, "hibernate.connection.driver_class,.url,.username,.password and .dialect now in " + config.getName() + "." + config.getApplication().getDad().toLowerCase() + ".properties");
                          element.content().add(2, dElem);
                       } else {
                          foundUrl = true;
                          property.setText(Core.decrypt(config.getUrl_connection(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB));
                       }
                       break;
                    case "hibernate.connection.username":
                       if (saveProps(config))
                          element.remove(property);
                       else {
                          foundUser = true;
                          property.setText(Core.decrypt(config.getUsername(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB));
                       }
                       break;
                    case "hibernate.connection.password":
                       if (saveProps(config))
                          element.remove(property);
                       else {
                          foundPass = true;
                          property.setText(Core.decrypt(config.getPassword(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB));
                       }
                       break;
                    case "hibernate.connection.driver_class":
                       if (saveProps(config))
                          element.remove(property);
                       else {
                          foundDriver = true;
                          property.setText(Core.decrypt(config.getDriver_connection(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB));
                       }
                       break;
                    case "hibernate.dialect":
                       if (saveProps(config))
                          element.remove(property);
                       else {
                          foundDialect = true;
                          property.setText(config.getName_db());
                       }
                       break;
                 }
              }
           }
			    	   if(!saveProps(config)) {
			    	   // In the case we don´t have this properties because they were deleted. Will add at the end
			    		   if(!foundDriver){
			    			   Element dElem = new DefaultElement("property").addAttribute("name","hibernate.connection.driver_class"); 
			    			   dElem.setText(Core.decrypt(config.getDriver_connection(),EncrypDecrypt.SECRET_KEY_ENCRYPT_DB));
			    			   element.content().add(1,dElem);
			    		   }
			    		   if(!foundDialect){
			    			   Element dElem = new DefaultElement("property").addAttribute("name", "hibernate.dialect");
			    			   dElem.setText(config.getName_db());
			    			   element.content().add(2,dElem);
			    			   
			    		   }
				    	   if(!foundUrl){
								Element dElem = new DefaultElement("property").addAttribute("name","hibernate.connection.url"); 
						   		dElem.addText(Core.decrypt(config.getUrl_connection(),EncrypDecrypt.SECRET_KEY_ENCRYPT_DB));
						   		element.content().add(3, dElem);
						   
						   }
							if(!foundUser){
								Element dElem = new DefaultElement("property").addAttribute("name","hibernate.connection.username"); 
						   		dElem.setText(Core.decrypt(config.getUsername(),EncrypDecrypt.SECRET_KEY_ENCRYPT_DB));
						   		element.content().add(4,dElem);
						   }
							if(!foundPass){
								Element dElem = new DefaultElement("property").addAttribute("name", "hibernate.connection.password");
						   		dElem.setText(Core.decrypt(config.getPassword(),EncrypDecrypt.SECRET_KEY_ENCRYPT_DB));
						   		element.content().add(5,dElem);
	    				  
						   }
			    	   }
			    	 
			    xmlOutput = doc.asXML().replace("</property><", "</property>\n\t\t<");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return xmlOutput;
	}
	
	private boolean saveFiles(String fileName,String content,String path) throws IOException {
		boolean flag = false;
		if(Core.isNotNull(content)) {
			flag = FileHelper.save(path, fileName, content);
		}
		return flag;
	}
	
	private boolean saveProps(Config_env config) {
		//Checks if it is null and if the switch check was saved with option 1 so it means save .propeties
		if(Core.isNotNullMultiple(config,config.getHost()))
			return config.getHost().equals("1");
		return true;
	}
	
	public Response actionChangeStatus() {
		this.format = Response.FORMAT_JSON;
        Integer id = Core.getParamInt("p_id");
        boolean response = false;
        
        if(id != null) {
        	Config_env config_env = new Config_env().find().andWhere("id", "=", id).one();
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
	
	public Response actionVer() {
		String path = new Config().getPathConexao() ;
		String fileName = Core.getParam("conn_name")+"."+Core.getParam("app_name") + ".cfg.xml"; 
		String cfgFileContent = SaveMapeamentoDAO.getHibernateConfig(path + fileName); 
		this.format = Response.FORMAT_TEXT;
        return this.renderView(cfgFileContent);
	}
	
	/*----#end-code----*/
}
