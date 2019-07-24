package nosi.webapps.app_teste.pages.getfields;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;

public class GetfieldsView extends View {

	public IGRPBox box_1;


	public GetfieldsView(){

		this.setPageTitle("Getfields");
			
		box_1 = new IGRPBox("box_1","");



		
	}
		
	@Override
	public void render(){
		

		this.addToPage(box_1);
	}
		
	@Override
	public void setModel(Model model) {
			

		}
}
