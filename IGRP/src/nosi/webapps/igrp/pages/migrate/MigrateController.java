/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.migrate;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;

import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.IgrpHelper;
import nosi.webapps.igrp.dao.Application;
import nosi.core.igrp.mingrations.MigrationIGRP;
import java.util.HashMap;
import java.util.Map;
import nosi.core.webapp.Igrp;
/*---- End ----*/

public class MigrateController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/						
		Migrate model = new Migrate();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
		}
		MigrateView view = new MigrateView(model);
		tipos.put(null, "-- Selecione Base de Dados --");
		tipos.put("mysql", "MySql");
		tipos.put("postgresql", "Postgresql");
		tipos.put("h2", "H2");
		tipos.put("oracle", "Oracle");
		view.tipo_base_dados.setValue(tipos);
		view.aplicacao.setValue(IgrpHelper.toMap(new Application().findAll(), "id", "name","-- Selecionar Aplicação --"));
		return this.renderView(view);
					/*---- End ----*/
	}


	public Response actionMigrar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/						
		Migrate model = new Migrate();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
			if(model.getAplicacao().equals("1")){
				if(MigrationIGRP.validate(model)){
					MigrationIGRP.start(model);
					Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, "Migração Efetuada com sucesso");
				}else{
					Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Conexão inválido");
					return this.forward("igrp","Migrate","index");
				}
			}
		}
		return this.redirect("igrp","Migrate","index");
					/*---- End ----*/
	}
	
	public Response actionTestar_conexao() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/
		Migrate model = new Migrate();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
			if(MigrationIGRP.validate(model)){
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, "Conexão válido");
			}else{
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Conexão inválido");
			}
		}
		return this.forward("igrp","Migrate","index");
		/*---- End ----*/
	}
	/*---- Insert your actions here... ----*/
	private static Map<String,String> tipos = new HashMap<>();
	/*---- End ----*/
}
