
package nosi.webapps.igrp.pages.listapage;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/

import nosi.core.config.Config;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
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
import nosi.webapps.igrp.dao.User;

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
		model.load();
		model.setBtn_import("igrp_studio", "ImportArquivo","index&target=_blank");
       model.setLink_btn_ab("igrp", "ListaEnv", "index");
       model.setLink_btn_nova_pagina("igrp", "Page", "index&target=_blank");
		String app = Igrp.getInstance().getRequest().getParameter("app");
		if (app != null && !app.equals("") ) {
			if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("GET")) {
				model.setEnv_fk(app);
		}
		}
		if (model.getEnv_fk() != null && !model.getEnv_fk().equals("") ) {
			model.setBtn_import("igrp_studio", "ImportArquivo",
				"index&target=_blank&app=" + model.getEnv_fk() + "#tab-tabcontent_1-importar_pagina");
			   model.setLink_btn_nova_pagina("igrp", "Page", "index&target=_blank&p_env_fk=" + model.getEnv_fk());
		}
		
//		model.setBtn_import_desc(gt("Importar"));
		List<Action> actions = a.find().andWhere("application", "=",
				(model.getEnv_fk() != null && !model.getEnv_fk().equals("")) ? Integer.parseInt(model.getEnv_fk()) : -1)
				// .andWhere("page", "like", model.getPage())
				// .andWhere("page_descr", "like", model.getPage_descr())
				.all();
		for (Action ac : actions) {
			ListaPage.Table_1 table1 = new ListaPage.Table_1();
			table1.setP_id_page("" + ac.getId());
			table1.setNome_page(ac.getPage());
			table1.setDescricao_page(ac.getPage_descr());
			if (ac.getStatus() == 1) {
				table1.setStatus_page_check(ac.getStatus());
				table1.setStatus_page(ac.getStatus());
			}
			lista.add(table1);
		}

		ListaPageView view = new ListaPageView(model);
		view.p_id_page.setParam(true);

		view.env_fk.setValue(new Application().getListApps());
		view.table_1.addData(lista);
				
		view.btn_eliminar.setVisible(false);
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionEditar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(EDITAR)----*/
		String p_id_page = Igrp.getInstance().getRequest().getParameter("p_id_page");
		if (p_id_page != null && !p_id_page.equals("")) {
			return this.forward("igrp", "Page", "index&target=_blank&p_id=" + p_id_page);
		}

		return this.redirect("igrp", "Page", "index&target=_blank");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionVisualizar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(VISUALIZAR)----*/
		String p_id_page = Igrp.getInstance().getRequest().getParameter("p_id_page");
		if (p_id_page != null && !p_id_page.equals("")) {
			return this.forward("igrp", "Page", "visualizar&target=_blank&p_id=" + p_id_page);
		}
		return this.redirect("igrp", "Page", "index&target=_blank");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionEliminar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(ELIMINAR)----*/
		String p_id_page = Igrp.getInstance().getRequest().getParameter("p_id_page");
		if (p_id_page != null && !p_id_page.equals("")) {
			return this.forward("igrp", "Page", "eliminar&id=" + p_id_page);
		}
		return this.redirect("igrp", "ListaPage", "index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionGerar_codigo() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(GERAR_CODIGO)----*/
		String p_id_page = Igrp.getInstance().getRequest().getParameter("p_id_page");
		if (p_id_page != null && !p_id_page.equals("")) {
			return this.forward("igrp", "generator", "index&target=_blank&id=" + p_id_page);
		}
		return this.redirect("igrp", "Page", "index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionDownload() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(DOWNLOAD)----*/
		String id = Igrp.getInstance().getRequest().getParameter("p_id_page");
		if (id != null && !id.equals("")) {
			Action page = new Action().findOne(Integer.parseInt(id));
			ImportExportApp iea = new ImportExportApp();
			if (page != null && iea.validateExportPage(page)) {
				iea.ExportPage(page);
				String pathJar = Config.getPathExport() + page.getApplication().getDad().toLowerCase() + File.separator
						+ page.getPage() + ".page.jar";
				FileHelper.createDiretory(Config.getPathExport() + page.getApplication().getDad().toLowerCase());
				JarUnJarFile.saveJarFiles(pathJar, iea.getFilesPageClasses(), 9);

				// insert data on import/export table
				ImportExportDAO ie_dao = new ImportExportDAO(page.getPage(), Config.getUserName(),
						DateHelper.getCurrentDataTime(), "Export");
				ie_dao = ie_dao.insert();
				return this.sendFile(new File(pathJar), page.getPage() + ".page", "application/jar", true);
			}
			Core.setMessageWarning(FlashMessage.WARNING_EXPORT_PAGE);
		} else {
			Core.setMessageError();
		}
		return this.redirect("igrp", "ListaPage", "index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/

	/*----#END-PRESERVED-AREA----*/
}
