
package nosi.webapps.igrp.pages.listapage;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/

import nosi.core.config.Config;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.DateHelper;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.ImportExportApp;
import nosi.core.webapp.helpers.JarUnJarFile;
import nosi.core.webapp.helpers.Permission;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.ImportExportDAO;
import nosi.webapps.igrp.dao.ProfileType;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import static nosi.core.i18n.Translator.gt;

/*----#END-PRESERVED-AREA----*/

public class ListaPageController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/	
		ListaPage model = new ListaPage();
		ArrayList<ListaPage.Table_1> lista = new ArrayList<>();
		Action a = new Action();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();		
			Application app = new Application();
			if(model.getEnv_fk()!=null && !model.getEnv_fk().equals("")){
				app.setId(Integer.parseInt(model.getEnv_fk()));
			}
			a.setPage(model.getPage());
			a.setPage_descr(model.getPage_descr());
		}	
		List<Action> actions = null;
		int idProf = Permission.getCurrentPerfilId();
		ProfileType p = new ProfileType().findOne(idProf);		
		if(p!=null && p.getCode().equalsIgnoreCase("ADMIN")){
			 actions = a.find()
					  .andWhere("application", "=", model.getEnv_fk()!=null && !model.getEnv_fk().equals("")?Integer.parseInt(model.getEnv_fk()):null)
					  .andWhere("page", "like", model.getPage())
					  .andWhere("page_descr", "like", model.getPage_descr())
					  .all();
		}else if(p!=null){
				  Application app = new Application().find().andWhere("dad", "=", Permission.getCurrentEnv()).one();
				  actions = a.find()
				  .andWhere("application", "=", model.getEnv_fk()!=null && !model.getEnv_fk().equals("")?Integer.parseInt(model.getEnv_fk()):app.getId())
				  .andWhere("page", "like", model.getPage())
				  .andWhere("page_descr", "like", model.getPage_descr())
				  .all();
		}
		for(Action ac:actions){
			ListaPage.Table_1 table1 = new ListaPage.Table_1();
			table1.setP_id_page(""+ac.getId());
			table1.setNome_page(ac.getPage());
			table1.setDescricao_page(ac.getPage_descr());
			if(ac.getStatus()==1){
				table1.setStatus_page_check(ac.getStatus());
				table1.setStatus_page(ac.getStatus());
			}
			lista.add(table1);
		}
		 
		ListaPageView view = new ListaPageView(model);
		view.p_id_page.setParam(true);
		view.env_fk.setLabel(gt("Aplicação"));
		view.env_fk.setValue(new Application().getListApps());
		view.table_1.addData(lista);
		view.nome_page.setLabel(gt("Código"));
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionNovo() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(NOVO)----*/
		return this.redirect("igrp","Page","index&target=_blank");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionPesquisar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(PESQUISAR)----*/
		ListaPage model = new ListaPage();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
			return this.forward("igrp","ListaPage","index");
		}
		return this.redirect("igrp","ListaPage","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionEidtar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(EIDTAR)----*/
		String p_id_page = Igrp.getInstance().getRequest().getParameter("p_id_page");
		if(p_id_page!=null && !p_id_page.equals("")){
			return this.forward("igrp","Page","editar&target=_blank&id="+p_id_page);
		}
		return this.redirect("igrp","Page","index&target=_blank");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionVisualizar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(VISUALIZAR)----*/
		String p_id_page = Igrp.getInstance().getRequest().getParameter("p_id_page");
		if(p_id_page!=null && !p_id_page.equals("")){
			return this.forward("igrp","Page","visualizar&target=_blank&id="+p_id_page);
		}
		return this.redirect("igrp","Page","index&target=_blank");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionEliminar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(ELIMINAR)----*/
		String p_id_page = Igrp.getInstance().getRequest().getParameter("p_id_page");
		if(p_id_page!=null && !p_id_page.equals("")){
			return this.forward("igrp","Page","eliminar&id="+p_id_page);
		}
		return this.redirect("igrp","ListaPage","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionGerar_codigo() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(GERAR_CODIGO)----*/
		String p_id_page = Igrp.getInstance().getRequest().getParameter("p_id_page");
		if(p_id_page!=null && !p_id_page.equals("")){
			return this.forward("igrp","generator","index&target=_blank&id="+p_id_page);
		}
		return this.redirect("igrp","Page","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionDownload() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(DOWNLOAD)----*/
		String id = Igrp.getInstance().getRequest().getParameter("p_id_page");
		if(id!=null && !id.equals("")){
			Action page = new Action().findOne(Integer.parseInt(id));
			ImportExportApp iea = new ImportExportApp();
			if(page!=null && iea.validateExportPage(page)){
				iea.ExportPage(page);
				String pathJar = Config.getPathExport()+page.getApplication().getDad().toLowerCase()+File.separator+page.getPage()+".page.jar";
				FileHelper.createDiretory(Config.getPathExport()+page.getApplication().getDad().toLowerCase());
				JarUnJarFile.saveJarFiles(pathJar, iea.getFilesPageClasses(),9);			
				
				//insert data on import/export table
				ImportExportDAO ie_dao = new ImportExportDAO(page.getPage(), Config.getUserName(), DateHelper.getCurrentDataTime(), "Export");
				ie_dao = ie_dao.insert();				
				return this.sendFile(new File(pathJar), page.getPage()+".page", "application/jar", true);
			}
			Core.setMessageWarning(FlashMessage.WARNING_EXPORT_PAGE);
		}else {
			Core.setMessageError();
		}
		return this.redirect("igrp","ListaPage","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	/*----#END-PRESERVED-AREA----*/
}
