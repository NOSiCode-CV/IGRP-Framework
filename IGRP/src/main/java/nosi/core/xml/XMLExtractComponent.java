package nosi.core.xml;

import static nosi.core.i18n.Translator.gt;
import java.util.List;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPButton;
import nosi.core.gui.components.IGRPForm;
import nosi.core.gui.components.IGRPMessage;
import nosi.core.gui.components.IGRPSeparatorList;
import nosi.core.gui.components.IGRPTable;
import nosi.core.gui.components.IGRPToolsBar;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.FileField;
import nosi.core.gui.fields.TextAreaField;
import nosi.core.gui.fields.TextField;
import nosi.core.webapp.Core;
import nosi.core.webapp.activit.rest.FormDataService;
import nosi.core.webapp.activit.rest.FormDataService.FormProperties;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.IgrpHelper;
import nosi.core.webapp.helpers.StringHelper;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.TaskComponent;

/**
 * Emanuel
 * 5 Apr 2018
 */
public class XMLExtractComponent {

	private String componentXML="";
	private Config config;
	private String componentXSL="";
	
	public XMLExtractComponent() {
		this.config = new Config();
	}
	public String extractXML(String xml) {
		if(Core.isNotNull(xml)) {
			int start = xml.indexOf(">",xml.indexOf("<content"))+">".length();
			int end = xml.lastIndexOf("</content>");
			if(start != -1 && end != -1) {
				return xml.substring(start, end);
			}
		}
		return "";
	}
	
	public String extractXSL(String xml) {
		if(Core.isNotNull(xml)) {
			int start = xml.indexOf(">",xml.indexOf("<content"))+">".length();
			int end = xml.lastIndexOf("</content>");
			if(start != -1 && end != -1) {
				return xml.substring(start, end);
			}
		}
		return "";
	}
	
	public IGRPToolsBar generateButtonProcess(String appDad,Integer appId, String page,String action,String p_processId) {
		IGRPToolsBar toolsbar1 = new IGRPToolsBar("toolsbar_1");
		IGRPButton button = new IGRPButton();
		button.getProperties().add("code", "iniciar_processo");
		button.getProperties().add("rel", "iniciar_processo");
		button.getProperties().add("type", "specific");
		button.setTitle(gt("Iniciar Processo"));
		button.setApp(appDad);
		button.setPage(page);
		button.setLink(action+"&"+"p_prm_definitionid="+p_processId+"&processDefinition="+Core.getParam("processDefinition",false)+"&taskDefinition="+Core.getParam("taskDefinition",false)+"&appId="+appId);
		button.setTarget("submit");
		button.setImg("primary|fa-play");
		toolsbar1.addButton(button);
		return toolsbar1;
	}
	

	public IGRPToolsBar generateButtonTask(String appDad,Integer appId, String page,String action, String taskId) {
		return this.generateButtonTask(appDad,appId, page, action, "primary|fa-save", taskId);
	}

	public IGRPToolsBar generateButtonEditTask(String appDad,Integer appId,String page,String action,String taskId) {
		return this.generateButtonTask(appDad,appId, page, action, "success|fa-save", taskId);
	}
	
	public IGRPToolsBar generateButtonTask(String appDad,Integer appId, String page,String action,String icon, String taskId) {
		IGRPToolsBar toolsbar1 = new IGRPToolsBar("toolsbar_1");
		IGRPButton button = new IGRPButton();
		button.getProperties().add("code", "iniciar_processo");
		button.getProperties().add("rel", "iniciar_processo");
		button.getProperties().add("type", "specific");
		button.setTitle(gt("Seguinte"));
		button.setApp(appDad);
		button.setPage(page);
		button.setLink(action+"&"+"taskId="+taskId+"&processDefinition="+Core.getParam("processDefinition",false)+"&taskDefinition="+Core.getParam("taskDefinition",false)+"&appId="+appId);
		button.setTarget("submit");
		button.setImg(icon);
		toolsbar1.addButton(button);
		return toolsbar1;
	}
	
