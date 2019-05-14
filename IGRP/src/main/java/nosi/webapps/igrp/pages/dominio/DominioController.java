package nosi.webapps.igrp.pages.dominio;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import static nosi.core.i18n.Translator.gt;

/*----#end-code----*/
		
public class DominioController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Dominio model = new Dominio();
		model.load();
		DominioView view = new DominioView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadFormlist_1(Core.query(null,"SELECT 'Lorem iste magna omnis rem' as description,'Perspiciatis adipiscing lorem totam amet' as key,'2' as estado,'hidden-ffa4_3431' as ordem "));
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.lst_dominio.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.estado.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/			
		view.aplicacao.setValue(DomainHeper.getApplications());
		view.estado.setQuery(DomainHeper.getEstadoQuery());
       
        if(Core.isNullOrZero(model.getAplicacao())){
            model.setPublico(1);         
        }else {
        	String dad = Core.getCurrentDad();		
   		 if (!"igrp".equalsIgnoreCase(dad) && !"igrp_studio".equalsIgnoreCase(dad)) {			
   			model.setAplicacao(Core.findApplicationByDad(dad).getId());
   	        view.aplicacao.propertie().add("disabled","true");			
   			}
        }
       
     	view.lst_dominio.setQuery(DomainHeper.getDomainQuery(model.getAplicacao()), gt("-- Selecionar --"));	
		
		if(Core.isNotNull(model.getLst_dominio())) {        
			model.loadFormlist_1(DomainHeper.getDomainItemQuery(model.getLst_dominio()));
		}
      
            view.btn_gravar_domain.setVisible(Core.isNull(model.getLst_dominio()));
            view.btn_gravar_domain.addParameter("p_aplicacao",model.getAplicacao());
     		 view.btn_guardar_item_domain.setVisible(Core.isNotNull(model.getLst_dominio()));
     		 view.btn_guardar_item_domain.addParameter("p_aplicacao",model.getAplicacao());
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGuardar_item_domain() throws IOException, IllegalArgumentException, IllegalAccessException{
		Dominio model = new Dominio();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","Dominio","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(guardar_item_domain)----*/
		if(DomainHeper.saveItemDomain(model)) {
			Core.setMessageSuccess();
			this.addQueryString("p_aplicacao", model.getAplicacao())
				.addQueryString("p_lst_dominio", model.getLst_dominio());
			return this.redirect("igrp","Dominio","index", this.queryString());
		}else {
			Core.setMessageError();
			return this.forward("igrp","Dominio","index", model, this.queryString());
		}
		/*----#end-code----*/
			
	}
	
	public Response actionGravar_domain() throws IOException, IllegalArgumentException, IllegalAccessException{
		Dominio model = new Dominio();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","Dominio","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(gravar_domain)----*/
		if(DomainHeper.saveDomain(model)) {
			Core.setMessageSuccess();
			addQueryString("p_lst_dominio", model.getNovo_dominio());
			return this.redirect("igrp","Dominio","index", model, this.queryString());
		}else {
			Core.setMessageError();
			return this.forward("igrp","Dominio","index", model, this.queryString());
		}
		/*----#end-code----*/
			
	}
	
/*----#start-code(custom_actions)----*/



	/*----#end-code----*/
}
