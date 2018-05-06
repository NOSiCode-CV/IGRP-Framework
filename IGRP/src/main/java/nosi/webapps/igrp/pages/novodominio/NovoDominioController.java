
package nosi.webapps.igrp.pages.novodominio;

import nosi.core.config.Config;
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;

/*----#start-code(packages_import)----*/
import org.modelmapper.ModelMapper;
import nosi.webapps.igrp.dao.Domain;
/*----#end-code----*/



public class NovoDominioController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		NovoDominio model = new NovoDominio();
		NovoDominioView view = new NovoDominioView();
		model.load();
		/*----#start-code(index)----*/
		view.estado.setSqlQuery(null,"SELECT 'ATIVE' as ID,'Ativo' as NAME UNION SELECT 'INATIVE' as ID,'Inativo' as NAME ");
		String isEdit = Core.getParam("isEdit");
		if(Core.isNotNull(isEdit)) {
			model.load(Core.query(Config.getBaseConnection(), "SELECT dominio,description,valor,status as estado,ordem,id as p_id FROM tbl_domain").where("id=:id").addInt("id", model.getP_id()));
		}else {
			model.setEstado("ATIVE");
		}
		/*----#end-code----*/
		
		
		view.setModel(model);
		
		return this.renderView(view);
		
	}

	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{		
		NovoDominio model = new NovoDominio();
		model.load();
		
		/*----#start-code(gravar)----*/
  		ModelMapper modelMapper = new ModelMapper();
  		Domain d = new Domain();
      	if(model.getP_id()==0){
      		modelMapper.map(model, d);
          	if(d.insert() != null)
              Core.setMessageSuccess();
          	else
              Core.setMessageError();
        }else{
        	d = d.findOne(model.getP_id());
      		modelMapper.map(model, d);
        	if(d.update() != null)
                Core.setMessageSuccess();
        	else
                Core.setMessageError();
        }
		/*----#end-code----*/
		
		return this.redirect("igrp","NovoDominio","index");
		
	}
	public Response actionLista_dominios() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#start-code(lista_dominios)----*/
				
		/*----#end-code----*/		
		return this.redirect("igrp","Dominio","index");
		
	}
	
	/*----#start-code(custom_actions)----*/
		
		
		/*----#end-code----*/
	
	
	
	
}