	public String joinComponentXML(String codigo) {
		List<TaskComponent> components = new TaskComponent().find().andWhere("codigo", "=",codigo).all();
		components.stream().forEach(c->{
			componentXML += Core.isNotNull(c.getAction().getXmlContent())?c.getAction().getXmlContent():"";
		});
		return componentXML;
	}

	public String joinComponentXSL(String codigo) {
		List<TaskComponent> components = new TaskComponent().find().andWhere("codigo", "=",codigo).all();
		components.stream().forEach(c->{
			componentXSL += Core.isNotNull(c.getAction().getXslContent())?c.getAction().getXslContent():"";
		});
		return componentXSL;
	}
	
	public String transformToXmlWorkFlow(String title,FormDataService formData,boolean withButton) {
		String path_xsl = this.config.getLinkXSLMapProcess();
		XMLWritter xml = new XMLWritter("rows", path_xsl , "utf-8");
		xml.addXml(new Config().getHeader(null));
		xml.startElement("content");
		xml.writeAttribute("type", "");
		xml.setElement("title", title);
		IGRPMessage msg = new IGRPMessage();
		String m = msg.toString();
		xml.addXml(m);
		IGRPForm form = new IGRPForm("form",(float)2.1);
		IGRPButton btn_next = new IGRPButton((formData!=null && formData.getProcessDefinitionId()!=null)?"Iniciar Processo":"Seguinte", "igrp", "ExecucaoTarefas", "process-task", "submit", "next.png", "", "");
		IGRPTable table = new IGRPTable("table", (float)2.1);
		IGRPTable table_form = new IGRPTable("table", (float)2.1);
		
		Field prm_file_name = new TextField(null,"prm_file_name");
		prm_file_name.setLabel(gt("Nome Ficheiro"));
		prm_file_name.propertie().add("rel", "prm_doc_list").add("required", "true");
		Field prm_file_name_desc = new TextField(null,"prm_file_name_desc");
		prm_file_name_desc.setLabel(gt("Nome Ficheiro"));
		Field prm_file_description = new TextAreaField(null,"prm_file_description");
		prm_file_description.setLabel(gt("Descrição"));
		prm_file_description.propertie().add("rel", "prm_doc_list").add("required", "true");
		Field prm_file_description_desc = new TextAreaField(null,"prm_file_description_desc");
		prm_file_description_desc.setLabel(gt("Descrição"));
		Field prm_file = new FileField(null,"prm_file");
		prm_file.setLabel(gt("Ficheiro"));
		prm_file.propertie().add("rel", "prm_doc_list").add("maxlength", 300);
		prm_file.propertie().add("end", "true").add("required", "true");
		Field prm_file_desc = new FileField(null,"prm_file_desc");
		prm_file_desc.setLabel(gt("Ficheiro"));
		prm_file_desc.propertie().add("maxlength", 300);
		Field prm_doc_list_id = new TextField(null,"prm_doc_list_id");
		prm_doc_list_id.propertie().add("type", "hidden");
		
		table_form.addField(prm_file_name);
		table_form.addField(prm_file_name_desc);
		table_form.addField(prm_file_description);
		table_form.addField(prm_file_description_desc);
		table_form.addField(prm_file);
		table_form.addField(prm_file_desc);
		table_form.addField(prm_doc_list_id);
		
		Field prm_doc_list = new TextField(null,"prm_doc_list");
		prm_doc_list.propertie().add("type", "separatordialog");
		prm_doc_list.propertie().add("container", "true");
		prm_doc_list.setLabel(gt("Adicionar Documentos"));
		
		Field p_fwl_tab_page = new TextField(null,"p_fwl_tab_page");
		p_fwl_tab_page.propertie().add("type", "hidden");
		Field p_fwl_workflow = new TextField(null,"p_fwl_workflow");
		p_fwl_workflow.propertie().add("type", "hidden");
		Field p_fwl_dialogbox = new TextField(null,"p_fwl_dialogbox");
		p_fwl_dialogbox.propertie().add("type", "hidden");
		Field p_fwl_relbox = new TextField(null,"p_fwl_relbox");
		p_fwl_relbox.propertie().add("type", "hidden");
		Field p_fwl_tab_menu = new TextField(null,"p_fwl_tab_menu");
		p_fwl_tab_menu.propertie().add("type", "hidden");

		
		if(formData!=null){
			Field prm_taskid = XMLTransform.getField("prm_taskid", "hidden");
			prm_taskid.setValue(formData.getTaskId()!=null?formData.getTaskId():"");

			Field prm_definitionid = XMLTransform.getField("prm_definitionid", "hidden");
			prm_definitionid.setValue(formData.getProcessDefinitionId()!=null?formData.getProcessDefinitionId():"");
			form.addField(prm_taskid);
			form.addField(prm_definitionid);
			if(formData.getFormProperties()!=null){
				for(FormProperties prop:formData.getFormProperties()){
					Field field = XMLTransform.getField(prop.getId().toLowerCase(), prop.getType());
					field.setLabel(prop.getName());
					field.setValue("");
					if(prop.getValue()!=null)
						field.setValue(prop.getValue());
					if(prop.getRequired())
						field.propertie().add("required","true");
					if(!prop.getWritable())
						field.propertie().add("readonly", "true");
					if(prop.getType().endsWith("enum")){
						field.setValue(IgrpHelper.toMap(prop.getEnumValues(), "id", "name",gt("--- Selecionar Opção ---")));
					}
					field.setLabel(gt(StringHelper.camelCase(prop.getName())));
					form.addField(field);
				}
			}
		}
		form.addField(prm_doc_list);
		form.addField(p_fwl_tab_menu);
		form.addField(p_fwl_relbox);
		form.addField(p_fwl_dialogbox);
		form.addField(p_fwl_workflow);
		form.addField(p_fwl_tab_page);
		form.addField(prm_file_name);
		form.addField(prm_file_description);
		form.addField(prm_file);
		if(withButton) {
			form.addButton(btn_next);
		}
		form.setTable(table_form);
		xml.addXml(form.toString());
		xml.addXml(table.toString());
		return xml.toString();
	}
	public String addButtonXsl() {
		return " <xsl:if test=\"rows/content/toolsbar_1\">\r\n" + 
				"                          <div class=\"toolsbar-holder default gen-container-item \" gen-structure=\"toolsbar\" gen-fields=\".btns-holder&gt;a.btn\" gen-class=\"\" item-name=\"toolsbar_1\">\r\n" + 
				"                            <div class=\"btns-holder   pull-right\" role=\"group\">\r\n" + 
				"                              <xsl:apply-templates select=\"rows/content/toolsbar_1\" mode=\"gen-buttons\">\r\n" + 
				"                                <xsl:with-param name=\"vertical\" select=\"'true'\"/>\r\n" + 
				"                                <xsl:with-param name=\"outline\" select=\"'false'\"/>\r\n" + 
				"                              </xsl:apply-templates>\r\n" + 
				"                            </div>\r\n" + 
				"                          </div>\r\n" + 
				"                        </xsl:if>";
	}
	public String addHeaderXSL() {
		return "";
	}
	
