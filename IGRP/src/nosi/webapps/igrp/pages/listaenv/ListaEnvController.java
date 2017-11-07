/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.listaenv;
/*---- Import your packages here... ----*/

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import nosi.core.config.Config;
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.DateHelper;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.ImportExportApp;
import nosi.core.webapp.helpers.JarUnJarFile;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.ImportExportDAO;

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
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS,FlashMessage.MESSAGE_SUCCESS);
		else
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR,FlashMessage.MESSAGE_ERROR);
		return this.redirect("igrp","lista-env","index");
	}
	

	public Response actionExport() throws IOException{
		/*---- Insert your code here... ----*/
		String id = Igrp.getInstance().getRequest().getParameter("id");
		if(id != null && !id.equals("")) {
			Application app = new Application().findOne(id);
			if(app!=null){
				ImportExportApp iea = new ImportExportApp();
				if(iea.validateExportApp(app)){					
					//Insert data on Export/Import
					ImportExportDAO ie_dao = new ImportExportDAO(app.getName(), Config.getUserName(), DateHelper.getCurrentDataTime(), "Export");
					ie_dao =  ie_dao.insert();
					
					return this.exportApp(app,iea);
				}else{	
					Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.WARNING, FlashMessage.WARNING_EXPORT_APP);
				}
			}else{
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, FlashMessage.ERROR);
			}
		}
		return this.redirect("igrp","ListaEnv","index");
		/*---- End ----*/
	}


	
	
	/*---- Insert your actions here... ----*/
	private Response exportApp(Application app,ImportExportApp iea) {
		for(Action a:new Action().find().andWhere("application", "=", app.getId()).all()){
			iea.putFilesPageConfig(a);
		}
		Map<String,String> files = iea.getFilesPageClasses();
		if(iea.getFilesDaoClasses()!=null)
			files.putAll(iea.getFilesDaoClasses());

		String pathConfigApp = Config.getPathExport()+"ConfigApp"+File.separator+app.getDad().toLowerCase();
		try {
			FileHelper.save(pathConfigApp , "Config"+app.getDad()+".xml", ImportExportApp.genereteXMLApplication(app));
		} catch (IOException e) {
			e.printStackTrace();
		}
		files.put("configApp/"+app.getDad().toLowerCase()+"/"+app.getDad().toLowerCase()+".xml",pathConfigApp+File.separator+"Config"+app.getDad().toLowerCase()+".xml");
		String pathJar = Config.getPathExport()+app.getDad().toLowerCase()+File.separator+app.getDad().toLowerCase()+".jar";
		FileHelper.createDiretory(Config.getPathExport()+app.getDad().toLowerCase());
		JarUnJarFile.saveJarFiles(pathJar, files,9);
		return this.sendFile(new File(pathJar), app.getDad().toLowerCase(), "application/jar", true);
	}
	/*---- End ----*/
}
