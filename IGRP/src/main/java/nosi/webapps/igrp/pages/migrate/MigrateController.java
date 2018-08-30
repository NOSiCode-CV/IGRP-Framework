package nosi.webapps.igrp.pages.migrate;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.core.igrp.mingrations.MigrationIGRP;
import nosi.core.webapp.databse.helpers.DatabaseConfigHelper;
/*----#end-code----*/

public class MigrateController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Migrate model = new Migrate();
		model.load();
		MigrateView view = new MigrateView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.tipo_base_dados.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/						
		if (Core.isInt(model.getAplicacao()) ) {
			if(model.getAplicacao().compareTo("1")==0) {
				model.setNome_de_conexao(this.configApp.getBaseConnection());
				view.nome_de_conexao.propertie().add("disabled","true");
			}
			view.tipo_base_dados.setValue(DatabaseConfigHelper.getDatabaseTypes());		
			if(Core.isNotNull(model.getTipo_base_dados())) {
				model.setUrl_connection(DatabaseConfigHelper.getUrlConnections(model.getTipo_base_dados()));
				model.setDriver_connection(DatabaseConfigHelper.getDatabaseDriversExamples(model.getTipo_base_dados()));
			}
		}
		view.tipo_base_dados.setValue(DatabaseConfigHelper.getDatabaseTypes());
		view.aplicacao.setQuery(Core.query(this.configApp.getBaseConnection(),"SELECT id as ID, name as NAME FROM tbl_env WHERE id=:id").addInt("id", 1));
		
		//return this.renderView(view);
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionMigrar() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Migrate model = new Migrate();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","PesquisaNIF","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(migrar)----*/		
		if(model.getAplicacao().equals("1")){
			model.setNome_de_conexao(this.configApp.getBaseConnection());
			MigrationIGRP migrate = new MigrationIGRP();
			if(migrate.validate(model)){
				migrate.start(model);
				Core.setMessageSuccess("Migração efetuada com sucesso");
			}else{
				Core.setMessageError("Falha na conexão com a base de dados");
				return this.forward("igrp","Migrate","index");
			}
		}
		//return this.redirect("igrp","Migrate","index");
		/*----#end-code----*/
		return this.redirect("igrp","Migrate","index", this.queryString());	
	}
	
	/*----#start-code(custom_actions)----*/
	
	/*----#end-code----*/
	}
