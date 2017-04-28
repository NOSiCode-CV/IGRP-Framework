package nosi.webapps.igrp.pages.generator;

import nosi.core.gui.components.IGRPButton;
import nosi.core.gui.components.IGRPFilter;
import nosi.core.gui.components.IGRPForm;
import nosi.core.gui.components.IGRPTable;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.FileField;
import nosi.core.gui.fields.LinkField;
import nosi.core.gui.fields.ListField;
import nosi.core.gui.fields.NumberField;
import nosi.core.gui.fields.TextField;
import nosi.core.gui.generator.Generator2_3;
import nosi.core.webapp.View;

public class GeneratorView extends View{
	public Field package_;
	public Field page;
	public Field gen_elements;
	public Field has_menu;
	public Field id_objeto;
	public Field nome;
	public Field link_image;
	public Field link_save;
	public Field page_form;
	public Field page_xml;
	public Field page_xsl;
	public Field data;
	public Field instancia;
	public Field transform_tools;
	public Field tool_nome;
	public Field xsl_path;
	public Field on_click;
	public Field icon;
	public Field title;
	public Field id;
	public Field id_pai;
	public Field link;
	public Field link_desc;
	public Field tipo;
	public Field env_fk;
	public IGRPFilter filter;
	public IGRPForm form;
	public IGRPTable table;
	public IGRPButton btn_publicar;
	public IGRPButton btn_gravar;
	public IGRPButton btn_pesquisar;
	
	
	public GeneratorView(Generator model) {
		table = new IGRPTable("table", (float) 2.1);
		form = new IGRPForm("form", (float) 2.1);		
		filter = new IGRPFilter("filter", (float) 2.1);
		env_fk = new ListField(model,"env_fk");
		gen_elements = new LinkField(model,"gen_elements");
		has_menu = new TextField(model,"has_menu");
		id_objeto = new NumberField(model,"id_objeto");			
		nome = new TextField(model,"nome");
		link_image = new LinkField(model,"link_image");
		link_save = new LinkField(model,"link_save");
		page_form = new LinkField(model,"page_form");
		page_xml = new FileField(model,"page_xml");
		page_xsl = new FileField(model,"page_xsl");
		data = new FileField(model,"data");
		instancia = new ListField(model,"instancia");
		transform_tools = new ListField(model,"transform_tools");
		transform_tools.propertie().put("type","list");
		tool_nome = new TextField(model,"tool_nome");
		xsl_path = new TextField(model,"xsl_path");
		on_click = new TextField(model,"on_click");
		icon = new TextField(model,"icon");
		title = new TextField(model,"title");
		id = new TextField(model,"id");
		id_pai = new TextField(model,"id_pai");
		link = new LinkField(model,"link");
		link_desc = new LinkField(model,"link_desc");
		link_desc.propertie().put("type", "field_copy");
		tipo = new TextField(model,"tipo");
		package_ = new TextField(model, "package_");
		page = new TextField(model,"page");
		btn_gravar = new IGRPButton("Gravar", "igrp", "page", "saveGenPage", "submit", "save.png", "","");
		btn_publicar = new IGRPButton("Publicar1", "igrp", "page", "publishGenPage", "submit", "save.png", "","");
		btn_pesquisar = new IGRPButton("Pesquisar", "igrp", "form", "1", "_self", "search.png","","");
	}
	
	@Override
	public void render(){	
		filter.addField(env_fk);		
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
		form.addField(package_);
		form.addField(page);
		table.addField(title);
		table.addField(id);
		table.addField(id_pai);
		table.addField(link);
		table.addField(link_desc);
		table.addField(id_objeto);
		table.addField(tipo);		

		form.addButton(btn_gravar);
		//form.addButton(btn_publicar);
		filter.addButton(btn_pesquisar);
		Generator2_3 gen23 = new Generator2_3(filter.toString()+form.toString()+table.toString());
		
		this.addToPage(gen23);
	}
}
