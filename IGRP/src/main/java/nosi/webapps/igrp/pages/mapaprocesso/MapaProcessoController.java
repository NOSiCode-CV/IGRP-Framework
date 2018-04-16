/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.mapaprocesso;


/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import static nosi.core.i18n.Translator.gt;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import nosi.core.gui.components.IGRPMenu;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.core.webapp.activit.rest.FormDataService;
import nosi.core.webapp.activit.rest.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.TaskService;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.Permission;
import nosi.core.xml.XMLExtractComponent;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.TipoDocumentoEtapa;
/*----#END-PRESERVED-AREA----*/

public class MapaProcessoController extends Controller{		


	public Response actionIndex() throws IOException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		MapaProcesso model = new MapaProcesso();
		MapaProcessoView view = new MapaProcessoView(model);
		List<IGRPMenu> listMenus = new ArrayList<>();
		IGRPMenu menus = new IGRPMenu(gt("Lista de Processos"),"webapps?r=");
		IGRPMenu.Menu menu = new IGRPMenu.Menu(gt("Processos Ativos"));
		Application app = new Application().find().andWhere("dad", "=",new Permission().getCurrentEnv()).one();
		for(ProcessDefinitionService process:new ProcessDefinitionService().getProcessDefinitionsAtivos(app.getId())){
			IGRPMenu.SubMenu submenu = new IGRPMenu.SubMenu(process.getName(), this.getConfig().getResolveUrl("igrp","MapaProcesso","openProcess")+"&p_processId="+process.getId(), process.getId(),process.getSuspended(), "LEFT_MENU");
			menu.addSubMenu(submenu);
		}
		menus.addMenu(menu);
		listMenus.add(menus);
		view.menu.setListMenu(listMenus);
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}

	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	public Response actionOpenProcess() throws IOException{
		XMLExtractComponent comp = new XMLExtractComponent();
		String p_processId = Igrp.getInstance().getRequest().getParameter("p_processId");
		String taskId = Igrp.getInstance().getRequest().getParameter("taskId");
		String withButton = Igrp.getInstance().getRequest().getParameter("withButton");
		String processDefinition = "";
		String taskDefinition = "";
		FormDataService formData = null;
		String title = "";
		String idApp = "-1";
		if(p_processId!=null){
			ProcessDefinitionService process = new ProcessDefinitionService().getProcessDefinition(p_processId);
			title = process!=null?process.getName():"";
			formData = new FormDataService().getFormDataByProcessDefinitionId(p_processId);
			idApp = process.getTenantId();
			taskDefinition = formData.getTaskId();
			processDefinition = process.getKey();
		}
		if(taskId!=null){
			TaskService task = new TaskService().getTask(taskId);
			title = task!=null?Core.isNotNull(task.getDescription())?task.getDescription():task.getName()+" - Nº "+task.getId():"";
			formData = new FormDataService().getFormDataByTaskId(taskId);
			idApp = task.getTenantId();
			taskDefinition = task.getTaskDefinitionKey();
			processDefinition = task.getProcessDefinitionKey();
		}
		if(formData != null) {
			if(Core.isNotNull(formData.getFormKey())) {				
				Action action = new Action().find().andWhere("application", "=",Core.toInt(idApp)).andWhere("page", "=",formData.getFormKey()).one();
				Response resp = this.call(action.getApplication().getDad(), action.getPage(),"index",this.queryString());
				String content = comp.removeXMLButton(resp.getContent());
				XMLWritter xml = new XMLWritter("rows", this.getConfig().getResolveUrl("igrp","mapa-processo","get-xsl").replaceAll("&", "&amp;")+"&amp;page="+formData.getFormKey()+"&amp;app="+idApp, "utf-8");
				xml.addXml(this.getConfig().getHeader(null));
				xml.startElement("content");
				xml.writeAttribute("type", "");
				xml.setElement("title", title);
				xml.addXml(comp.generateButtonProcess(p_processId, taskId).toString());
				xml.addXml(content);
				xml.addXml(comp.extractXML(this.addFileSeparator(processDefinition,taskDefinition,idApp)));
				xml.endElement();
				return this.renderView(xml.toString());	
			}
			String content = comp.transformToXmlWorkFlow(title,formData,(Core.isNotNull(withButton) && withButton.equals("false"))?false:true);
			return this.renderView(content);
		}
		return null;
	}
	
	private String addFileSeparator(String processDefinition,String taskDefinition,String idApp) {
		List<TipoDocumentoEtapa> tipoDocs = new TipoDocumentoEtapa()
				.find()
				.andWhere("processId", "=",Core.isNotNull(processDefinition)?processDefinition:"-1")
				.andWhere("taskId", "=",Core.isNotNull(taskDefinition)?taskDefinition:"-1")
				.andWhere("tipoDocumento.application", "=",Core.toInt(idApp))
				.andWhere("status", "=",1)
				.andWhere("tipo", "=","IN")
				.all();
		if(tipoDocs != null && tipoDocs.size() > 0){
			for(TipoDocumentoEtapa doc:tipoDocs){
				this.addQueryString("p_formlist_documento_task_nome_fk",doc.getTipoDocumento().getNome());
				this.addQueryString("p_formlist_documento_task_nome_fk_desc",doc.getTipoDocumento().getNome());
				this.addQueryString("p_formlist_documento_task_descricao_fk",doc.getTipoDocumento().getDescricao());
				this.addQueryString("p_formlist_documento_task_descricao_fk_desc",doc.getTipoDocumento().getDescricao());
				this.addQueryString("p_formlist_documento_task_obrigatoriedade_fk",this.getObrigatoriedade(doc.getRequired()));
				this.addQueryString("p_formlist_documento_task_obrigatoriedade_fk_desc",this.getObrigatoriedade(doc.getRequired()));
				this.addQueryString("p_formlist_documento_task_mostrar_fk","");
				this.addQueryString("p_formlist_documento_task_mostrar_fk_desc","");
			}
			return this.call("igrp", "Addfiletask", "index", this.queryString()).getContent();
		}
		return "";
	}

	private String getObrigatoriedade(int required) {
		return required==1?"Sim":"Nao";
	}

	public Response actionGetXsl() throws IOException{
		String page = Core.getParam("page");
		String app = Core.getParam("app");
		if(Core.isNotNull(page) && Core.isNotNull(app)){
			XMLExtractComponent comp = new XMLExtractComponent();
			Action ac = new Action().find().andWhere("page", "=",page).andWhere("application", "=",Core.toInt(app)).one();
			String path_xsl = this.getConfig().getBaseServerPahtXsl(ac);
			String content = FileHelper.readFile(path_xsl, ac.getPage()+".xsl");
			content = comp.addButtonXsl(content);
			this.format = Response.FORMAT_XSL;			
			return this.renderView(content.replaceAll("<xsl:include href=\"../../../","<xsl:include href=\""+this.getConfig().getLinkImg()+"/"));
		}
		return this.redirect("igrp", "ErrorPage", "exception");
	}
	/*----#END-PRESERVED-AREA----*/
}
