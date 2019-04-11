package nosi.webapps.igrp.pages.pesquisa_cae;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class Pesquisa_caeView extends View {

	public Field treemenu_1_link;
	public Field treemenu_1_link_desc;
	public Field treemenu_1_tmid;
	public Field treemenu_1_parent;
	public Field treemenu_1_icon;
	public Field treemenu_1_child;
	public Field treemenu_1_active;
	public IGRPTable treemenu_1;


	public Pesquisa_caeView(){

		this.setPageTitle("Pesquisa CAE");
			
		treemenu_1 = new IGRPTreeMenu("treemenu_1","");

		treemenu_1_link = new LinkField(model,"treemenu_1_link");
		treemenu_1_link.setLabel(gt("Link"));
		treemenu_1_link_desc = new LinkField(model,"treemenu_1_link_desc");
		treemenu_1_link_desc.setLabel(gt("Link"));
		treemenu_1_link.propertie().add("type","link").add("maxlength","4000").add("target","_self").add("desc","true");
		
		treemenu_1_tmid = new TextField(model,"treemenu_1_tmid");
		treemenu_1_tmid.setLabel(gt("ID"));
		treemenu_1_tmid.propertie().add("type","text");
		
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
		


		
	}
		
	@Override
	public void render(){
		
		treemenu_1.addField(treemenu_1_link);
		treemenu_1.addField(treemenu_1_link_desc);
		treemenu_1.addField(treemenu_1_tmid);
		treemenu_1.addField(treemenu_1_parent);
		treemenu_1.addField(treemenu_1_icon);
		treemenu_1.addField(treemenu_1_child);
		treemenu_1.addField(treemenu_1_active);

		this.addToPage(treemenu_1);
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

		treemenu_1.loadModel(((Pesquisa_cae) model).getTreemenu_1());
		}
}
