package nosi.core.gui.generator;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 18, 2017
 *
 * Description: class to build API Generator
 */

import nosi.core.config.Config;
import nosi.core.gui.components.IGRPFilter;
import nosi.core.gui.components.IGRPForm;
import nosi.core.gui.components.IGRPTable;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.FileField;
import nosi.core.gui.fields.LinkField;
import nosi.core.gui.fields.ListField;
import nosi.core.gui.fields.NumberField;
import nosi.core.gui.fields.TextField;
import nosi.core.xml.XMLWritter;

public class Generator2_3 {

	private XMLWritter xml;
	
	public Generator2_3() {
		this.xml = new XMLWritter("rows","images/IGRP/IGRP2.3/app/RED/RED_FORM_1_dash.xsl", "dash");
		this.xml.addXml(Config.getHeader());
		this.xml.startElement("content");
		this.xml.writeAttribute("type", "dash");
			this.xml.setElement("title", "Form Design");
			IGRPFilter filter = new IGRPFilter("filter", (float) 2.1);
			Field env_fk = new ListField("env_fk");
			env_fk.addOption("", "--- Aplicação ---");//Colocar dinamicamente depois
			filter.addField(env_fk);
			filter.addButton("Pesquisar", "igrp", "form", "1", "_self", "search.png");
			this.xml.addXml(filter.toString());
			IGRPForm form = new IGRPForm("form", (float) 2.1);
			Field gen_elements = new LinkField("gen_elements");
			gen_elements.setValue("images/IGRP/Config/formgen.config.txt?id=");
			Field has_menu = new TextField("has_menu");
			Field id_objeto = new NumberField("id_objeto");
			id_objeto.setValue(11);
			Field nome = new TextField("nome");
			Field link_image = new LinkField("link_image");
			link_image.setValue("images/IGRP/Config/img.list.php?name=");
			Field link_save = new LinkField("link_save");
			link_save.setValue("images/IGRP/Config/data.txt");
			Field page_form = new LinkField("page_form");
			Field page_xml = new FileField("page_xml");
			Field page_xsl = new FileField("page_xsl");
			Field data = new FileField("data");
			Field instancia = new ListField("instancia");
			instancia.addOption("", "--- Instancia ---");
			Field transform_tools = new ListField("transform_tools");
			transform_tools.propertie().put("type","list");
			Field tool_nome = new TextField("tool_nome");
			Field xsl_path = new TextField("xsl_path");
			Field on_click = new TextField("on_click");
			Field icon = new TextField("icon");
			
			form.addField(gen_elements);
			form.addField(has_menu);
			form.addField(id_objeto);
			form.addField(nome);
			form.addField(link_image);
			form.addField(link_save);
			form.addField(page_form);
			form.addField(page_xml);
			form.addField(page_xsl);
			form.addField(data);
			form.addField(instancia);
			form.addField(transform_tools);
			form.addField(tool_nome);
			form.addField(xsl_path);
			form.addField(on_click);
			form.addField(icon);
			
			form.addButton("Publicar", "igrp", "form", "1", "submit", "save.png", "","","");
			form.addButton("Gravar", "igrp", "form", "1", "submit", "save.png", "","","");
			
			this.xml.addXml(form.toString());
			
			IGRPTable table = new IGRPTable("table", (float) 2.1);
			Field title = new TextField("title");
			Field id = new TextField("id");
			Field id_pai = new TextField("id_pai");
			Field link = new LinkField("link");
			Field link_desc = new LinkField("link_desc");
			link_desc.propertie().put("type", "field_copy");
			Field tipo = new TextField("tipo");
			table.addField(title);
			table.addField(id);
			table.addField(id_pai);
			table.addField(link);
			table.addField(link_desc);
			table.addField(id_objeto);
			table.addField(tipo);
			
			this.xml.addXml(table.toString());
		this.xml.endElement();//end tag content
		this.xml.endElement();//end tag rows
	}

	public String toString(){
		return this.xml.toString();
	}
	
	public static void main(String [] args){
		System.out.println(new Generator2_3());
	}
}
