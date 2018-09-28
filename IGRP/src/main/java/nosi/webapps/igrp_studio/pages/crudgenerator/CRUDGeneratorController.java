package nosi.webapps.igrp_studio.pages.crudgenerator;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.core.gui.page.Page;
import java.io.File;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.xml.transform.TransformerConfigurationException;
import nosi.core.webapp.compiler.helpers.Compiler;
import nosi.core.webapp.databse.helpers.*;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.xml.XMLTransform;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Config_env;
import nosi.core.webapp.Igrp;
/*----#end-code----*/
		
public class CRUDGeneratorController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		CRUDGenerator model = new CRUDGenerator();
		model.load();
		model.setAdd_datasource("igrp_studio","ListaEnv","index");
		CRUDGeneratorView view = new CRUDGeneratorView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT 'check_table' as check_table,'table_name' as table_name "));
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.data_source.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.schema.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/	 
		model.setAdd_datasource("igrp","ConfigDatabase","index");     	 
      	view.schema.setVisible(false);
		view.aplicacao.setValue(new Application().getListApps());
		view.data_source.setValue(new Config_env().getListDSbyEnv(Core.toInt(model.getAplicacao(),-1)));			
		view.check_table.setLabel("");
		view.check_table_check.setLabel("");
      
		if(Core.isNotNull(model.getAplicacao())) {
			if(Core.isNotNull(model.getData_source())) {
				List<CRUDGenerator.Table_1> data = new ArrayList<>();    
				int i=1;
				Config_env config = new Config_env()
										.find()
										.andWhere("id","=",Core.toInt(model.getData_source(),-1))
										.andWhere("application", "=",Core.toInt(model.getAplicacao(),-1))
										.one();		
				Map<String,String> schemasMap = this.dmh.getSchemas(config );
			
				if(schemasMap.size() > 1){
					if(schemasMap.size() == 2) {
						model.setSchema(schemasMap.keySet().toArray()[1].toString());
					}
					view.schema.setVisible(true);
					view.schema.setValue(schemasMap);
					if(Core.isNotNull(model.getSchema())) {
						List<String> list = this.dmh.getTables(config,model.getSchema());
						for(String table:list) {
							CRUDGenerator.Table_1 t = new CRUDGenerator.Table_1();
							t.setCheck_table(i);
							t.setCheck_table_check(-1);
							t.setTable_name(table);
							data.add(t);
							i++;
						}
					}
				}else {
					List<String> list = this.dmh.getTables(config,null);
					for(String table:list) {
						CRUDGenerator.Table_1 t = new CRUDGenerator.Table_1();
						t.setCheck_table(i);
						t.setCheck_table_check(-1);
						t.setTable_name(table);
						data.add(t);
						i++;
					}
				}
				
				view.table_1.addData(data);
			}
			model.getAdd_datasource().addParam("p_aplicacao",model.getAplicacao());
		}
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGerar() throws IOException, IllegalArgumentException, IllegalAccessException{
		CRUDGenerator model = new CRUDGenerator();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp_studio","CRUDGenerator","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(gerar)----*/

		if(Igrp.getMethod().equalsIgnoreCase("post")){
	
			if(Core.isNotNull(model.getData_source()) && Core.isNotNull(model.getAplicacao())) {
		
				Config_env config = new Config_env()
						.find()
						.andWhere("id","=",Core.toInt(model.getData_source(),-1))
						.andWhere("application", "=",Core.toInt(model.getAplicacao(),-1))
						.one();	
				List<String> list = this.dmh.getTables(config,model.getSchema());
				String[] tables = Core.getParamArray("p_check_table");
				boolean r = false;
				if(tables!=null) {
					for(String table:tables) {
						String tableName = list.get(Integer.parseInt(table)-1);		                      
						try {
							r = this.generateCRUD(config,model.getSchema(),tableName);
						} catch (TransformerConfigurationException | URISyntaxException e) {
							// TODO Auto-generated catch block							
							e.printStackTrace();
						}
					}
					if(r) {
						Core.setMessageSuccess();
                      	return this.forward("igrp_studio","CRUDGenerator","index&p_aplicacao="+model.getAplicacao());
					}
					else {
						Core.setMessageError();
						return this.forward("igrp_studio","CRUDGenerator","index");
					}
					}
					else
					{
						Core.setMessageError("Escolha uma tabela.");
						
					}
				}
		}

		/*----#end-code----*/
		return this.redirect("igrp_studio","CRUDGenerator","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/
	
	private boolean generateCRUD(Config_env config,String schema, String tableName) throws TransformerConfigurationException, IOException, URISyntaxException {
		String pageNameForm = Page.resolvePageName(tableName)+"Form";
		String pageNameList = Page.resolvePageName(tableName)+"List";

		Action pageForm = new Action().find().andWhere("page", "=",pageNameForm).andWhere("application", "=",config.getApplication().getId()).one();
		Action pageList = new Action().find().andWhere("page", "=",pageNameList).andWhere("application", "=",config.getApplication().getId()).one();		
		
		if(pageForm==null) {
			pageForm = new Action(pageNameForm, "index", ("nosi.webapps."+config.getApplication().getDad()+".pages").toLowerCase(), (config.getApplication().getDad()+"/"+pageNameForm).toLowerCase()+"/"+pageNameForm+".xsl", "Registar "+tableName, "Registar "+tableName, "2.3", 1, config.getApplication());
			pageForm = pageForm.insert();

		}else {
			if(!pageForm.getPackage_name().endsWith(".pages")) {
				pageForm.setPackage_name(("nosi.webapps."+config.getApplication().getDad()+".pages").toLowerCase());
				pageForm = pageForm.update();
			}
		}
		if(pageList==null) {
			pageList = new Action(pageNameList, "index", ("nosi.webapps."+config.getApplication().getDad()+".pages").toLowerCase(), (config.getApplication().getDad()+"/"+pageNameList).toLowerCase()+"/"+pageNameList+".xsl", "Listar "+tableName, "Listar "+tableName, "2.3", 1, config.getApplication());
			pageList = pageList.insert();

		}else {
			if(!pageList.getPackage_name().endsWith(".pages")) {
				pageList.setPackage_name(("nosi.webapps."+config.getApplication().getDad()+".pages").toLowerCase());
				pageList = pageList.update();
			}
		}	
		boolean flag = false;
		
		try {
			 flag = this.processGenerate(config, tableName, schema, pageForm, pageList);
		}catch(Exception e) {
			pageList.delete(pageList.getId());	
			pageForm.delete(pageForm.getId());
			return false;
		} 					
		return flag;
	}

	private boolean processGenerate(Config_env config, String tableName, String schema, Action pageForm, Action pageList) throws IOException, TransformerConfigurationException, URISyntaxException {
		boolean r = false;
		List<DatabaseMetadaHelper.Column> columns = null;
		try {
			columns = this.dmh.getCollumns(config, schema, tableName);
		} catch (Exception e) {
			// TODO: handle exception
			Core.setMessageError(tableName+" error: "+e.getMessage());
			return false;
		}
		
		XMLTransform xml = new XMLTransform();
		String formXML = xml.genXML(xml.generateXMLForm(config, pageForm, columns,pageList),pageForm,"form",config.getName(),schema,tableName);
		String listXML = xml.genXML(xml.generateXMLTable(config, pageList, columns,pageForm),pageList,"table",config.getName(),schema,tableName);
		
		
		r = this.saveFiles(pageForm, pageForm.getPage()+".xml",formXML)		
			&& this.saveFiles(pageList, pageList.getPage()+".xml",listXML);		
		
		String xslFileNameFrom = this.getConfig().getLinkXSLGeneratorMCVForm();
		String xslFileNameList = this.getConfig().getLinkXSLGeneratorMCVList();
		String xslFileNameGen = this.getConfig().getLinkXSLGenerator_CRUD();
		String jsonFileName = this.getConfig().getLinkXSLJsonGenerator();
		String pathXslForm = this.getConfig().getCurrentBaseServerPahtXsl(pageForm)+File.separator+pageForm.getPage()+".xml";
		String pathXslList = this.getConfig().getCurrentBaseServerPahtXsl(pageList)+File.separator+pageList.getPage()+".xml";
		
		String formJson = XMLTransform.xmlTransformWithXSL(pathXslForm, jsonFileName);
		String listJson = XMLTransform.xmlTransformWithXSL(pathXslList, jsonFileName);
		
		String formMVC = XMLTransform.xmlTransformWithXSL(pathXslForm, xslFileNameFrom);
		String listMVC = XMLTransform.xmlTransformWithXSL(pathXslList, xslFileNameList);
		
		String xslForm = XMLTransform.xmlTransformWithXSL(pathXslForm, xslFileNameGen);
		String xslList = XMLTransform.xmlTransformWithXSL(pathXslList, xslFileNameGen);
		
		r = this.saveFiles(pageForm, pageForm.getPage()+".json",formJson)	
			&& this.saveFiles(pageList, pageList.getPage()+".json",listJson)
			&& this.saveFiles(pageForm, pageForm.getPage()+".xsl",xslForm) 
			&& this.saveFiles(pageList, pageList.getPage()+".xsl",xslList) 
			&& this.generateClassMVC(pageForm, formMVC)
			&& this.generateClassMVC(pageList, listMVC)
			&& this.processCompiler();
		return r;
	}


	private boolean processCompiler() {
		Compiler compiler = new Compiler();		
		File[] fs = new File[6];
		this.files.toArray(fs);
		compiler.compile(fs);
		return !compiler.hasError();
	}

	private boolean saveFiles(Action page,String fileName,String content) throws IOException {
		boolean r = false;
		if(content!=null) {
			content = content.replaceAll("<xsl:stylesheet xmlns:xsl=\"dim-red\" version=\"1.0\">", "<xsl:stylesheet xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\" version=\"1.0\">\r\n");
			String pathXsl = this.getConfig().getCurrentBaseServerPahtXsl(page);
			r = FileHelper.save(pathXsl, fileName, content);
			if(FileHelper.fileExists(this.getConfig().getWorkspace())){
				r = FileHelper.save(this.getConfig().getBasePahtXslWorkspace(page), fileName, content);
			}
		}
		return r;
	}
	
	private boolean generateClassMVC(Action page,String mvc) throws IOException, URISyntaxException {
		if(mvc!=null) {
			String[] partsJavaCode = mvc.toString().split(" END ");
			if(partsJavaCode.length > 2){
				String model = partsJavaCode[0];
				String view = partsJavaCode[1];
				String controller = partsJavaCode[2];
				String path_class = page.getPackage_name().trim()
						.replaceAll("(\r\n|\n)", "")
						.replace(".",File.separator)+File.separator+ page.getPage().toLowerCase().trim();
				Boolean workspace= this.getConfig().getWorkspace().equals("");
				String path_class_work_space = null;
				if(workspace)
					path_class_work_space = this.getConfig().getBasePahtClassWorkspace(page.getApplication().getDad(),page.getPage());
				path_class = this.getConfig().getBasePathClass()+ path_class;	
			
				
				boolean r = FileHelper.saveFilesJava(path_class, page.getPage(), new String[]{model,view,controller});
				
				if(workspace){
					if(!FileHelper.fileExists(path_class_work_space)){//check directory
						FileHelper.createDiretory(path_class_work_space);//create directory if not exist
					}
					r = FileHelper.saveFilesJava(path_class_work_space, page.getPage(), new String[]{model,view,controller});
				}
				String fileJava = path_class + File.separator + page.getPage();
				files.add(new File(fileJava+".java"));
				files.add(new File(fileJava+"View.java"));
				files.add(new File(fileJava+"Controller.java"));
				return r;
			}
		}
		return false;
	}
	private ArrayList<File> files = new ArrayList<>();
	private DatabaseMetadaHelper dmh = new DatabaseMetadaHelper();
	/*----#end-code----*/
}
