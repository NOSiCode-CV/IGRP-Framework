package nosi.webapps.app_teste.pages.listar_exames;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/

import java.util.ArrayList;
import java.util.List;
import nosi.webapps.app_teste.dao.Exame;
import nosi.webapps.app_teste.dao.User;
import nosi.webapps.igrp.dao.CLob;
/*----#end-code----*/
		
public class Listar_examesController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Listar_exames model = new Listar_exames();
		model.load();
		Listar_examesView view = new Listar_examesView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT 'Officia perspiciatis omnis ape' as nome_utente,'Ipsum unde aliqua omnis accusa' as nome_exame,'02-01-2015' as date,'/IGRP-Template/images/IGRP/IGRP2.3/app/app_teste/processamento_de_imagem/Processamento_de_imagem.xml' as ver_exame "));
		  ----#gen-example */
		/*----#start-code(index)----*/
	
		String p_id_user = Core.getParam("p_id_user");
		//System.out.println(p_id_user);
		List<Exame> exameList = new Exame().find()
		 			.andWhere("idUser.idUser","=", Core.toInt(p_id_user)) //id user da tabela exame apanhado como .idUser da tabela utilizador
		 			.all();
	
		if (exameList != null) {
			// creating a list of the type person (this is the table on the page)
			List<Listar_exames.Table_1> exameTable = new ArrayList<>();

			// copying data from personList to personTable
			for (Exame ex : exameList) {
				// creating a row for the table
				Listar_exames.Table_1 row = new Listar_exames.Table_1();
				// filling the row
				
				row.setNome_utente(ex.getIdUser().getNome()); //nome apanhado através do objeto id user
				row.setNome_exame(ex.getNome_exame());
				row.setDate(Core.dateToString(ex.getData()));
			
				
				//row.setFile("app_teste", "UserList", "download&file_id=" + u.getFile());
				row.setVer_exame("app_teste", "Processamento_de_imagem", "index&file_id="+ ex.getRaioX());
				// adding row to the table
				exameTable.add(row);
			}

			// inserting the table in model
			model.setTable_1(exameTable);

		}
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
/*----#start-code(custom_actions)----*/
	public Response actionDownload() throws IOException, IllegalArgumentException, IllegalAccessException {
		int fileId = Core.getParamInt("file_id");
		//System.out.println(fileId + " print!!!");
		CLob c = Core.getFile(fileId);
		byte[] content = c.getC_lob_content();
		String name = c.getName();
		String contentType = c.getMime_type();
		boolean download = false;
		return this.xSend(content, name, contentType, download);
	}

/*----#end-code----*/
}
