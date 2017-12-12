
package nosi.webapps.app_test.pages.pagetest;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Response;
import nosi.core.webapp.Igrp;

/*----#END-PRESERVED-AREA----*/

public class PageTestController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		PageTest model = new PageTest();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
		}
      	
		PageTestView view = new PageTestView(model);     
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
        if(id!=null){
          view.btn_gravar.setLink("gravar&p_id="+id);
        }
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(GRAVAR)----*/
		PageTest model = new PageTest();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
          	String id = Igrp.getInstance().getRequest().getParameter("p_id");
			 if(id==null && model.save(model)){
				Core.setMessageSuccess();
			 }else if(id!=null && model.update(model,id)){
               Core.setMessageSuccess();
             }
             else{
				Core.setMessageError();
			 	return this.forward("app_test","PageTest","index");
			}
		}
		return this.redirect("app_test","PageTest","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	/*----#END-PRESERVED-AREA----*/
}
