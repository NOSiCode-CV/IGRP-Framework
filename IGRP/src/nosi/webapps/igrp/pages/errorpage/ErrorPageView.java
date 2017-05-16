/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.errorpage;
import nosi.core.webapp.View;
import nosi.core.config.Config; 

public class ErrorPageView extends View {
	public String title = "";

	public ErrorPageView(ErrorPage model){
	}
		
	@Override
	public void render(){
		Config.TITLE = this.title;
	}
}
/*-------------------------*/