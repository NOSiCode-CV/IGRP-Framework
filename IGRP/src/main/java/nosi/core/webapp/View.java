package nosi.core.webapp;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import nosi.core.config.IHeaderConfig;
import nosi.core.gui.components.IGRPComponent;
import nosi.core.gui.components.IGRPForm;
import nosi.core.gui.components.IGRPTable;
import nosi.core.gui.components.IGRPToolsBar;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.HiddenField;
import nosi.core.gui.page.Page;
import nosi.core.webapp.bpmn.BPMNConstants;
import nosi.core.webapp.bpmn.RuntimeTask;
import nosi.core.webapp.helpers.Route;
/**
 * You can set/get the page title, addToPage...
 * 
 * @author Marcel Iekiny
 * Apr 15, 2017
 */
public abstract class View  implements IHeaderConfig{
	
	private Controller context;
	private final Page page; // representa o main layout de uma view
	private String title;
	private String target;	
	private String pageTitle;
	protected Model model;
	
	private final Map<String, Object> currentModels;
	
	protected View(){
		this.currentModels = new HashMap<>();
		this.pageTitle = "IGRP"; // Default page title
		this.page = new Page();
		this.page.setView(this);
	}

	protected IGRPForm addFieldToFormHidden() {
		IGRPForm formHidden = new IGRPForm("hidden_form_igrp");			
		if(!IGRPForm.hiddenFields.isEmpty()) {
			for(Field f:IGRPForm.hiddenFields) {
				formHidden.addField(f);
			}
			IGRPForm.resetHiddenField();
		}
		this.addPersistentParams(formHidden);
		this.addLookupParams(formHidden);
		return formHidden;
	}
	
	private void addPersistentParams(IGRPForm formHidden) {
		//Add hidden field env_frm_url to persistence index url of page
		HiddenField field = new HiddenField("env_frm_url");
		String targetPersit = Core.getParam("target");
		String value = null;
		String isPublic = Core.getParam("isPublic");
		
		RuntimeTask runtimeTask = RuntimeTask.getRuntimeTask(); 
		if(runtimeTask != null) { 
			String taskId = runtimeTask.getTask().getId(); 
			value = "webapps" + Route.toUrl("igrp", "ExecucaoTarefas", "Executar_button_minha_tarefas") + "&" + BPMNConstants.PRM_TASK_ID + "=" + taskId + "&dad=" + Core.getCurrentDad(); 
		}else {
			//No encrypt if page is public
			if(Core.isNotNull(isPublic) && isPublic.equals("1")) 
				value = "webapps?r="+Igrp.getInstance().getCurrentAppName()+"/"+Igrp.getInstance().getCurrentPageName()+"/index&target="+targetPersit+"&isPublic=1&lang="+Core.getParam("lang")+"&dad="+Igrp.getInstance().getCurrentAppName();
			else 
				value = Route.getResolveUrl(Igrp.getInstance().getCurrentAppName(),Igrp.getInstance().getCurrentPageName(), "index"+(Core.isNotNull(targetPersit)?("&target="+targetPersit):""));
		}
		field.propertie().add("value", value).add("name","p_env_frm_url").add("type","hidden").add("maxlength","250").add("java-type","").add("tag","env_frm_url");
		field.setValue(value);
		formHidden.addField(field);
		
		String table_lookup_row = Core.getParam(IGRPTable.TABLE_LOOKUP_ROW);
		if(Core.isNotNull(table_lookup_row)) {
			//Add hidden field env_frm_url to persistence index url of page
			HiddenField fieldtable_lookup_row = new HiddenField(IGRPTable.TABLE_LOOKUP_ROW);
			fieldtable_lookup_row.propertie().add("value", table_lookup_row).add("name",IGRPTable.TABLE_LOOKUP_ROW).add("type","hidden").add("maxlength","250").add("java-type","").add("tag",IGRPTable.TABLE_LOOKUP_ROW);
			fieldtable_lookup_row.setValue(table_lookup_row);
			formHidden.addField(fieldtable_lookup_row);
		}
		
		Map<String,String[]> paramsName = Core.getParameters();
		paramsName.entrySet().stream()
				  .filter(param->
				  		   (param.getKey().equalsIgnoreCase(IGRPTable.TABLE_LOOKUP_ROW) || param.getKey().startsWith("p_fwl_")) 
				  		    && !param.getKey().equalsIgnoreCase("p_fwl_search")
				  		)
				  .forEach(param->{
					  	HiddenField f = new HiddenField(null,param.getKey());
						f.propertie().add("value", param.getValue()[0]).add("tag", param.getKey()).add("name",param.getKey());
						f.setValue(param.getValue()[0]);
						formHidden.addField(f);
				  });		
	}

	private void addLookupParams(IGRPForm formHidden) {
		/**
		 * Extract parameters in json format
		 */
		String jsonLookup = Core.getParam("jsonLookup");
		if (Core.isNotNull(jsonLookup)) {
			jsonLookup = URLEncoder.encode(jsonLookup, StandardCharsets.UTF_8);
			HiddenField f = new HiddenField(null, "jsonLookup");
			f.propertie().add("value", jsonLookup).add("tag", "jsonLookup").add("name", "jsonLookup");
			f.setValue(jsonLookup);
			formHidden.addField(f);
		}
		
		/**
		 * Deprecated
		 */
		String isLookup = Core.getParam("forLookup");
		if(Core.isNotNull(isLookup)){
			Map<String,String[]> paramsName = Core.getParameters();
			for(Entry<String,String[]> p:paramsName.entrySet()) {
				String param = p.getKey();
				if(
					   !param.equalsIgnoreCase("dad") 
					&& !param.equalsIgnoreCase("target") 
					&& !param.equalsIgnoreCase("r") 
					&& !param.equalsIgnoreCase("p_fwl_search")
					&& !param.equalsIgnoreCase("prm_page")
					&& !param.equalsIgnoreCase("prm_app")
				) {
					HiddenField f = new HiddenField(null,param);
					f.propertie().add("value", p.getValue()[0]).add("tag", param).add("name",param);
					f.setValue(p.getValue()[0]);
					formHidden.addField(f);
				}
			}
		}
	}

	@Override
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String getTarget() {
		return target;
	}
	
	public void setTarget(String target) {
		this.target = target;
	}
	public Controller getContext(){
		return this.context;
	}
	
	public void setContext(Controller context){
		this.context = context;
	}
	
	public Page getPage(){
		return this.page;
	}
	
	public abstract void render(); // Permite override obrigatorio nas subclasses
	
	protected void addToPage(Object obj){
		//Attention with lint suggestion...
		if (obj instanceof IGRPComponent) {
			if (((IGRPComponent) obj).isVisible())
				this.page.addContent(obj);
		} else if (obj instanceof IGRPToolsBar) {
			if (((IGRPToolsBar) obj).isVisible())
				this.page.addContent(obj);
		} else
			this.page.addContent(obj);
	}
	
	
	
	protected Object getModel(String name){
		return this.currentModels.get(name);
	}	
	
	public void addComponent(IGRPComponent component) {
		if(this.page!=null)
			this.page.addContent(component);
	}
	
	public View addModel(String name, Object model){
			this.currentModels.put(name, model);
		return this;
	}
	
	public void setPageTitle(String pageTitle){
		this.pageTitle = pageTitle;
	}
	
	public String getPageTitle(){
		return this.pageTitle;
	}

	public Model getModel() {
		return model;
	}

	public void setModel(Model model) {
		this.model = model;
	}	
	
	//... Others methods ...

}
