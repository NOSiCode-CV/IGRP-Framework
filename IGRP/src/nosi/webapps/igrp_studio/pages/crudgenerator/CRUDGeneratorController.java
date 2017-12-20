
package nosi.webapps.igrp_studio.pages.crudgenerator;

/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.config.Config;
import nosi.core.gui.page.Page;
import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.xml.transform.TransformerConfigurationException;
import nosi.core.webapp.Response;
import nosi.core.webapp.compiler.helpers.Compiler;
import nosi.core.webapp.databse.helpers.*;
import nosi.core.webapp.databse.helpers.DatabaseMetadaHelper.Column;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.xml.XMLTransform;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.CRUD;
import nosi.webapps.igrp.dao.Config_env;
import nosi.core.webapp.Igrp;
/*----#END-PRESERVED-AREA----*/

public class CRUDGeneratorController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		List<CRUDGenerator.Table_1> data = new ArrayList<>();
		CRUDGenerator model = new CRUDGenerator();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
		}		
		CRUDGeneratorView view = new CRUDGeneratorView(model);
		view.schema.setVisible(false);
		view.aplicacao.setValue(new Application().getListApps());
		view.data_source.setValue(new Config_env().getListEnv(model.getAplicacao()!=null && !model.getAplicacao().equals("")?Integer.parseInt(model.getAplicacao()):-1));
		view.check_table.setLabel("");
		view.check_table_check.setLabel("");
		int i=1;
		Config_env config = new Config_env().findOne((model.getData_source()!=null && !model.getData_source().equals(""))?Integer.parseInt(model.getData_source()):-1);
		Map<String,String> schemasMap = DatabaseMetadaHelper.getSchemas(config );
		if(schemasMap.size() > 0){
			view.schema.setVisible(true);
			view.schema.setValue(schemasMap);
			if(model.getSchema()!=null && !model.getSchema().equals("")) {
				List<String> list = DatabaseMetadaHelper.getTables(config,model.getSchema());
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
			List<String> list = DatabaseMetadaHelper.getTables(config,null);
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
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionGerar() throws IOException, IllegalArgumentException, IllegalAccessException, TransformerConfigurationException, URISyntaxException{
		/*----#START-PRESERVED-AREA(GERAR)----*/
		CRUDGenerator model = new CRUDGenerator();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
			if( model.getData_source()!=null && model.getAplicacao()!=null) {
				Integer id = Integer.parseInt( model.getData_source());
				Config_env config = new Config_env().findOne(id);
				List<String> list = DatabaseMetadaHelper.getTables(config,model.getSchema());
				String[] tables = Igrp.getInstance().getRequest().getParameterValues("p_check_table");
				boolean r = false;
				for(String table:tables) {
					String tableName = list.get(Integer.parseInt(table)-1);					
					r = this.generateCRUD(config,model.getSchema(),tableName);
				}
				if(r) {
					Core.setMessageSuccess();
				}
				else {
					Core.setMessageError();
					return this.forward("igrp_studio","CRUDGenerator","index");
				}
			}
		}
		return this.redirect("igrp_studio","CRUDGenerator","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	private boolean generateCRUD(Config_env config,String schema, String tableName) throws TransformerConfigurationException, IOException, URISyntaxException {
		Column primaryKey = DatabaseMetadaHelper.getPrimaryKey(config, schema, tableName);
		String pageNameForm = Page.resolvePageName(tableName)+"Form";
		String pageNameList = Page.resolvePageName(tableName)+"List";
		CRUD crud = new CRUD().find().andWhere("schemaName", "=", schema).andWhere("tableName", "=", tableName).andWhere("config_env", "=", config.getId()).one();
		if(crud==null) {
			crud = new CRUD(tableName, schema, config);
			crud = crud.insert();
		}
		Action pageForm = new Action().find().andWhere("page", "=",pageNameForm).andWhere("application", "=",config.getApplication().getId()).one();
		Action pageList = new Action().find().andWhere("page", "=",pageNameList).andWhere("application", "=",config.getApplication().getId()).one();
		if(pageForm==null) {
			pageForm = new Action(pageNameForm, "index", ("nosi.webapps."+config.getApplication().getDad()+".pages."+pageNameForm).toLowerCase(), (config.getApplication().getDad()+"/"+pageNameForm).toLowerCase()+"/"+pageNameForm+".xsl", "Registar "+tableName, "Registar "+tableName, "2.3", 1, config.getApplication(), crud);
			pageForm = pageForm.insert();
		}
		if(pageList==null) {
			pageList = new Action(pageNameList, "index", ("nosi.webapps."+config.getApplication().getDad()+".pages."+pageNameList).toLowerCase(), (config.getApplication().getDad()+"/"+pageNameList).toLowerCase()+"/"+pageNameList+".xsl", "Listar "+tableName, "Listar "+tableName, "2.3", 1, config.getApplication(), crud);
			pageList = pageList.insert();
		}		
		return this.processGenerate(config,tableName,schema,primaryKey,pageForm,pageList);
	}

	private boolean processGenerate(Config_env config, String tableName, String schema, Column primaryKey, Action pageForm, Action pageList) throws IOException, TransformerConfigurationException, URISyntaxException {
		boolean r = false;
		List<DatabaseMetadaHelper.Column> columns = DatabaseMetadaHelper.getCollumns(config, schema, tableName);
		String formXML = XMLTransform.genXML(XMLTransform.generateXMLForm(config, pageForm, columns,pageList),pageForm,primaryKey,"form");
		String listXML = XMLTransform.genXML(XMLTransform.generateXMLTable(config, pageList, columns,pageForm,primaryKey),pageList,primaryKey,"table");
		
		r = this.saveFiles(pageForm, pageForm.getPage()+".xml",formXML)		
			&& this.saveFiles(pageList, pageList.getPage()+".xml",listXML);		
		
		String xslFileName = Config.getBasePathXsl()+"images/IGRP/IGRP2.3/core/formgen/util/plsql_import_to_java/XSL_GENERATOR.xsl";
		String xslFileNameGen = Config.getBasePathXsl()+"images/IGRP/IGRP2.3/core/formgen/util/GEN.CRUD.xsl";
		String jsonFileName = Config.getBasePathXsl()+"images/IGRP/IGRP2.3/core/formgen/util/GEN.JSON.xsl";
		String pathXslForm = Config.getBasePathXsl()+Config.getResolvePathXsl(pageForm)+File.separator+pageForm.getPage()+".xml";
		String pathXslList = Config.getBasePathXsl()+Config.getResolvePathXsl(pageList)+File.separator+pageList.getPage()+".xml";
		
		String formJson = XMLTransform.xmlTransformWithXSL(pathXslForm, jsonFileName);
		String listJson = XMLTransform.xmlTransformWithXSL(pathXslList, jsonFileName);
		
		String formMVC = XMLTransform.xmlTransformWithXSL(pathXslForm, xslFileName);
		String listMVC = XMLTransform.xmlTransformWithXSL(pathXslList, xslFileName);
	
		String xslForm = XMLTransform.xmlTransformWithXSL(pathXslForm, xslFileNameGen);
		String xslList = XMLTransform.xmlTransformWithXSL(pathXslList, xslFileNameGen);
		
		r = this.saveFiles(pageForm, pageForm.getPage()+".json",formJson)	
			&& this.saveFiles(pageList, pageList.getPage()+".json",listJson)
			&& this.saveFiles(pageForm, pageForm.getPage()+".xsl",xslForm) 
			&& this.saveFiles(pageList, pageList.getPage()+".xsl",xslList) 
			&& this.generateClassMVC(pageForm, formMVC)
			&& this.generateClassMVC(pageList, listMVC);
		return r;
	}


	private boolean saveFiles(Action page,String fileName,String content) throws IOException {
		boolean r = false;
		if(content!=null) {
			content = content.replaceAll("<xsl:stylesheet xmlns:xsl=\"dim-red\" version=\"1.0\">", "<xsl:stylesheet xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\" version=\"1.0\">\r\n");
			String pathXsl = Config.getBasePathXsl()+Config.getResolvePathXsl(page);
			r = FileHelper.save(pathXsl, fileName, content);
			if(FileHelper.fileExists(Config.getWorkspace())){
				r = FileHelper.save(Config.getBasePahtXsl(page), fileName, content);
			}
		}
		return r;
	}
	
	private boolean generateClassMVC(Action page,String mvc) throws IOException, URISyntaxException {
		String[] partsJavaCode = mvc.toString().split(" END ");
		if(partsJavaCode.length > 2){
			String model = partsJavaCode[0];
			String view = partsJavaCode[1];
			String controller = partsJavaCode[2];
			String path_class = page.getPackage_name().replace(".",File.separator);
			String path_class_work_space = Config.getWorkspace() + File.separator+"src"+File.separator+ path_class;
			path_class = Config.getBasePathClass()+ path_class;			
			FileHelper.saveFilesJava(path_class, page.getPage(), new String[]{model,view,controller});
			
			if(FileHelper.fileExists(Config.getWorkspace())){
				if(!FileHelper.fileExists(path_class_work_space)){//check directory
					FileHelper.createDiretory(path_class_work_space);//create directory if not exist
				}
				FileHelper.saveFilesJava(path_class_work_space, page.getPage(), new String[]{model,view,controller});
			}
			String fileJava = path_class + File.separator + page.getPage();
			return new Compiler().compile(new File[] {new File(fileJava+".java"),new File(fileJava+"View.java"),new File(fileJava+"Controller.java")});
		}
		return false;
	}

	/*----#END-PRESERVED-AREA----*/
}
