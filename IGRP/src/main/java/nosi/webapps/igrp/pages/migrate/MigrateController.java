/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.migrate;

/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.IgrpHelper;
import nosi.webapps.igrp.dao.Application;
import nosi.core.igrp.mingrations.MigrationIGRP;
import nosi.core.webapp.Igrp;
import static nosi.core.i18n.Translator.gt;
/*----#END-PRESERVED-AREA----*/

public class MigrateController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/						
		Migrate model = new Migrate();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
		}
		MigrateView view = new MigrateView(model);
		
		view.tipo_base_dados.setValue(this.config.getDatabaseTypes());
		view.aplicacao.setValue(IgrpHelper.toMap(new Application().findAll(), "id", "name",gt("-- Selecionar --")));
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionMigrar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(MIGRAR)----*/						
		Migrate model = new Migrate();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
			if(model.getAplicacao().equals("1")){
				if(MigrationIGRP.validate(model)){
					MigrationIGRP.start(model);
					Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, gt("Migração efetuada com sucesso"));
				}else{
					Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt("Falha na conexão com a base de dados"));
					return this.forward("igrp","Migrate","index");
				}
			}
		}
		return this.redirect("igrp","Migrate","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	public Response actionTestar_conexao() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(TESTAR_CONEXAO)----*/
		Migrate model = new Migrate();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
			if(MigrationIGRP.validate(model)){
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, gt("Conectado com sucesso"));
			}else{
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt("Falha na conexão com a base de dados"));
			}
		}
		return this.forward("igrp","Migrate","index");
		/*----#END-PRESERVED-AREA----*/
	}
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	/*----#END-PRESERVED-AREA----*/
}