	public String addSepratorListXsl() {
		String page = "Addfiletask";
		Action ac = new Action().find().andWhere("page", "=",page).andWhere("application.dad", "=","igrp").one();
		if(ac!=null) {
			String path = new Config().getBaseServerPahtXsl(ac);
			String content = FileHelper.readFile(path, page+".xsl");
			String c = content.substring(content.indexOf("<xsl:if test=\"rows/content/formlist_documento_task\">"),content.lastIndexOf("</xsl:if>"))+"</xsl:if>";
			return c;
		}
		return "";
	}
	
	public String removeXMLButton(String content) {
		int index = content.indexOf("xml-type=\"toolsbar\"");
		if(index != -1) {
			int index2 = content.indexOf("<item",index);
			if(index2 != -1) {
				String c = content.substring(0,content.indexOf(">",index))+">";
				c+= content.substring(content.lastIndexOf("</item>")+"</item>".length()); 
				return c;
			}
		}
		return content;
	}
	
	public IGRPSeparatorList addFormlistFile() {
		IGRPSeparatorList separatorlist_1 = new IGRPSeparatorList("separatorlist_1","");
		Field prm_file_description = new TextField(null,"prm_file_description");
		prm_file_description.setLabel(gt("Descrição"));
		prm_file_description.propertie().add("name","p_prm_file_description").add("type","text").add("maxlength","100").add("required","false").add("desc","true");
		
		Field prm_file_name_fk = new FileField(null,"prm_file_name_fk");
		prm_file_name_fk.setLabel(gt("Ficheiro"));
		prm_file_name_fk.propertie().add("name","p_prm_file_name").add("type","file").add("accept","").add("targetrend","").add("multiple","false").add("rendvalue","false").add("maxlength","30").add("required","false").add("desc","true");
		separatorlist_1.addField(prm_file_description);
		separatorlist_1.addField(prm_file_name_fk);
		return separatorlist_1;
	}
	
