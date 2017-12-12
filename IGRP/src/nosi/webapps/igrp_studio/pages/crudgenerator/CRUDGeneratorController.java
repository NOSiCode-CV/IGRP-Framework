
package nosi.webapps.igrp_studio.pages.crudgenerator;

/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import nosi.core.config.Config;
import nosi.core.gui.page.Page;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Part;
import javax.xml.transform.TransformerConfigurationException;
import nosi.core.webapp.Response;
import nosi.core.webapp.databse.helpers.*;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.import_export.FileImportAppOrPage;
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
				List<String> list = DatabaseMetadaHelper.getTables(model.getSchema(),config);
				for(String table:list) {
					CRUDGenerator.Table_1 t = new CRUDGenerator.Table_1();
					t.setCheck_table(i);
					t.setCheck_table_check(i);
					t.setTable_name(table);
					data.add(t);
					i++;
				}
			}
		}else {
			List<String> list = DatabaseMetadaHelper.getTables(null,config);
			for(String table:list) {
				CRUDGenerator.Table_1 t = new CRUDGenerator.Table_1();
				t.setCheck_table(i);
				t.setCheck_table_check(i);
				t.setTable_name(table);
				data.add(t);
				i++;
			}
		}
		view.table_1.addData(data);
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionGerar() throws IOException, IllegalArgumentException, IllegalAccessException, TransformerConfigurationException{
		/*----#START-PRESERVED-AREA(GERAR)----*/
		CRUDGenerator model = new CRUDGenerator();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
			if( model.getData_source()!=null && model.getAplicacao()!=null) {
				Integer id = Integer.parseInt( model.getData_source());
				Config_env config = new Config_env().findOne(id);
				List<String> list = DatabaseMetadaHelper.getTables(model.getSchema(),config);
				String[] tables = Igrp.getInstance().getRequest().getParameterValues("p_check_table");
				for(String table:tables) {
					String tableName = list.get(Integer.parseInt(table)-1);
					System.out.println("Generate CRUD for Table: "+tableName);					
					this.generateCRUD(config,model.getSchema(),tableName);
				}
			}
		}
		return this.redirect("igrp_studio","CRUDGenerator","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	private void generateCRUD(Config_env config,String schema, String tableName) throws TransformerConfigurationException, IOException {
		String pageName = Page.resolvePageName(tableName);
		CRUD crud = new CRUD().find().andWhere("schemaName", "=", schema).andWhere("tableName", "=", tableName).andWhere("config_env", "=", config.getId()).one();
		if(crud==null) {
			crud = new CRUD(tableName, schema, config);
			crud = crud.insert();
		}
		Action pageForm = new Action().find().andWhere("page", "=",pageName+"Form").andWhere("application", "=",config.getApplication().getId()).one();
		Action pageList = new Action().find().andWhere("page", "=",pageName+"List").andWhere("application", "=",config.getApplication().getId()).one();
		if(pageForm==null) {
			pageForm = new Action(pageName+"Form", "index", "nosi.webapps."+config.getApplication().getDad().toLowerCase()+".pages."+pageName+"form".toLowerCase(), config.getApplication().getDad().toLowerCase()+"/"+pageName+"form".toLowerCase()+"/"+pageName+"Form.xsl", "Registar "+pageName, "Registar "+pageName, "2.3", 1, config.getApplication(), crud);
			pageForm = pageForm.insert();
		}
		if(pageList==null) {
			pageList = new Action(pageName+"List", "index", "nosi.webapps."+config.getApplication().getDad().toLowerCase()+".pages."+pageName+"list".toLowerCase(), config.getApplication().getDad().toLowerCase()+"/"+pageName+"List".toLowerCase()+"/"+pageName+"List.xsl", "Registar "+pageName, "Registar "+pageName, "2.3", 1, config.getApplication(), crud);
			pageList = pageList.insert();
		}		
		List<DatabaseMetadaHelper.Column> columns = DatabaseMetadaHelper.getCollumns(config, schema, tableName);
		String formXML = XMLTransform.genXML("", XMLTransform.generateXMLForm(config, tableName, columns),pageForm);
		String listXML = XMLTransform.genXML("", XMLTransform.generateXMLTable(config, tableName, columns),pageList);
		
		System.out.println(formXML);
		System.out.println(listXML);

		FileHelper.save(Config.getBaseServerPahtXsl(pageForm), pageName+"Form.xml", formXML);
		FileHelper.save(Config.getBaseServerPahtXsl(pageList), pageName+"List.xml", listXML);		
		if(FileHelper.fileExists(Config.getWorkspace())){
			FileHelper.save(Config.getBasePahtXsl(pageForm), pageName+"Form.xml", formXML);
			FileHelper.save(Config.getBasePahtXsl(pageList), pageName+"List.xml", listXML);	
		}
		String xslFileName = Config.getBasePathXsl()+"images/IGRP/IGRP2.3/core/formgen/util/plsql_import_to_java/XSL_GENERATOR.xsl";
		String formMVC = XMLTransform.xmlTransformWithXSL(Config.getBaseServerPahtXsl(pageForm)+File.separator+pageName+"Form.xml", xslFileName);
		String listMVC = XMLTransform.xmlTransformWithXSL(Config.getBaseServerPahtXsl(pageList)+File.separator+pageName+"List.xml", xslFileName);
		
		this.generateClassMVC(pageForm, formMVC);
		this.generateClassMVC(pageList, listMVC);
	}

	private void generateClassMVC(Action page,String mvc) throws IOException {
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
			
		}
	}

	/*----#END-PRESERVED-AREA----*/
}
