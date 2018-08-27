package nosi.webapps.igrp.pages.configdatabase;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.core.webapp.databse.helpers.DatabaseConfigHelper;
import nosi.core.webapp.helpers.FileHelper;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Config_env;
import nosi.webapps.igrp.pages.migrate.Migrate;
import nosi.core.webapp.Igrp;
import java.util.ArrayList;
import java.util.List;
import nosi.core.config.Config;
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
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		model.loadTable_1(Core.query(null,"SELECT 'nome_de_conexao_tabela' as nome_de_conexao_tabela,'user_name_tabela' as user_name_tabela,'tipo_de_base_de_dados_tabela' as tipo_de_base_de_dados_tabela,'t_url_connection' as t_url_connection,'t_driver_connection' as t_driver_connection,'id' as id "));
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.tipo_base_dados.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		String id_app = model.getAplicacao();
		java.util.List<Config_env> list_app = new Config_env().find().andWhere("application", "=",Core.toInt(id_app)).all();
		ArrayList<ConfigDatabase.Table_1> lista_tabela = new ArrayList<>();
		for(Config_env lista : list_app) {
			ConfigDatabase.Table_1 tabela = new ConfigDatabase.Table_1();
          	tabela.setId(""+lista.getId());
          	tabela.setTipo_de_base_de_dados_tabela(Core.decrypt(lista.getType_db(), Config.SECRET_KEY_ENCRYPT_DB));
			tabela.setNome_de_conexao_tabela(lista.getName());
			tabela.setT_url_connection(
				Core.isNotNull(lista.getUrl_connection())
				?
					Core.decrypt(lista.getUrl_connection(), Config.SECRET_KEY_ENCRYPT_DB)
				:
					DatabaseConfigHelper.getUrl(
						tabela.getTipo_de_base_de_dados_tabela(), 
						Core.decrypt(lista.getHost(), Config.SECRET_KEY_ENCRYPT_DB), 
						Core.decrypt(lista.getPort(),Config.SECRET_KEY_ENCRYPT_DB), 
						Core.decrypt(lista.getName_db(), Config.SECRET_KEY_ENCRYPT_DB)
					)
			);
			tabela.setT_driver_connection(Core.isNotNull(lista.getDriver_connection())?Core.decrypt(lista.getDriver_connection(), Config.SECRET_KEY_ENCRYPT_DB):DatabaseConfigHelper.getDatabaseDriversExamples(tabela.getTipo_de_base_de_dados_tabela()));
			tabela.setUser_name_tabela(Core.decrypt(lista.getUsername(), Config.SECRET_KEY_ENCRYPT_DB));
			lista_tabela.add(tabela);
		}	
		if (Core.isInt(model.getAplicacao()) ) {
			view.aplicacao.setQuery(Core.query(Config.getBaseConnection(),"SELECT id as ID, name as NAME FROM tbl_env WHERE id=" + Core.toInt(model.getAplicacao())));		 	
			view.tipo_base_dados.setValue(DatabaseConfigHelper.getDatabaseTypes());
			view.table_1.addData(lista_tabela);			
			if(Core.isNotNull(model.getTipo_base_dados())) {
				model.setUrl_connection(DatabaseConfigHelper.getUrlConnections(model.getTipo_base_dados()));
				model.setDriver_connection(DatabaseConfigHelper.getDatabaseDriversExamples(model.getTipo_base_dados()));
				Integer idApp = Core.toInt(model.getAplicacao());
				Application app = new Application().findOne(idApp);
				List<Config_env> list = new Config_env()
											.find()
											.andWhere("application", "=",idApp)
											.andWhere("type_db", "=",Core.encrypt(model.getTipo_base_dados(),Config.SECRET_KEY_ENCRYPT_DB) )
											.all();
				int size = list!=null?(list.size()+1):1;
				model.setNome_de_conexao(app.getDad().toLowerCase()+"_"+model.getTipo_base_dados()+"_"+size);
				model.setParagraph_1("  Ex: "+ DatabaseConfigHelper.getUrlConnectionsExamples(model.getTipo_base_dados(),new Application().findOne(model.getAplicacao()).getDad()));
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
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","ConfigDatabase","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(gravar)----*/
		
      if (Igrp.getMethod().equalsIgnoreCase("post")) {		
			Config_env config = new Config_env();
			config.setApplication(new Application().findOne(Integer.parseInt(model.getAplicacao())));
			config.setCharset("utf-8");
			config.setUsername(Core.encrypt(model.getUsername(),Config.SECRET_KEY_ENCRYPT_DB));
			config.setPassword(Core.encrypt(model.getPassword(),Config.SECRET_KEY_ENCRYPT_DB));
			config.setType_db(Core.encrypt(model.getTipo_base_dados(),Config.SECRET_KEY_ENCRYPT_DB));
			config.setUrl_connection(Core.encrypt(model.getUrl_connection(),Config.SECRET_KEY_ENCRYPT_DB));
			config.setDriver_connection(Core.encrypt(model.getDriver_connection(),Config.SECRET_KEY_ENCRYPT_DB));
			config.setName(model.getNome_de_conexao());
			Migrate m = new Migrate();
			m.load();
			if (!(new MigrationIGRP().validate(m)) || config.getName().equalsIgnoreCase(Config.getBaseConnection())) {
				Core.setMessageError(gt("Falha na conexão com a base de dados"));
				return this.forward("igrp", "ConfigDatabase", "index&id=" + model.getAplicacao());
			}
			boolean check = new Config_env().find()
											.andWhere("name", "=", config.getName())
											.andWhere("application", "=",Integer.parseInt(model.getAplicacao()))
											.one() == null;
			if (check && !config.getName().equalsIgnoreCase(Config.getBaseConnection()) && !config.getName().equalsIgnoreCase(Config.getH2IGRPBaseConnection())) {
				config = config.insert();
				if (config != null) {
					this.saveConfigHibernateFile(config);
					Core.setMessageSuccess();
                    Core.setMessageInfo(gt("Nome da conexão: ") + config.getName());
					return this.forward("igrp", "ConfigDatabase", "index&id=" + model.getAplicacao());
				}
			} else {
              Core.setMessageWarning(gt("Nome da conexão inválido"));
				return this.forward("igrp", "ConfigDatabase", "index&id=" + model.getAplicacao());
			}
		}
		
		/*----#end-code----*/
		return this.redirect("igrp","ConfigDatabase","index", this.queryString());	
	}
	
	public Response actionDelete() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		ConfigDatabase model = new ConfigDatabase();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","ConfigDatabase","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(delete)----*/
		if (new Config_env().delete(Core.getParamInt("p_id"))) {
				Core.setMessageSuccess();
			}else
				Core.setMessageError();
      this.addQueryString("p_aplicacao",Core.getParam("p_aplicacao")); 
      return this.redirect("igrp", "ConfigDatabase", "index", this.queryString());
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
	/*----#end-code----*/
	}
