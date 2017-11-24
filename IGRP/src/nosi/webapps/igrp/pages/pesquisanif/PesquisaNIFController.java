
package nosi.webapps.igrp.pages.pesquisanif;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
import nosi.core.webapp.webservices.biztalk.dao.PesquisaNIF.RowList;
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
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionPesquisar()  throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(PESQUISAR)----*/
		PesquisaNIF model = new PesquisaNIF();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
			nosi.core.webapp.webservices.biztalk.dao.PesquisaNIF p = Core.getBizTalkPesquisaNIF(new nosi.core.webapp.webservices.biztalk.dao.PesquisaNIF(model.getNif(), model.getNome()));

			List<PesquisaNIF.Table_1> data = new ArrayList<>();
			if(p!=null){
				System.out.println(p.getRowList());
				for(RowList row:p.getRowList()){
					PesquisaNIF.Table_1 pbi = new PesquisaNIF.Table_1();
//					pbi.setData_nascimento(row.get);
					data.add(pbi);
				}
				PesquisaNIFView view = new PesquisaNIFView(model);
				return this.renderView(view);
			}
		}
		return this.redirect("igrp","PesquisaNIF","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	/*----#END-PRESERVED-AREA----*/
}
