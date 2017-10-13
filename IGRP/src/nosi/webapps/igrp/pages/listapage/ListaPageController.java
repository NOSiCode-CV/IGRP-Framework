/*-------------------------*/

/*Create Controller*/


package nosi.webapps.igrp.pages.listapage;
/*---- Import your packages here... ----*/

import nosi.core.config.Config;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.ImportExportApp;
import nosi.core.webapp.helpers.JarUnJarFile;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/*---- End ----*/
public class ListaPageController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		ListaPage model = new ListaPage();
		ArrayList<ListaPage.Table_1> lista = new ArrayList<>();
		Action a = new Action();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();		
			Application app = new Application();
			app.setId(model.getEnv_fk());
			a.setPage(model.getPage());
			a.setPage_descr(model.getPage_descr());
		}	
		List<Action> actions = a.find()
				  .andWhere("application", "=", model.getEnv_fk()!=0?model.getEnv_fk():null)
				  .andWhere("page", "like", model.getPage())
				  .andWhere("page_descr", "like", model.getPage_descr())
				  .all();
		for(Action ac:actions){
			ListaPage.Table_1 table1 = new ListaPage().new Table_1();
			table1.setId(ac.getId());
			table1.setNome_page(ac.getPage());
			table1.setDescricao_page(ac.getPage_descr());
			table1.setVersao_page(ac.getVersion());
			if(ac.getStatus()==1){
				table1.setStatus_page_check(ac.getStatus());
				table1.setStatus_page(ac.getStatus());
			}
			lista.add(table1);
		}
		
		ListaPageView view = new ListaPageView(model);
		view.id.setParam(true);
		view.env_fk.setLabel("Aplicação");
		view.env_fk.setValue(new Application().getListApps());
		view.table_1.addData(lista);
		
		return this.renderView(view);
	}

	public Response actionExport() throws IOException{
		/*---- Insert your code here... ----*/	
		String id = Igrp.getInstance().getRequest().getParameter("id");
		if(id != null && !id.equals("")) {
			Action page = new Action().findOne(id);
			String xml_file = ImportExportApp.generateXMLPage(page);			
			String path_class_files = Config.getWorkspace() +"\\src\\"+ page.getPackage_name().replace(".", "\\");
			String path_xsl_xml = Config.getWorkspace() + "\\WebContent\\" + Config.getResolvePathXsl(page.getApplication().getDad(), page.getPage(), page.getVersion());
			
			FileHelper.save(path_xsl_xml, page.getPage()+"Config.xml", xml_file);
			
			Map<String, String> xsl_xml_files = FileHelper.listFilesDirectory(path_xsl_xml);
			Map<String, String> Java_files = FileHelper.listFilesDirectory(path_class_files);
			
			xsl_xml_files.putAll(Java_files);
			System.out.println(xsl_xml_files);
			boolean status = JarUnJarFile.saveJarFiles("C:\\Users\\isaias.nunes\\Downloads\\"+page.getPage()+".jar", xsl_xml_files, 9);
			if(status) {
				Igrp.getInstance().getFlashMessage().addMessage("success", "Upload concluído com sucesso...");
			}else {
				Igrp.getInstance().getFlashMessage().addMessage("error", "Falha ao realizar o Upload...");
			}
		}
		
		return this.redirect("igrp","ListaPage","index");
			/*---- End ----*/
	}
}
