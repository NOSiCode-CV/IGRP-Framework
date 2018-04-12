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
import nosi.core.webapp.helpers.IgrpHelper;
import nosi.core.webapp.helpers.StringHelper;
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
	public IGRPToolsBar generateButtonProcess(String p_processId,String taskId) {
		IGRPToolsBar toolsbar1 = new IGRPToolsBar("toolsbar_1");
		String id = Core.isNotNull(p_processId)?("p_prm_definitionid="+p_processId):("p_prm_taskid="+taskId);
		IGRPButton button = new IGRPButton();
		button.getProperties().add("code", "iniciar_processo");
		button.getProperties().add("rel", "iniciar_processo");
		button.getProperties().add("type", "specific");
		button.setTitle(gt(Core.isNotNull(p_processId)?"Iniciar Processo":"Gravar"));
		button.setApp("igrp");
		button.setPage("ExecucaoTarefas");
		button.setLink("process-task&"+id+"&customForm=true");
		button.setTarget("submit");
		button.setImg("primary|fa-save");
		toolsbar1.addButton(button);
		return toolsbar1;
	}

	public Object generateButtonEditTask(String taskId) {
		IGRPToolsBar toolsbar1 = new IGRPToolsBar("toolsbar_1");
		IGRPButton button = new IGRPButton();
		button.getProperties().add("code", "iniciar_processo");
		button.getProperties().add("rel", "iniciar_processo");
		button.getProperties().add("type", "specific");
		button.setTitle(gt("Gravar"));
		button.setApp("igrp");
		button.setPage("ExecucaoTarefas");
		button.setLink("process-edit-task&"+("p_prm_taskid="+taskId)+"&customForm=true");
		button.setTarget("submit");
		button.setImg("primary|fa-save");
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
		return "<xsl:if test=\"rows/content/formlist_documento_task\">\r\n" + 
				"                          <div class=\"box box-table-contents gen-container-item \" gen-class=\"\" item-name=\"formlist_documento_task\">\r\n" + 
				"                            <div class=\"box-body table-box\">\r\n" + 
				"                              <xsl:apply-templates mode=\"form-hidden-fields\" select=\"rows/content/formlist_documento_task/fields\"/>\r\n" + 
				"                              <table id=\"formlist_documento_task\" class=\"table table-striped gen-data-table IGRP_formlist  \" rel=\"T_formlist_documento_task\" data-control=\"data-formlist_documento_task\">\r\n" + 
				"                                <thead>\r\n" + 
				"                                  <tr>\r\n" + 
				"                                    <xsl:if test=\"rows/content/formlist_documento_task/fields/nome\">\r\n" + 
				"                                      <th align=\"\" class=\" gen-fields-holder\">\r\n" + 
				"                                        <span>\r\n" + 
				"                                          <xsl:value-of select=\"rows/content/formlist_documento_task/fields/nome/label\"/>\r\n" + 
				"                                        </span>\r\n" + 
				"                                      </th>\r\n" + 
				"                                    </xsl:if>\r\n" + 
				"                                    <xsl:if test=\"rows/content/formlist_documento_task/fields/descricao\">\r\n" + 
				"                                      <th align=\"\" class=\" gen-fields-holder\">\r\n" + 
				"                                        <span>\r\n" + 
				"                                          <xsl:value-of select=\"rows/content/formlist_documento_task/fields/descricao/label\"/>\r\n" + 
				"                                        </span>\r\n" + 
				"                                      </th>\r\n" + 
				"                                    </xsl:if>\r\n" + 
				"                                    <xsl:if test=\"rows/content/formlist_documento_task/fields/obrigatoriedade\">\r\n" + 
				"                                      <th align=\"\" class=\" gen-fields-holder\">\r\n" + 
				"                                        <span>\r\n" + 
				"                                          <xsl:value-of select=\"rows/content/formlist_documento_task/fields/obrigatoriedade/label\"/>\r\n" + 
				"                                        </span>\r\n" + 
				"                                      </th>\r\n" + 
				"                                    </xsl:if>\r\n" + 
				"                                    <xsl:if test=\"rows/content/formlist_documento_task/fields/documento\">\r\n" + 
				"                                      <th align=\"\" class=\" gen-fields-holder\">\r\n" + 
				"                                        <span>\r\n" + 
				"                                          <xsl:value-of select=\"rows/content/formlist_documento_task/fields/documento/label\"/>\r\n" + 
				"                                        </span>\r\n" + 
				"                                      </th>\r\n" + 
				"                                    </xsl:if>\r\n" + 
				"                                    <xsl:if test=\"rows/content/formlist_documento_task/fields/mostrar\">\r\n" + 
				"                                      <th align=\"\" class=\" gen-fields-holder\">\r\n" + 
				"                                        <span>\r\n" + 
				"                                          <xsl:value-of select=\"rows/content/formlist_documento_task/fields/mostrar/label\"/>\r\n" + 
				"                                        </span>\r\n" + 
				"                                      </th>\r\n" + 
				"                                    </xsl:if>\r\n" + 
				"                                    <xsl:if test=\"not(rows/content/formlist_documento_task/table/value/row[position() = 1]/@noupdate) or not(rows/content/formlist_documento_task/table/value/row[position() = 1]/@nodelete)\">\r\n" + 
				"                                      <th class=\"table-btn add\">\r\n" + 
				"                                        <xsl:if test=\"not(rows/content/formlist_documento_task/table/value/row[position() = 1]/@noupdate)\">\r\n" + 
				"                                          <a class=\"formlist-row-add btn btn-primary\" rel=\"formlist_documento_task\">\r\n" + 
				"                                            <i class=\"fa fa-plus\"/>\r\n" + 
				"                                          </a>\r\n" + 
				"                                        </xsl:if>\r\n" + 
				"                                      </th>\r\n" + 
				"                                    </xsl:if>\r\n" + 
				"                                  </tr>\r\n" + 
				"                                </thead>\r\n" + 
				"                                <tbody>\r\n" + 
				"                                  <xsl:for-each select=\"rows/content/formlist_documento_task/table/value/row\">\r\n" + 
				"                                    <tr row=\"{position()}\">\r\n" + 
				"                                      <input type=\"hidden\" name=\"p_formlist_documento_task_id\" value=\"{formlist_documento_task_id}\"/>\r\n" + 
				"                                      <xsl:if test=\"nome\">\r\n" + 
				"                                        <xsl:if test=\"not(nome/@visible)\">\r\n" + 
				"                                          <td align=\"\" data-row=\"{position()}\" data-title=\"{../../fields/nome/label}\" class=\"text\" item-name=\"nome\">\r\n" + 
				"                                            <input type=\"hidden\" name=\"{../../../fields/nome/@name}_fk_desc\" value=\"{nome_desc}\"/>\r\n" + 
				"                                            <div class=\"form-group\" item-name=\"nome\" item-type=\"text\">\r\n" + 
				"                                              <input type=\"text\" name=\"{../../../fields/nome/@name}_fk\" value=\"{nome}\" class=\"text form-control\" rel=\"F_formlist_documento_task\">\r\n" + 
				"                                                <xsl:call-template name=\"setAttributes\">\r\n" + 
				"                                                  <xsl:with-param name=\"field\" select=\"rows/content/formlist_documento_task/fields/nome\"/>\r\n" + 
				"                                                </xsl:call-template>\r\n" + 
				"                                              </input>\r\n" + 
				"                                            </div>\r\n" + 
				"                                          </td>\r\n" + 
				"                                        </xsl:if>\r\n" + 
				"                                      </xsl:if>\r\n" + 
				"                                      <xsl:if test=\"descricao\">\r\n" + 
				"                                        <xsl:if test=\"not(descricao/@visible)\">\r\n" + 
				"                                          <td align=\"\" data-row=\"{position()}\" data-title=\"{../../fields/descricao/label}\" class=\"text\" item-name=\"descricao\">\r\n" + 
				"                                            <input type=\"hidden\" name=\"{../../../fields/descricao/@name}_fk_desc\" value=\"{descricao_desc}\"/>\r\n" + 
				"                                            <div class=\"form-group\" item-name=\"descricao\" item-type=\"text\">\r\n" + 
				"                                              <input type=\"text\" name=\"{../../../fields/descricao/@name}_fk\" value=\"{descricao}\" class=\"text form-control\" rel=\"F_formlist_documento_task\">\r\n" + 
				"                                                <xsl:call-template name=\"setAttributes\">\r\n" + 
				"                                                  <xsl:with-param name=\"field\" select=\"rows/content/formlist_documento_task/fields/descricao\"/>\r\n" + 
				"                                                </xsl:call-template>\r\n" + 
				"                                              </input>\r\n" + 
				"                                            </div>\r\n" + 
				"                                          </td>\r\n" + 
				"                                        </xsl:if>\r\n" + 
				"                                      </xsl:if>\r\n" + 
				"                                      <xsl:if test=\"obrigatoriedade\">\r\n" + 
				"                                        <xsl:if test=\"not(obrigatoriedade/@visible)\">\r\n" + 
				"                                          <td align=\"\" data-row=\"{position()}\" data-title=\"{../../fields/obrigatoriedade/label}\" class=\"text\" item-name=\"obrigatoriedade\">\r\n" + 
				"                                            <input type=\"hidden\" name=\"{../../../fields/obrigatoriedade/@name}_fk_desc\" value=\"{obrigatoriedade_desc}\"/>\r\n" + 
				"                                            <div class=\"form-group\" item-name=\"obrigatoriedade\" item-type=\"text\">\r\n" + 
				"                                              <input type=\"text\" name=\"{../../../fields/obrigatoriedade/@name}_fk\" value=\"{obrigatoriedade}\" class=\"text form-control\" rel=\"F_formlist_documento_task\">\r\n" + 
				"                                                <xsl:call-template name=\"setAttributes\">\r\n" + 
				"                                                  <xsl:with-param name=\"field\" select=\"rows/content/formlist_documento_task/fields/obrigatoriedade\"/>\r\n" + 
				"                                                </xsl:call-template>\r\n" + 
				"                                              </input>\r\n" + 
				"                                            </div>\r\n" + 
				"                                          </td>\r\n" + 
				"                                        </xsl:if>\r\n" + 
				"                                      </xsl:if>\r\n" + 
				"                                      <xsl:if test=\"documento\">\r\n" + 
				"                                        <xsl:if test=\"not(documento/@visible)\">\r\n" + 
				"                                          <td align=\"\" data-row=\"{position()}\" data-title=\"{../../../fields/documento/label}\" class=\"file\" item-name=\"documento\">\r\n" + 
				"                                            <input type=\"hidden\" name=\"{../../../fields/documento/@name}_fk_desc\" value=\"{documento_desc}\"/>\r\n" + 
				"                                            <div class=\"form-group\" item-name=\"documento\" item-type=\"file\">\r\n" + 
				"                                              <div class=\"input-group\">\r\n" + 
				"                                                <input type=\"text\" class=\"form-control form-hidden\" readonly=\"\"/>\r\n" + 
				"                                                <span class=\"input-group-btn\">\r\n" + 
				"                                                  <span class=\"btn btn-default file-btn-holder\">\r\n" + 
				"                                                    <i class=\"fa fa-upload\"/>\r\n" + 
				"                                                    <input id=\"{../../../fields/documento/@name}_fk\" name=\"{../../../fields/documento/@name}_fk\" value=\"{documento}\" class=\"transparent\" type=\"file\" accept=\"\" rel=\"F_formlist_documento_task\">\r\n" + 
				"                                                      <xsl:call-template name=\"setAttributes\">\r\n" + 
				"                                                        <xsl:with-param name=\"field\" select=\"rows/content/formlist_documento_task/fields/documento\"/>\r\n" + 
				"                                                      </xsl:call-template>\r\n" + 
				"                                                    </input>\r\n" + 
				"                                                  </span>\r\n" + 
				"                                                </span>\r\n" + 
				"                                              </div>\r\n" + 
				"                                            </div>\r\n" + 
				"                                          </td>\r\n" + 
				"                                        </xsl:if>\r\n" + 
				"                                      </xsl:if>\r\n" + 
				"                                      <xsl:if test=\"mostrar\">\r\n" + 
				"                                        <xsl:if test=\"not(mostrar/@visible)\">\r\n" + 
				"                                          <td align=\"\" data-row=\"{position()}\" data-title=\"{../../../fields/mostrar/label}\" class=\"link\" item-name=\"mostrar\">\r\n" + 
				"                                            <input type=\"hidden\" name=\"{../../../fields/mostrar/@name}_fk_desc\" value=\"{mostrar_desc}\"/>\r\n" + 
				"                                            <input type=\"hidden\" name=\"{../../../fields/mostrar/@name}_fk\" value=\"{mostrar}\" rel=\"F_formlist_documento_task\"/>\r\n" + 
				"                                            <xsl:choose>\r\n" + 
				"                                              <xsl:when test=\"mostrar != ''\">\r\n" + 
				"                                                <a href=\"{mostrar}\" name=\"p_mostrar\" class=\"link  btn btn-link form-link\" target-fields=\"\" target=\"_self\">\r\n" + 
				"                                                  <i class=\"fa fa-link\"/>\r\n" + 
				"                                                  <span>\r\n" + 
				"                                                    <xsl:value-of select=\"mostrar_desc\"/>\r\n" + 
				"                                                  </span>\r\n" + 
				"                                                </a>\r\n" + 
				"                                              </xsl:when>\r\n" + 
				"                                              <xsl:otherwise>\r\n" + 
				"                                                <xsl:value-of select=\"mostrar_desc\"/>\r\n" + 
				"                                              </xsl:otherwise>\r\n" + 
				"                                            </xsl:choose>\r\n" + 
				"                                          </td>\r\n" + 
				"                                        </xsl:if>\r\n" + 
				"                                      </xsl:if>\r\n" + 
				"                                      <xsl:if test=\"not(@nodelete) or not(@noupdate)\">\r\n" + 
				"                                        <td class=\"table-btn delete\" data-row=\"{position()}\">\r\n" + 
				"                                          <xsl:if test=\"not(@nodelete)\">\r\n" + 
				"                                            <span class=\"formlist-row-remove btn btn-danger\" rel=\"formlist_documento_task\">\r\n" + 
				"                                              <i class=\"fa fa-times\"/>\r\n" + 
				"                                            </span>\r\n" + 
				"                                          </xsl:if>\r\n" + 
				"                                        </td>\r\n" + 
				"                                      </xsl:if>\r\n" + 
				"                                    </tr>\r\n" + 
				"                                  </xsl:for-each>\r\n" + 
				"                                </tbody>\r\n" + 
				"                              </table>\r\n" + 
				"                            </div>\r\n" + 
				"                          </div>\r\n" + 
				"                        </xsl:if>";
	}
	
	public String removeXMLButton(String content) {
		content = this.extractXML(content);
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
