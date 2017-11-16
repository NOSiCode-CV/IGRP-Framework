
package nosi.webapps.igrp.pages.pesquisanif;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
import nosi.core.webapp.Igrp;

/*----#END-PRESERVED-AREA----*/

public class PesquisaNIFController extends Controller {		


	public Response actionIndex()  throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		PesquisaNIF model = new PesquisaNIF();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
		}
		PesquisaNIFView view = new PesquisaNIFView(model);
		//view.table_1.setSqlQuery("SELECT 'nif_tabela' nif_tabela, 'nome_tabela' nome_tabela, 'desig_social' desig_social, 'data_nascimento' data_nascimento, 'nome_pai' nome_pai, 'nome_mae' nome_mae, 'documento' documento FROM dual");
		//view.tipo_contribuinte.setSqlQuery("SELECT id as ID, name as NAME FROM tbl_domain WHERE code = 'SIM_NAO'");
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionPesquisar()  throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(PESQUISAR)----*/
		PesquisaNIF model = new PesquisaNIF();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
			/*if(/* Your code condition *//*){
			 Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, FlashMessage.MESSAGE_SUCCESS);
			 }else{
			 Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, FlashMessage.MESSAGE_ERROR);
			 return this.forward("igrp","PesquisaNIF","index");
			}*/
		}
		return this.redirect("igrp","PesquisaNIF","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*//*----#END-PRESERVED-AREA----*/
}
