<<<<<<< HEAD
/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.listaenv;
/*---- Import your packages here... ----*/

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.ImportExportApp;
import nosi.core.webapp.helpers.JarUnJarFile;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;

/*---- End ----*/

public class ListaEnvController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		ListaEnv model = new ListaEnv();
		ArrayList<ListaEnv.Table_1> lista = new ArrayList<>();
		Application app = new Application();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();		
			app.setDad(model.getDad());
			app.setName(model.getNome());
		}
		List<Application> apps = app.find()
								.andWhere("dad", "like", app.getDad())
								.andWhere("name", "like", app.getName())
								.all();
		for(Application a:apps){
			if(!a.getDad().toLowerCase().equals("igrp")){
				ListaEnv.Table_1 table = new ListaEnv().new Table_1();
				table.setDad(a.getDad());
				table.setName(""+a.getName());
				table.setStatus(a.getStatus());
				table.setId(a.getId());
				lista.add(table);
			}
		}
		model.setTable_1(lista);
		
		ListaEnvView view = new ListaEnvView(model);
		view.table_1.addData(model.gettable_1());
		view.title = "Lista Aplicação";
		view.id.setParam(true);
		return this.renderView(view);
	}


	public Response actionNovo() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","ListaPage","index");
		/*---- End ----*/
	}
	

	public Response actionPesquisar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","listaenv","index");
		/*---- End ----*/
	}
	

	public Response actionEditar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","ListaPage","index");
		/*---- End ----*/
	}
	

	public Response actionEliminar() throws IOException{
		String id = Igrp.getInstance().getRequest().getParameter("id");
		Application app = new Application();
		if(app.delete(Integer.parseInt(id)))
			Igrp.getInstance().getFlashMessage().addMessage("success","Operação efetuada com sucesso");
		else
			Igrp.getInstance().getFlashMessage().addMessage("error","Falha ao tentar efetuar esta operação");
		return this.redirect("igrp","lista-env","index");
	}
	

	public Response actionExport() throws IOException{
		/*---- Insert your code here... ----*/
		String id = Igrp.getInstance().getRequest().getParameter("id");
		boolean status = false;
		boolean statuspage = false;
		if(id != null && !id.equals("")) {
			Application app = new Application().findOne(id);
			List<Action> paginas = app.getActions();
			
			if(paginas != null) {
				for(Action pagina : paginas) {
					//statuspage = ImportExportApp.ExportPage(pagina.getId()+"");
					System.out.println(pagina.getAction()); 
				}
			}
			
			String xml_config = ImportExportApp.genereteXMLApplication(app);
			String path_files = "C:\\Users\\isaias.nunes\\Downloads\\"+app.getDad();
			FileHelper.save(path_files, app.getDad()+"ConfigApplication.xml", xml_config);
			Map<String, String> files = FileHelper.listFilesDirectory(path_files);
			status = JarUnJarFile.saveJarFiles("C:\\Users\\isaias.nunes\\Downloads\\"+app.getDad()+".jar", files, 9);
			
		}
		if(status) {
			Igrp.getInstance().getFlashMessage().addMessage("success", "Export de uma aplicação concluído com sucesso...");
		}else {
			Igrp.getInstance().getFlashMessage().addMessage("error", "Falha ao realizar o Export...");
		}
		return this.redirect("igrp","ListaEnv","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
=======
/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.listaenv;
/*---- Import your packages here... ----*/

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.ImportExportApp;
import nosi.core.webapp.helpers.JarUnJarFile;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;

/*---- End ----*/

public class ListaEnvController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		ListaEnv model = new ListaEnv();
		ArrayList<ListaEnv.Table_1> lista = new ArrayList<>();
		Application app = new Application();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();		
			app.setDad(model.getDad());
			app.setName(model.getNome());
		}
		List<Application> apps = app.find()
								.andWhere("dad", "like", app.getDad())
								.andWhere("name", "like", app.getName())
								.all();
		for(Application a:apps){
			if(!a.getDad().toLowerCase().equals("igrp")){
				ListaEnv.Table_1 table = new ListaEnv().new Table_1();
				table.setDad(a.getDad());
				table.setName(""+a.getName());
				table.setStatus(a.getStatus());
				if(a.getStatus()==1){
					table.setStatus_check(a.getStatus());
				}
				table.setId(a.getId());
				lista.add(table);
			}
		}
		model.setTable_1(lista);
		
		ListaEnvView view = new ListaEnvView(model);
		view.table_1.addData(model.gettable_1());
		view.title = "Lista Aplicação";
		view.id.setParam(true);
		return this.renderView(view);
	}


	public Response actionNovo() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","ListaPage","index");
		/*---- End ----*/
	}
	

	public Response actionPesquisar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","listaenv","index");
		/*---- End ----*/
	}
	

	public Response actionEditar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","ListaPage","index");
		/*---- End ----*/
	}
	

	public Response actionEliminar() throws IOException{
		String id = Igrp.getInstance().getRequest().getParameter("id");
		Application app = new Application();
		if(app.delete(Integer.parseInt(id)))
			Igrp.getInstance().getFlashMessage().addMessage("success","Operação efetuada com sucesso");
		else
			Igrp.getInstance().getFlashMessage().addMessage("error","Falha ao tentar efetuar esta operação");
		return this.redirect("igrp","lista-env","index");
	}
	

	public Response actionExport() throws IOException{
		/*---- Insert your code here... ----*/
		String id = Igrp.getInstance().getRequest().getParameter("id");
		boolean status = false;
		boolean statuspage = false;
		if(id != null && !id.equals("")) {
			Application app = new Application().findOne(id);
			List<Action> paginas = app.getActions();
			
			if(paginas != null) {
				for(Action pagina : paginas) {
					statuspage = ImportExportApp.ExportPage(pagina.getId()+"");
				}
			}
			
			String xml_config = ImportExportApp.genereteXMLApplication(app);
			String path_files = "C:\\Users\\isaias.nunes\\Downloads\\"+app.getDad();
			FileHelper.save(path_files, app.getDad()+"ConfigApplication.xml", xml_config);
			Map<String, String> files = FileHelper.listFilesDirectory(path_files);
			status = JarUnJarFile.saveJarFiles("C:\\Users\\isaias.nunes\\Downloads\\"+app.getDad()+".jar", files, 9);
			
		}
		if(status && statuspage) {
			Igrp.getInstance().getFlashMessage().addMessage("success", "Export de uma aplicação concluído com sucesso...");
		}else {
			Igrp.getInstance().getFlashMessage().addMessage("error", "Falha ao realizar o Export...");
		}
		return this.redirect("igrp","ListaEnv","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
>>>>>>> branch 'master' of https://github.com/NOSiCode-CV/IGRP-Framework.git
