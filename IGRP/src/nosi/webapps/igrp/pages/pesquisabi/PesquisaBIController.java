
package nosi.webapps.igrp.pages.pesquisabi;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.core.webapp.Igrp;

/*----#END-PRESERVED-AREA----*/

public class PesquisaBIController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		PesquisaBI model = new PesquisaBI();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
		}
		PesquisaBIView view = new PesquisaBIView(model);
		//view.table_1.setSqlQuery("SELECT 'bi_tabela' bi_tabela, 'nome_tabela' nome_tabela, 'data_nascimento' data_nascimento, 'sexo' sexo, 'nome_pai' nome_pai, 'nome_mae' nome_mae FROM dual");
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionPesquisar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(PESQUISAR)----*/
		PesquisaBI model = new PesquisaBI();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
			/*if(/* Your code condition *//*){
			 Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, FlashMessage.MESSAGE_SUCCESS);
			 }else{
			 Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, FlashMessage.MESSAGE_ERROR);
			 return this.forward("igrp","PesquisaBI","index");
			}*/
		}
		return this.redirect("igrp","PesquisaBI","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*//*----#END-PRESERVED-AREA----*/
}
