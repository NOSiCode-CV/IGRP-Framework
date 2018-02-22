
package nosi.webapps.igrp.pages.configdatabase;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.FlashMessage;
import nosi.core.config.Config;
import nosi.core.igrp.mingrations.MigrationIGRP;
import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.FileHelper;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Config_env;
import nosi.webapps.igrp.pages.migrate.Migrate;
import nosi.core.webapp.Igrp;
import static nosi.core.i18n.Translator.gt;
/*----#END-PRESERVED-AREA----*/

public class ConfigDatabaseController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/

		ConfigDatabase model = new ConfigDatabase();

		model.load(); 
		
		System.out.println(model);

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
			ConfigDatabaseView view = new ConfigDatabaseView(model);
			view.aplicacao.setSqlQuery(
					"SELECT id as ID, name as NAME FROM tbl_env WHERE id=" + Integer.parseInt(model.getAplicacao()));
			view.tipo_base_dados.setValue(Config.getDatabaseTypes());
			return this.renderView(view);
		}
		return this.redirect("igrp", "error-page", "exception");
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionTestar_conexao() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(TESTAR_CONEXAO)----*/
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
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(GRAVAR)----*/
		ConfigDatabase model = new ConfigDatabase();
		if (Igrp.getMethod().equalsIgnoreCase("post")) {
			model.load();
			Config_env config = new Config_env();
			config.setApplication(new Application().findOne(Integer.parseInt(model.getAplicacao())));
			config.setCharset("utf-8");
			config.setHost(Core.encrypt(model.getHostname()));
			config.setName_db(Core.encrypt(model.getNome_de_bade_dados()));
			config.setUsername(Core.encrypt(model.getUsername()));
			config.setPassword(Core.encrypt(model.getPassword()));
			config.setPort(Core.encrypt("" + model.getPort()));
			config.setType_db(Core.encrypt(model.getTipo_base_dados()));
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
		return this.redirect("igrp", "ConfigDatabase", "index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	private void saveConfigHibernateFile(Config_env config) throws IOException {
		String package_ = "nosi.webapps." + config.getApplication().getDad().toLowerCase() + ".dao";
		String content = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
				+ "<!DOCTYPE hibernate-configuration SYSTEM \"http://www.hibernate.org/dtd/hibernate-configuration\">\n"
				+ "<hibernate-configuration>\n" + "		<session-factory>\n"
				+ "				<!-- Mapping your class here... \n" + "					Ex: <mapping class=\""
				+ package_ + ".Employee\"/>\n" + "				-->\n" + "		</session-factory>\n"
				+ "</hibernate-configuration>";
		String pathWS = Config.getWorkspace() + "/src";
		String pathServer = Config.getBasePathClass();
		FileHelper.save(pathServer, config.getName() + ".cfg.xml", content);
		if (FileHelper.fileExists(pathWS)) {
			FileHelper.save(pathWS, config.getName() + ".cfg.xml", content);
		}
	}
	/*----#END-PRESERVED-AREA----*/
}
