/**
 * @author: Emanuel Pereira
 * 15 Jun 2017
 */
/*Create Controller*/

package nosi.webapps.igrp.pages.datasource;

import nosi.core.webapp.Controller;
import java.io.IOException;
/*---- Import your packages here... ----*/
import nosi.core.gui.components.IGRPForm;
import nosi.core.gui.components.IGRPTable;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.TextField;
import nosi.core.config.Config;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.RepSource;
import nosi.webapps.igrp.dao.User;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Properties;
import java.util.Set;
/*---- End ----*/

public class DataSourceController extends Controller {		

	public Response actionIndex() throws IOException{		
		/*---- Insert your code here... ----*/		
		DataSource model = new DataSource();
		DataSourceView view = new DataSourceView(model);
		view.tipo.setValue(tipo);
		view.aplicacao.setValue(new Application().getListApps());
		//view.pagina.setValue(new Action().getListActions());
		view.pagina.setLookup("r=igrp/LookupListPage/index&amp;dad=igrp");
		Config.target = "_blank";
		return this.renderView(view);
		/*---- End ----*/
	}


	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/
		DataSource model = new DataSource();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
			RepSource rep = new RepSource();
			rep.setName(model.getNome());
			rep.setType(model.getTipo());
			rep.setType_name(tipo.get(model.getTipo()));
			rep.setType_query(model.getQuery());
			if(model.getTipo().equals("object")){
				rep.setType_query(model.getObjecto());
			}
			if(model.getTipo().equals("page")){				
				rep.setType_fk(/*Integer.parseInt(model.getPagina())*/2);
			}
			if(model.getTipo().equals("object") || model.getTipo().equals("query")){
				String query = rep.getType_query();
				query = rep.getType().equals("object")?"SELECT * FROM "+query:query;
				if(!rep.validateQuery(query)){
					Igrp.getInstance().getFlashMessage().addMessage("error","Query Invalido");
					return this.redirect("igrp","DataSource","index");
				}
			}
			Application app = new Application();
			app = app.findOne(Integer.parseInt(model.getAplicacao()));
			rep.setApplication(app);
			rep.setStatus(1);
			rep.setApplication_source(app);
			Date dt = new Date(System.currentTimeMillis());
			rep.setDt_created(dt);
			rep.setDt_updated(dt);
			User user = new User();
			user = user.findOne(Igrp.getInstance().getUser().getIdentity().getIdentityId());
			rep.setUser_created(user);
			rep.setUser_updated(user);
			if(rep.insert()!=null){
				Igrp.getInstance().getFlashMessage().addMessage("success","Operação efetuada com sucesso");
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("error","Falha ao tentar efetuar esta operação");				
			}
		}
		return this.redirect("igrp","DataSource","index");
		/*---- End ----*/
	}
	

	public Response actionFechar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","DataSource","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*/
	private static HashMap<String,String> tipo = new HashMap<>();
	static {
		//tipo.put("acti", "Etapa");
		tipo.put("object", "Objecto");
		tipo.put("page", "Paginas");
		//tipo.put("proc", "Processo");
		tipo.put("query", "Query");
		//tipo.put("serv", "Serviços");
	}
	
	//Print data source in xml format
	public PrintWriter actionGetDataSource() throws IOException{
		String [] p_id = Igrp.getInstance().getRequest().getParameterValues("p_id");
		String p_template_id = Igrp.getInstance().getRequest().getParameter("p_template_id");
		
		Igrp.getInstance().getResponse().setContentType("text/xml");
		String list ="<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>";
			   list += "<rows>\n";		
		if(p_id!=null && p_id.length > 0){
			for(String id:p_id){
				list += this.loadDataSource(Integer.parseInt(id),(p_template_id!=null && !p_template_id.equals(""))?Integer.parseInt(p_template_id):0);
			}
		}
		list +="</rows>";
		return Igrp.getInstance().getResponse().getWriter().append(list);
	}

	//Load data source
	private String loadDataSource(int id,int template_id) {
		RepSource rep = new RepSource();
		rep = rep.findOne(id);
		if(rep!=null){
			Set<Properties> columns = new HashSet<>();
			String title = rep.getName();
			if(rep.getType().equals("object") || rep.getType().equals("query")){
				String query = rep.getType_query();
				query = rep.getType().equals("object")?"SELECT * FROM "+query:query;
				columns = rep.getColumns(template_id,query);
				return this.transformToXml(title,columns);
			}else if(rep.getType().equals("page")){
				Action ac = new Action();
				ac = ac.findOne(rep.getType_fk());
				String fileName = ac.getPage()+".xml";
				String basePath =Config.getBasePathXsl()+Config.getResolvePathXsl(ac.getApplication().getDad(), ac.getPage(), ac.getVersion());
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
			IGRPForm form = new IGRPForm("form",(float)2.1);
			IGRPTable table = new IGRPTable("table",(float)2.1);
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
	
	/*---- End ----*/
}
