package nosi.webapps.igrp.pages.dominio;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.webapps.igrp.dao.Domain;
import static nosi.core.i18n.Translator.gt;
import nosi.webapps.igrp.pages.dominio.Dominio.Formlist_1;
import java.util.ArrayList;
import java.util.List;
/*----#end-code----*/
		
public class DominioController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Dominio model = new Dominio();
		model.load();
		DominioView view = new DominioView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadFormlist_1(Core.query(null,"SELECT 'Omnis iste totam officia iste' as description,'Iste voluptatem doloremque perspiciatis accusantium' as key,'2' as estado,'1' as ordem "));
		view.lst_dominio.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.estado.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		Core.log(model.getLst_dominio());
		view.estado.setQuery(Core.query(this.configApp.getBaseConnection(),
				"SELECT 'ATIVE' as ID,'Ativo' as NAME UNION SELECT 'INATIVE' as ID,'Inativo' as NAME "));
		view.lst_dominio.setQuery(Core.query(this.configApp.getBaseConnection(),
				"SELECT DISTINCT dominio as id, dominio FROM tbl_domain"), gt("-- Selecionar --"));
		// model.loadTable_1(Core.query(this.config.getBaseConnection(),"SELECT valor as
		// key,description,status as estado,ordem,id as p_id FROM tbl_domain WHERE
		// dominio= '"+model.getLst_dominio()+"'"));
		if (Core.isNotNull(Core.getParam("save"))) {
			model.setLst_dominio(Core.getParam("save"));
		}
		model.loadFormlist_1(Core
				.query(this.configApp.getBaseConnection(),
						"SELECT id as formlist_1_id,description,valor as key,status as estado,ordem FROM tbl_domain")
				.where("dominio=:dominio").andWhere("description", "!=", "").andWhere("valor", "!=", "")
				.addString("dominio", model.getLst_dominio()));
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGuardar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Dominio model = new Dominio();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","Dominio","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(guardar)----*/
		if (Core.isNotNull(model.getLst_dominio())) {
			List<Formlist_1> formlistTud = new ArrayList<Formlist_1>();
			String[] formlistDel = model.getP_formlist_1_del();
			boolean error = false;
			formlistTud = model.getFormlist_1();
			// this.addQueryString("save",model.getLst_dominio());
			if (Core.isNotNull(formlistDel)) {
				for (int i = 0; i < formlistDel.length; i++) {
					Domain del = new Domain();
					if (!del.delete(Core.toInt(formlistDel[i]))) {
						Core.setMessageError("Delete error id=" + formlistDel[i]);
					}
				}
			}

			for (int i = 0; i < formlistTud.size(); i++) {
				Formlist_1 formlist = formlistTud.get(i);
				if (this.validateDomains(formlist)) {
					Domain d = new Domain().find().andWhere("dominio", "=", model.getLst_dominio())
							.andWhere("valor", "=", formlist.getKey().getKey()).one();
					if (d != null) {
						d.setDescription(formlist.getDescription().getKey());
						d.setStatus(formlist.getEstado().getKey());
						d.setValor(formlist.getKey().getKey());
						d.setordem(Core.toInt(formlist.getOrdem().getKey()));
						d = d.update();
						if (d.hasError()) {
							d.showMessage();
							error = true;
							break;
						}
					} else {
						d = new Domain(model.getLst_dominio(), formlist.getKey().getKey(),
								formlist.getDescription().getKey(), formlist.getEstado().getKey(),
								Core.toInt(formlist.getOrdem().getKey()));
						d = d.insert();
						if (d.hasError()) {
							d.showMessage();
							error = true;
							break;
						}
					}
				}

			}
			if (!error)
				Core.setMessageSuccess();
		} else
			Core.setMessageWarning("DOMW1");
		this.restartQueryString();
		// this.addQueryString("p_lst_dominio", model.getLst_dominio());
		return this.forward("igrp", "Dominio", "index", this.queryString());
		/*----#end-code----*/
			
	}
	
	public Response actionNovo() throws IOException, IllegalArgumentException, IllegalAccessException{
		Dominio model = new Dominio();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","Dominio","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(novo)----*/
		if (Core.isNotNull(model.getNovo_dominio())) {
			if (new Domain(model.getNovo_dominio(), "", "", "", 0).insert() != null)
				Core.setMessageSuccess();
			else
				Core.setMessageError();

		} else
			Core.setMessageWarning("DOMW1");
		/*----#end-code----*/
		return this.redirect("igrp","Dominio","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/

	private boolean validateDomains(Formlist_1 formlist) {
		return Core.isNotNullMultiple(formlist.getKey().getKey(), formlist.getDescription().getKey(),
				formlist.getDescription().getKey());
	}

	/*----#end-code----*/
}
