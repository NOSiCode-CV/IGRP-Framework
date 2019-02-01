package nosi.webapps.igrp.pages.pesquisanif;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import java.util.ArrayList;
import java.util.List;
import nosi.core.webapp.webservices.biztalk.dao.PesquisaNIF.RowList;
import nosi.core.webapp.Igrp;

/*----#end-code----*/
		
public class PesquisaNIFController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisaNIF model = new PesquisaNIF();
		model.load();
		PesquisaNIFView view = new PesquisaNIFView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT 'Anim rem dolor rem stract' as nif_tabela,'Stract doloremque sit labore p' as nome_tabela,'Perspiciatis rem dolor stract' as desig_social,'Laudantium sit amet perspiciat' as data_nascimento,'Lorem iste ipsum dolor elit' as nome_pai,'Officia stract dolor totam off' as nome_mae,'Voluptatem doloremque ipsum na' as documento "));
		view.tipo_contribuinte.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
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
		PesquisaNIF model = new PesquisaNIF();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","Resetbyemail","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(pesquisar)----*/
		
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
			nosi.core.webapp.webservices.biztalk.dao.PesquisaNIF p = Core.getBizTalkPesquisaNIF(new nosi.core.webapp.webservices.biztalk.dao.PesquisaNIF(model.getNif(), model.getNome()));

			List<PesquisaNIF.Table_1> data = new ArrayList<>();
			if(p!=null){
				for(RowList row:p.getRowList()){
					PesquisaNIF.Table_1 pbi = new PesquisaNIF.Table_1();
					pbi.setData_nascimento(row.getNm_contribuinte());
					data.add(pbi);
				}
				PesquisaNIFView view = new PesquisaNIFView();
				return this.renderView(view);
			}
		}
		
		/*----#end-code----*/
		return this.redirect("igrp","Resetbyemail","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/
	
	/*----#end-code----*/
}
