package nosi.webapps.igrp_studio.pages.get_coordinates;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class Get_coordinatesView extends View {

	public Field map_os_1_data;
	public Field p_fwl_fieldname;
	public IGRPForm map_os_1;
	public IGRPForm form_1;


	public Get_coordinatesView(){

		this.setPageTitle("Get coordinates");
			
		map_os_1 = new IGRPForm("map_os_1","");

		form_1 = new IGRPForm("form_1","");

		map_os_1_data = new TextField(model,"map_os_1_data");
		map_os_1_data.setLabel(gt("Map Data"));
		map_os_1_data.setValue(gt("/IGRP/images/IGRP/IGRP2.3/core/formgen/types/containers/map_os/config.example.json"));
		map_os_1_data.propertie().add("type","text").add("name","p_map_os_1_data").add("maxlength","8000");
		
		p_fwl_fieldname = new HiddenField(model,"p_fwl_fieldname");
		p_fwl_fieldname.setLabel(gt(""));
		p_fwl_fieldname.propertie().add("name","p_p_fwl_fieldname").add("type","hidden").add("maxlength","250").add("java-type","").add("tag","p_fwl_fieldname");
		


		
	}
		
	@Override
	public void render(){
		
		map_os_1.addField(map_os_1_data);

		form_1.addField(p_fwl_fieldname);

		this.addToPage(map_os_1);
		this.addToPage(form_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		p_fwl_fieldname.setValue(model);	

		}
}
