
package nosi.webapps.igrp.pages.datasource;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.gui.components.IGRPForm;
import nosi.core.gui.components.IGRPTable;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.TextField;
import nosi.core.config.Config;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.core.webapp.databse.helpers.Query;
import nosi.core.webapp.Core;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Config_env;
import nosi.webapps.igrp.dao.RepSource;
import nosi.webapps.igrp.dao.User;
import java.sql.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Properties;
import java.util.Set;
import static nosi.core.i18n.Translator.gt;
/*----#END-PRESERVED-AREA----*/

public class DataSourceController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/	
		HashMap<String,String> tipo = new HashMap<>();
		tipo.put(null, "--- Selecionar Tipo Data Source ---");
		//tipo.put("acti", "Etapa");
		tipo.put("Object", "Objecto");
		tipo.put("Page", "Paginas");
		//tipo.put("proc", "Processo");
		tipo.put("Query", "Query");
		//tipo.put("serv", "Serviços");
		DataSource model = new DataSource();
		model.setQuery("Select * FROM nome_tabela");
		String id_env = Igrp.getInstance().getRequest().getParameter("id_env");
		
		if(Core.isNotNull(id_env)) {
			String id = Igrp.getInstance().getRequest().getParameter("p_datasorce_app");
			model.setP_id_env(id_env);
			if(Core.isNotNull(id)){
				RepSource rep = new RepSource().findOne(Integer.parseInt(id));
				model.setNome(rep.getName());
				model.setObjecto(rep.getType_name().equalsIgnoreCase("object")?rep.getType_query():"");
				model.setQuery(rep.getType_name().equalsIgnoreCase("query")?rep.getType_query():"");
				model.setTipo(rep.getType_name());
			}
			if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
				model.load();
			}
			DataSourceView view = new DataSourceView(model);
			view.processo.setVisible(false);
			view.query.setVisible(false);
			view.servico.setVisible(false);
			view.area.setVisible(false);
			view.etapa.setVisible(false);
			view.pagina.setVisible(false);
			view.objecto.setVisible(false);
			
			view.tipo.setValue(tipo);
			
			view.pagina.setLookup("r=igrp/LookupListPage/index&dad=igrp");
			view.pagina.addParam("p_prm_target","_blank");
			view.pagina.addParam("p_id_pagina", "p_id");
			view.pagina.addParam("p_pagina", "descricao");
			view.pagina.addParam("p_aplicacao", "p_id_aplicacao");
			view.data_source.setValue(new Config_env().getListEnv(Integer.parseInt(id_env)));
			
			//habilita botao de acordo com tipo de objeto
			if(Core.isNotNull(model.getTipo())){
				if(model.getTipo().equalsIgnoreCase("object")){
					view.objecto.setVisible(true);
				}else if(model.getTipo().equalsIgnoreCase("page")){
					view.pagina.setVisible(true);
				}else if(model.getTipo().equalsIgnoreCase("query")){
					view.query.setVisible(true);
				}
			}
			Config.target = "_blank";
	
			if(Core.isNotNull(id)){
				view.btn_gravar.setLink("gravar&p_datasorce_app="+id);
			}
			view.btn_fechar.setVisible(false);
			return this.renderView(view);
		}
		return this.redirectError();
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(GRAVAR)----*/		
		DataSource model = new DataSource();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
			RepSource rep = new RepSource();
			rep.setName(model.getNome());
			rep.setType(model.getTipo());
			rep.setType_name(model.getTipo());
			rep.setType_query(model.getQuery());
			
			if(Core.isNotNull(model.getP_id_env()) && Core.isNotNull(model.getData_source())){
				rep.setConfig_env(new Config_env().findOne(Integer.parseInt(model.getData_source())));
				if(model.getTipo().equalsIgnoreCase("object")){
					rep.setType_query(model.getObjecto());
				}
				if(model.getTipo().equalsIgnoreCase("page")){				
					rep.setType_fk(Integer.parseInt(model.getP_id_pagina()));
				}
				if(model.getTipo().equalsIgnoreCase("object") || model.getTipo().equalsIgnoreCase("query")){
					String query = rep.getType_query();
					query = rep.getType().equalsIgnoreCase("object")?"SELECT * FROM "+query:query;
					if(!Query.validateQuery(rep.getConfig_env(),query)){
						Igrp.getInstance().getFlashMessage().addMessage("error","Query Invalido");
						return this.forward("igrp","DataSource","index&id_env="+model.getP_id_env());
					}
				}
				
				Application app = new Application().findOne(Integer.parseInt(model.getP_id_env()));
				rep.setApplication(app);
				rep.setStatus(1);
				rep.setApplication_source(app);
				Date dt = new Date(System.currentTimeMillis());
				rep.setDt_created(dt);
				rep.setDt_updated(dt);
				User user = new User().findOne(Igrp.getInstance().getUser().getIdentity().getIdentityId());
				rep.setUser_created(user);
				rep.setUser_updated(user);
				String id = Igrp.getInstance().getRequest().getParameter("p_datasorce_app");
				if(Core.isNotNull(id)){
					rep.setId(Integer.parseInt(id));
					rep = rep.update();
				}else{
					rep = rep.insert();
				}
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("error",gt("Operação falhada"));
				return this.forward("igrp","DataSource","index&id_env="+model.getP_id_env());
			}
			if(rep!=null){
				Igrp.getInstance().getFlashMessage().addMessage("success",gt("Operação efetuada com sucesso"));
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("error",gt("Falha ao tentar efetuar esta operação"));	
				return this.forward("igrp","DataSource","index&id_env="+model.getP_id_env());			
			}
		}
		return this.redirect("igrp","DataSource","index&id_env="+model.getP_id_env());
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionFechar() throws IOException{
		/*----#START-PRESERVED-AREA(FECHAR)----*/		
		return this.redirect("igrp","DataSource","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	//Print data source in xml format
	public Response actionGetDataSource() throws IOException{
		String [] p_id = Igrp.getInstance().getRequest().getParameterValues("p_id");
		String p_template_id = Igrp.getInstance().getRequest().getParameter("p_template_id");
		XMLWritter xml = new XMLWritter();
		xml.startElement("rows");
		if(p_id!=null && p_id.length > 0){
			for(String id:p_id){
				xml.addXml(this.loadDataSource((int)Float.parseFloat(id),(p_template_id!=null && !p_template_id.equals(""))?(int)Float.parseFloat(p_template_id):0));
			}
		}
		xml.endElement();
		return this.renderView(xml.toString());
	}

	//Load data source
	private String loadDataSource(int id,int template_id) {
		RepSource rep = new RepSource().findOne(id);
		if(rep!=null){
			Set<Properties> columns = new HashSet<>();
			String title = rep.getName();
			if(rep.getType().equalsIgnoreCase("object") || rep.getType().equalsIgnoreCase("query")){
				String query = rep.getType_query();
				query = rep.getType().equalsIgnoreCase("object")?"SELECT * FROM "+query:query;
				columns = rep.getColumns(rep.getConfig_env(),template_id,query);
				return this.transformToXml(title,columns);
			}else if(rep.getType().equalsIgnoreCase("page")){
				Action ac = new Action();
				ac = ac.findOne(rep.getType_fk());
				String fileName = ac.getPage()+".xml";
				String basePath = Config.getBaseServerPahtXsl(ac);
				String content = FileHelper.readFile(basePath, fileName);
				int start = content.indexOf("<content");
				int end = content.indexOf("</rows>");
				content = (start!=-1 && end!=-1)?content.substring(start,end):"";
				return content;
			}
		}
		return null;
	}

	//Transform columns to xml
	private String transformToXml(String title,Set<Properties> columns) {
		XMLWritter xml = new XMLWritter();
		xml.startElement("content");
			xml.setElement("title", title);
			IGRPForm form = new IGRPForm("form");
			IGRPTable table = new IGRPTable("table");
			Iterator<Properties> listColumns = columns.iterator();
			while(listColumns.hasNext()){
				Properties p = listColumns.next();
				Field f = new TextField(null,p.getProperty("tag"));
				f.propertie().add("name",p.getProperty("tag"));
				f.propertie().add("key",p.getProperty("key"));
				form.addField(f);
				table.addField(f);
			}
			xml.addXml(form.toString());
			xml.addXml(table.toString());
		xml.endElement();
		return xml.toString();
	}
	
	/*----#END-PRESERVED-AREA----*/
}
