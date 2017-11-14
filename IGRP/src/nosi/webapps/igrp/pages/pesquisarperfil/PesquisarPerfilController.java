/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.pesquisarperfil;
/*---- Import your packages here... ----*/

import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.ProfileType;
import java.io.IOException;
import java.util.ArrayList;
import static nosi.core.i18n.Translator.gt;
/*---- End ----*/

public class PesquisarPerfilController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarPerfil model = new PesquisarPerfil();		
		ArrayList<PesquisarPerfil.Table_1> lista = new ArrayList<>();
		ProfileType profile_db = new ProfileType();		
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
		}		
		//Preenchendo a tabela
		for(ProfileType p:profile_db.find().andWhere("application", "=",model.getAplicacao()!=0? model.getAplicacao():null).andWhere("organization", "=",model.getOrgania()!=0? model.getOrgania():null).all()){
			PesquisarPerfil.Table_1 table1 = new PesquisarPerfil().new Table_1();
			table1.setCodigo(p.getCode());
			table1.setDescricao(p.getDescr());
			table1.setEstado(p.getStatus()==1?"Ativo":"Inativo");
			if(p.getOrganization()!=null){
				table1.setOrganica(p.getOrganization().getName());
			}
			table1.setP_id(p.getId());
			lista.add(table1);
		}
		//Alimentando o selectorOption (Aplicacao, organica, e menuPrincipal)
		PesquisarPerfilView view = new PesquisarPerfilView(model);
		view.aplicacao.setValue(new Application().getListApps());
		view.organia.setValue(new Organization().getListOrganizations());
		//Para pegar os parametros que queremos enviar para poder editar o menu no view
		view.p_id.setParam(true);
		view.table_1.addData(lista);
		return this.renderView(view);
	}
	
	public Response actionEliminar() throws IOException{
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		ProfileType p = new ProfileType();
		if(p.delete(Integer.parseInt(id)))
			Igrp.getInstance().getFlashMessage().addMessage("success",gt("Operação efetuada com sucesso"));
		else
			Igrp.getInstance().getFlashMessage().addMessage("error",gt("Falha ao tentar efetuar esta operação"));
		return this.redirect("igrp","PesquisarPerfil","index");
	}
	
	public Response actionMenu() throws IOException{
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		return this.redirect("igrp", "MenuOrganica", "index","id="+id+"&type=perfil");
	}
	
	public Response actionTransacao() throws IOException{
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		return this.redirect("igrp", "TransacaoOrganica", "index","id="+id+"&type=perfil");
	}
	
}
