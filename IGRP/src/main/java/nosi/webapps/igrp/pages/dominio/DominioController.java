package nosi.webapps.igrp.pages.dominio;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import static nosi.core.i18n.Translator.gt;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import nosi.webapps.igrp.dao.Domain;
import nosi.webapps.igrp.dao.DomainType;
/*----#end-code----*/
		
public class DominioController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Dominio model = new Dominio();
		model.load();
		DominioView view = new DominioView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadFormlist_1(Core.query(null,"SELECT 'Stract labore dolor aperiam magna' as description,'Unde voluptatem lorem labore lorem' as key,'1' as estado,'hidden-0a30_88d5' as ordem "));
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.lst_dominio.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/			
		view.aplicacao.setValue(DomainHeper.getApplications());
		//view.estado.setQuery(DomainHeper.getEstadoQuery());
		view.estado_check.setValue(1);
		model.setPublico_check(1);
	
		String dad = Core.getCurrentDad();		
  		 if (!"igrp".equalsIgnoreCase(dad) && !"igrp_studio".equalsIgnoreCase(dad)) {	
           	model.setApp(Core.findApplicationByDad(dad).getId());
  			model.setAplicacao(model.getApp());
  	        view.aplicacao.propertie().add("disabled","true");			
  		}
  		Integer app=model.getAplicacao();
//  		Mudar para value para mostrar escolhido logo
     	 final BaseQueryInterface domainQuery = DomainHeper.getDomainQuery(app);
		
     	
		if(domainQuery.getSingleResult()==null) {
			LinkedHashMap<Object,Object> mapDom=new LinkedHashMap<>();
	     	mapDom.put(null,gt("++ Adicione um domínio ++"));
			view.lst_dominio.setValue(mapDom);
		}else
			view.lst_dominio.setQuery(domainQuery, gt("-- Selecione ou adicione um domínio ++"));	     
		if(Core.isNotNull(model.getLst_dominio())) {        
			model.loadFormlist_1(DomainHeper.getDomainItemQuery(model.getLst_dominio(),app));
			final List<Domain> findDomainByCode = Core.findDomainByCode(model.getLst_dominio(),app);
			model.setPublico(findDomainByCode!=null && !findDomainByCode.isEmpty() && findDomainByCode.size()>0?findDomainByCode.get(0).getDomainType().equals(DomainType.PUBLIC)?1:0:0);
		}
      
		if(Core.isNotNullOrZero(app)) {
			 view.btn_gravar_domain.addParameter("p_aplicacao",app);
			 view.btn_guardar_item_domain.addParameter("p_aplicacao",app);
		}
        view.btn_gravar_domain.setVisible(Core.isNull(model.getLst_dominio()));           
     	view.btn_guardar_item_domain.setVisible(Core.isNotNull(model.getLst_dominio()));
     		 
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
			this.addQueryString("p_aplicacao", model.getAplicacao());
			this.addQueryString("p_lst_dominio", model.getLst_dominio());
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
			this.addQueryString("p_aplicacao", model.getAplicacao());
			this.addQueryString("p_lst_dominio", model.getNovo_dominio());
			return this.redirect("igrp","Dominio","index", this.queryString());
		}else {
			Core.setMessageError();
			return this.forward("igrp","Dominio","index", model, this.queryString());
		}
		/*----#end-code----*/
			
	}
	
/*----#start-code(custom_actions)----*/



	/*----#end-code----*/
}
