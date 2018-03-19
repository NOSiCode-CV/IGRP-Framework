
package nosi.webapps.igrp.pages.configdatabase;

import nosi.core.webapp.Controller;
import java.io.IOException;
import java.util.ArrayList;

import nosi.core.webapp.Core;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Response;
import nosi.core.webapp.databse.helpers.QueryHelper;

/*----#start-code(packages_import)----*/
import nosi.core.webapp.FlashMessage;
import nosi.core.config.Config;
import nosi.core.igrp.mingrations.MigrationIGRP;
import nosi.core.webapp.helpers.FileHelper;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Config_env;
import nosi.webapps.igrp.pages.migrate.Migrate;
import nosi.core.webapp.Igrp;
/*----#end-code----*/



public class ConfigDatabaseController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		ConfigDatabase model = new ConfigDatabase();
		ConfigDatabaseView view = new ConfigDatabaseView();
		model.load();
		
		/*----#gen-example
		This is an example of how you can implement your code:
		
		view.table_1.setSqlQuery(null,"SELECT 'tipo_de_base_de_dados_tabela' tipo_de_base_de_dados_tabela, 'nome_de_conexao_tabela' nome_de_conexao_tabela, 'hostname_tabela' hostname_tabela, 'porta_tabela' porta_tabela, 'user_name_tabela' user_name_tabela, 'nome_base_de_dados_tabela' nome_base_de_dados_tabela");
		view.aplicacao.setSqlQuery(null,"SELECT 'id' as ID,'name' as NAME ");
		view.tipo_base_dados.setSqlQuery(null,"SELECT 'id' as ID,'name' as NAME ");
		
		----#gen-example */
		
		/*----#start-code(index)----*/
		String id_app = model.getAplicacao();
			java.util.List<Config_env> list_app = new Config_env().find().andWhere("application", "=", Integer.parseInt(Core.isNotNull(id_app)?id_app:"0")).all();
			ArrayList<ConfigDatabase.Table_1> lista_tabela = new ArrayList<>();
			for(Config_env lista : list_app) {
				ConfigDatabase.Table_1 tabela = new ConfigDatabase.Table_1();
				tabela.setHostname_tabela(Core.decrypt(lista.getHost(), Config.SECRET_KEY_ENCRYPT_DB));
				tabela.setNome_base_de_dados_tabela(Core.decrypt(lista.getName_db(), Config.SECRET_KEY_ENCRYPT_DB));
				tabela.setNome_de_conexao_tabela(lista.getName());
				tabela.setPorta_tabela(Core.decrypt(lista.getPort(), Config.SECRET_KEY_ENCRYPT_DB));
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
			default:
				model.setPort(0);
				break;
			}
			view.setModel(model);
			view.aplicacao.setSqlQuery(
					"SELECT id as ID, name as NAME FROM tbl_env WHERE id=" + Integer.parseInt(model.getAplicacao()));
			view.tipo_base_dados.setValue(Config.getDatabaseTypes());
			view.table_1.addData(lista_tabela);
			return this.renderView(view);
		}
		//return this.redirect("igrp", "error-page", "exception");
		/*----#end-code----*/
		
		
		
		
		return this.renderView(view);
		
	}

	public Response actionTestar_conexao() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		/*----#gen-example
		This is an example of how you can implement your code:
		
		if(model.save(model)){
			Core.setMessageSuccess();
		 }else{
			Core.setMessageError();
		 return this.forward("igrp","ConfigDatabase","index");
		}
		
		----#gen-example */
		
		/*----#start-code(testar_conexao)----*/
		Migrate model = new Migrate();
		if (Igrp.getMethod().equalsIgnoreCase("post")) {
			model.load();
			if (MigrationIGRP.validate(model)) {
				Core.setMessageSuccess(gt("Conetado com sucesso"));
			
			} else {
				Core.setMessageError(gt("Falha na conexão com a base de dados"));
			}
		}
		return this.forward("igrp", "ConfigDatabase", "index&id=" + model.getAplicacao());
		/*----#end-code----*/
		
		//return this.redirect("igrp","ConfigDatabase","index");
		
	}
	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		/*----#gen-example
		This is an example of how you can implement your code:
		
		if(model.save(model)){
			Core.setMessageSuccess();
		 }else{
			Core.setMessageError();
		 return this.forward("igrp","ConfigDatabase","index");
		}
		
		----#gen-example */
		
		/*----#start-code(gravar)----*/
		ConfigDatabase model = new ConfigDatabase();
		if (Igrp.getMethod().equalsIgnoreCase("post")) {
			model.load();
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
					Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, FlashMessage.MESSAGE_SUCCESS);
					Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.INFO,
							gt("Nome da conexão: ") + config.getName());
					return this.forward("igrp", "ConfigDatabase", "index&id=" + model.getAplicacao());
				}
			} else {
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.WARNING, gt("Nome da conexão já existe"));
				return this.forward("igrp", "ConfigDatabase", "index&id=" + model.getAplicacao());
			}
		}
		
		/*----#end-code----*/
		
		return this.redirect("igrp","ConfigDatabase","index");
		
	}
	
	/*----#start-code(custom_actions)----*/
	private void saveConfigHibernateFile(Config_env config) throws IOException {
		String package_ = "nosi.webapps." + config.getApplication().getDad().toLowerCase() + ".dao";
		String content = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
				+ "<!DOCTYPE hibernate-configuration SYSTEM \"http://www.hibernate.org/dtd/hibernate-configuration\">\n"
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
