
package nosi.webapps.igrp.pages.configdatabase;

import nosi.core.webapp.Controller;
import nosi.core.config.Config;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import static nosi.core.i18n.Translator.gt;
import nosi.core.igrp.mingrations.MigrationIGRP;
import nosi.core.webapp.helpers.FileHelper;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Config_env;
import nosi.webapps.igrp.pages.migrate.Migrate;
import nosi.core.webapp.Igrp;
import java.util.ArrayList;
import java.util.List;
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
		model.loadTable_1(Core.query(null,"SELECT 'nome_de_conexao_tabela' as nome_de_conexao_tabela,'hostname_tabela' as hostname_tabela,'porta_tabela' as porta_tabela,'nome_base_de_dados_tabela' as nome_base_de_dados_tabela,'user_name_tabela' as user_name_tabela,'tipo_de_base_de_dados_tabela' as tipo_de_base_de_dados_tabela,'hidden' as hidden "));
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
			tabela.setHostname_tabela(Core.decrypt(lista.getHost(), Config.SECRET_KEY_ENCRYPT_DB));
			tabela.setNome_base_de_dados_tabela(Core.decrypt(lista.getName_db(), Config.SECRET_KEY_ENCRYPT_DB));
			tabela.setNome_de_conexao_tabela(lista.getName());
			tabela.setPorta_tabela(Integer.parseInt(Core.decrypt(lista.getPort(), Config.SECRET_KEY_ENCRYPT_DB)));
			tabela.setTipo_de_base_de_dados_tabela(Core.decrypt(lista.getType_db(), Config.SECRET_KEY_ENCRYPT_DB));
			tabela.setUser_name_tabela(Core.decrypt(lista.getUsername(), Config.SECRET_KEY_ENCRYPT_DB));
			lista_tabela.add(tabela);
		}			
		
		if (Core.isInt(model.getAplicacao()) ) {
			switch (model.getTipo_base_dados()) {
			case "mysql":
				model.setPort(3306);
				break;
			case "postgresql":
				model.setPort(5432);
				break;
			case "oracle":
				model.setPort(1521);
				break;
			case "mssql":
				model.setPort(1433);
				break;
			default:
				model.setPort(0);
				break;
			}
			view.setModel(model);
			view.aplicacao.setQuery(
					Core.query(Config.getBaseConnection(),"SELECT id as ID, name as NAME FROM tbl_env WHERE id=" + Core.toInt(model.getAplicacao())));
          
			view.tipo_base_dados.setValue(Config.getDatabaseTypes());
			view.table_1.addData(lista_tabela);
		}
		if(Core.isNotNull(model.getTipo_base_dados())) {
			Integer idApp = Core.toInt(model.getAplicacao());
			Application app = new Application().findOne(idApp);
			List<Config_env> list = new Config_env()
										.find()
										.andWhere("application", "=",idApp)
										.andWhere("type_db", "=",Core.encrypt(model.getTipo_base_dados(),Config.SECRET_KEY_ENCRYPT_DB) )
										.all();
			int size = list!=null?(list.size()+1):1;
			model.setNome_de_conexao(app.getDad().toLowerCase()+"_"+Config.getDatabaseTypesSiglas(model.getTipo_base_dados())+"_"+size);
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
			config.setHost(Core.encrypt(model.getHostname(),Config.SECRET_KEY_ENCRYPT_DB));
			config.setName_db(Core.encrypt(model.getNome_de_bade_dados(),Config.SECRET_KEY_ENCRYPT_DB));
			config.setUsername(Core.encrypt(model.getUsername(),Config.SECRET_KEY_ENCRYPT_DB));
			config.setPassword(Core.encrypt(model.getPassword(),Config.SECRET_KEY_ENCRYPT_DB));
			config.setPort(Core.encrypt("" + model.getPort(),Config.SECRET_KEY_ENCRYPT_DB));
			config.setType_db(Core.encrypt(model.getTipo_base_dados(),Config.SECRET_KEY_ENCRYPT_DB));
			config.setName(model.getNome_de_conexao());
			Migrate m = new Migrate();
			m.load();
			if (!MigrationIGRP.validate(m)) {
				Core.setMessageError(gt("Falha na conexão com a base de dados"));
				return this.forward("igrp", "ConfigDatabase", "index&id=" + model.getAplicacao());
			}
			boolean check = new Config_env().find().andWhere("name", "=", config.getName()).one() == null;
			if (check) {
				config = config.insert();
				if (config != null) {
					this.saveConfigHibernateFile(config);
					Core.setMessageSuccess();
                    Core.setMessageInfo(gt("Nome da conexão: ") + config.getName());
					return this.forward("igrp", "ConfigDatabase", "index&id=" + model.getAplicacao());
				}
			} else {
              Core.setMessageWarning(gt("Nome da conexão já existe"));
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
		String pathWS = this.getConfig().getPathConfigDB();
		String pathServer = this.getConfig().getBasePathClass();
		FileHelper.save(pathServer, config.getName() + ".cfg.xml", content);
		if (FileHelper.fileExists(pathWS)) {
			FileHelper.save(pathWS, config.getName() + ".cfg.xml", content);
		}
	}
	/*----#end-code----*/
	}
