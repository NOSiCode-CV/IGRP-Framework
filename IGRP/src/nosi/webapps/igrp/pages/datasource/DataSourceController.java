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
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.RepSource;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map.Entry;
import java.util.Set;
/*---- End ----*/

public class DataSourceController extends Controller {		

	public void actionIndex() throws IOException{		
		/*---- Insert your code here... ----*/		
		DataSource model = new DataSource();
		DataSourceView view = new DataSourceView(model);
		view.tipo.setValue(tipo);
		view.aplicacao.setValue(new Application().getListApps());
		//view.pagina.setValue(new Action().getListActions());
		view.pagina.setLookup("r=igrp/LookupListPage/index&amp;dad=igrp");
		this.renderView(view);
		/*---- End ----*/
	}


	public void actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
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
				rep.setType_fk(Integer.parseInt(model.getPagina()));
			}
			if(model.getTipo().equals("object") || model.getTipo().equals("query")){
				String query = rep.getType_query();
				query = rep.getType().equals("object")?"SELECT * FROM "+query:query;
				if(!rep.validateQuery(query)){
					Igrp.getInstance().getFlashMessage().addMessage("error","Query Invalido");
					this.redirect("igrp","DataSource","index");
					return;
				}
			}
			rep.setEnv_fk(model.getAplicacao());
			rep.setStatus(1);
			rep.setEnv_fk_source(model.getAplicacao());
			Date dt = new Date(System.currentTimeMillis());
			rep.setDt_created(dt);
			rep.setDt_updated(dt);
			rep.setUser_created_fk(Igrp.getInstance().getUser().getIdentity().getIdentityId());
			rep.setUser_updated_fk(Igrp.getInstance().getUser().getIdentity().getIdentityId());
			if(rep.insert()){
				Igrp.getInstance().getFlashMessage().addMessage("success","Operação efetuada com sucesso");
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("error","Falha ao tentar efetuar esta operação");				
			}
		}
		this.redirect("igrp","DataSource","index");
		/*---- End ----*/
	}
	

	public void actionFechar() throws IOException{
		/*---- Insert your code here... ----*/
		this.redirect("igrp","DataSource","index");
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
		rep.setId(id);
		rep = (RepSource) rep.getOne();
		if(rep!=null){
			HashMap<String,Boolean> columns = new HashMap<>();
			String title = rep.getName();
			if(rep.getType().equals("object") || rep.getType().equals("query")){
				String query = rep.getType_query();
				query = rep.getType().equals("object")?"SELECT * FROM "+query:query;
				columns = rep.getSqlColumns(template_id,query);
				return this.transformToXml(title,columns);
			}else if(rep.getType().equals("page")){
				Action ac = new Action();
				ac.setId(rep.getType_fk());
				ac = (Action) ac.getOne();
				String fileName = ac.getPage()+".xml";
				String basePath =Config.getBasePathXsl()+Config.getResolvePathXsl(ac.getEnv().getDad(), ac.getPage(), ac.getVersion());
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
	private String transformToXml(String title,HashMap<String, Boolean> columns) {
		XMLWritter xml = new XMLWritter();
		xml.startElement("content");
			xml.setElement("title", title);
			IGRPForm form = new IGRPForm("form",(float)2.1);
			Set<Entry<String,Boolean>> cols = columns.entrySet();
			IGRPTable table = new IGRPTable("table",(float)2.1);
			for(Entry<String,Boolean> c:cols){
				Field f = new TextField(null,c.getKey());
				f.propertie().add("name",c.getKey().toLowerCase());
				if(c.getValue())
					f.propertie().add("key", "true");
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
