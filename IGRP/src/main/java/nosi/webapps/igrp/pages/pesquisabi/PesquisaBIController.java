package nosi.webapps.igrp.pages.pesquisabi;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import java.util.ArrayList;
import java.util.List;
//import nosi.core.webapp.webservices.biztalk.dao.PesquisaBI.RowList;
import nosi.core.webapp.Igrp;

/*----#end-code----*/
		
public class PesquisaBIController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisaBI model = new PesquisaBI();
		model.load();
		PesquisaBIView view = new PesquisaBIView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT 'Laudantium doloremque aperiam' as bi_tabela,'Accusantium unde sit aperiam m' as nome_tabela,'Sed elit officia sit aperiam' as data_nascimento,'Adipiscing amet sit sed deseru' as sexo,'Natus mollit adipiscing ipsum' as nome_pai,'Aliqua rem sit mollit sed' as nome_mae "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
		}
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionPesquisar() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisaBI model = new PesquisaBI();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","PesquisaBI","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(pesquisar)----*/
		
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
//			List<PesquisaBI.Table_1> data = new ArrayList<>();
//			if(model.getBi() != 0 && Core.isNotNull(model.getNome())) {
//			nosi.core.webapp.webservices.biztalk.dao.PesquisaBI p = Core.getBizTalkPesquisaBI(new nosi.core.webapp.webservices.biztalk.dao.PesquisaBI(model.getBi(), model.getNome()));
//				if(p!=null){	
//					for(RowList row:p.getRowList()){
//						PesquisaBI.Table_1 pbi = new PesquisaBI.Table_1();
//						pbi.setBi_tabela(""+row.getNumero());
//						pbi.setData_nascimento(row.getData_nascimento());
//						pbi.setNome_mae(row.getNome_mae());
//						pbi.setNome_pai(row.getNome_pai());
//						pbi.setSexo(row.getSexo());
//						data.add(pbi);
//					}
//				}
//			}else {
//				Core.setMessageInfo(" Prenche todos os campos "); 
//				forward("igrp","PesquisaBI","index");
//			}
//			PesquisaBIView view = new PesquisaBIView();
//			view.table_1.addData(data);
//		
		}
		
		/*----#end-code----*/
		return this.redirect("igrp","PesquisaBI","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/
	
	/*----#end-code----*/
}
