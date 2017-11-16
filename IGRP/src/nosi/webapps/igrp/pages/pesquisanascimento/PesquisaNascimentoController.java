
package nosi.webapps.igrp.pages.pesquisanascimento;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import nosi.core.webapp.Response;
import nosi.core.webapp.webservices.biztalk.dao.PesquisaNascimento.RowList;
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
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionPesquisar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(PESQUISAR)----*/
		PesquisaNascimento model = new PesquisaNascimento();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
			nosi.core.webapp.webservices.biztalk.dao.PesquisaNascimento p = Core.getBizTalkPesquisaNascimento(new nosi.core.webapp.webservices.biztalk.dao.PesquisaNascimento(model.getNome(), (model.getN_registo()!=null && !model.getN_registo().equals(""))?Integer.parseInt(model.getN_registo()):null, null));

			List<PesquisaNascimento.Table_1> data = new ArrayList<>();
			if(p!=null){
				System.out.println(p.getRowList());
				for(RowList row:p.getRowList()){
					PesquisaNascimento.Table_1 pbi = new PesquisaNascimento.Table_1();
					pbi.setData_facto(row.getData_nascimento());
					pbi.setN_registo_tabela(""+row.getNumero());
					pbi.setNome_mae(row.getMae_nome());
					pbi.setNome_pai(row.getNome_pai());
					pbi.setNome_tabela(row.getIdentificacao());
					data.add(pbi);
				}
			}
			PesquisaNascimentoView view = new PesquisaNascimentoView(model);
			view.table_1.addData(data);
			return this.renderView(view);
		}
		return this.redirect("igrp","PesquisaNascimento","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*//*----#END-PRESERVED-AREA----*/
}
