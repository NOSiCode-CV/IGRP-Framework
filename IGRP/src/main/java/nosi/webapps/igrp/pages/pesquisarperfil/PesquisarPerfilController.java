
package nosi.webapps.igrp.pages.pesquisarperfil;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.ProfileType;
import java.io.IOException;
import java.util.ArrayList;
import nosi.core.webapp.Core;
/*----#END-PRESERVED-AREA----*/

public class PesquisarPerfilController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		PesquisarPerfil model = new PesquisarPerfil();		
		ArrayList<PesquisarPerfil.Table_1> lista = new ArrayList<>();
		ProfileType profile_db = new ProfileType();		
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
		}	
		int idOrg = 0;
		int idApp = 0;
		if(Igrp.getInstance().getRequest().getParameter("id_org")!=null){
			idOrg = (Integer.parseInt(Igrp.getInstance().getRequest().getParameter("id_org")));
		}
		if(Igrp.getInstance().getRequest().getParameter("id_app")!=null){
			idApp = (Integer.parseInt(Igrp.getInstance().getRequest().getParameter("id_app")));
		}
		//Preenchendo a tabela
		for(ProfileType p:profile_db.find().andWhere("application", "=",idApp!=0?idApp:-1).andWhere("organization", "=",idOrg!=0?idOrg:-1).all()){
			PesquisarPerfil.Table_1 table1 = new PesquisarPerfil.Table_1();
			table1.setCodigo(p.getCode());
			table1.setDescricao(p.getDescr());
			table1.setEstado(p.getStatus());
          	table1.setEstado_check(1);
			if(p.getOrganization()!=null){
				table1.setOrganica(p.getOrganization().getName());
			}
			table1.setP_id(""+p.getId());
			lista.add(table1);
		}
		//Alimentando o selectorOption (Aplicacao, organica, e menuPrincipal)
		PesquisarPerfilView view = new PesquisarPerfilView(model);
		//Para pegar os parametros que queremos enviar para poder editar o menu no view
		view.p_id.setParam(true);
		view.table_1.addData(lista);
        view.btn_eliminar.setVisible(false);
        view.btn_novo.setLink("igrp","NovoPerfil","index&id_app="+idApp+"&id_org="+idOrg);
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionNovo() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(NOVO)----*/
//NOT IN USE. SET link in index
		return this.redirect("igrp","NovoPerfil","index&target=_blank");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionEditar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(EDITAR)----*/
      	String id = Igrp.getInstance().getRequest().getParameter("p_id");
		if(id!=null && !id.equals("")){
			return this.redirect("igrp","NovoPerfil","editar&target=_blank&p_id="+id);
		}
		return this.redirectError();
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionEliminar() throws IOException{
		/*----#START-PRESERVED-AREA(ELIMINAR)----*/
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
        if(id!=null){
			ProfileType p = new ProfileType().findOne(Integer.parseInt(id));
            if(p!=null && p.delete(Integer.parseInt(id))){
              Core.setMessageSuccess();
              return this.redirect("igrp","PesquisarPerfil","index&target=_blank");
            }
        }
		return this.redirectError();
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionMenu() throws IOException{
		/*----#START-PRESERVED-AREA(MENU)----*/
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		 if(id!=null){
		return this.redirect("igrp", "MenuOrganica", "index","id="+id+"&type=perfil");		
		 }
		 return this.redirectError();		
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionTransacao() throws IOException{
		/*----#START-PRESERVED-AREA(TRANSACAO)----*/
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		return this.redirect("igrp", "TransacaoOrganica", "index","id="+id+"&type=perfil");		
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionConvidar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(CONVIDAR)----*/
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
        if(id!=null && !id.equals("")){
          return this.redirect("igrp", "novo-utilizador", "index&target=_blank&p_id_prof="+id);
        }
        return this.redirectError();
		/*----#END-PRESERVED-AREA----*/
	}
	
	public Response actionEtapas() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(ETAPAS)----*/
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
        if(id!=null && !id.equals("")){
          return this.redirect("igrp", "Task", "index&target=_blank&type=prof&p_id="+id);
        }
        return this.redirectError();
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	/*----#END-PRESERVED-AREA----*/
}
