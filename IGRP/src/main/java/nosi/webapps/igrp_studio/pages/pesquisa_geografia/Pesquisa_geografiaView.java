package nosi.webapps.igrp_studio.pages.pesquisa_geografia;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;

public class Pesquisa_geografiaView extends View {

	public Field sectionheader_1_text;
	public Field geo_link;
	public Field geo_tmid;
	public Field geo_parent;
	public Field geo_icon;
	public Field geo_child;
	public Field geo_active;
	public IGRPForm sectionheader_1;
	public IGRPTable geo;


	public Pesquisa_geografiaView(){

		this.setPageTitle("Pesquisa Geografia");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		geo = new IGRPTreeMenu("geo","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Pesquisa Geografia"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		geo_link = new LinkField(model,"geo_link");
		geo_link.setLabel(gt("Link"));
		geo_link.propertie().add("type","link").add("maxlength","4000").add("target","_self").add("desc","true");
		
		geo_tmid = new NumberField(model,"geo_tmid");
		geo_tmid.setLabel(gt("ID"));
		geo_tmid.propertie().add("type","number");
		
		geo_parent = new NumberField(model,"geo_parent");
		geo_parent.setLabel(gt("Parent ID"));
		geo_parent.propertie().add("type","number");
		
		geo_icon = new TextField(model,"geo_icon");
		geo_icon.setLabel(gt("Icon"));
		geo_icon.propertie().add("type","text");
		
		geo_child = new TextField(model,"geo_child");
		geo_child.setLabel(gt("Has child value(0/X)"));
		geo_child.propertie().add("type","text");
		
		geo_active = new TextField(model,"geo_active");
		geo_active.setLabel(gt("Is Active value(true/false)"));
		geo_active.propertie().add("type","text");
		


		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		geo.addField(geo_link);
		geo.addField(geo_tmid);
		geo.addField(geo_parent);
		geo.addField(geo_icon);
		geo.addField(geo_child);
		geo.addField(geo_active);

		this.addToPage(sectionheader_1);
		this.addToPage(geo);
	}
		
	@Override
	public void setModel(Model model) {
		
		geo_link.setValue(model);
		geo_tmid.setValue(model);
		geo_parent.setValue(model);
		geo_icon.setValue(model);
		geo_child.setValue(model);
		geo_active.setValue(model);	

		}
}
