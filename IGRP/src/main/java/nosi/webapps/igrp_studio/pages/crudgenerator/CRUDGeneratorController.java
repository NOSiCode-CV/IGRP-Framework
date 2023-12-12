package nosi.webapps.igrp_studio.pages.crudgenerator;

import nosi.core.webapp.Controller;//
import nosi.core.webapp.databse.helpers.ResultSet;//
import nosi.core.webapp.databse.helpers.QueryInterface;//
import java.io.IOException;//
import nosi.core.webapp.Core;//
import nosi.core.webapp.Response;//
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.HashSet;
import javax.xml.transform.TransformerConfigurationException;
import java.io.File;
import java.util.ArrayList;
import nosi.core.config.Config;
import nosi.core.gui.page.Page;
import nosi.core.webapp.compiler.helpers.Compiler;
import nosi.core.webapp.databse.helpers.DatabaseMetadaHelper;
import nosi.core.webapp.helpers.CheckBoxHelper;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.dao_helper.DaoDto;
import nosi.core.webapp.helpers.dao_helper.GerarClasse;
import nosi.core.webapp.helpers.dao_helper.SaveMapeamentoDAO;
import nosi.core.webapp.security.EncrypDecrypt;
import nosi.core.xml.XMLTransform;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Config_env;
import java.util.LinkedHashMap;
/*----#end-code----*/
		
