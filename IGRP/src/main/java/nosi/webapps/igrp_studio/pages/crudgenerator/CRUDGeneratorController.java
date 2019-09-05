package nosi.webapps.igrp_studio.pages.crudgenerator;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
import nosi.core.config.Config;
/* Start-Code-Block (import) */
/* End-Code-Block */
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
import nosi.core.webapp.helpers.CheckBoxHelper;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.dao_helper.GerarClasse;
import nosi.core.webapp.helpers.dao_helper.SaveMapeamentoDAO;
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
		model.setAdd_datasource_botton("igrp_studio","ListaPage","index");
		CRUDGeneratorView view = new CRUDGeneratorView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT '1' as check_table,'Iste unde mollit perspiciatis' as table_name "));
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.data_source.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.schema.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/	 
		
		model.setAdd_datasource_botton("igrp","ConfigDatabase","index");
		view.aplicacao.setValue(new Application().getListApps());
		view.btn_gerar_dao.setLink("index&dao_boo=true&dad_id="+model.getAplicacao());
		
		List<String> list_table = null;
		
		if(Core.isNotNull(model.getAplicacao())) {
			
			final Map<Object, Object> listDSbyEnv = new Config_env().getListDSbyEnv(Core.toInt(model.getAplicacao()));
			view.data_source.setValue(listDSbyEnv);
			
			if(Core.isNotNull(model.getData_source())) {
				
				Config_env config = new Config_env().find()
													.andWhere("id","=",Core.toInt(model.getData_source()))
													.andWhere("application", "=",Core.toInt(model.getAplicacao()))
													.one();	
				Map<String,String> schemasMap = DatabaseMetadaHelper.getSchemas(config);
				view.schema.setValue(schemasMap);
				
				if(Core.isNotNull(model.getSchema())) {
					list_table = DatabaseMetadaHelper.getTables(config,model.getSchema());
					List<CRUDGenerator.Table_1> list_tb = new ArrayList<>();
					int i =1;
					for(String li : list_table) {
						CRUDGenerator.Table_1 tb = new CRUDGenerator.Table_1();
						
						tb.setTable_name(li);
						tb.setCheck_table(i);
						tb.setCheck_table_check(-1);
						i++;
						list_tb.add(tb);
					}
					model.setTable_1(list_tb);
					
					//action gerar --- put here to aproveitar a list_table
					String[] rows_id = Core.getParamArray("p_check_table_fk");
					String[] p_checkbox_check = Core.getParamArray( "p_check_table_check_fk" );
					

					if(Core.isNotNull(p_checkbox_check) && Core.isNotNull(rows_id) && Core.getParam("dao_boo").equals("true")) {
						
						CheckBoxHelper cbh = Core.extractCheckBox(rows_id, p_checkbox_check); 
						if(Core.isNotNull(cbh)) {
							boolean r = false;
							for(String id_ch : cbh.getChekedIds()) {
								String tableName = list_table.get(Integer.parseInt(id_ch)-1);
								String dad_name = new Application().findOne(Core.toInt(model.getAplicacao())).getDad();
								r = this.generateDAO(config,model.getSchema(),tableName, dad_name);
							}
							
							if(r) {
								Core.setMessageSuccess("Classe DAO gerado sucesso!");
								
							}
							else {
								Core.setMessageError();
							}
						}
					}
					/* --  FIM ACTION GERAR  --*/
					
				}
			model.getAdd_datasource_botton().addParam("p_aplicacao",model.getAplicacao());
			}
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
		  return this.forward("igrp_studio","CRUDGenerator","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(gerar)----*/

		if(Igrp.getMethod().equalsIgnoreCase("post")){
	
			if(Core.isNotNull(model.getData_source()) && Core.isNotNull(model.getAplicacao())) {
		
				Config_env config = new Config_env()
						.find()
						.andWhere("id","=",Core.toInt(model.getData_source(),-1))
						.andWhere("application", "=",Core.toInt(model.getAplicacao(),-1))
						.one();	
				List<String> list = DatabaseMetadaHelper.getTables(config,model.getSchema());
				
				String[] rows_id = Core.getParamArray("p_check_table_fk");
				String[] p_checkbox_check = Core.getParamArray( "p_check_table_check_fk" );
				
				boolean r = false;
				if(Core.isNotNull(p_checkbox_check) && Core.isNotNull(rows_id)) {
					CheckBoxHelper cbh = Core.extractCheckBox(rows_id, p_checkbox_check);
					if(cbh!=null) {
						for(String table:cbh.getChekedIds()) {
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
							Core.setMessageWarning("Escolha uma tabela.");
							
						}
					}
				
			}
		}
		this.addQueryString("dao_boo","false");
		/*----#end-code----*/
		return this.redirect("igrp_studio","CRUDGenerator","index", this.queryString());	
	}
	
	public Response actionGerar_dao() throws IOException, IllegalArgumentException, IllegalAccessException{
		CRUDGenerator model = new CRUDGenerator();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp_studio","CRUDGenerator","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(gerar_dao)----*/
		return this.forward("igrp_studio","Daogenerator","index",this.queryString());
		
		/*----#end-code----*/
			
	}
	
		
		
/*----#start-code(custom_actions)----*/
	
	
	
	/********************* METODO USADOS PARA GERAR CRUD *********************/
	private Compiler compiler = new Compiler();
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
			columns = DatabaseMetadaHelper.getCollumns(config, schema, tableName);
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
		this.compiler.compile();
		return !this.compiler.hasError();
	}

	private boolean saveFiles(Action page,String fileName,String content_) throws IOException {
		boolean r = false;
		String content = content_;
		if(content!=null) {
			content = content.replaceAll("<xsl:stylesheet xmlns:xsl=\"dim-red\" version=\"1.0\">", "<xsl:stylesheet xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\" version=\"1.0\">\r\n");
			String pathXsl = this.getConfig().getCurrentBaseServerPahtXsl(page);
			r = FileHelper.save(pathXsl, fileName, content);
			if(Core.isNotNull(this.getConfig().getWorkspace()) && FileHelper.fileExists(this.getConfig().getWorkspace())){
				r = FileHelper.save(this.getConfig().getBasePahtXslWorkspace(page), fileName, content);
			}
		}
		return r;
	}
	
	private boolean generateClassMVC(Action page,String mvc) throws IOException, URISyntaxException {
		if(mvc!=null) {
			String[] partsJavaCode = mvc.toString().split(" END ");
			if(partsJavaCode.length > 2){
				String model = partsJavaCode[0]+"*/";
				String view = "/*"+partsJavaCode[1]+"*/";
				String controller = "/*"+partsJavaCode[2];
				String path_class = page.getPackage_name().trim()
						.replaceAll("(\r\n|\n)", "")
						.replace(".",File.separator)+File.separator+ page.getPage().toLowerCase().trim();
				boolean workspace= Core.isNotNull(this.getConfig().getWorkspace());
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
				this.compiler.addFileName(fileJava+".java");
				this.compiler.addFileName(fileJava+"View.java");
				this.compiler.addFileName(fileJava+"Controller.java");
				return r;
			}
		}
		return false;
	}
	/********************* FIM METODO USADOS PARA GERAR CRUD *********************/
	
	
	
	
	/********************* METODO USADOS PARA GERAR DAO *********************/
	

	//resolver o problema do nome da tabela
	public String resolveDAOName(String tabela_name) {
		String dao_name_class = "";
		for(String aux : tabela_name.split("_")){
			dao_name_class += aux.substring(0, 1).toUpperCase() + aux.substring(1).toLowerCase();
		}
		return dao_name_class;
	}
	
	
	public boolean  generateDAO(Config_env config,String schema, String tableName, String dad_name) throws IOException{ 
		boolean flag = false;
		String dao_name_class = resolveDAOName(tableName);
		flag = processGenerate(config, dao_name_class, schema,tableName, dad_name);
		return flag;
	}
	

	public boolean processGenerate(Config_env config, String dao_name_class, String schema, String tableName, String dad_name) {
		boolean flag = false;
		boolean flag_compile = false;
		List<DatabaseMetadaHelper.Column> columns = null;
		try {
			
			//Mas antes temos de vereficar se a classe é nova ou nao
			if(!Core.fileExists(new  Config().getPathDAO(dad_name)+dao_name_class+".java")) {
				//Aqui guarda novo configuracao de hibernate
				String package_name = "nosi.webapps." + config.getApplication().getDad().toLowerCase() + ".dao";
				SaveMapeamentoDAO.loadCfg(config.getName()+"."+config.getApplication().getDad()+".cfg.xml",package_name,dao_name_class);
			}
			
			columns = DatabaseMetadaHelper.getCollumns(config, schema, tableName);
			

			//Salvar os files de classe DAO vazio
			flag = saveFiles(dao_name_class+".java", "", new Config().getPathDAO(dad_name));
			
			//Gerar conteudo da classe DAO
			String content = new GerarClasse().gerarCode(dad_name,tableName,dao_name_class, columns,schema,config);
			
			//Salvar os files de classe DAO
			flag = saveFiles(dao_name_class+".java", content, new Config().getPathDAO(dad_name));
			
			//compilar as classes DAO
			Compiler compiler = new Compiler();
			compiler.addFileName(new Config().getPathDAO(dad_name)+File.separator+dao_name_class+".java");
			compiler.compile();
			flag_compile = compiler.hasError();
			
			if(flag_compile) {
				Core.setMessageWarning("Ups... Erro na compilção na classe "+dao_name_class);
			}
			
		} catch (Exception e) {
			Core.setMessageError(tableName+" error: "+e.getMessage());
			return false;
		}
		
		return flag;
	}
	
	public boolean saveFiles(String fileName,String content,String path) throws IOException {
		boolean flag = false;
		if(Core.isNotNull(content)) {
			flag = FileHelper.save(path, fileName, content);
		}
		return flag;
	}
	
	/******************** FIM METODO USADOS PARA GERAR DAO *******************/
	
	
	/*----#end-code----*/
}