	public String addButtonXsl(String content) {
		int index = content.indexOf("<xsl:if test=\"rows/content/toolsbar_1\">");		
		String c0 = content.substring(0,content.lastIndexOf("</form>"))+"</form>";
		c0 +=this.addLink(content, "<script type=\"text/javascript\" src=\"{$path}/plugins/formlist/igrp.formlist.js?v={$version}\"/>");
		c0 += content.substring(content.lastIndexOf("</form>")+"</form>".length());
		String c1 = c0.substring(0, c0.indexOf("<xsl:call-template name=\"IGRP-head\"/>"))+"<xsl:call-template name=\"IGRP-head\"/>";
		c1 +=this.addLink(c0, "<link rel=\"stylesheet\" type=\"text/css\" href=\"{$path}/core/igrp/toolsbar/toolsbar.css?v={$version}\"/>");
		c1 +=this.addLink( c0,"<link rel=\"stylesheet\" type=\"text/css\" href=\"{$path}/plugins/formlist/igrp.formlist.css?v={$version}\"/>");
		c1 +=this.addLink(c0,"<link rel=\"stylesheet\" type=\"text/css\" href=\"{$path}/core/igrp/table/igrp.tables.css?v={$version}\"/>");
		c1 +=this.addLink(c0,"<link rel=\"stylesheet\" type=\"text/css\" href=\"{$path}/core/igrp/table/dataTables.bootstrap.css?v={$version}\"/>");
		
		c1 += c0.substring(content.indexOf("<xsl:call-template name=\"IGRP-head\"/>")+"<xsl:call-template name=\"IGRP-head\"/>".length());
		String c2 = c1.substring(0,c1.lastIndexOf("<div class=\"gen-inner\">"))+"<div class=\"gen-inner\">";
		if(index == -1) {
			c2+=this.addButtonXsl();
		}
		c2+=c1.substring(c1.lastIndexOf("<div class=\"gen-inner\">")+"<div class=\"gen-inner\">".length());
		String c3 = c2.substring(0,c2.lastIndexOf("</xsl:if>"))+"</xsl:if>";
		c3 += this.addSepratorListXsl();
		c3 += c2.substring(c2.lastIndexOf("</xsl:if>")+"</xsl:if>".length());
		return c3;
	}
	
	private String addLink(String source,String link) {
		return source.indexOf(link)==-1?link:"";
	}
}