public class CRUDGeneratorController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		CRUDGenerator model = new CRUDGenerator();
		model.load();
		CRUDGeneratorView view = new CRUDGeneratorView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT '1' as check_table,'Sit elit perspiciatis unde rem' as table_name "));
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.data_source.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.schema.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.table_type.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.form_2_radiolist_1.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/* Start-Code-Block (index) *//* End-Code-Block (index) */
		/*----#start-code(index)----*/
		
		try {
			
			final Map<String, String> daoCrudOptions = new LinkedHashMap<>();
			daoCrudOptions.put("dao", "DAO");
			daoCrudOptions.put("crud", "CRUD");
			view.form_2_radiolist_1.setValue(daoCrudOptions);

			view.btn_add_datasource.setLink("igrp", "ConfigDatabase", "index");
			view.aplicacao.setValue(new Application().getListApps());
			view.table_type.setValue(DatabaseMetadaHelper.getTableTypeOptions());
			view.check_table.propertie().add("maxlength", 100);
			view.check_table_check.propertie().add("maxlength", 100);
			view.documento.setValue("https://docs.igrp.cv/IGRP/app/webapps?r=tutorial/Listar_documentos/index&dad=tutorial&target=_blank&isPublic=1&lang=pt_PT&p_type=crud");
			view.forum.setValue("https://gitter.im/igrpweb/crud_dao_generator?utm_source=share-link&utm_medium=link&utm_campaign=share-link");
			
			if (Core.isNotNull(model.getAplicacao())) {
				
				final Map<Object, Object> datasourceByEnv = new Config_env().getListDSbyEnv(Core.toInt(model.getAplicacao()));
				
				if (datasourceByEnv.size() == 2)
					datasourceByEnv.remove(null);
					
				view.data_source.setValue(datasourceByEnv);

				if (Core.isNotNull(model.getData_source())) {

					Config_env config = new Config_env().find().andWhere("id", "=", Core.toInt(model.getData_source()))
							.andWhere("application.id", "=", Core.toInt(model.getAplicacao())).one();
					if(config!=null) {
						
							Map<String, String> schemasMap = DatabaseMetadaHelper.getSchemas(config);
							if (schemasMap.size() == 2)
								schemasMap.remove(null);
							else
								model.setSchema(Core.decrypt(config.getUsername(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB));

							view.schema.setValue(schemasMap);

							this.fillTable(model, config);
						
					}
					
				}else
					model.setSchema(null);
			}
		} catch (Exception e) {
			model.setTable_1(new ArrayList<>());
			
		//	model.getTable_1().add(row);
			
			//e.printStackTrace();
		}
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionAdd_datasource() throws IOException, IllegalArgumentException, IllegalAccessException{
		CRUDGenerator model = new CRUDGenerator();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp_studio","ListaPage","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (add_datasource)  *//* End-Code-Block  */
		/*----#start-code(add_datasource)----*/

		/*----#end-code----*/
		return this.redirect("igrp_studio","ListaPage","index", this.queryString());	
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
		/* Start-Code-Block (gerar)  *//* End-Code-Block  */
		/*----#start-code(gerar)----*/

		if (Core.isNotNullMultiple(model.getData_source(), model.getAplicacao())) {

			Config_env config = new Config_env().find().andWhere("id", "=", Core.toInt(model.getData_source(), -1))
					.andWhere("application.id", "=", Core.toInt(model.getAplicacao(), -1)).one();

			String[] rowsId = Core.getParamArray("p_check_table_fk");
			String[] pCheckboxCheck = Core.getParamArray("p_check_table_check_fk");

			boolean r = false;
			if (Core.isNotNull(pCheckboxCheck) && Core.isNotNull(rowsId)) {
				CheckBoxHelper cbh = Core.extractCheckBox(rowsId, pCheckboxCheck);
				if (cbh.getChekedIds().isEmpty()) {
					Core.setMessageWarning("<strong> Deve escolher pelo menos uma tabela! </strong>");
					return this.renderView(new CRUDGeneratorView());
				}
				for (String tableName : cbh.getChekedIds()) {
					try {
						r = this.generateCRUD(config, model.getSchema(), tableName);
					} catch (TransformerConfigurationException e) {
						e.printStackTrace();
					}
				}
				if (r) {
					Core.setMessageSuccess();
				} else {
					Core.setMessageError();
				}
			}
		}
		//return this.renderView(new CRUDGeneratorView());
		  return this.forward("igrp_studio","CRUDGenerator","index",this.queryString()); //if submit, loads the values
						
		/*----#end-code----*/
			
	}
	
	public Response actionGerar_dao() throws IOException, IllegalArgumentException, IllegalAccessException{
		CRUDGenerator model = new CRUDGenerator();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp_studio","ListaEnv","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (gerar_dao)  *//* End-Code-Block  */
		/*----#start-code(gerar_dao)----*/

		final String[] rowsId = Core.getParamArray("p_check_table_fk");
		final String[] pCheckboxCheck = Core.getParamArray("p_check_table_check_fk");

		if (Core.isNotNullMultiple(pCheckboxCheck, rowsId)) {
			
			final CheckBoxHelper checkBoxHelper = Core.extractCheckBox(rowsId, pCheckboxCheck);
			
			if (checkBoxHelper.getChekedIds().isEmpty()) {
				Core.setMessageWarning("<strong> Deve escolher pelo menos uma tabela! </strong>");
				return this.renderView(new CRUDGeneratorView());
			}
			
			final Config_env configEnv = new Config_env().find().andWhere("id", "=", Core.toInt(model.getData_source(), -1))
					.andWhere("application.id", "=", Core.toInt(model.getAplicacao(), -1)).one();
			
			final String dadName = configEnv.getApplication().getDad();
						
			final String daoPackageName = NOSI_WEBAPPS + dadName.toLowerCase() + ".dao";
			
			final Set<String> daoMappings = new HashSet<>();
			
			for (String tableName : checkBoxHelper.getChekedIds()) {
				final DaoDto daoDto = new DaoDto();
				daoDto.setConfigEnv(configEnv);
				daoDto.setSchema(model.getSchema());
				daoDto.setDadName(dadName);
				daoDto.setHasList(false);
				daoDto.setContentList("");
				daoDto.setContentListSetGet("");
				daoDto.setTableType(model.getTable_type());
				daoDto.setTableName(tableName);
				daoDto.setDaoClassName(GerarClasse.convertCase(tableName, true));
				
				if (this.generateDAO(daoDto)) 
					daoMappings.add(daoPackageName + "." + daoDto.getDaoClassName());
			}
			
			final String hibernateConfigFileName = configEnv.getName() + "." + dadName + ".cfg.xml";
					
			SaveMapeamentoDAO.saveMappings(hibernateConfigFileName, daoMappings);

			Core.setMessageSuccess();
			if ("view".equals(model.getTable_type()))
				Core.setMessageWarning("Consider adding identifier/primary key(@Id) annotation for your views!");
			
		}
		/* -- FIM ACTION GERAR -- */

	//	return this.renderView(new CRUDGeneratorView());
		  return this.forward("igrp_studio","CRUDGenerator","index",this.queryString()); //if submit, loads the values
						
		/*----#end-code----*/
			
	}
	/* Start-Code-Block (custom-actions)  *//* End-Code-Block  */
/*----#start-code(custom_actions)----*/
	
	private void fillTable(CRUDGenerator model, Config_env config) {
		List<String> tables = DatabaseMetadaHelper.getTables(config, model.getSchema(), model.getTable_type());
		model.setTable_1(new ArrayList<>());
		for (String tableName : tables) {
			CRUDGenerator.Table_1 row = new CRUDGenerator.Table_1();
			row.setTable_name(tableName);
			row.setCheck_table(tableName);
			row.setCheck_table_check("-1");
			model.getTable_1().add(row);
		}
	}

	/********************* METODO USADOS PARA GERAR CRUD *********************/
	private Compiler compiler = new Compiler();

	private boolean generateCRUD(Config_env config, String schema, String tableName)
			throws TransformerConfigurationException, IOException {
		String pageNameForm = Page.resolvePageName(tableName) + "Form";
		String pageNameList = Page.resolvePageName(tableName) + "List";

		Action pageForm = new Action().find().andWhere("page", "=", pageNameForm)
				.andWhere("application", "=", config.getApplication().getId()).one();
		Action pageList = new Action().find().andWhere("page", "=", pageNameList)
				.andWhere("application", "=", config.getApplication().getId()).one();

		if (pageForm == null) {
			pageForm = new Action(pageNameForm, "index",
					(NOSI_WEBAPPS + config.getApplication().getDad() + PAGES).toLowerCase(),
					(config.getApplication().getDad() + "/" + pageNameForm).toLowerCase() + "/" + pageNameForm + ".xsl",
					"Registar " + tableName, "Registar " + tableName, Config.DEFAULT_V_PAGE, 1, config.getApplication());
			pageForm = pageForm.insert();

		} else {
			if (!pageForm.getPackage_name().endsWith(PAGES)) {
				pageForm.setPackage_name((NOSI_WEBAPPS + config.getApplication().getDad() + PAGES).toLowerCase());
				pageForm = pageForm.update();
			}
		}
		if (pageList == null) {
			pageList = new Action(pageNameList, "index",
					(NOSI_WEBAPPS + config.getApplication().getDad() + PAGES).toLowerCase(),
					(config.getApplication().getDad() + "/" + pageNameList).toLowerCase() + "/" + pageNameList + ".xsl",
					"Listar " + tableName, "Listar " + tableName, Config.DEFAULT_V_PAGE, 1, config.getApplication());
			pageList = pageList.insert();

		} else {
			if (!pageList.getPackage_name().endsWith(PAGES)) {
				pageList.setPackage_name((NOSI_WEBAPPS + config.getApplication().getDad() + PAGES).toLowerCase());
				pageList = pageList.update();
			}
		}
		boolean flag = false;

		try {
			flag = this.processGenerate(config, tableName, schema, pageForm, pageList);
		} catch (Exception e) {
			pageList.delete(pageList.getId());
			pageForm.delete(pageForm.getId());
			return false;
		}
		return flag;
	}

	private boolean processGenerate(Config_env config, String tableName, String schema, Action pageForm,
			Action pageList) throws IOException, TransformerConfigurationException {
		boolean r = false;
		boolean xmlSave = false;
		List<DatabaseMetadaHelper.Column> columns = null;
		try {
			columns = DatabaseMetadaHelper.getCollumns(config, schema, tableName);
			columns.replaceAll(e -> {
				if (e.getName().equals("model")) {
					e.setName("models");
				}
				return e;
			});
		} catch (Exception e) {
			Core.setMessageError(tableName + " error: " + e.getMessage());
			return false;
		}

		XMLTransform xml = new XMLTransform();
		String formXML = xml.genXML(xml.generateXMLForm(config, pageForm, columns, pageList), pageForm, "form",
				config.getName(), schema, tableName);
		String listXML = xml.genXML(xml.generateXMLTable(config, pageList, columns, pageForm), pageList, "table",
				config.getName(), schema, tableName);

		xmlSave = this.saveFiles(pageForm, pageForm.getPage() + ".xml", formXML)
				&& this.saveFiles(pageList, pageList.getPage() + ".xml", listXML);

		String xslFileNameFrom = this.getConfig().getLinkXSLGeneratorMCVForm();
		String xslFileNameList = this.getConfig().getLinkXSLGeneratorMCVList();
		String xslFileNameGen = this.getConfig().getLinkXSLGenerator_CRUD();
		String jsonFileName = this.getConfig().getLinkXSLJsonGenerator();
		String pathXslForm = this.getConfig().getCurrentBaseServerPahtXsl(pageForm) + File.separator
					+ pageForm.getPage() + ".xml";
		String pathXslList = this.getConfig().getCurrentBaseServerPahtXsl(pageList) + File.separator
				+ pageList.getPage() + ".xml";

		String formJson = XMLTransform.xmlTransformWithXSL(pathXslForm, jsonFileName);
		String listJson = XMLTransform.xmlTransformWithXSL(pathXslList, jsonFileName);

		String formMVC = XMLTransform.xmlTransformWithXSL(pathXslForm, xslFileNameFrom);
		String listMVC = XMLTransform.xmlTransformWithXSL(pathXslList, xslFileNameList);

		String xslForm = XMLTransform.xmlTransformWithXSL(pathXslForm, xslFileNameGen);
		String xslList = XMLTransform.xmlTransformWithXSL(pathXslList, xslFileNameGen);

		r = this.saveFiles(pageForm, pageForm.getPage() + ".json", formJson)
				&& this.saveFiles(pageList, pageList.getPage() + ".json", listJson)
				&& this.saveFiles(pageForm, pageForm.getPage() + ".xsl", xslForm)
				&& this.saveFiles(pageList, pageList.getPage() + ".xsl", xslList)
				&& this.generateClassMVC(pageForm, formMVC) && this.generateClassMVC(pageList, listMVC);

		if (!this.processCompiler())
			Core.setMessageWarning("Errors when compiling. Please compile again.");
		return r && xmlSave;
	}

	private boolean processCompiler() {
		this.compiler.compile();
		return !this.compiler.hasError();
	}

	private boolean saveFiles(Action page, String fileName, String content) throws IOException {
		boolean r = false;
		if (content != null) {
			content = content.replaceAll("<xsl:stylesheet xmlns:xsl=\"dim-red\" version=\"1.0\">",
					"<xsl:stylesheet xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\" version=\"1.0\">\r\n");
			String pathXsl = this.getConfig().getCurrentBaseServerPahtXsl(page);
			r = FileHelper.save(pathXsl, fileName, content);
			if (Core.isNotNull(this.getConfig().getWorkspace())
					&& FileHelper.fileExists(this.getConfig().getWorkspace())) {
				r = FileHelper.save(this.getConfig().getBasePahtXslWorkspace(page), fileName, content);
			}
		}
		return r;
	}

	private boolean generateClassMVC(Action page, String mvc) throws IOException {
		if (mvc != null) {
			String[] partsJavaCode = mvc.split(" END ");
			if (partsJavaCode.length > 2) {
				String model = partsJavaCode[0] + "*/";
				String view = "/*" + partsJavaCode[1] + "*/";
				String controller = "/*" + partsJavaCode[2];
				String pathClass = page.getPackage_name().trim().replaceAll("(\r\n|\n)", "").replace(".",
						File.separator) + File.separator + page.getPage().toLowerCase().trim();
				boolean workspace = Core.isNotNull(this.getConfig().getWorkspace());
				String pathClassWorkSpace = null;
				if (workspace)
					pathClassWorkSpace = this.getConfig().getBasePahtClassWorkspace(page.getApplication().getDad(),
							page.getPage());
				pathClass = this.getConfig().getBasePathClass() + pathClass;

				boolean r = FileHelper.saveFilesJava(pathClass, page.getPage(),
						new String[] { model, view, controller });

				if (workspace) {
					if (!FileHelper.fileExists(pathClassWorkSpace)) {// check directory
						FileHelper.createDiretory(pathClassWorkSpace);// create directory if not exist
					}
					r = FileHelper.saveFilesJava(pathClassWorkSpace, page.getPage(),
							new String[] { model, view, controller });
				}
				String fileJava = pathClass + File.separator + page.getPage();
				this.compiler.addFileName(fileJava + JAVA_EXTENSION);
				this.compiler.addFileName(fileJava + "View.java");
				this.compiler.addFileName(fileJava + "Controller.java");
				return r;
			}
		}
		return false;
	}

	/********************* FIM METODO USADOS PARA GERAR CRUD *********************/
	/********************* METODO USADOS PARA GERAR DAO *********************/

	public boolean generateDAO(DaoDto daoDto) {
		boolean flag = false;
		try {
			
			final String pathDao = new Config().getPathDAO(daoDto.getDadName());
			final String daoClassPathName = String.format("%s%s%s", pathDao, daoDto.getDaoClassName(), JAVA_EXTENSION);
			 
			// Generate dao class files content
			final String content = new GerarClasse(daoDto).generate();

			// Save dao class files
			flag = saveFiles(daoDto.getDaoClassName().concat(JAVA_EXTENSION), content, pathDao);

			if (this.daoClassHasWarning(daoClassPathName))
				Core.setMessageWarning("Erro de compilação na classe <strong>" + daoDto.getDaoClassName() + "</strong>");

		} catch (Exception e) {
			Core.setMessageError("<strong>"+daoDto.getTableName() + "</strong> error: " + e.getMessage());
			flag = false;
		}
		return flag;
	}

	private boolean daoClassHasWarning(String daoClassPathName) {
		Compiler compilerDAO = new Compiler();
		compilerDAO.addFileName(daoClassPathName);
		compilerDAO.compile();
		return compilerDAO.hasWarning();
	}

	public boolean saveFiles(String fileName, String content, String path) throws IOException {
		return Core.isNull(content) ? Boolean.FALSE : FileHelper.save(path, fileName, content);
	}
	
	public static final String JAVA_EXTENSION = ".java";
	private static final String NOSI_WEBAPPS = "nosi.webapps.";
	private static final String PAGES = ".pages";

	/******************** FIM METODO USADOS PARA GERAR DAO *******************/

	/*----#end-code----*/
}
