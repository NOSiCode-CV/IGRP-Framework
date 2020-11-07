package nosi.webapps.igrp_studio.pages.modulo;

import java.io.IOException;

import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.Application;
		
public class ModuloController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Modulo model = new Modulo();
		model.load();
		ModuloView view = new ModuloView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		view.aplicacao.setValue(new Application().getListApps());

		String p_modulo_cod = Core.getParam("p_modulo_cod");
		if(Core.isNotNull(p_modulo_cod)) {
			nosi.webapps.igrp.dao.Modulo m = new nosi.webapps.igrp.dao.Modulo().find().where("name","=",p_modulo_cod).one();
			if(Core.isNotNull(m)) {
				model.setDescricao(m.getDescricao());
				model.setModulo(m.getName());
				model.setAplicacao(m.getApplication().getId()+"");
				view.btn_gravar.addParameter("p_modulo_cod",p_modulo_cod);
				view.aplicacao.propertie().add("disabled","true");
				view.modulo.propertie().add("disabled","true");
				view.btn_gravar.setTitle("Gravar");
			}else {
				Core.setMessageInfo("Nenhum módulo encontrado!");
				view.aplicacao.propertie().add("disabled","true");
				view.modulo.propertie().add("disabled","true");
				view.descricao.propertie().add("disabled","true");
				view.btn_gravar.setVisible(false);
			}
		}
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#start-code(gravar)----*/
		Modulo model = new Modulo();
		model.load();
		String p_modulo_cod = Core.getParam("p_modulo_cod");
      try {

			if(Core.isNotNull(p_modulo_cod)) {
				nosi.webapps.igrp.dao.Modulo m = new nosi.webapps.igrp.dao.Modulo().find().where("name","=",p_modulo_cod).one();
				m.setDescricao(model.getDescricao());
				m = m.update();
				if(m == null) {
					Core.setMessageError();
					this.addQueryString("p_modulo_cod",p_modulo_cod);
					return forward("igrp_studio","Modulo","index", this.queryString());
				}
				else {
					Core.setMessageSuccess("Descrição actualizada com sucesso!");
					this.addQueryString("p_modulo_cod",p_modulo_cod);
					return forward("igrp_studio","Modulo","index", this.queryString());
				}
			}else {
				nosi.webapps.igrp.dao.Modulo m = new nosi.webapps.igrp.dao.Modulo();
				Application application = new Application();
				application.setId(Core.toInt(model.getAplicacao()));
				m.setApplication(application);
				m.setName(model.getModulo());
				m.setDescricao(model.getDescricao()); 
				this.addQueryString("p_aplicacao", model.getAplicacao());
				if (new nosi.webapps.igrp.dao.Modulo().find().andWhere("name", "=", model.getModulo()).andWhere("application", "=", Core.toInt(model.getAplicacao())).one() == null) {
					m = m.insert();
					if(m == null) {
						Core.setMessageError();
						return forward("igrp_studio","Modulo","index", this.queryString());
					}
					else
						Core.setMessageSuccess();
				} else {
					Core.setMessageWarning("Nome do módulo já existe");
					return this.forward("igrp_studio","Modulo","index", this.queryString());
				}
			}

         
			
		}catch(Exception e) {
			Core.setMessageError();
			return forward("igrp_studio","Modulo","index", this.queryString());
		}
		/*----#end-code----*/
		
		return this.redirect("igrp_studio","modulo","index");	
	}
	
/*----#start-code(custom_actions)----*/
	
	/*----#end-code----*/
}
