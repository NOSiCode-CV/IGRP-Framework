
package nosi.webapps.igrp.pages.pesquisabi;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import nosi.core.webapp.Response;
import nosi.core.webapp.webservices.biztalk.dao.PesquisaBI.RowList;
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
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionPesquisar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(PESQUISAR)----*/
		PesquisaBI model = new PesquisaBI();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
			nosi.core.webapp.webservices.biztalk.dao.PesquisaBI p = Core.getBizTalkPesquisaBI(new nosi.core.webapp.webservices.biztalk.dao.PesquisaBI(model.getBi(), model.getNome()));

			List<PesquisaBI.Table_1> data = new ArrayList<>();
			if(p!=null){
				System.out.println(p.getRowList());
				for(RowList row:p.getRowList()){
					PesquisaBI.Table_1 pbi = new PesquisaBI.Table_1();
					pbi.setBi_tabela(""+row.getNumero());
					pbi.setData_nascimento(row.getData_nascimento());
					pbi.setNome_mae(row.getNome_mae());
					pbi.setNome_pai(row.getNome_pai());
					pbi.setSexo(row.getSexo());
					data.add(pbi);
				}
			}
			PesquisaBIView view = new PesquisaBIView(model);
			view.table_1.addData(data);
			return this.renderView(view);
		}
		return this.redirect("igrp","PesquisaBI","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	/*----#END-PRESERVED-AREA----*/
}
