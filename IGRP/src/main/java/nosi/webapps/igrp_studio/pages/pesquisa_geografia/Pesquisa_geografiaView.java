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
	public Field treemenu_1_link;
	public Field treemenu_1_link_desc;
	public Field treemenu_1_tmid;
	public Field treemenu_1_parent;
	public Field treemenu_1_icon;
	public Field treemenu_1_child;
	public Field treemenu_1_active;
	public Field sectionheader_2_text;
	public Field treemenu_2_link;
	public Field treemenu_2_link_desc;
	public Field treemenu_2_tmid;
	public Field treemenu_2_parent;
	public Field treemenu_2_icon;
	public Field treemenu_2_child;
	public Field treemenu_2_active;
	public IGRPForm sectionheader_1;
	public IGRPTable treemenu_1;
	public IGRPForm sectionheader_2;
	public IGRPTable treemenu_2;


	public Pesquisa_geografiaView(){

		this.setPageTitle("Pesquisa Geografia");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		treemenu_1 = new IGRPTreeMenu("treemenu_1","");

		sectionheader_2 = new IGRPForm("sectionheader_2","");

		treemenu_2 = new IGRPTreeMenu("treemenu_2","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Pesquisa Geografia"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		treemenu_1_link = new LinkField(model,"treemenu_1_link");
		treemenu_1_link.setLabel(gt("Link"));
		treemenu_1_link_desc = new LinkField(model,"treemenu_1_link_desc");
		treemenu_1_link_desc.setLabel(gt("Link"));
		treemenu_1_link.propertie().add("type","link").add("maxlength","4000").add("target","_self").add("desc","true");
		
		treemenu_1_tmid = new NumberField(model,"treemenu_1_tmid");
		treemenu_1_tmid.setLabel(gt("ID"));
		treemenu_1_tmid.propertie().add("type","number").add("java-type","Integer");
		
		treemenu_1_parent = new NumberField(model,"treemenu_1_parent");
		treemenu_1_parent.setLabel(gt("Parent ID"));
		treemenu_1_parent.propertie().add("type","number").add("java-type","Integer");
		
		treemenu_1_icon = new TextField(model,"treemenu_1_icon");
		treemenu_1_icon.setLabel(gt("Icon"));
		treemenu_1_icon.propertie().add("type","text");
		
		treemenu_1_child = new TextField(model,"treemenu_1_child");
		treemenu_1_child.setLabel(gt("Has child value(0/X)"));
		treemenu_1_child.propertie().add("type","text");
		
		treemenu_1_active = new TextField(model,"treemenu_1_active");
		treemenu_1_active.setLabel(gt("Is Active value(true/false)"));
		treemenu_1_active.propertie().add("type","text");
		
		sectionheader_2_text = new TextField(model,"sectionheader_2_text");
		sectionheader_2_text.setLabel(gt(""));
		sectionheader_2_text.setValue(gt("Pesquisa Nacionalidade"));
		sectionheader_2_text.propertie().add("type","text").add("name","p_sectionheader_2_text").add("maxlength","4000");
		
		treemenu_2_link = new LinkField(model,"treemenu_2_link");
		treemenu_2_link.setLabel(gt("Link"));
		treemenu_2_link_desc = new LinkField(model,"treemenu_2_link_desc");
		treemenu_2_link_desc.setLabel(gt("Link"));
		treemenu_2_link.propertie().add("type","link").add("maxlength","4000").add("target","_self").add("desc","true");
		
		treemenu_2_tmid = new NumberField(model,"treemenu_2_tmid");
		treemenu_2_tmid.setLabel(gt("ID"));
		treemenu_2_tmid.propertie().add("type","number").add("java-type","Integer");
		
		treemenu_2_parent = new NumberField(model,"treemenu_2_parent");
		treemenu_2_parent.setLabel(gt("Parent ID"));
		treemenu_2_parent.propertie().add("type","number").add("java-type","Integer");
		
		treemenu_2_icon = new TextField(model,"treemenu_2_icon");
		treemenu_2_icon.setLabel(gt("Icon"));
		treemenu_2_icon.propertie().add("type","text");
		
		treemenu_2_child = new TextField(model,"treemenu_2_child");
		treemenu_2_child.setLabel(gt("Has child value(0/X)"));
		treemenu_2_child.propertie().add("type","text");
		
		treemenu_2_active = new TextField(model,"treemenu_2_active");
		treemenu_2_active.setLabel(gt("Is Active value(true/false)"));
		treemenu_2_active.propertie().add("type","text");
		


		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		treemenu_1.addField(treemenu_1_link);
		treemenu_1.addField(treemenu_1_link_desc);
		treemenu_1.addField(treemenu_1_tmid);
		treemenu_1.addField(treemenu_1_parent);
		treemenu_1.addField(treemenu_1_icon);
		treemenu_1.addField(treemenu_1_child);
		treemenu_1.addField(treemenu_1_active);

		sectionheader_2.addField(sectionheader_2_text);

		treemenu_2.addField(treemenu_2_link);
		treemenu_2.addField(treemenu_2_link_desc);
		treemenu_2.addField(treemenu_2_tmid);
		treemenu_2.addField(treemenu_2_parent);
		treemenu_2.addField(treemenu_2_icon);
		treemenu_2.addField(treemenu_2_child);
		treemenu_2.addField(treemenu_2_active);

		this.addToPage(sectionheader_1);
		this.addToPage(treemenu_1);
		this.addToPage(sectionheader_2);
		this.addToPage(treemenu_2);
	}
		
	@Override
	public void setModel(Model model) {
		
		treemenu_1_link.setValue(model);
		treemenu_1_link_desc.setValue(model);
		treemenu_1_tmid.setValue(model);
		treemenu_1_parent.setValue(model);
		treemenu_1_icon.setValue(model);
		treemenu_1_child.setValue(model);
		treemenu_1_active.setValue(model);
		treemenu_2_link.setValue(model);
		treemenu_2_link_desc.setValue(model);
		treemenu_2_tmid.setValue(model);
		treemenu_2_parent.setValue(model);
		treemenu_2_icon.setValue(model);
		treemenu_2_child.setValue(model);
		treemenu_2_active.setValue(model);	

		treemenu_1.loadModel(((Pesquisa_geografia) model).getTreemenu_1());
		treemenu_2.loadModel(((Pesquisa_geografia) model).getTreemenu_2());
		}
}
