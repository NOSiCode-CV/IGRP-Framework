
package nosi.webapps.igrp.pages.pesquisanascimento;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.core.webapp.Igrp;

/*----#END-PRESERVED-AREA----*/

public class PesquisaNascimentoController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		PesquisaNascimento model = new PesquisaNascimento();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
		}
		PesquisaNascimentoView view = new PesquisaNascimentoView(model);
		//view.table_1.setSqlQuery("SELECT 'n_registo_tabela' n_registo_tabela, 'nome_tabela' nome_tabela, 'data_facto' data_facto, 'nome_mae' nome_mae, 'nome_pai' nome_pai FROM dual");
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionPesquisar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(PESQUISAR)----*/
		PesquisaNascimento model = new PesquisaNascimento();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
			/*if(/* Your code condition *//*){
			 Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, FlashMessage.MESSAGE_SUCCESS);
			 }else{
			 Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, FlashMessage.MESSAGE_ERROR);
			 return this.forward("igrp","PesquisaNascimento","index");
			}*/
		}
		return this.redirect("igrp","PesquisaNascimento","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*//*----#END-PRESERVED-AREA----*/
}
