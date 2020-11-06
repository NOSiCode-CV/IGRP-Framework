package nosi.webapps.igrp.pages.proforgmapper;

import nosi.core.webapp.mvc.Controller;
import nosi.core.webapp.util.Core;
import nosi.core.webapp.util.helpers.database.QueryInterface;
import nosi.core.webapp.util.helpers.database.ResultSet;
import nosi.core.webapp.Response;

import java.io.IOException;

import nosi.base.ActiveRecord.HibernateUtils;
import nosi.core.gui.components.IGRPSeparatorList.Pair;

import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Mapping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/*----#end-code----*/
		
public class ProforgmapperController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Proforgmapper model = new Proforgmapper();
		model.load();
		ProforgmapperView view = new ProforgmapperView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadFormlist_1(Core.query(null,"SELECT 'Sit consectetur aperiam sit amet' as perfilorganica_origem,'Amet adipiscing sit iste anim' as perfilorganica_destino "));
		view.aplicacao_origem.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.aplicacao_destino.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.tipo.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		
      view.tipo.setQuery(Core.query(null,"SELECT '1' as ID,'Perfil' as NAME union SELECT '2' as ID,'Orgânica' as NAME"), "--- Selecionar ---");
      List<Application> allAppsOrigem = new Application().find().andWhere("status", "=", 1).all(); 
  	  if(allAppsOrigem != null) { 
  		  Map<String, String> m = allAppsOrigem.stream().collect(Collectors.toMap(Application::getDad, Application::getName)); 
  		  m.put(null, "--- Selecionar ---"); 
  		  view.aplicacao_origem.setValue(m); 
  	  }
  	  
  	 // if(model.getAplicacao_origem() != null && !model.getAplicacao_origem().isEmpty()) {
	      List<Application> allAppsDestino = new Application().find().andWhere("dad", "<>", model.getAplicacao_origem()).andWhere("status", "=", 1).all(); 
	  	  if(allAppsDestino != null) {
	  		  Map<String, String> m = allAppsDestino.stream().collect(Collectors.toMap(Application::getDad, Application::getName)); 
	  		  m.put(null, "--- Selecionar ---"); 
	  		 view.aplicacao_destino.setValue(m); 
	  	  }
  	  //}
    	int tipo = Core.toInt(model.getTipo()); 
    	if(tipo == 1) {
    		view.perfilorganica_origem.setValue("Perfil (Origem)");
    		view.perfilorganica_destino.setValue("Perfil (Destino)");
    	}else if(tipo == 2) {
    		view.perfilorganica_origem.setValue("Orgânica (Origem)");
    		view.perfilorganica_destino.setValue("Orgânica (Destino)");
    	}else {
    		view.perfilorganica_origem.setValue("Perfil/Orgânica (Origem)");
    		view.perfilorganica_destino.setValue("Perfil/Orgânica (Destino)");
    	}
    	
    	view.formlist_1.setVisible(false);
    	view.btn_guardar.setVisible(false);
    	
    	if(model.getAplicacao_origem() != null && model.getAplicacao_destino() != null && tipo != 0) {
    		view.formlist_1.setVisible(true); 
        	view.btn_guardar.setVisible(true); 
        	
        	String p_error = Core.getParam("p_error"); 
        	// preencher formlist 
        	if(p_error == null || !p_error.equals("true")) {
        		List<Mapping> all = new Mapping().find().andWhere("dadOrigem", "=", model.getAplicacao_origem())
        				.andWhere("dadDestino", "=", model.getAplicacao_destino())
        				.andWhere("tipo", "=", tipo).all(); 
        		if(all != null) { 
        			model.setFormlist_1(new ArrayList<Proforgmapper.Formlist_1>());
        			all.forEach(obj->{
        				Proforgmapper.Formlist_1 row = new Proforgmapper.Formlist_1(); 
        				row.setFormlist_1_id(new Pair(obj.getId() + "", obj.getId() + "")); 
	        			row.setPerfilorganica_origem(new Pair(obj.getValorOrigem(), obj.getValorOrigem()));
	        			row.setPerfilorganica_destino(new Pair(obj.getValorDestino(), obj.getValorDestino()));
        				model.getFormlist_1().add(row); 
        			});
        		}
        	}
        	
    	}

		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGuardar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Proforgmapper model = new Proforgmapper();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp","Proforgmapper","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(guardar)----*/
		
		this.t = null;
		boolean success = false;
		try {
			
			SessionFactory sessionFactory = HibernateUtils.getSessionFactory(this.configApp.getBaseConnection());
			if(sessionFactory != null) 
				 s = sessionFactory.getCurrentSession();
			
			this.t = this.s.getTransaction(); 
			
			if(!this.t.isActive())
				this.t.begin(); 
			
			List<Proforgmapper.Formlist_1> data = model.getFormlist_1(); 
			if(data != null) {
				for(Proforgmapper.Formlist_1 row : data) {
					
					if(row.getPerfilorganica_origem().getKey() == null || row.getPerfilorganica_origem().getKey().isEmpty() && row.getPerfilorganica_destino().getKey() == null || row.getPerfilorganica_destino().getKey().isEmpty()) {  
						Core.setMessageError("Campos obrigatórios. Favor preencher os campos."); 
						throw new Exception("Campos obrigatórios. Favor preencher os campos."); 
					}
					
					Mapping mapping = new Mapping(); 
					int id = Core.toInt(row.getFormlist_1_id().getKey()); 
					if(id != 0) 
						mapping = this.s.get(Mapping.class, id); 
					mapping.setTipo(Core.toInt(model.getTipo())); 
					mapping.setValorOrigem(row.getPerfilorganica_origem().getKey());
					mapping.setValorDestino(row.getPerfilorganica_destino().getKey());
					mapping.setDadOrigem(model.getAplicacao_origem());
					mapping.setDadDestino(model.getAplicacao_destino());
					this.s.persist(mapping);
				}
			}
			
			String []delIds = model.getP_formlist_1_del(); 
			if(delIds != null) {
				for(String delId : delIds) {
					this.s.remove(this.s.get(Mapping.class, Core.toInt(delId)));
				}
			}
			
			this.t.commit(); 
			
			success = true; 
			
		}catch (Exception e) {
			//e.printStackTrace();
		if(this.t!=null)
			this.t.rollback();
		} finally {
			if(this.s != null) 
				this.s.close();
		}
		
		if(success) {
			Core.setMessageSuccess(); 
		}else {
			Core.setMessageError(); 
			 this.addQueryString("p_error","true"); //to send a query string in the URL 
			//return this.forward("igrp", "Proforgmapper","index", this.queryString()); 
		}
		
      return this.forward("igrp", "Proforgmapper","index", this.queryString());
		
		/*----#end-code----*/
			
	}
	
	public Response actionPesquisar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Proforgmapper model = new Proforgmapper();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp","Dominio","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(pesquisar)----*/
		
      return this.forward("igrp","Proforgmapper","index",this.queryString()); //if submit, loads the values
		
		/*----#end-code----*/
			
	}
	
		
		
/*----#start-code(custom_actions)----*/

    public Response actionAppOrigemDestino() throws Exception{ 
    	String p_app_origem = Core.getParam("p_aplicacao_origem"); 
        String xml = "< ?xml version = \"1.0\" encoding = \"utf-8\"?> ";
	    ProforgmapperView view = new ProforgmapperView(); 
	    Map<Object, Object>  targets = new HashMap<>();
	    if(p_app_origem != null && !p_app_origem.isEmpty()) {
	    	List<Application> allApps = new Application().find().andWhere("dad", "<>", p_app_origem).andWhere("status", "=", 1).all(); 
	    	if(allApps != null)
	    		targets = allApps.stream().collect(Collectors.toMap(Application::getDad, Application::getName)); 
	    }
	    xml += Core.remoteComboBoxXml(targets, view.aplicacao_destino, null, "-- Selecionar --");
	    this.format = Response.FORMAT_XML; 
       return this.renderView(xml);
    }  
    
    private Session s;
	private Transaction t;
    
/*----#end-code----*/
}
