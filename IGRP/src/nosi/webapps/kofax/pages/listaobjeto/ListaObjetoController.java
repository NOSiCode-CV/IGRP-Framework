/*-------------------------*/

/*Create Controller*/

package nosi.webapps.kofax.pages.listaobjeto;
/*---- Import your packages here... ----*/

import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.kofax.dao.Objeto;

/*---- End ----*/

public class ListaObjetoController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/										
		ListaObjeto model = new ListaObjeto();
		List<ListaObjeto.Table_1> data = new ArrayList<>();
		Objeto obj = new Objeto();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
		}
		List<Objeto> lista_obj = obj.find().andWhere("objeto", "like", model.getObjecto_pesquisar()).all();
				
		for(Objeto o:lista_obj) {
			ListaObjeto.Table_1 tabela = new ListaObjeto.Table_1();
			tabela.setObjeto(o.getObjeto());
			tabela.setPagina(o.getLink_pagina());
			Organization org = new Organization().findOne(o.getId_organica());
			tabela.setOrganica(org!=null?org.getName():"");
			tabela.setEstado(o.getEstado());
			tabela.setP_id(""+o.getId());
			data.add(tabela);
		}
		ListaObjetoView view = new ListaObjetoView(model);
		view.table_1.addData(data);
		view.p_id.setParam(true);
		view.btn_pesquisar.setLink("index");
		return this.renderView(view);
							/*---- End ----*/
	}


	public Response actionNovo() throws IOException{
		/*---- Insert your code here... ----*/										
		return this.redirect("kofax","NovoObjeto","index");
							/*---- End ----*/
	}
	

	public Response actionPesquisar() throws IOException{
		/*---- Insert your code here... ----*/								
		
		return this.redirect("kofax","ListaObjeto","index");
						/*---- End ----*/
	}
	

	public Response actionEditar() throws IOException{
		/*---- Insert your code here... ----*/										
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		return this.redirect("kofax","NovoObjeto","index&id="+id);
							/*---- End ----*/
	}
	

	public Response actionEliminar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/										
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		if(id != null && !id.equals("") ) {
			Objeto obj = new Objeto();
			obj = obj.findOne(id);
			if(obj.getEstado().toUpperCase().equals("ATIVO"))
				obj.setEstado("INATIVO");
			else
				obj.setEstado("ATIVO");
			obj = obj.update();
			if(obj != null) {
				Igrp.getInstance().getFlashMessage().addMessage("success", "Operacao efetuada com sucesso");
			}else {
				Igrp.getInstance().getFlashMessage().addMessage("error", "Operacao falhada");
			}
		}
		return this.redirect("kofax","ListaObjeto","index");
							/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
