/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.import_export;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.ImportExportDAO;

import static nosi.core.i18n.Translator.gt;

/*---- End ----*/

public class Import_exportController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/				
		Import_export model = new Import_export();
		
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")) {
			model.load(); 
		}
		
		
		
		ArrayList<Import_export.Table_1> lista = new ArrayList<>();
		ImportExportDAO ie_dao = new ImportExportDAO();
		List<ImportExportDAO> ie_list = ie_dao.find()
												.andWhere("aplicacao", "=", model.getAplicacao())
												.andWhere("tipo", "like", model.getTipo())
												.all();
		for(ImportExportDAO ie: ie_list) {
			Import_export.Table_1 tabela = new Import_export.Table_1();
			tabela.setAplicacao_tabela(ie.getAplicacao());
			tabela.setUtilizador(ie.getUsuario());
			tabela.setData(ie.getData());
			tabela.setTipo_tabela(ie.getTipo());
			lista.add(tabela); 
		}
		Import_exportView view = new Import_exportView(model);
		HashMap<String, String> tipo = new HashMap<>();
		tipo.put(null, gt("-- Escolha o tipo --"));
		tipo.put("export", "Export");
		tipo.put("import", "Import");
		view.tipo.setValue(tipo);
		view.aplicacao.setValue(new ImportExportDAO().getList());
		view.table_1.addData(lista);
		return this.renderView(view);
				/*---- End ----*/
	}


	public Response actionPesquisar() throws IOException{
		/*---- Insert your code here... ----*/				
		
		return this.redirect("igrp","Import_export","index");
				/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
