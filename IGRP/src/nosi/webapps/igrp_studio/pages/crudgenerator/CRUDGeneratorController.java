
package nosi.webapps.igrp_studio.pages.crudgenerator;
import nosi.core.config.Config;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.xml.transform.TransformerConfigurationException;
import nosi.core.webapp.Response;
import nosi.core.webapp.databse.helpers.*;
import nosi.core.xml.XMLTransform;
import nosi.webapps.igrp.dao.Application;
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
	
	private void generateCRUD(Config_env config,String schema, String tableName) throws TransformerConfigurationException {
		String path_xsl = Config.getBasePathXsl()+"images/IGRP/IGRP2.3/core/formgen/util/plsql_import_to_java/XSL_GENERATOR.xsl";
		List<DatabaseMetadaHelper.Column> columns = DatabaseMetadaHelper.getCollumns(config, schema, tableName);
		String formXML = XMLTransform.genXML(path_xsl, XMLTransform.generateXMLForm(config, tableName, columns));
		String tableXML = XMLTransform.genXML(path_xsl, XMLTransform.generateXMLTable(config, tableName, columns));
		String xslFileName = "";
		String formMVC = XMLTransform.xmlTransformWithXSL(formXML, xslFileName);
		String tableMVC = XMLTransform.xmlTransformWithXSL(tableXML, xslFileName);
		System.out.println(formXML);
		System.out.println(tableXML);
	}

	

	/*----#END-PRESERVED-AREA----*/
}
